
require("lua.lua_ext")
local util = require("lua.play_util")
local consts = require("lua.play_consts")
local prop = require("lua.play_properties")
local note = {}

function note.load(skin_type, resolution, lane_geometry, src_id_note, src_id_lanecover, image_id_line)
	local skin = {}

	skin.images = {}
	skin.sliders = {
		{id = "lanecover", src = src_id_lanecover, x = 0, y = 0, w = 585, h = 660, angle = 2, range = 480, type = 4}
	}
	skin.note = { id = "notes" }

	local keys_count
	local key_types = {}
	if skin_type == consts.SKIN_TYPE.PLAY_24K_SP then
		keys_count = 26
	elseif skin_type == consts.SKIN_TYPE.PLAY_24K_DP then
		keys_count = 52
	end
	for i = 1, keys_count do
		key_types[i] = util.get_keyboard_wbss(i)
	end

	local function images_note_wb(prefix, y, h)
		return {
			{id = prefix.."-w", src = src_id_note, x = 0, y = y, w = 36, h = h},
			{id = prefix.."-b", src = src_id_note, x = 40, y = y, w = 32, h = h},
			{id = prefix.."-s", src = src_id_note, x = 0, y = 0, w = 0, h = 0},		-- dummy
		}
	end
	
	table.append_all(skin.images, images_note_wb("note", 0, 12))
	table.append_all(skin.images, images_note_wb("lne", 16, 12))
	table.append_all(skin.images, images_note_wb("lns", 30, 12))
	table.append_all(skin.images, images_note_wb("lnb", 44, 6))
	table.append_all(skin.images, images_note_wb("lna", 52, 1))
	table.append_all(skin.images, images_note_wb("hcne", 60, 12))
	table.append_all(skin.images, images_note_wb("hcns", 74, 12))
	table.append_all(skin.images, images_note_wb("hcnb", 88, 1))
	table.append_all(skin.images, images_note_wb("hcna", 96, 1))
	table.append_all(skin.images, images_note_wb("hcnd", 104, 1))
	table.append_all(skin.images, images_note_wb("hcnr", 112, 1))
	table.append_all(skin.images, images_note_wb("mine", 128, 12))
	table.append_all(skin.images, {
		{id = "note-su", src = src_id_note, x = 0, y = 160, w = 55, h = 16},
		{id = "note-sd", src = src_id_note, x = 60, y = 160, w = 55, h = 16},
		{id = "mine-su", src = src_id_note, x = 0, y = 178, w = 55, h = 16},
		{id = "mine-sd", src = src_id_note, x = 60, y = 178, w = 55, h = 16},
	})

	local function set_note_images_wbss(category, prefix)
		skin.note[category] = {}
		for i = 1, keys_count do
			local t = key_types[i]
			if t == 0 then
				skin.note[category][i] = prefix.."-w"
			elseif t == 1 then
				skin.note[category][i] = prefix.."-b"
			elseif t == 2 then
				skin.note[category][i] = prefix.."-su"
			else
				skin.note[category][i] = prefix.."-sd"
			end
		end
	end

	local function set_note_images_wb(category, prefix)
		skin.note[category] = {}
		for i = 1, keys_count do
			local t = key_types[i]
			if t == 0 then
				skin.note[category][i] = prefix.."-w"
			elseif t == 1 then
				skin.note[category][i] = prefix.."-b"
			else
				skin.note[category][i] = prefix.."-s"		-- dummy
			end
		end
	end

	set_note_images_wbss("note", "note")
	set_note_images_wbss("mine", "mine")
	set_note_images_wb("lnend", "lne")
	set_note_images_wb("lnstart", "lns")
	set_note_images_wb("lnbody", "lnb")
	set_note_images_wb("lnactive", "lna")
	set_note_images_wb("hcnend", "hcne")
	set_note_images_wb("hcnstart", "hcns")
	set_note_images_wb("hcnbody", "hcnb")
	set_note_images_wb("hcnactive", "hcna")
	set_note_images_wb("hcndamage", "hcnd")
	set_note_images_wb("hcnreactive", "hcnr")
	skin.note.hidden = {}
	skin.note.processed = {}

	skin.note.dst = {}
	for i = 1, keys_count do
		skin.note.dst[i] = {
			x = lane_geometry.notes_x[i],
			y = lane_geometry.note_y,
			w = lane_geometry.notes_w[i],
			h = lane_geometry.lane_h,
		}
	end

	local function set_line_groups(category, h, r, g, b)
		skin.note[category] = {}
		for i, group in ipairs(lane_geometry.groups) do
			skin.note[category][i] = {
				id = image_id_line,
				offset = 3,
				dst = {
					{ x = group.x, y = lane_geometry.note_y, w = group.w, h = h, r = r, g = g, b = b }
				}
			}
		end
	end

	set_line_groups("group", 1, 128, 128, 128)
	set_line_groups("time", 1, 64, 192, 192)
	set_line_groups("bpm", 2, 0, 192, 0)
	set_line_groups("stop", 2, 192, 192, 0)

	skin.destinations = {
		{ id = skin.note.id }
	}
	for i, group in ipairs(lane_geometry.groups) do
		table.append_all(skin.destinations, {
			{id = "lanecover", dst = {
				{x = group.x, y = lane_geometry.note_y + 480, w = group.w, h = 660}
			}},
		})
	end

	return skin
end

return note

