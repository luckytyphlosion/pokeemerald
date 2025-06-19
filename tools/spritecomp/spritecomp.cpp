// Copyright(c) 2025 luckytyphlosion
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include <string>
#include <span>
#include <vector>
#include <map>
#include <fstream>
#include <iterator>
#include <cstdarg>
#include <cstdint>
#include <tuple>
#include <algorithm>
#include <cstring>

#include "spritecomp.h"


TileKey::TileKey(std::span<unsigned char> data, bool isRightSide) : data(data)
{
    //fprintf(stderr, "in TileKey constructor, this->data ptr: %p\n", &this->data);
    bool hasNoBytesHalfwords = this->CalcCompressedSizeNoOverHeadAndTileKey(isRightSide);

    if (hasNoBytesHalfwords) {
        this->tileType = TileType::HAS_NO_BYTES_OR_HALFWORDS;
    } else if (isRightSide) {
        this->tileType = TileType::IS_RIGHT_SIDE;
    } else {
        this->tileType = TileType::IS_LEFT_SIDE;
    }
}

TileKey::TileKey(const TileKey& other) : data(other.data)
{
    //fprintf(stderr, "In TileKey copy constructor, this->data ptr: %p, other.data ptr: %p\n", &this->data, &other.data);
    this->tileType = other.tileType;
    this->compressedSizeNoOverhead = other.compressedSizeNoOverhead;
    this->isBlank = other.isBlank;
}

TileKey& TileKey::operator=(const TileKey& other)
{
    //fprintf(stderr, "In TileKey operator=\n");
    this->data = other.data;
    
    this->tileType = other.tileType;
    this->compressedSizeNoOverhead = other.compressedSizeNoOverhead;
    this->isBlank = other.isBlank;

    return *this;
}
    
bool TileKey::CalcCompressedSizeNoOverHeadAndTileKey(bool isRightSide)
{
    bool hasNoBytesHalfwords = true;
    bool isBlank = true;
    int compressedSizeNoOverhead = 0;
    uint32_t byteMask;
    uint32_t halfwordMask;

    if (isRightSide) {
        byteMask = 0xffffff00;
        halfwordMask = 0xffff0000;
    } else {
        byteMask = 0xffffff;
        halfwordMask = 0xffff;
    }

    // Iterate over the span in chunks of 4 bytes
    for (size_t i = 0; i < this->data.size(); i += sizeof(uint32_t)) {
        // Read 4 bytes and merge them into a uint32_t
        uint32_t word = static_cast<uint32_t>(this->data[i]) |
            (static_cast<uint32_t>(this->data[i + 1]) << 8) |
            (static_cast<uint32_t>(this->data[i + 2]) << 16) |
            (static_cast<uint32_t>(this->data[i + 3]) << 24);

        if (word != 0) {
            isBlank = false;
            if ((word & byteMask) == 0) {
                compressedSizeNoOverhead++;
                hasNoBytesHalfwords = false;
            } else if ((word & halfwordMask) == 0) {
                compressedSizeNoOverhead += 2;
                hasNoBytesHalfwords = false;
            } else {
                compressedSizeNoOverhead += 4;
            }
        }
    }

    this->compressedSizeNoOverhead = compressedSizeNoOverhead;
    this->isBlank = isBlank;

    return hasNoBytesHalfwords;
}

bool TileKey::operator<(const TileKey& other) const
{
    if (this->tileType != other.tileType) {
        return this->tileType < other.tileType;
    } else {
        return std::lexicographical_compare(this->data.begin(), this->data.end(), other.data.begin(), other.data.end());
    }
}

TileKeyInfoEntry::TileKeyInfoEntry(std::shared_ptr<TileKey> keyPtr, OutputType outputTileType) : keyPtr(keyPtr), outputTileType(outputTileType)
{
    ////std::fprintf(stderr, "in TileKeyInfoEntry constructor\n");
    ////std::fprintf(stderr, "this->keyPtr.get().data.size(): %lu, ptr: %p\n", this->keyPtr->data.size(), &this->keyPtr->data);
    this->reusableTileNum = 0;
    this->compressType = COMPRESS_TYPE_0h0b;
    if (this->outputTileType == OutputType::UNIQUE_COMPRESSED || this->outputTileType == OutputType::REUSABLE_COMPRESSED) {
        this->CompressTile();
    }
}

TileKeyInfoEntry::TileKeyInfoEntry(const TileKeyInfoEntry& other) : keyPtr(other.keyPtr), outputTileType(other.outputTileType)
{
    ////std::fprintf(stderr, "in TileKeyInfoEntry copy constructor\n");
    this->reusableTileNum = other.reusableTileNum;
    // probably should be changed to not create a new object
    this->compressedBytes = other.compressedBytes;
    this->compressedHalfwords = other.compressedHalfwords;
    this->compressedWords = other.compressedWords;
    this->compressType = other.compressType;
}

