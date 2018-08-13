
require("lua.lua_ext")
local util = require("lua.play_util")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local ext = {}

function ext.load(skin_type, resolution, src_id_fullcombo, lane_geometry)
	local skin = {}

	skin.images = {
		{id = "fullcombo-b-1", src = src_id_fullcombo, x = 0, y = 0, w = 512, h = 256},
		{id = "fullcombo-b-2", src = src_id_fullcombo, x = 512, y = 0, w = 512, h = 256},
		{id = "fullcombo-b-3", src = src_id_fullcombo, x = 0, y = 0, w = 512, h = 256},
		{id = "fullcombo-b-4", src = src_id_fullcombo, x = 512, y = 0, w = 512, h = 256},
		{id = "fullcombo-p", src = src_id_fullcombo, x = 0, y = 768, w = 256, h = 256},
		{id = "fullcombo-s-u1", src = src_id_fullcombo, x = 256, y = 588, w = 384, h = 180},
		{id = "fullcombo-s-u2", src = src_id_fullcombo, x = 640, y = 588, w = 384, h = 180},
		{id = "fullcombo-s-d1", src = src_id_fullcombo, x = 256, y = 844, w = 384, h = 180},
		{id = "fullcombo-s-d2", src = src_id_fullcombo, x = 640, y = 844, w = 384, h = 180},
		{id = "fullcombo-f", src = src_id_fullcombo, x = 256, y = 768, w = 384, h = 48},
	}
	skin.destinations = {}

	local rate = 250
	local alphas = {255, 191, 63, 0, 63, 191}
	local phase_offsets = {0, 1, 4, 3}

	local shine_parts = {
		{id = "fullcombo-s-u1", v = 2},
		{id = "fullcombo-s-u2", v = 1},
		{id = "fullcombo-s-d1", v = -1},
		{id = "fullcombo-s-d2", v = -2},
	}

	local fullcombo_y = lane_geometry.keyboard_y + 60 - 16
	for _, group in ipairs(lane_geometry.groups) do

		local b_duration = 12
		local b_fadeout = 6

		for n = 1, 4 do
			local image = {id =  "fullcombo-b-" .. n, loop = -1, blend =  2, timer = 48, offset = 3, dst = {
				{time = 0, x = group.x, y = fullcombo_y, w = group.w, h = group.w * 256 / 512, a = 0},
			}}
			for t = 1, b_duration do
				local a = alphas[(t + phase_offsets[n]) % 6 + 1]
				if t < 2 then
					a = a * t / 2
				elseif t > b_duration - b_fadeout then
					a = a * (b_duration - a) / b_fadeout
				end
				table.insert(image.dst, { time = rate * t, a = a })
			end
			table.insert(skin.destinations, image)
		end

		for i = 1, 100 do
			local s = 0.25 + 0.75 * math.random()
			local t = math.random() * 1200 + 1
			local x = group.x + math.random() * (group.w - 40) + 20 - 128*s
			local v = 0
			local y = fullcombo_y + 10.0 - 128*s
			local a = 255
			local image = {id = "fullcombo-p", loop = -1, blend = 2, timer = 48, offset = 3, dst = {
				{time = 0, x = x, y = y, w = 256*s, h = 256*s, r = 127, g = 191, b = 255, a = 0},
				{time = t, a = 0},
			}}
			for j = 1, 12 do
				if j <= 4 then
					a = 255 * j / 4
				elseif j >= 6 then
					a = a * 0.67
				end
				t = t + 100
				v = v + (math.random() - 0.5) * 3.0 * s
				x = x + v
				y = y + 30*s
				table.insert(image.dst, { time = t, x = x, y = y, a = a })
			end
			table.insert(skin.destinations, image)
		end
		
		local font_x = group.x + (group.w - 384)/2
		local font_y = fullcombo_y + 200
		local shine_y = font_y - (180 - 48)/2
		local base_t = 160
		table.insert(skin.destinations, {id = "fullcombo-f", loop = -1, blend = 1, timer = 48, offset = 3, dst = {
			{time = 0, x = font_x, y = font_y - 200, w = 384, h = 48, a = 0},
			{time = base_t + 0, y = font_y, h = 48, a = 63},
			{time = base_t + 40, y = font_y + 120 + 24, h = 96, a = 127},
			{time = base_t + 80, y = font_y - 120 - 12, h = 72, a = 155},
			{time = base_t + 120, y = font_y, h = 48, a = 255},
			{time = 1000, y = font_y, a = 255},
			{time = 1050, y = font_y, a = 0},
			{time = 1100, y = font_y, a = 255},
			{time = 1150, y = font_y, a = 0},
			{time = 1200, y = font_y, a = 127},
			{time = 1250, y = font_y, a = 0},
			{time = 1300, y = font_y, a = 63},
			{time = 1350, y = font_y, a = 0},
			{time = 1400, y = font_y, a = 31},
			{time = 1450, y = font_y, a = 0},
		}})
		for _, shine in ipairs(shine_parts) do
			table.insert(skin.destinations, {id = shine.id, loop = -1, blend = 2, timer = 48, offset = 3, dst = {
				{time = base_t + 0, x = font_x, y = shine_y - 10 * shine.v - 90, w = 384, h = 360, r = 127, g = 191, b = 255, a = 63},
				{time = base_t + 40, y = shine_y - 30, h = 240, a = 255},
				{time = base_t + 80, y = shine_y + 5 * shine.v, h = 180, a = 191},
				{time = base_t + 200, y = shine_y + 10 * shine.v + 30, h = 120, a = 63},
				{time = base_t + 500, y = shine_y + 30 * shine.v + 50, h = 60, a = 0},
			}})
		end
	end

	return skin
end

return ext
