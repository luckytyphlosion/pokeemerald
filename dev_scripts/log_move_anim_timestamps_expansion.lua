-- =============================================================================
-- Copyright (c) 2025 luckytyphlosion
-- 
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
-- REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
-- AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
-- INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
-- LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.
-- =============================================================================

local sSpriteTileAllocBitmap = nil
local gCurrentMove = nil
local gBattlerAttacker = nil
local gBattlerTarget = nil
local startFrameCount = emu.framecount()
local gMain_inBattle = nil

dofile("move_names_expansion.lua")

local moveAnimTimestamps = {}

local function onMoveAnimStart()
	local currentMove = memory.read_u16_le(gCurrentMove)
	local battlerAttacker = memory.read_u8(gBattlerAttacker)
	local battlerTarget = memory.read_u8(gBattlerTarget)

	local moveAnimTimestampInfo = moveAnimTimestamps[currentMove]
	if moveAnimTimestampInfo == nil then
		moveAnimTimestampInfo = {}
		moveAnimTimestamps[currentMove] = moveAnimTimestampInfo
	end

	local moveAnimTimestamp = moveAnimTimestampInfo[battlerAttacker * 4 + battlerTarget]
	if moveAnimTimestamp == nil then
		moveAnimTimestamp = {
			attacker = battlerAttacker,
			target = battlerTarget,
			frameNum = emu.framecount() - startFrameCount
		}
		moveAnimTimestampInfo[battlerAttacker * 4 + battlerTarget] = moveAnimTimestamp
	end
end

local function readBreakpointsAndSetAddrs()
	local file = io.open("sprite_tiles_alloc_info.txt", "r")
	local inputLines = {}

	for line in file:lines() do
		inputLines[#inputLines + 1] = line
	end
	file:close()

	local moveAnimStartAddr = tonumber(inputLines[1])
	local moveAnimEndAddr = tonumber(inputLines[2])
	gCurrentMove = tonumber(inputLines[3])
	gBattlerAttacker = tonumber(inputLines[4])
	gBattlerTarget = tonumber(inputLines[5])
	gMain_inBattle = tonumber(inputLines[6]) + 0x439

	event.onmemoryexecute(onMoveAnimStart, moveAnimStartAddr)
	--event.onmemoryexecute(onMoveAnimEnd, moveAnimEndAddr)
end

local function writeTimestampsToFile()
	local output = {}

	for currentMove, moveAnimTimestampInfo in pairs(moveAnimTimestamps) do
		output[#output + 1] = string.format("%d,%s", currentMove, MOVE_NAMES_EXPANSION[currentMove])
		for key, moveAnimTimestamp in pairs(moveAnimTimestampInfo) do
			output[#output + 1] = string.format("~%d,%d,%d", moveAnimTimestamp.attacker, moveAnimTimestamp.target, moveAnimTimestamp.frameNum)
		end
	end

	local file = io.open("move_anim_timestamps_expansion.txt", "w+")
	file:write(table.concat(output, "\n"))
	file:close()
end

print("Running log_move_anim_timestamps_expansion.lua!")

readBreakpointsAndSetAddrs()

while true do
	local inBattle = memory.read_u8(gMain_inBattle)
	if (inBattle & 2) == 0 then
		writeTimestampsToFile()
		client.pause()
		return
	end
	emu.frameadvance()
end