TileKeyInfoEntry& TileKeyInfoEntry::operator=(const TileKeyInfoEntry& other)
{
    this->keyPtr = other.keyPtr;
    this->outputTileType = other.outputTileType;
    this->reusableTileNum = other.reusableTileNum;
    // probably should be changed to not create a new object
    this->compressedBytes = other.compressedBytes;
    this->compressedHalfwords = other.compressedHalfwords;
    this->compressedWords = other.compressedWords;
    this->compressType = other.compressType;

    return *this;
}

static const enum CompressType sCompressedNumBytesHalfwordsToCompressType[] = {
    [(0 << 2) | 0] = COMPRESS_TYPE_0h0b,
    [(0 << 2) | 1] = COMPRESS_TYPE_0h1b,
    [(0 << 2) | 2] = COMPRESS_TYPE_0h2b,
    [(0 << 2) | 3] = COMPRESS_TYPE_0h3b,
    [(1 << 2) | 0] = COMPRESS_TYPE_1h0b,
    [(1 << 2) | 1] = COMPRESS_TYPE_1h1b,
    [(1 << 2) | 2] = COMPRESS_TYPE_0h0b,
    [(1 << 2) | 3] = COMPRESS_TYPE_1h3b
};

static const size_t sValidSubcases[][6] = {
    {0, 0, 0, 0, 1, 1},
    {0, 0, 0, 1, 0, 1},
    {0, 0, 0, 1, 3, 0},
    {0, 0, 0, 2, 2, 0},
    {0, 0, 0, 3, 1, 0},
    {0, 0, 1, 0, 0, 2},
    {0, 0, 1, 0, 2, 0},
    {0, 0, 1, 1, 1, 0},
    {0, 0, 1, 2, 0, 0},
    {0, 1, 0, 0, 0, 2},
    {0, 1, 0, 0, 2, 0},
    {0, 1, 0, 1, 1, 0},
    {0, 1, 0, 2, 0, 0},
    {0, 1, 1, 0, 0, 0},
    {1, 0, 0, 0, 0, 3},
    {1, 0, 0, 0, 1, 0},
    {1, 0, 0, 1, 0, 0},
    {1, 0, 1, 0, 0, 1},
    {1, 1, 0, 0, 0, 1},
    {2, 0, 0, 0, 0, 2},
    {2, 0, 1, 0, 0, 0},
    {2, 1, 0, 0, 0, 0},
    {3, 0, 0, 0, 0, 1},
};

static void AppendWord(std::vector<unsigned char>& vec, uint32_t word)
{
    vec.push_back(word & 0xff);
    vec.push_back((word >> 8) & 0xff);
    vec.push_back((word >> 16) & 0xff);
    vec.push_back((word >> 24) & 0xff);
}

static void AppendHalfword(std::vector<unsigned char>& vec, uint32_t halfword)
{
    if (halfword >= 0x10000) {
        FATAL_ERROR("halfword >= 0x10000\n");
    }
    vec.push_back(halfword & 0xff);
    vec.push_back((halfword >> 8) & 0xff);
}

