
require("lua.lua_ext")
local util = require("lua.play_util")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local ext = {}

function ext.load(skin_type, resolution, src_id_frame, src_id_close, src_id_number)
	local skin = {}

	skin.images = {
		{id = "close-main-u", src = src_id_close, x = 0, y = 0, w = 1280, h = 360},
		{id = "close-main-l", src = src_id_close, x = 0, y = 360, w = 1280, h = 360},
		{id = "close-text", src = src_id_close, x = 408, y = 720, w = 464, h = 108},
		{id = "close-bl-a", src = src_id_close, x = 352, y = 720, w = 32, h = 108},
		{id = "close-bl-x", src = src_id_close, x = 0, y = 720, w = 352, h = 108},
		{id = "close-br-a", src = src_id_close, x = 896, y = 720, w = 32, h = 108},
		{id = "close-br-x", src = src_id_close, x = 928, y = 720, w = 352, h = 108},
	}

	skin.dst_close = {
		{id = "close-main-l", loop = 640, timer = 3, dst = {
			{time = 0, x = 0, y = -360, w = 1280, h = 360},
			{time = 200, y = -200},
			{time = 480, y = 0},
			{time = 560, y = -60},
			{time = 640, y = 0}
		}},
		{id = "close-main-u", loop = 640, timer = 3, dst = {
			{time = 0, x = 0, y = 720, w = 1280, h = 360},
			{time = 200, y = 600},
			{time = 480, y = 360},
			{time = 560, y = 420},
			{time = 640, y = 360}
		}},
		{id = "close-text", loop = 1000, timer = 3, blend = 2, dst = {
			{time = 660, x = 408, y = 306, w = 464, h = 108, a = 0},
			{time = 960, a = 255},
			{time = 1000}
		}},
		{id = "close-bl-a", loop = 1000, timer = 3, blend = 2, dst = {
			{time = 680, x = 352, y = 306, w = 32, h = 108},
			{time = 960},
			{time = 1000}
		}},
		{id = "close-bl-x", loop = 1000, timer = 3, blend = 2, dst = {
			{time = 680, x = 320, y = 306, w = 32, h = 108},
			{time = 960, x = 0, w = 352},
			{time = 1000}
		}},
		{id = "close-br-a", loop = 1000, timer = 3, blend = 2, dst = {
			{time = 680, x = 896, y = 306, w = 32, h = 108},
			{time = 960},
			{time = 1000}
		}},
		{id = "close-br-x", loop = 1000, timer = 3, blend = 2, dst = {
			{time = 680, x = 928, y = 306, w = 32, h = 108},
			{time = 960, x = 928, w = 352},
			{time = 1000}
		}}
	}

	return skin
end

return ext
