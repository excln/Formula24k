
require("lua.lua_ext")
local util = require("lua.play_util")
local skin_values = require("lua.skin_values")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local ext = {}

function ext.load(skin_type, resolution, src_id_laser, lane_geometry, key_clusters, laser_color)
	local skin = {}

	local params = {
		keybeam_on_duration = 30,
		keybeam_off_duration = 120,
		keybeam_alpha_max = 223,
	}

	skin.images = {
		{id = "keybeam-su", src = 6, x = 1, y = 0, w = 55, h = 240},
		{id = "keybeam-sd", src = 6, x = 57, y = 0, w = 55, h = 240},
		{id = "keybeam-01", src = 6, x = 113, y = 0, w = 36, h = 240},
		{id = "keybeam-02", src = 6, x = 150, y = 0, w = 21, h = 240},
		{id = "keybeam-03", src = 6, x = 172, y = 0, w = 37, h = 240},
		{id = "keybeam-04", src = 6, x = 210, y = 0, w = 21, h = 240},
		{id = "keybeam-05", src = 6, x = 232, y = 0, w = 36, h = 240},
		{id = "keybeam-06", src = 6, x = 291, y = 0, w = 37, h = 240},
		{id = "keybeam-07", src = 6, x = 329, y = 0, w = 21, h = 240},
		{id = "keybeam-08", src = 6, x = 351, y = 0, w = 37, h = 240},
		{id = "keybeam-09", src = 6, x = 389, y = 0, w = 21, h = 240},
		{id = "keybeam-10", src = 6, x = 411, y = 0, w = 37, h = 240},
		{id = "keybeam-11", src = 6, x = 449, y = 0, w = 21, h = 240},
		{id = "keybeam-12", src = 6, x = 471, y = 0, w = 37, h = 240},
	}

	skin.destinations = {}

	local keyflash_octave_order = { 1, 3, 5, 6, 8, 10, 12, 2, 4, 7, 9, 11 }
	local function key_suffix(k)
		if k < 10 then
			return "0"..k
		else
			return k
		end
	end

	local function generic_dst(id, timer, loop, blend, a1, a2, x, y, w, h1, h2, color)
		return {
			id = id,
			timer = timer,
			loop = loop,
			blend = blend,
			offset = 3,
			dst = {
				{ time = 0, x = x, y = y, w = w, h = h1, r = color.r, g = color.g, b = color.b, a = a1 },
				{ time = loop, h = h2, a = a2 },
			}
		}
	end

	local function color_lighter(color)
		return {
			r = color.r + (255 - color.r) * 0.5,
			g = color.g + (255 - color.g) * 0.5,
			b = color.b + (255 - color.b) * 0.5,
		}
	end

	local function keybeam_on(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_on(k),
			params.keybeam_on_duration, 1,
			params.keybeam_alpha_max, params.keybeam_alpha_max,
			xw.x, lane_geometry.keyboard_y + 60, xw.w, 240, 480, color_lighter(color))
	end

	local function keybeam_off(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_off(k),
			params.keybeam_off_duration, 1,
			params.keybeam_alpha_max, 0,
			xw.x, lane_geometry.keyboard_y + 60, xw.w, 480, 120, color_lighter(color))
	end

	local function keybeam_key_xw(x, i)
		return { x = x + lane_geometry.notes_octave_x[i], w = lane_geometry.notes_octave_w[i], }
	end

	local function keybeam_wheel_xw(x)
		return { x = x + lane_geometry.note_wheel_x, w = lane_geometry.note_wheel_w }
	end

	local function keybeam_key_id(i)
		return "keybeam-"..key_suffix(i)
	end

	local function add_octave(x, k)
		local dst_beam_on = {}
		local dst_beam_off = {}
		for i = 1, 12 do
			local n = k + i - 1
			dst_beam_on[i] = keybeam_on(n, keybeam_key_id(i), keybeam_key_xw(x, i), laser_color.keybeam_color_normal)
			dst_beam_off[i] = keybeam_off(n, keybeam_key_id(i), keybeam_key_xw(x, i), laser_color.keybeam_color_normal)
		end
		for j = 1, 12 do
			o = keyflash_octave_order[j]
			table.insert(skin.destinations, dst_beam_on[o])
			table.insert(skin.destinations, dst_beam_off[o])
		end
	end

	local white = { r = 255, g = 255, b = 255 }

	local function add_wheel(x, k)
		table.append_all(skin.destinations, {
			keybeam_on(k, "keybeam-su", keybeam_wheel_xw(x, i), white),
			keybeam_off(k, "keybeam-su", keybeam_wheel_xw(x, i), white),
			keybeam_on(k+1, "keybeam-sd", keybeam_wheel_xw(x, i), white),
			keybeam_off(k+1, "keybeam-sd", keybeam_wheel_xw(x, i), white),
		})
	end

	local k = 1
	for _, cluster in ipairs(key_clusters) do
		if cluster.wheel_side == 1 then
			local x = cluster.position_x + lane_geometry.wheel_lane_width
			for o = 1, cluster.octave do
				add_octave(x, k)
				x = x + lane_geometry.octave_interval
				k = k + 12
			end
			add_wheel(cluster.position_x, k)
			k = k + 2
		else
			local x = cluster.position_x
			for o = 1, cluster.octave do
				add_octave(x, k)
				x = x + lane_geometry.octave_interval
				k = k + 12
			end
			add_wheel(x, k)
			k = k + 2
		end
	end

	return skin
end

return ext