void TileKeyInfoEntry::CompressTile()
{
    uint32_t byteMask;
    int byteShiftAmount;
    uint32_t halfwordMask;
    int halfwordShiftAmount;

    //fprintf(stderr, "in CompressTile\n");
    this->compressedHalfwords.push_back(0);
    //fprintf(stderr, "after push halfword\n");

    const TileKey& key = *this->keyPtr;
    //fprintf(stderr, "after get keyref\n");

    if (key.tileType == TileType::IS_LEFT_SIDE) {
        byteMask = 0xffffff;
        byteShiftAmount = 24;
        halfwordMask = 0xffff;
        halfwordShiftAmount = 16;
    } else if (key.tileType == TileType::IS_RIGHT_SIDE) {
        byteMask = 0xffffff00;
        byteShiftAmount = 0;
        halfwordMask = 0xffff0000;
        halfwordShiftAmount = 0;
    } else {
        byteMask = 0xffffffff;
        byteShiftAmount = 0;
        halfwordMask = 0xffffffff;
        halfwordShiftAmount = 0;
    }

    
    //fprintf(stderr, "after determine vars\n");

    uint32_t compressedBitfield = 0;
    int bitfieldPos = 14;

    //fprintf(stderr, "CompressTile key.data.size(): %lu\n", key.data.size());

    // Iterate over the span in chunks of 4 bytes
    for (size_t i = 0; i < key.data.size(); i += sizeof(uint32_t)) {
        //fprintf(stderr, "CompressTile i: %lu\n", i);
        // Read 4 bytes and merge them into a uint32_t
        uint32_t word = static_cast<uint32_t>(key.data[i]) |
            (static_cast<uint32_t>(key.data[i + 1]) << 8) |
            (static_cast<uint32_t>(key.data[i + 2]) << 16) |
            (static_cast<uint32_t>(key.data[i + 3]) << 24);
        //fprintf(stderr, "CompressTile word: 0x%08x\n", word);

        if (word == 0) {
            //fprintf(stderr, "CompressTile i: %lu, blank\n", i);            
            compressedBitfield |= (3 << bitfieldPos);
        } else if ((word & byteMask) == 0) {            
            //fprintf(stderr, "CompressTile i: %lu, byte: 0x%02x\n", i, word >> byteShiftAmount);
            this->compressedBytes.push_back(word >> byteShiftAmount);
            compressedBitfield |= (0 << bitfieldPos);
        } else if ((word & halfwordMask) == 0) {
            //fprintf(stderr, "CompressTile i: %lu, hword: 0x%04x\n", i, word >> halfwordShiftAmount);
            this->compressedHalfwords.push_back(word >> halfwordShiftAmount);
            compressedBitfield |= (1 << bitfieldPos);
        } else {
            //fprintf(stderr, "CompressTile i: %lu, word: 0x%08x\n", i, word);
            this->compressedWords.push_back(word);
            compressedBitfield |= (2 << bitfieldPos);
        }

        bitfieldPos -= 2;
    }

    this->compressedHalfwords[0] = compressedBitfield;
    this->compressType = sCompressedNumBytesHalfwordsToCompressType[((this->compressedHalfwords.size() & 1) << 2) | (this->compressedBytes.size() & 3)];
}

SpriteCompressor::SpriteCompressor(std::string inputFilename, std::string outputFilename, int width, int height) : inputFilename(inputFilename), outputFilename(outputFilename), width(width), height(height)
{
    if (this->width == 2 && this->height == 2) {
        this->spriteSize = SPRITE_SIZE_16x16;
    } else if (this->width == 2 && this->height == 4) {
        this->spriteSize = SPRITE_SIZE_16x32;
    } else if (this->width == 4 && this->height == 4) {
        this->spriteSize = SPRITE_SIZE_32x32;
    } else if (this->width == 8 && this->height == 8) {
        this->spriteSize = SPRITE_SIZE_64x64;
    } else {
        FATAL_ERROR("Invalid dimensions for compressed sprite \"%s\", must be one of (2, 2), (2, 4), (4, 4), (8, 8), but got (%d, %d)!", this->inputFilename.c_str(), this->width, this->height);
    }

    std::ifstream inputStream(this->inputFilename, std::ios::binary );

    if (!inputStream.is_open()) {
        FATAL_ERROR("Failed to open \"%s\" for reading.\n", this->inputFilename.c_str());
    }

    this->inputData = std::vector<unsigned char>(std::istreambuf_iterator<char>(inputStream), {});

    if ((this->inputData.size() & 0x1f) != 0) {
        FATAL_ERROR("File \"%s\"'s size not to a tile boundary (size: 0x%lx)!\n", this->inputFilename.c_str(), this->inputData.size());
    }

    this->numFrames = this->inputData.size() / (this->width * this->height * 0x20);

    this->numReusableUncompressedTiles = 0;
    this->numReusableCompressedTiles = 0;
}

void SpriteCompressor::ReadInTiles()
{
    size_t widthMask = this->width - 1;
    size_t rightSideCompareValue = this->width / 2;
    size_t numTiles = this->inputData.size() / 0x20;

    for (size_t i = 0; i < numTiles; i++) {
        bool isRightSide;

        if ((i & widthMask) >= rightSideCompareValue) {
            isRightSide = true;
        } else {
            isRightSide = false;
        }

        std::span<unsigned char> tileData(this->inputData.data() + 0x20 * i, 0x20);
        std::shared_ptr<TileKey> tileKeyPtr = std::make_shared<TileKey>(tileData, isRightSide);

        //fprintf(stderr, "tile %lu tileDataPtr: %p\n", i, &tileData);
        this->tiles.push_back(tileKeyPtr);

        auto tileKeyCount = this->tileCounter.find(tileKeyPtr);
        if (tileKeyCount == this->tileCounter.end()) {
            this->tileCounter.emplace(tileKeyPtr, 1);
        } else {
            this->tileCounter[tileKeyPtr] = tileKeyCount->second + 1;
        }
        //fprintf(stderr, "tile %lu: compressedSizeNoOverhead: %d\n", i, tileKeyPtr->compressedSizeNoOverhead);
    }
}

