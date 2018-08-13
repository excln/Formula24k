
require("lua.lua_ext")
local util = require("lua.play_util")
local skin_values = require("lua.skin_values")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local ext = {}

function ext.load(skin_type, resolution, src_id_laser, lane_geometry, key_clusters, laser_color)
	local skin = {}

	local params = {
		keyflash_on_duration = 30,
		keyflash_off_duration = 90,
		keyflash_alpha_max = 63,
		keybeam_on_duration = 30,
		keybeam_off_duration = 120,
		keybeam_alpha_max = 255,
	}

	skin.images = {
		{id = "keyflash-01", src = src_id_laser, x = 120, y = 16, w = 38, h = 105},
		{id = "keyflash-05", src = src_id_laser, x = 195, y = 16, w = 38, h = 105},
		{id = "keyflash-08", src = src_id_laser, x = 270, y = 16, w = 39, h = 105},
		{id = "keyflash-12", src = src_id_laser, x = 346, y = 16, w = 39, h = 105},
		{id = "keyflash-03", src = src_id_laser, x = 157, y = 132, w = 39, h = 105},
		{id = "keyflash-06", src = src_id_laser, x = 232, y = 132, w = 39, h = 105},
		{id = "keyflash-10", src = src_id_laser, x = 308, y = 132, w = 39, h = 105},
		{id = "keyflash-02", src = src_id_laser, x = 146, y = 248, w = 21, h = 67},
		{id = "keyflash-04", src = src_id_laser, x = 186, y = 248, w = 21, h = 67},
		{id = "keyflash-07", src = src_id_laser, x = 258, y = 248, w = 21, h = 67},
		{id = "keyflash-09", src = src_id_laser, x = 298, y = 248, w = 21, h = 67},
		{id = "keyflash-11", src = src_id_laser, x = 338, y = 248, w = 21, h = 67},
		{id = "keyflash-su", src = src_id_laser, x = 78, y = 16, w = 39, h = 82},
		{id = "keyflash-sd", src = src_id_laser, x = 78, y = 112, w = 39, h = 82},
		{id = "keybeam-su", src = src_id_laser, x = 400, y = 0, w = 55, h = 240},
		{id = "keybeam-sd", src = src_id_laser, x = 456, y = 0, w = 55, h = 240},
		{id = "keybeam-01", src = src_id_laser, x = 512, y = 0, w = 36, h = 240},
		{id = "keybeam-02", src = src_id_laser, x = 549, y = 0, w = 21, h = 240},
		{id = "keybeam-03", src = src_id_laser, x = 571, y = 0, w = 37, h = 240},
		{id = "keybeam-04", src = src_id_laser, x = 609, y = 0, w = 21, h = 240},
		{id = "keybeam-05", src = src_id_laser, x = 631, y = 0, w = 36, h = 240},
		{id = "keybeam-06", src = src_id_laser, x = 668, y = 0, w = 37, h = 240},
		{id = "keybeam-07", src = src_id_laser, x = 706, y = 0, w = 21, h = 240},
		{id = "keybeam-08", src = src_id_laser, x = 728, y = 0, w = 37, h = 240},
		{id = "keybeam-09", src = src_id_laser, x = 766, y = 0, w = 21, h = 240},
		{id = "keybeam-10", src = src_id_laser, x = 788, y = 0, w = 37, h = 240},
		{id = "keybeam-11", src = src_id_laser, x = 826, y = 0, w = 21, h = 240},
		{id = "keybeam-12", src = src_id_laser, x = 848, y = 0, w = 37, h = 240},
		{id = "keybeam-tail-su", src = src_id_laser, x = 400, y = 240, w = 55, h = 56},
		{id = "keybeam-tail-sd", src = src_id_laser, x = 456, y = 240, w = 55, h = 56},
		{id = "keybeam-tail-01", src = src_id_laser, x = 512, y = 240, w = 36, h = 56},
		{id = "keybeam-tail-02", src = src_id_laser, x = 549, y = 240, w = 21, h = 56},
		{id = "keybeam-tail-03", src = src_id_laser, x = 571, y = 240, w = 37, h = 56},
		{id = "keybeam-tail-04", src = src_id_laser, x = 609, y = 240, w = 21, h = 56},
		{id = "keybeam-tail-05", src = src_id_laser, x = 631, y = 240, w = 36, h = 56},
		{id = "keybeam-tail-06", src = src_id_laser, x = 668, y = 240, w = 37, h = 56},
		{id = "keybeam-tail-07", src = src_id_laser, x = 706, y = 240, w = 21, h = 56},
		{id = "keybeam-tail-08", src = src_id_laser, x = 728, y = 240, w = 37, h = 56},
		{id = "keybeam-tail-09", src = src_id_laser, x = 766, y = 240, w = 21, h = 56},
		{id = "keybeam-tail-10", src = src_id_laser, x = 788, y = 240, w = 37, h = 56},
		{id = "keybeam-tail-11", src = src_id_laser, x = 826, y = 240, w = 21, h = 56},
		{id = "keybeam-tail-12", src = src_id_laser, x = 848, y = 240, w = 37, h = 56},
		{id = "keybeam-su-w", src = src_id_laser, x = 400, y = 320, w = 55, h = 390},
		{id = "keybeam-sd-w", src = src_id_laser, x = 456, y = 320, w = 55, h = 390},
	}

	skin.dst_layers = {
		flash_normal = {},
		flash_additive = {},
		beam = {},
		wheel_fx = {},
	}

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
			dst = {
				{ time = 0, x = x, y = y, w = w, h = h1, r = color.r, g = color.g, b = color.b, a = a1 },
				{ time = loop, h = h2, a = a2 },
			}
		}
	end

	local function keyflash_on(k, id, rect, blend, color)
		return generic_dst(
			id, skin_values.timer_key_on(k),
			params.keyflash_on_duration, blend,
			params.keyflash_alpha_max / 2, params.keyflash_alpha_max,
			rect.x, rect.y, rect.w, rect.h, rect.h, color)
	end

	local function keyflash_off(k, id, rect, blend, color)
		return generic_dst(
			id, skin_values.timer_key_off(k),
			params.keyflash_off_duration, blend,
			params.keyflash_alpha_max, 0,
			rect.x, rect.y, rect.w, rect.h, rect.h, color)
	end

	local function keyflash_key_id(i)
		return "keyflash-"..key_suffix(i)
	end

	local function keyflash_key_rect(x, i)
		return  {
			x = x + lane_geometry.keyflash_octave_x[i],
			y = lane_geometry.keyboard_y + lane_geometry.keyflash_octave_y[i],
			w = lane_geometry.keyflash_octave_w[i],
			h = lane_geometry.keyflash_octave_h[i],
		}
	end

	local function keyflash_wheel_rect(x)
		return {
			x = x + lane_geometry.keyflash_wheel_x,
			y = lane_geometry.keyboard_y + lane_geometry.keyflash_wheel_y,
			w = lane_geometry.keyflash_wheel_w,
			h = lane_geometry.keyflash_wheel_h,
		}
	end

	local function keybeam_on(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_on(k),
			params.keybeam_on_duration, 1,
			params.keybeam_alpha_max, params.keybeam_alpha_max,
			xw.x, lane_geometry.keyboard_y + 116, xw.w, 240, 424, color)
	end

	local function keybeam_off(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_off(k),
			params.keybeam_off_duration, 1,
			params.keybeam_alpha_max, 0,
			xw.x, lane_geometry.keyboard_y + 116, xw.w, 424, 120, color)
	end

	local function keybeam_tail_on(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_on(k),
			params.keybeam_on_duration, 1,
			params.keybeam_alpha_max, params.keybeam_alpha_max,
			xw.x, lane_geometry.keyboard_y + 60, xw.w, 56, 56, color)
	end

	local function keybeam_tail_off(k, id, xw, color)
		return generic_dst(
			id, skin_values.timer_key_off(k),
			params.keybeam_off_duration, 1,
			params.keybeam_alpha_max, 0,
			xw.x, lane_geometry.keyboard_y + 60, xw.w, 56, 56, color)
	end

	local function keybeam_key_xw(x, i)
		return { x = x + lane_geometry.notes_octave_x[i], w = lane_geometry.notes_octave_w[i], }
	end

	local function keybeam_key_tail_xw(x, i)
		return { x = x + lane_geometry.keybeam_tail_octave_x[i], w = lane_geometry.keybeam_tail_octave_w[i], }
	end

	local function keybeam_wheel_xw(x)
		return { x = x + lane_geometry.note_wheel_x, w = lane_geometry.note_wheel_w }
	end

	local function keybeam_key_id(i)
		return "keybeam-"..key_suffix(i)
	end

	local function keybeam_key_tail_id(i)
		return "keybeam-tail-"..key_suffix(i)
	end

	local function add_octave(x, k)
		local dst_n_on = {}
		local dst_n_off = {}
		local dst_a_on = {}
		local dst_a_off = {}
		local dst_beam_on = {}
		local dst_beam_off = {}
		local dst_beam_tail_on = {}
		local dst_beam_tail_off = {}
		for i = 1, 12 do
			local n = k + i - 1
			dst_n_on[i] = keyflash_on(n, keyflash_key_id(i), keyflash_key_rect(x, i), 1, laser_color.keyflash_color_normal)
			dst_n_off[i] = keyflash_off(n, keyflash_key_id(i), keyflash_key_rect(x, i), 1, laser_color.keyflash_color_normal)
			dst_a_on[i] = keyflash_on(n, keyflash_key_id(i), keyflash_key_rect(x, i), 2, laser_color.keyflash_color_add)
			dst_a_off[i] = keyflash_off(n, keyflash_key_id(i), keyflash_key_rect(x, i), 2, laser_color.keyflash_color_add)
			dst_beam_on[i] = keybeam_on(n, keybeam_key_id(i), keybeam_key_xw(x, i), laser_color.keybeam_color_normal)
			dst_beam_off[i] = keybeam_off(n, keybeam_key_id(i), keybeam_key_xw(x, i), laser_color.keybeam_color_normal)
			dst_beam_tail_on[i] = keybeam_tail_on(n, keybeam_key_tail_id(i), keybeam_key_tail_xw(x, i), laser_color.keybeam_color_normal)
			dst_beam_tail_off[i] = keybeam_tail_off(n, keybeam_key_tail_id(i), keybeam_key_tail_xw(x, i), laser_color.keybeam_color_normal)
		end
		for j = 1, 12 do
			o = keyflash_octave_order[j]
			table.insert(skin.dst_layers.flash_normal, dst_n_on[o])
			table.insert(skin.dst_layers.flash_normal, dst_n_off[o])
			table.insert(skin.dst_layers.flash_additive, dst_a_on[o])
			table.insert(skin.dst_layers.flash_additive, dst_a_off[o])
			table.insert(skin.dst_layers.beam, dst_beam_on[o])
			table.insert(skin.dst_layers.beam, dst_beam_off[o])
			table.insert(skin.dst_layers.beam, dst_beam_tail_on[o])
			table.insert(skin.dst_layers.beam, dst_beam_tail_off[o])
		end
	end

	local white = { r = 255, g = 255, b = 255 }

	local function add_wheel(x, k)
		table.append_all(skin.dst_layers.flash_normal, {
			keyflash_on(k, "keyflash-su", keyflash_wheel_rect(x), 1, white),
			keyflash_off(k, "keyflash-su", keyflash_wheel_rect(x), 1, white),
			keyflash_on(k+1, "keyflash-sd", keyflash_wheel_rect(x), 1, white),
			keyflash_off(k+1, "keyflash-sd", keyflash_wheel_rect(x), 1, white),
		})
		table.append_all(skin.dst_layers.flash_additive, {
			keyflash_on(k, "keyflash-su", keyflash_wheel_rect(x), 2, white),
			keyflash_off(k, "keyflash-su", keyflash_wheel_rect(x), 2, white),
			keyflash_on(k+1, "keyflash-sd", keyflash_wheel_rect(x), 2, white),
			keyflash_off(k+1, "keyflash-sd", keyflash_wheel_rect(x), 2, white),
		})
		table.append_all(skin.dst_layers.beam, {
			keybeam_on(k, "keybeam-su", keybeam_wheel_xw(x, i), white),
			keybeam_off(k, "keybeam-su", keybeam_wheel_xw(x, i), white),
			keybeam_on(k+1, "keybeam-sd", keybeam_wheel_xw(x, i), white),
			keybeam_off(k+1, "keybeam-sd", keybeam_wheel_xw(x, i), white),
			keybeam_tail_on(k, "keybeam-tail-su", keybeam_wheel_xw(x, i), white),
			keybeam_tail_off(k, "keybeam-tail-su", keybeam_wheel_xw(x, i), white),
			keybeam_tail_on(k+1, "keybeam-tail-sd", keybeam_wheel_xw(x, i), white),
			keybeam_tail_off(k+1, "keybeam-tail-sd", keybeam_wheel_xw(x, i), white),
		})
		table.append_all(skin.dst_layers.wheel_fx, {
			{id = "keybeam-su-w",
				timer = skin_values.timer_key_on(k),
				loop = -1, blend = 2, offset = 3,
				dst = {
					{ time = 0, x = x + lane_geometry.note_wheel_x, y = lane_geometry.keyboard_y + 60, w = lane_geometry.note_wheel_w, h = 390, a = 31 },
					{time = 30, a = 63}, {time = 90, a = 31}, {time = 180, a = 0},
				}
			},
			{id = "keybeam-sd-w",
				timer = skin_values.timer_key_on(k+1),
				loop = -1, blend = 2, offset = 3,
				dst = {
					{ time = 0, x = x + lane_geometry.note_wheel_x, y = lane_geometry.keyboard_y + 60, w = lane_geometry.note_wheel_w, h = 390, a = 31 },
					{time = 30, a = 63}, {time = 90, a = 31}, {time = 180, a = 0},
				}
			}
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

	skin.destinations = {}
	for layer_name, dsts in pairs(skin.dst_layers) do
		table.append_all(skin.destinations, dsts)
	end

	return skin
end

return ext
