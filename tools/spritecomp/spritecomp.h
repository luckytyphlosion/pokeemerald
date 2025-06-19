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

#ifndef SPRITECOMP_H
#define SPRITECOMP_H

#include <string>
#include <set>
#include <functional>
#include <deque>
#include <array>
#include <vector>
#include <memory>

enum class TileType
{
    IS_LEFT_SIDE,
    IS_RIGHT_SIDE,
    HAS_NO_BYTES_OR_HALFWORDS
};

class TileKey
{
public:
    TileKey(std::span<unsigned char> data, bool isRightSide);
    TileKey(const TileKey& other);

    std::span<unsigned char> data;
    TileType tileType;
    int compressedSizeNoOverhead;
    bool isBlank;

    bool operator<(const TileKey& other) const;
    TileKey& operator=(const TileKey& other);

private:
    bool CalcCompressedSizeNoOverHeadAndTileKey(bool isRightSide);
};

// Custom comparator for std::shared_ptr<TileKey>
struct TileKeyComparator {
    bool operator()(const std::shared_ptr<TileKey>& lhs, const std::shared_ptr<TileKey>& rhs) const {
        return *lhs < *rhs; // Compare the underlying TileKey objects
    }
};

enum class OutputType
{
    BLANK,
    UNIQUE_RAW,
    UNIQUE_COMPRESSED,
    REUSABLE_RAW,
    REUSABLE_COMPRESSED,
};

enum CompressType
{
    COMPRESS_TYPE_0h0b = 0,
    COMPRESS_TYPE_0h1b = 1,
    COMPRESS_TYPE_0h2b = 2,
    COMPRESS_TYPE_1h0b = 3,
    COMPRESS_TYPE_0h3b = 4,
    COMPRESS_TYPE_1h1b = 5,
    COMPRESS_TYPE_1h3b = 6,
    NUM_COMPRESS_TYPES = 7,
};

class TileKeyInfoEntry
{
public:
    TileKeyInfoEntry(std::shared_ptr<TileKey> keyPtr, OutputType outputTileType);
    TileKeyInfoEntry(const TileKeyInfoEntry& other);

    void CompressTile();

    std::shared_ptr<TileKey> keyPtr;
    OutputType outputTileType;
    int reusableTileNum;
    std::vector<unsigned char> compressedBytes;
    std::vector<uint32_t> compressedHalfwords;
    std::vector<uint32_t> compressedWords;
    enum CompressType compressType;

    TileKeyInfoEntry& operator=(const TileKeyInfoEntry& other);
};

enum SpriteSize
{
    SPRITE_SIZE_16x16 = 0,
    SPRITE_SIZE_16x32 = 1,
    SPRITE_SIZE_32x32 = 2,
    SPRITE_SIZE_64x64 = 3
};

class SpriteCompressor
{
public:
    SpriteCompressor(std::string inputFilename, std::string outputFilename, int width, int height);
    void Process();

private:
    std::string inputFilename;
    std::string outputFilename;
    int width;
    int height;

    int numReusableUncompressedTiles;
    int numReusableCompressedTiles;
    enum SpriteSize spriteSize;
    int numFrames;

    std::vector<unsigned char> inputData;
    std::map<std::shared_ptr<TileKey>, int, TileKeyComparator> tileCounter;
    std::vector<std::shared_ptr<TileKey>> tiles;
    std::map<std::shared_ptr<TileKey>, std::shared_ptr<TileKeyInfoEntry>, TileKeyComparator> tileKeyInfo;

    std::array<std::deque<std::shared_ptr<TileKeyInfoEntry>>, NUM_COMPRESS_TYPES> reusableCompressedTileKeyInfoByCompressType;

    std::vector<std::vector<std::shared_ptr<TileKey>>> reusableCompressedTileGrouping;
    std::vector<unsigned char> reusableCompressedTileData;
    std::vector<std::array<int, 3>> reusableCompressedTileOffsets;
    std::vector<unsigned char> uncompressedTileData;

    std::vector<uint32_t> wordData;
    std::vector<uint32_t> halfwordData;
    std::vector<unsigned char> byteData;
    std::vector<std::array<int, 3>> frameOffsetsTable;
    std::vector<unsigned char> frameBitfields;

    void ReadInTiles();
    void GenerateTileKeyInfo();
    void PartitionReusableCompressedTiles();
    void OutputReusableCompressedTileData();
    void SetReusableRawTileNums();
    void GenerateFrameData();
    void WriteToFile();
};

#ifdef _MSC_VER

#define FATAL_ERROR(format, ...)               \
do                                             \
{                                              \
    std::fprintf(stderr, format, __VA_ARGS__); \
    std::exit(1);                              \
} while (0)

#else

#define FATAL_ERROR(format, ...)                 \
do                                               \
{                                                \
    std::fprintf(stderr, format, ##__VA_ARGS__); \
    std::exit(1);                                \
} while (0)

#endif // _MSC_VER

#define ARRAY_COUNT(array) (size_t)(sizeof(array) / sizeof((array)[0]))

#endif // SPRITECOMP_H