void SpriteCompressor::GenerateTileKeyInfo()
{
    int i = 0;

    for (const auto & [tileKeyPtr, count] : this->tileCounter) {
        //fprintf(stderr, "GenerateTileKeyInfo iteration: %d\n", i);
        const TileKey& tileKey = *tileKeyPtr;
        OutputType outputTileType;

        if (tileKey.isBlank) {
            outputTileType = OutputType::BLANK;
        // is a unique tile
        } else if (count == 1) {
            if (tileKey.compressedSizeNoOverhead + 2 < 32) {
                outputTileType = OutputType::UNIQUE_COMPRESSED;
            } else {
                outputTileType = OutputType::UNIQUE_RAW;
            }
        // is a reusable tile
        } else {
            if (tileKey.compressedSizeNoOverhead + 6 < 32) {
                outputTileType = OutputType::REUSABLE_COMPRESSED;
            } else {
                outputTileType = OutputType::REUSABLE_RAW;
                this->numReusableUncompressedTiles++;
            }
        }

        ////std::fprintf(stderr, "outputTileType: %d\n", (int)outputTileType);

        ////std::fprintf(stderr, "tileKey.data.size(): %lu\n", tileKey.data.size());
        //TileKeyInfoEntry tileKeyInfoEntry(tileKeyRef, outputTileType);

        std::shared_ptr<TileKeyInfoEntry> tileKeyInfoEntryPtr = std::make_shared<TileKeyInfoEntry>(tileKeyPtr, outputTileType);

        this->tileKeyInfo.emplace(tileKeyPtr, tileKeyInfoEntryPtr);
        ////std::fprintf(stderr, "after create tileKeyInfoEntry\n");

        if (outputTileType == OutputType::REUSABLE_COMPRESSED) {
            this->reusableCompressedTileKeyInfoByCompressType[tileKeyInfoEntryPtr->compressType].push_back(tileKeyInfoEntryPtr);
        }
        i++;
    }
}

