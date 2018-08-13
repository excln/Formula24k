
require("lua.lua_ext")
local consts = require("lua.play_consts")
local skin_values = require("lua.skin_values")
local main = {}


local skin_type_map = {}
skin_type_map[consts.SKIN_TYPE.PLAY_24K_SP] = skin_values.skin_type.PLAY_24KEYS
skin_type_map[consts.SKIN_TYPE.PLAY_24K_DP] = skin_values.skin_type.PLAY_24KEYS_DOUBLE

local function skin_name_for(skin_type, resolution)
	return "Formula ".. resolution.name
end

local function shows_main_bga(skin_type, resolution)
	return skin_type ~= consts.SKIN_TYPE.PLAY_24K_DP
end

local function is_dp(skin_type)
	return skin_type == consts.SKIN_TYPE.PLAY_24K_DP
end

function main.skin(skin_type, resolution)

	local prop = require("lua.play_properties")

	local header = {
		type = skin_type_map[skin_type],
		name = skin_name_for(skin_type, resolution),
		w = resolution.width,
		h = resolution.height,
		playstart = 1000,
		scene = 3600000,
		input = 500,
		close = 1500,
		fadeout = 1000,
	}
	header.property = prop.get_properties(is_dp(skin_type), shows_main_bga(skin_type, resolution))
	header.filepath = prop.get_files()

	local function body()
		local util = require("lua.play_util")
		local skin = {}
		for k, v in pairs(header) do
			skin[k] = v
		end

		local src_ids = {
			background = 1,
			frame = 2,
			number = 3,
			judge = 4,
			lane = 5,
			laser = 6,
			keyboard = 7,
			frame_close = 8,
			fullcombo = 9,
			bomb = 10,
			hold = 11,
			lanecover = 12,
			object = 14,
		}

		skin.source = {
			{id = src_ids.background, path = prop.files.generic_background.path},
			{id = src_ids.frame, path = prop.files.frame.path .. "/frame.png"},
			{id = src_ids.number, path = prop.files.number.path},
			{id = src_ids.judge, path = prop.files.judge.path},
			{id = src_ids.lane, path = prop.files.lane.path},
			{id = src_ids.laser, path = prop.files.laser_type.path .. "/image.png"},
			{id = src_ids.keyboard, path = prop.files.keyboard.path},
			{id = src_ids.frame_close, path = prop.files.frame.path .. "/close.png"},
			{id = src_ids.fullcombo, path = prop.files.fullcombo.path .. "/image.png"},
			{id = src_ids.bomb, path = prop.files.bomb.path},
			{id = src_ids.hold, path = prop.files.hold.path},
			{id = src_ids.lanecover, path = prop.files.lanecover.path},
			{id = src_ids.object, path = prop.files.object.path}
		}
		skin.font = {
			{ id = 0, path = "VL-Gothic-Regular.ttf" }
		}
		skin.image = {
			{ id = "background", src = src_ids.background, x = 0, y = 0, w = 1280, h = 720 },
			{id = "percent", src = src_ids.number, x = 195, y = 12, w = 15, h = 16},
			{id = "period", src = src_ids.number, x = 210, y = 12, w = 7, h = 16},
			{id = "colon", src = src_ids.number, x = 217, y = 12, w = 7, h = 16},
		}
		skin.imageset = {}
		skin.value = {}
		skin.text = {}
		skin.slider = {}
		skin.graph = {}
		skin.note = {}
		skin.gauge = { id = "gauge" }
		skin.judge = {}
		skin.bga = { id = "bga" }
		skin.destination = {}

		local geometry = {}
		if prop.current.get_play_side_v() == 1 then
			geometry.main_y = 0
		else
			geometry.main_y = 180
		end

		local frame_module = require("lua.play_frame")
		local frame = frame_module.load(skin_type, resolution, src_ids.frame, src_ids.frame_close, src_ids.number, 0)
		table.append_all(skin.image, frame.images)
		table.append_all(skin.value, frame.values)
		table.append_all(skin.text, frame.texts)
		table.append_all(skin.slider, frame.sliders)
		table.append_all(skin.graph, frame.graphs)
		skin.gauge.nodes = frame.gauge_nodes

		local lane_module = require("lua.play_lane")
		local lane = lane_module.load(skin_type, resolution, src_ids.keyboard, src_ids.lane)
		table.append_all(skin.image, lane.images)

		local note_module = require("lua.play_note")
		local note = note_module.load(skin_type, resolution, lane.geometry, src_ids.object, src_ids.lanecover, frame.images.section_line.id)
		table.append_all(skin.image, note.images)
		table.append_all(skin.slider, note.sliders)
		skin.note = note.note

		local judge_module = require("lua.play_judge")
		local judge = judge_module.load(skin_type, resolution, src_ids.judge)
		table.append_all(skin.image, judge.images)
		table.append_all(skin.value, judge.values)
		skin.judge = judge.judges

		local bomb_module = require("lua.play_bomb")
		local bomb = bomb_module.load(skin_type, resolution, src_ids.bomb, src_ids.hold, lane.geometry)
		table.append_all(skin.image, bomb.images)

		local laser_color_status, laser_color = pcall(function()
			return dofile(skin_config.get_path(prop.files.laser_color.path))
		end)
		if not laser_color_status then
			laser_color = consts.LASER_COLOR_DEFAULT
		end

		local laser_status, laser = pcall(function()
			local m = dofile(skin_config.get_path(prop.files.laser_type.path) .. "/skin.lua")
			return m.load(skin_type, resolution, src_ids.laser, lane.geometry, lane.key_clusters, laser_color)
		end)
		if laser_status and laser then
			table.append_all(skin.image, laser.images)
		else
			laser = {}
		end

		local fc_status, fc = pcall(function()
			local m = dofile(skin_config.get_path(prop.files.fullcombo.path) .. "/skin.lua")
			return m.load(skin_type, resolution, src_ids.fullcombo, lane.geometry)
		end)
		if fc_status and fc then
			table.append_all(skin.image, fc.images)
		else
			fc = {}
		end

		-- Background
		if prop.current.is_background_generic_image() then
			table.insert(skin.destination, {
				id = "background", stretch = 2, dst = {
					{ x = 0, y = 0, w = 1280, h = 720 }
				}
			})
		end
		if prop.current.is_background_stagefile() then
			table.append_all(skin.destination, {
				{id = "background", stretch = 2, dst = {
					{x = 0, y = 0, w = 1280, h = 720}
				}},
				{id = -100, stretch = 2, dst = {
					{x = 0, y = 0, w = 1280, h = 720},
				}},
			})
		end
		if prop.current.is_background_bga() then
			table.append_all(skin.destination, {
				{id = "bga", stretch = 2, dst = {
					{x = 0, y = 0, w = 1280, h = 720}
				}},
				{id = "background", op = {80}, stretch = 2, dst = {
					{x = 0, y = 0, w = 1280, h = 720}
				}},
				{id = "background", stretch = 2, timer = 40, loop = -1, dst = {
					{time = 0, x = 0, y = 0, w = 1280, h = 720, a = 255},
					{time = 500, a = 0}
				}},
				{id = -100, op = {80}, stretch = 2, dst = {
					{x = 0, y = 0, w = 1280, h = 720}
				}},
				{id = -100, stretch = 2, timer = 40, loop = -1, dst = {
					{time = 0, x = 0, y = 0, w = 1280, h = 720, a = 255},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}}
			})
		end

		-- Frame (base) / Main BGA
		table.append_all(skin.destination, frame.dst_base)
		if shows_main_bga(skin_type, resolution) then
			local x = frame.geometry.frame_bga_x
			local y = frame.geometry.frame_bga_y
			local w = frame.geometry.frame_bga_w
			local h = frame.geometry.frame_bga_h
			table.insert(skin.destination, {id = frame.images.fadeout.id, dst = {{ x = x, y = y, w = w, h = h }}})
			if prop.current.get_main_bga_size() == 1 then
				table.insert(skin.destination, {id = "bga", stretch = 1, dst = {{ x = x, y = y, w = w, h = h }}})
			else
				table.insert(skin.destination, {id = "bga", stretch = 3, dst = {{ x = x, y = y, w = w, h = h }}})
			end
			if prop.current.shows_title_backbmp() then
				table.insert(skin.destination, {id = -101, stretch = 1, op = {80}, dst = {
					{x = x, y = y, w = w, h = h}
				}})
				table.insert(skin.destination, {id = -101, stretch = 1, timer = 40, loop = -1, dst = {
					{time = 0, x = x, y = y, w = w, h = h, a = 255},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}})
			end
		end

		-- Lanes
		table.append_all(skin.destination, lane.dst_keyboard)
		table.append_all(skin.destination, lane.dst_lane)

		-- Keybeams
		table.append_all(skin.destination, laser.destinations)

		-- Notes
		table.append_all(skin.destination, lane.dst_judgeline)
		table.append_all(skin.destination, note.destinations)

		-- Bombs
		table.append_all(skin.destination, bomb.destinations)

		-- Judge
		table.append_all(skin.destination, judge.destinations)
		table.append_all(skin.destination, fc.destinations)

		-- Panel
		table.append_all(skin.destination, frame.dst_panel)

		-- Foreground
		table.append_all(skin.destination, frame.dst_fore)
		table.append_all(skin.destination, frame.dst_close)
		table.insert(skin.destination, {id = frame.images.fadeout.id, loop = 500, timer = 2, dst = {
			{time = 0, x = 0, y = 0, w = 1280, h = 720, a = 0},
			{time = 500, a = 255}
		}})

		return skin
	end

	return {
		header = header,
		body = body,
	}
end


return main
