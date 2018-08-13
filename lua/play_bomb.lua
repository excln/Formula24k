
require("lua.lua_ext")
local util = require("lua.play_util")
local skin_values = require("lua.skin_values")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local bomb = {}

function bomb.load(skin_type, resolution, src_id_bomb, src_id_hold, lane_geometry)
	local skin = {}

	skin.images = {}
	skin.destinations = {}

	local keys_count
	local key_types = {}
	if skin_type == consts.SKIN_TYPE_24K_SP or skin_type == consts.SKIN_TYPE_24K_SP_WIDE then
		keys_count = 26
	elseif skin_type == consts.SKIN_TYPE_24K_DP then
		keys_count = 52
	end

	local function id_bomb(i)
		return "bomb-"..i
	end
	local function id_hold(i)
		return "hold-"..i
	end

	for i = 1, keys_count do
		table.append_all(skin.images, {
			{id = id_bomb(i), src = src_id_bomb, x = 0, y = 0, w = 2048, h = 2048, divx = 8, divy = 8, timer = skin_values.timer_key_bomb(i), cycle = 1067},
			{id = id_hold(i), src = src_id_hold, x = 0, y = 0, w = 1024, h = 1024, divx = 4, divy = 4, timer = skin_values.timer_key_hold(i), cycle = 267},
		})
		table.append_all(skin.destinations, {
			{
				id = id_bomb(i),
				timer = skin_values.timer_key_bomb(i),
				loop = -1, blend = 2, offset = 3,
				dst = {
					{time = 0,
						x = lane_geometry.notes_x[i] + lane_geometry.notes_w[i] / 2 - 128,
						y = lane_geometry.note_y - 124,
						w = 256,
						h = 256
					}, {time = 1000}
				}
			},
			{
				id = id_hold(i),
				timer = skin_values.timer_key_hold(i),
				blend = 2, offset = 3,
				dst = {
					{time = 0,
						x = lane_geometry.notes_x[i] + lane_geometry.notes_w[i] / 2 - 128,
						y = lane_geometry.note_y - 124,
						w = 256,
						h = 256
					}
				}
			},
		})
	end

	return skin
end

return bomb