void SpriteCompressor::PartitionReusableCompressedTiles()
{
    for (int compressType = 0; compressType < NUM_COMPRESS_TYPES; compressType++) {
        //fprintf(stderr, "PartitionReusableCompressedTiles compressType: %d\n", compressType);

        auto& tileKeyInfoEntries = this->reusableCompressedTileKeyInfoByCompressType[compressType];

        //fprintf(stderr, "PartitionReusableCompressedTiles after array read\n");

        if (compressType == COMPRESS_TYPE_0h0b) {
            for (std::shared_ptr<TileKeyInfoEntry> tileKeyInfoEntryPtr : tileKeyInfoEntries) {
                TileKeyInfoEntry& tileKeyInfoEntry = *tileKeyInfoEntryPtr;
                tileKeyInfoEntry.reusableTileNum = this->numReusableCompressedTiles;
                this->numReusableCompressedTiles++;
                this->reusableCompressedTileGrouping.push_back({tileKeyInfoEntry.keyPtr});
            }
        } else if (compressType == COMPRESS_TYPE_0h2b || compressType == COMPRESS_TYPE_1h0b) {
            while (tileKeyInfoEntries.size() >= 2) {
                TileKeyInfoEntry& tileKeyInfoEntry1 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();
                TileKeyInfoEntry& tileKeyInfoEntry2 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();
                tileKeyInfoEntry1.reusableTileNum = this->numReusableCompressedTiles;
                tileKeyInfoEntry2.reusableTileNum = this->numReusableCompressedTiles + 1;
                this->numReusableCompressedTiles += 2;
                this->reusableCompressedTileGrouping.push_back({tileKeyInfoEntry1.keyPtr, tileKeyInfoEntry2.keyPtr});
            }
        } else {
            while ((tileKeyInfoEntries.size()) >= 4) {
                TileKeyInfoEntry& tileKeyInfoEntry1 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();
                TileKeyInfoEntry& tileKeyInfoEntry2 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();
                TileKeyInfoEntry& tileKeyInfoEntry3 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();
                TileKeyInfoEntry& tileKeyInfoEntry4 = *tileKeyInfoEntries.front();
                tileKeyInfoEntries.pop_front();

                tileKeyInfoEntry1.reusableTileNum = this->numReusableCompressedTiles;
                tileKeyInfoEntry2.reusableTileNum = this->numReusableCompressedTiles + 1;
                tileKeyInfoEntry3.reusableTileNum = this->numReusableCompressedTiles + 2;
                tileKeyInfoEntry4.reusableTileNum = this->numReusableCompressedTiles + 3;
                this->numReusableCompressedTiles += 4;
                this->reusableCompressedTileGrouping.push_back({tileKeyInfoEntry1.keyPtr, tileKeyInfoEntry2.keyPtr, tileKeyInfoEntry3.keyPtr, tileKeyInfoEntry4.keyPtr});
            }
        }
    }

    //fprintf(stderr, "valid subcases count: %lu\n", ARRAY_COUNT(sValidSubcases));
    //fprintf(stderr, "doing subcases loop\n");

    for (size_t i = 0; i < ARRAY_COUNT(sValidSubcases); i++) {
        //fprintf(stderr, "subcase i: %lu\n", i);
        while (true) {
            bool canSubtract = true;
            const size_t * validSubcase = sValidSubcases[i];

            //fprintf(stderr, "Before can subtract check\n");
            for (int j = COMPRESS_TYPE_0h1b; j < NUM_COMPRESS_TYPES; j++) {
                if (this->reusableCompressedTileKeyInfoByCompressType[j].size() < validSubcase[j - 1]) {
                    canSubtract = false;
                    break;
                }
            }
            //fprintf(stderr, "After can subtract check\n");

            if (canSubtract) {
                std::vector<std::shared_ptr<TileKey>> reusableCompressedTileGroup;

                //fprintf(stderr, "Before subtraction loop\n");
                for (int j = COMPRESS_TYPE_0h1b; j < NUM_COMPRESS_TYPES; j++) {
                    //fprintf(stderr, "subtraction iteration %d, subcase val: %lu\n", j, validSubcase[j - 1]);
                    auto& tileKeyInfoEntries = this->reusableCompressedTileKeyInfoByCompressType[j];
                    for (size_t k = 0; k < validSubcase[j - 1]; k++) {
                        //fprintf(stderr, "individual pop_front iteration %lu\n", k);

                        TileKeyInfoEntry& tileKeyInfoEntry = *tileKeyInfoEntries.front();
                        tileKeyInfoEntries.pop_front();

                        //fprintf(stderr, "After pop, ptr: %p\n", &tileKeyInfoEntry);
                        tileKeyInfoEntry.reusableTileNum = this->numReusableCompressedTiles;
                        //fprintf(stderr, "After inc\n");
                        this->numReusableCompressedTiles++;
                        reusableCompressedTileGroup.push_back(tileKeyInfoEntry.keyPtr);
                    }
                }
                //fprintf(stderr, "After subtraction loop\n");
                this->reusableCompressedTileGrouping.push_back(reusableCompressedTileGroup);
            } else {
                break;
            }
        }
    }

    std::vector<std::shared_ptr<TileKey>> reusableCompressedTileGroup;

    for (int compressType = COMPRESS_TYPE_0h1b; compressType < NUM_COMPRESS_TYPES; compressType++) {
        auto& tileKeyInfoEntries = this->reusableCompressedTileKeyInfoByCompressType[compressType];

        for (std::shared_ptr<TileKeyInfoEntry>& tileKeyInfoEntryPtr : tileKeyInfoEntries) {
            TileKeyInfoEntry& tileKeyInfoEntry = *tileKeyInfoEntryPtr;
            tileKeyInfoEntry.reusableTileNum = this->numReusableCompressedTiles;
            this->numReusableCompressedTiles++;
            reusableCompressedTileGroup.push_back(tileKeyInfoEntry.keyPtr);
        }
    }

    this->reusableCompressedTileGrouping.push_back(reusableCompressedTileGroup);

    if (this->numReusableCompressedTiles >= 256) {
        FATAL_ERROR("numReusableCompressedTiles >= 256\n");
    }
}

void SpriteCompressor::OutputReusableCompressedTileData()
{
    int reusableCompressedTileOffsetsGroupIndex = 0;
    int curWordOffset = 0;

    int numReusableCompressedTileGroupingsMinus1 = this->reusableCompressedTileGrouping.size() - 1;

    for (int curEntryIndex = 0; curEntryIndex < numReusableCompressedTileGroupingsMinus1 + 1; curEntryIndex++) {
        std::vector<std::shared_ptr<TileKey>> reusableCompressedTileGroup = this->reusableCompressedTileGrouping[curEntryIndex];
        std::array<int, 3> reusableCompressedTileOffsetsEntry = {0, 0, 0};

        for (const auto& tileKeyPtr : reusableCompressedTileGroup) {
            const auto& tileKeyInfoEntryPtrPair = this->tileKeyInfo.find(tileKeyPtr);

            if (tileKeyInfoEntryPtrPair == this->tileKeyInfo.end()) {
                FATAL_ERROR("Couldn't find tileKeyPtr in tileKeyInfo");
            }

            auto& tileKeyInfoEntry = *tileKeyInfoEntryPtrPair->second;

            for (const uint32_t word : tileKeyInfoEntry.compressedWords) {
                AppendWord(this->reusableCompressedTileData, word);
            }

            reusableCompressedTileOffsetsEntry[2] = curWordOffset;
            this->reusableCompressedTileOffsets.push_back(reusableCompressedTileOffsetsEntry);
            curWordOffset += tileKeyInfoEntry.compressedWords.size();
        }

        int curHalfwordOffset = curWordOffset * 2;

        for (int i = 0; const auto& tileKeyPtr : reusableCompressedTileGroup) {
            auto& reusableCompressedTileOffsetsEntry = this->reusableCompressedTileOffsets[reusableCompressedTileOffsetsGroupIndex + i];

            curWordOffset = reusableCompressedTileOffsetsEntry[2];
            const auto& tileKeyInfoEntryPtrPair = this->tileKeyInfo.find(tileKeyPtr);

            if (tileKeyInfoEntryPtrPair == this->tileKeyInfo.end()) {
                FATAL_ERROR("Couldn't find tileKeyPtr in tileKeyInfo");
            }

            auto& tileKeyInfoEntry = *tileKeyInfoEntryPtrPair->second;

            for (const uint32_t halfword : tileKeyInfoEntry.compressedHalfwords) {
                AppendHalfword(this->reusableCompressedTileData, halfword);
            }

            int halfwordRelativeOffset = (curHalfwordOffset - curWordOffset * 2);
            if (halfwordRelativeOffset >= 256) {
                FATAL_ERROR("halfwordRelativeOffset >= 256\n");
            }

            reusableCompressedTileOffsetsEntry[1] = halfwordRelativeOffset;
            curHalfwordOffset += tileKeyInfoEntry.compressedHalfwords.size();
            i++;
        }

        int curByteOffset = curHalfwordOffset * 2;

        for (int i = 0; const auto& tileKeyPtr : reusableCompressedTileGroup) {
            auto& reusableCompressedTileOffsetsEntry = this->reusableCompressedTileOffsets[reusableCompressedTileOffsetsGroupIndex + i];
            curWordOffset = reusableCompressedTileOffsetsEntry[2];

            const auto& tileKeyInfoEntryPtrPair = this->tileKeyInfo.find(tileKeyPtr);

            if (tileKeyInfoEntryPtrPair == this->tileKeyInfo.end()) {
                FATAL_ERROR("Couldn't find tileKeyPtr in tileKeyInfo");
            }

            auto& tileKeyInfoEntry = *tileKeyInfoEntryPtrPair->second;

            //fprintf(stderr, "byte insert: %d, size: %lu, reusableCompressedTileData offset: 0x%lx\n", i, tileKeyInfoEntry.compressedBytes.size(), this->reusableCompressedTileData.size());
            this->reusableCompressedTileData.insert(this->reusableCompressedTileData.end(), tileKeyInfoEntry.compressedBytes.begin(), tileKeyInfoEntry.compressedBytes.end());

            int byteRelativeOffset = (curByteOffset - curWordOffset * 4);

            if (byteRelativeOffset >= 256) {
                FATAL_ERROR("byteRelativeOffset >= 256\n");
            }

            reusableCompressedTileOffsetsEntry[0] = byteRelativeOffset;

            curByteOffset += tileKeyInfoEntry.compressedBytes.size();
            i++;
        }

        //fprintf(stderr, "reusableCompressedTileOffsetsEntry[w,h,b]: 0x%x, 0x%x, 0x%x\n", reusableCompressedTileOffsetsEntry[2], reusableCompressedTileOffsetsEntry[1], reusableCompressedTileOffsetsEntry[0]);

        if ((curByteOffset & 3) != 0 && curEntryIndex != numReusableCompressedTileGroupingsMinus1) {
            FATAL_ERROR("file: %s, curEntryIndex: %d\n", this->inputFilename.c_str(), curEntryIndex);
        }

        curWordOffset = curByteOffset / 4;
        reusableCompressedTileOffsetsGroupIndex += reusableCompressedTileGroup.size();
    }
}

void SpriteCompressor::SetReusableRawTileNums()
{
    int curTileNum = this->numReusableCompressedTiles;

    for (auto & [tileKeyPtr, tileKeyInfoEntryPtr] : this->tileKeyInfo) {
        if (tileKeyInfoEntryPtr->outputTileType == OutputType::REUSABLE_RAW) {
            tileKeyInfoEntryPtr->reusableTileNum = curTileNum;
            curTileNum++;
            this->uncompressedTileData.insert(this->uncompressedTileData.end(), tileKeyPtr->data.begin(), tileKeyPtr->data.end());
        }
    }

    if (curTileNum >= 256) {
        FATAL_ERROR("curTileNum >= 256\n");
    }
}

void SpriteCompressor::GenerateFrameData()
{
    int numTilesPerFrame = this->width * this->height;

    int frameByteOffset = 0;
    int frameHalfwordOffset = 0;
    int frameWordOffset = 0;
    int bitPosStart;

    if (this->spriteSize == SPRITE_SIZE_16x16) {
        bitPosStart = 6;
    } else if (this->spriteSize == SPRITE_SIZE_16x32) {
        bitPosStart = 14;
    } else {
        bitPosStart = 30;
    }

    for (int i = 0; i < this->numFrames; i++) {
        //fprintf(stderr, "GenerateFrameData i: %d\n", i);
        std::vector<uint32_t> frameBitfield;

        if (this->spriteSize == SPRITE_SIZE_64x64) {
            frameBitfield = {0, 0, 0, 0};
        } else {
            frameBitfield = {0};
        }

        int bitPos = bitPosStart;

        for (int j = 0; j < numTilesPerFrame; j++) {
            int tileIndex = i * numTilesPerFrame + j;

            std::shared_ptr<TileKey> tileKeyPtr = this->tiles[tileIndex];

            const auto& tileKeyInfoEntryPtrPair = this->tileKeyInfo.find(tileKeyPtr);

            if (tileKeyInfoEntryPtrPair == this->tileKeyInfo.end()) {
                FATAL_ERROR("Couldn't find tileKeyRef in tileKeyInfo");
            }

            auto& tileKeyInfoEntry = *tileKeyInfoEntryPtrPair->second;

            OutputType outputTileType = tileKeyInfoEntry.outputTileType;

            if (outputTileType == OutputType::BLANK) {
                frameBitfield[j >> 4] |= (0 << bitPos);
            } else if (outputTileType == OutputType::UNIQUE_RAW) {
                frameBitfield[j >> 4] |= (1 << bitPos);

                // Iterate over the span in chunks of 4 bytes
                for (size_t j = 0; j < tileKeyPtr->data.size(); j += sizeof(uint32_t)) {
                    // Read 4 bytes and merge them into a uint32_t
                    uint32_t word = static_cast<uint32_t>(tileKeyPtr->data[j]) |
                        (static_cast<uint32_t>(tileKeyPtr->data[j + 1]) << 8) |
                        (static_cast<uint32_t>(tileKeyPtr->data[j + 2]) << 16) |
                        (static_cast<uint32_t>(tileKeyPtr->data[j + 3]) << 24);
                    this->wordData.push_back(word);
                }
            } else if (outputTileType == OutputType::UNIQUE_COMPRESSED) {
                frameBitfield[j >> 4] |= (2 << bitPos);
                this->wordData.insert(this->wordData.end(), tileKeyInfoEntry.compressedWords.begin(), tileKeyInfoEntry.compressedWords.end());
                this->halfwordData.insert(this->halfwordData.end(), tileKeyInfoEntry.compressedHalfwords.begin(), tileKeyInfoEntry.compressedHalfwords.end());
                this->byteData.insert(this->byteData.end(), tileKeyInfoEntry.compressedBytes.begin(), tileKeyInfoEntry.compressedBytes.end());
            } else if (outputTileType == OutputType::REUSABLE_RAW || outputTileType == OutputType::REUSABLE_COMPRESSED) {
                frameBitfield[j >> 4] |= (3 << bitPos);
                this->byteData.push_back(tileKeyInfoEntry.reusableTileNum);
            }

            bitPos -= 2;
            if (bitPos < 0) {
                bitPos = bitPosStart;
            }
        }

        this->frameOffsetsTable.push_back({frameByteOffset, frameHalfwordOffset, frameWordOffset});
        frameByteOffset = this->byteData.size();
        frameHalfwordOffset = this->halfwordData.size();
        frameWordOffset = this->wordData.size();

        if (this->spriteSize == SPRITE_SIZE_16x16) {
            this->frameBitfields.push_back(frameBitfield[0]);
        } else if (this->spriteSize == SPRITE_SIZE_16x32) {
            //fprintf(stderr, "Append frameBitfield 16x32: 0x%02x\n", frameBitfield[0]);
            AppendHalfword(this->frameBitfields, frameBitfield[0]);
            
        } else if (this->spriteSize == SPRITE_SIZE_32x32) {
            AppendWord(this->frameBitfields, frameBitfield[0]);
        } else {
            for (const uint32_t frameBitfieldPart : frameBitfield) {
                AppendWord(this->frameBitfields, frameBitfieldPart);
            }
        }
    }

    int reusableCompressedTileDataLen = this->reusableCompressedTileData.size();
    int baseFrameByteOffset = reusableCompressedTileDataLen;
    if (((this->byteData.size() + reusableCompressedTileDataLen) & 1) == 1) {
        this->byteData.push_back(0);
    }

    int baseFrameHalfwordOffset = (baseFrameByteOffset + this->byteData.size()) / 2;
    if (((this->halfwordData.size() + baseFrameHalfwordOffset) & 1) == 1) {
        this->halfwordData.push_back(0);
    }

    int baseFrameWordOffset = (baseFrameHalfwordOffset + this->halfwordData.size()) / 2;

    for (auto& frameOffsets : this->frameOffsetsTable) {
        frameOffsets[0] += baseFrameByteOffset;
        frameOffsets[1] += baseFrameHalfwordOffset;
        frameOffsets[2] += baseFrameWordOffset;
    }
}

void SpriteCompressor::WriteToFile()
{
    std::vector<unsigned char> output;

    output.push_back(this->numReusableUncompressedTiles);
    output.push_back(this->numReusableCompressedTiles);
    output.push_back(this->spriteSize);
    output.push_back(this->numFrames);

    //fprintf(stderr, "Size before framebitfields insert: %lu, frameBitfields.size(): %lu\n", output.size(), this->frameBitfields.size());

    output.insert(output.end(), this->frameBitfields.begin(), this->frameBitfields.end());

    //fprintf(stderr, "Size after framebitfields insert: %lu\n", output.size());

    while ((output.size() & 3) != 0) {
        output.push_back(0);
    }

    for (const auto& reusableCompressedTileOffsetsEntry : this->reusableCompressedTileOffsets) {
        output.push_back(reusableCompressedTileOffsetsEntry[0]); // byte
        output.push_back(reusableCompressedTileOffsetsEntry[1]); // halfword
        AppendHalfword(output, reusableCompressedTileOffsetsEntry[2]); // word
    }

    output.insert(output.end(), this->uncompressedTileData.begin(), this->uncompressedTileData.end());

    for (const auto& frameOffsets : this->frameOffsetsTable) {
        AppendHalfword(output, frameOffsets[0]); // byte
        AppendHalfword(output, frameOffsets[1]); // halfword
        AppendHalfword(output, frameOffsets[2]); // word
    }

    if ((output.size() & 3) == 2) {
        AppendHalfword(output, 0);
    }

    output.insert(output.end(), this->reusableCompressedTileData.begin(), this->reusableCompressedTileData.end());
    output.insert(output.end(), this->byteData.begin(), this->byteData.end());

    for (const uint32_t halfword : this->halfwordData) {
        AppendHalfword(output, halfword);
    }

    for (const uint32_t word : this->wordData) {
        AppendWord(output, word);
    }

    std::ofstream outputFile(this->outputFilename, std::ios::out|std::ios::binary);

    if (!outputFile.is_open()) {
        FATAL_ERROR("Could not open \"%s\" for writing.\n", this->outputFilename.c_str());
    }

    //fprintf(stderr, "output[0]: %d\n", output[0]);

    outputFile.write(reinterpret_cast<const char *>(output.data()), output.size());

    outputFile.close();
}

void SpriteCompressor::Process()
{
    //std::fprintf(stderr, "ReadInTiles\n");
    this->ReadInTiles();
    //std::fprintf(stderr, "GenerateTileKeyInfo\n");
    this->GenerateTileKeyInfo();
    //std::fprintf(stderr, "PartitionReusableCompressedTiles\n");
    this->PartitionReusableCompressedTiles();
    //std::fprintf(stderr, "OutputReusableCompressedTileData\n");
    this->OutputReusableCompressedTileData();
    //std::fprintf(stderr, "SetReusableRawTileNums\n");
    this->SetReusableRawTileNums();
    //std::fprintf(stderr, "GenerateFrameData\n");
    this->GenerateFrameData();
    //std::fprintf(stderr, "WriteToFile\n");
    this->WriteToFile();
}

int main(int argc, char **argv)
{
    if (argc != 7 || std::strcmp(argv[3], "-mwidth") || std::strcmp(argv[5], "-mheight")) {
        std::fprintf(stderr, "Usage: %s INPUT_4BPP_FILE OUTPUT_4BPP_SZ_FILE -mwidth WIDTH -mheight HEIGHT\n", argv[0]);
        return 1;
    }

    std::string inputFilename(argv[1]);
    std::string outputFilename(argv[2]);

    int width = std::stoi(argv[4]);
    int height = std::stoi(argv[6]);

    SpriteCompressor spriteCompressor(inputFilename, outputFilename, width, height);

    spriteCompressor.Process();

    return 0;
}