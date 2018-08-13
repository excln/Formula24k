
require("lua.lua_ext")
local util = require("lua.play_util")
local skin_values = require("lua.skin_values")
local consts = require("lua.play_consts")
local prop = require("lua.play_properties")
local lane = {}

function lane.load(skin_type, resolution, src_id_keyboard, src_id_lane)
	local skin = {}

	skin.geometry = {}
	skin.images = {}
	skin.dst_keyboard = {}
	skin.dst_lane = {}
	skin.dst_judgeline = {}

	-- Set keyboard octave geometry & source images
	local lane_src_offset_y = 0
	local lane_geometry = prop.current.get_lane_geometry()
	_t = {
		[consts.LANE_GEOMETRY.PROPORTIONAL] = function()
			skin.geometry.octave_interval = 264
			skin.geometry.wheel_lane_width = 56
			skin.geometry.notes_octave_x = { 1, 23, 39, 64, 77, 113, 134, 152, 175, 190, 216, 228 }
			skin.geometry.notes_octave_w = { 35, 27, 35, 27, 35,  36, 27, 35, 27, 35, 27, 36  }
			skin.geometry.note_wheel_x = 1
			skin.geometry.note_wheel_w = 55
			lane_src_offset_y = 0
		end,
		[consts.LANE_GEOMETRY.ISOSCELES] = function()
			skin.geometry.octave_interval = 264
			skin.geometry.wheel_lane_width = 56
			skin.geometry.notes_octave_x = { 1, 24, 39, 62, 77, 113, 137, 152, 175, 190, 213, 228 }
			skin.geometry.notes_octave_w = { 35, 27, 35, 27, 35,  36, 27, 35, 27, 35, 27, 36  }
			skin.geometry.note_wheel_x = 1
			skin.geometry.note_wheel_w = 55
			lane_src_offset_y = 0
		end,
		[consts.LANE_GEOMETRY.HYBRID] = function()
			skin.geometry.octave_interval = 264
			skin.geometry.wheel_lane_width = 56
			skin.geometry.notes_octave_x = { 1, 23, 41, 63, 81, 113, 135, 153, 175, 193, 215, 233 }
			skin.geometry.notes_octave_w = { 31, 27, 31, 27, 31,  31, 27, 31, 27, 31, 27, 31  }
			skin.geometry.note_wheel_x = 1
			skin.geometry.note_wheel_w = 55
			lane_src_offset_y = 128
		end,
		[consts.LANE_GEOMETRY.SEPARATE] = function()
			skin.geometry.octave_interval = 264
			skin.geometry.wheel_lane_width = 56
			skin.geometry.notes_octave_x = { 1, 25, 44, 69, 88, 112, 136, 155, 179, 198, 222, 241 }
			skin.geometry.notes_octave_w = { 24, 19, 25, 19, 24,  24, 19, 24, 19, 24, 19, 24  }
			skin.geometry.note_wheel_x = 1
			skin.geometry.note_wheel_w = 55
			lane_src_offset_y = 256
		end,
	}
	_t[lane_geometry]()
	table.append_all(skin.images, {
		{id = "lane-1pW-t", src = src_id_lane, x = 40, y = lane_src_offset_y + 0, w = 57, h = 40},
		{id = "lane-1pW-c", src = src_id_lane, x = 40, y = lane_src_offset_y + 40, w = 57, h = 40},
		{id = "lane-1pW-b", src = src_id_lane, x = 40, y = lane_src_offset_y + 80, w = 57, h = 40},
		{id = "lane-2pW-t", src = src_id_lane, x = 415, y = lane_src_offset_y + 0, w = 57, h = 40},
		{id = "lane-2pW-c", src = src_id_lane, x = 415, y = lane_src_offset_y + 40, w = 57, h = 40},
		{id = "lane-2pW-b", src = src_id_lane, x = 415, y = lane_src_offset_y + 80, w = 57, h = 40},
		{id = "lane-octave-t", src = src_id_lane, x = 120, y = lane_src_offset_y + 0, w = 265, h = 40},
		{id = "lane-octave-c", src = src_id_lane, x = 120, y = lane_src_offset_y + 40, w = 265, h = 40},
		{id = "lane-octave-b", src = src_id_lane, x = 120, y = lane_src_offset_y + 80, w = 265, h = 40},
		{id = "lane-opaque-1pW-t", src = src_id_lane, x = 40, y = 384, w = 57, h = 40},
		{id = "lane-opaque-1pW-c", src = src_id_lane, x = 40, y = 424, w = 57, h = 40},
		{id = "lane-opaque-2pW-t", src = src_id_lane, x = 415, y = 384, w = 57, h = 40},
		{id = "lane-opaque-2pW-c", src = src_id_lane, x = 415, y = 424, w = 57, h = 40},
		{id = "lane-opaque-octave-t", src = src_id_lane, x = 120, y = 384, w = 265, h = 40},
		{id = "lane-opaque-octave-c", src = src_id_lane, x = 120, y = 424, w = 265, h = 40},
		{id = "kb-1pL", src = src_id_keyboard, x = 0, y = 0, w = 97, h = 128},
		{id = "kb-1pR", src = src_id_keyboard, x = 98, y = 0, w = 21, h = 128},
		{id = "kb-2pL", src = src_id_keyboard, x = 393, y = 0, w = 21, h = 128},
		{id = "kb-2pR", src = src_id_keyboard, x = 415, y = 0, w = 97, h = 128},
		{id = "kb-octave", src = src_id_keyboard, x = 120, y = 0, w = 265, h = 128},
		{id = "keypress-01", src = src_id_keyboard, x = 120, y = 144, w = 38, h = 105},
		{id = "keypress-05", src = src_id_keyboard, x = 195, y = 144, w = 38, h = 105},
		{id = "keypress-08", src = src_id_keyboard, x = 270, y = 144, w = 39, h = 105},
		{id = "keypress-12", src = src_id_keyboard, x = 346, y = 144, w = 39, h = 105},
		{id = "keypress-03", src = src_id_keyboard, x = 157, y = 260, w = 39, h = 105},
		{id = "keypress-06", src = src_id_keyboard, x = 232, y = 260, w = 39, h = 105},
		{id = "keypress-10", src = src_id_keyboard, x = 308, y = 260, w = 39, h = 105},
		{id = "keypress-02", src = src_id_keyboard, x = 146, y = 376, w = 21, h = 63},
		{id = "keypress-04", src = src_id_keyboard, x = 186, y = 376, w = 21, h = 63},
		{id = "keypress-07", src = src_id_keyboard, x = 258, y = 376, w = 21, h = 63},
		{id = "keypress-09", src = src_id_keyboard, x = 298, y = 376, w = 21, h = 63},
		{id = "keypress-11", src = src_id_keyboard, x = 338, y = 376, w = 21, h = 63},
		{id = "keypress-su1", src = src_id_keyboard, x = 0, y = 144, w = 39, h = 82},
		{id = "keypress-su2", src = src_id_keyboard, x = 39, y = 144, w = 39, h = 82},
		{id = "keypress-su3", src = src_id_keyboard, x = 78, y = 144, w = 39, h = 82},
		{id = "keypress-sd1", src = src_id_keyboard, x = 0, y = 240, w = 39, h = 82},
		{id = "keypress-sd2", src = src_id_keyboard, x = 39, y = 240, w = 39, h = 82},
		{id = "keypress-sd3", src = src_id_keyboard, x = 78, y = 240, w = 39, h = 82},
	})

	skin.geometry.keyflash_octave_x = { 0, 26, 37, 66, 75,  112, 138, 150, 178, 188, 218, 226 }
	skin.geometry.keyflash_octave_y = { 11, 51, 11, 51, 11,  11, 51, 11, 51, 11, 51, 11 }
	skin.geometry.keyflash_octave_w = { 38, 21, 39, 21, 38,  39, 21, 39, 21, 39, 21, 39 }
	skin.geometry.keyflash_octave_h = { 105, 63, 105, 63, 105,  105, 63, 105, 63, 105, 63, 105 }
	skin.geometry.keyflash_wheel_x = 9
	skin.geometry.keyflash_wheel_y = 24
	skin.geometry.keyflash_wheel_w = 39
	skin.geometry.keyflash_wheel_h = 82
	skin.geometry.keybeam_tail_octave_x = { 1, 26, 38, 66, 76,  113, 138, 151, 178, 189, 218, 227 }	
	skin.geometry.keybeam_tail_octave_w = { 36, 21, 37, 21, 36,  37, 21, 37, 21, 37, 21, 37 }
	local keyflash_octave_order = { 1, 3, 5, 6, 8, 10, 12, 2, 4, 7, 9, 11 }


	-- Set destination

	skin.key_clusters = {}
	_t = {
		[consts.SKIN_TYPE_24K_SP] = function()
			if prop.current.get_play_side_h() == 1 then
				skin.key_clusters = {
					{
						position_x = 40,
						wheel_side = 1,
						octave = 2,
					}
				}
			else
				skin.key_clusters = {
					{
						position_x = 656,
						wheel_side = 2,
						octave = 2,
					}
				}
			end
		end,
		[consts.SKIN_TYPE_24K_DP] = function()
			skin.key_clusters = {
				{
					position_x = 40,
					wheel_side = 1,
					octave = 2,
				},
				{
					position_x = 656,
					wheel_side = 2,
					octave = 2,
				}
			}
		end,
		[consts.SKIN_TYPE_24K_SP_WIDE] = function()
			if prop.current.get_play_side_h() == 1 then
			else
			end
		end,
	}
	_t[skin_type]()

	if prop.current.get_play_side_v() == 1 then
		skin.geometry.keyboard_y = 0
	else
		skin.geometry.keyboard_y = 180
	end
	skin.geometry.lane_t_y = skin.geometry.keyboard_y + 220
	skin.geometry.lane_c_y = skin.geometry.keyboard_y + 117
	skin.geometry.lane_b_y = skin.geometry.keyboard_y + 60
	skin.geometry.note_y = skin.geometry.keyboard_y + 60
	skin.geometry.lane_h = 480

	skin.geometry.notes_x = {}
	skin.geometry.notes_w = {}
	skin.geometry.groups = {}

	local lane_opacity_255 = prop.current.get_lane_opacity_255()

	local function add_lane_dst(x, w, name)
		table.append_all(skin.dst_lane, {
			{id = "lane-opaque-"..name.."-t", dst = {
				{x = x, y = skin.geometry.lane_t_y, w = w, h = 320, a = lane_opacity_255 },
			}},
			{id = "lane-opaque-"..name.."-c", dst = {
				{x = x, y = skin.geometry.lane_c_y, w = w, h = 103, a = lane_opacity_255 },
			}},
			{id = "lane-"..name.."-t", dst = {
				{x = x, y = skin.geometry.lane_t_y, w = w, h = 320},
			}},
			{id = "lane-"..name.."-c", dst = {
				{x = x, y = skin.geometry.lane_c_y, w = w, h = 103},
			}},
			{id = "lane-"..name.."-b", dst = {
				{x = x, y = skin.geometry.lane_b_y, w = w, h = 57},
			}},
		})
	end

	local function id_keypress(i_octave)
		if i_octave < 10 then
			return "keypress-0"..i_octave
		else
			return "keypress-"..i_octave
		end
	end

	local function add_octave(x, k)
		table.append_all(skin.dst_keyboard, {
			{id = "kb-octave", dst = {
				{ x = x, y = skin.geometry.keyboard_y, w = skin.geometry.octave_interval + 1, h = 128 }
			}},
		})
		local dst_keypress_on_unsorted = {}
		local dst_keypress_off_unsorted = {}
		for i = 1, 12 do
			table.insert(skin.geometry.notes_x, x + skin.geometry.notes_octave_x[i])
			table.insert(skin.geometry.notes_w, skin.geometry.notes_octave_w[i])
			table.insert(dst_keypress_on_unsorted, {
				id = id_keypress(i),
				timer = skin_values.timer_key_on(k + i - 1),
				loop = 30,
				dst = {
					{
						time = 0,
						x = x + skin.geometry.keyflash_octave_x[i],
						y = skin.geometry.keyboard_y + skin.geometry.keyflash_octave_y[i],
						w = skin.geometry.keyflash_octave_w[i],
						h = skin.geometry.keyflash_octave_h[i],
						a = 127
					},
					{time = 30, a = 255}
				}
			})
			table.insert(dst_keypress_off_unsorted, {
				id = id_keypress(i),
				timer = skin_values.timer_key_off(k + i - 1),
				loop = 90,
				dst = {
					{
						time = 0,
						x = x + skin.geometry.keyflash_octave_x[i],
						y = skin.geometry.keyboard_y + skin.geometry.keyflash_octave_y[i],
						w = skin.geometry.keyflash_octave_w[i],
						h = skin.geometry.keyflash_octave_h[i],
						a = 255
					},
					{time = 90, a = 0}
				}
			})
		end
		for j = 1, 12 do
			table.insert(skin.dst_keyboard, dst_keypress_on_unsorted[keyflash_octave_order[j]])
			table.insert(skin.dst_keyboard, dst_keypress_off_unsorted[keyflash_octave_order[j]])
		end
		add_lane_dst(x, skin.geometry.octave_interval + 1, "octave")
	end

	local function keyflash_wheel_rect(x, time)
		return {
			time = time,
			x = x + skin.geometry.keyflash_wheel_x,
			y = skin.geometry.keyboard_y + skin.geometry.keyflash_wheel_y,
			w = skin.geometry.keyflash_wheel_w,
			h = skin.geometry.keyflash_wheel_h,
		}
	end

	local function add_keypress_wheel(x, k)
		table.append_all(skin.dst_keyboard, {
			{
				id = "keypress-su1", timer = skin_values.timer_key_on(k), loop = -1,
				dst = { keyflash_wheel_rect(x, 0), {time = 30} }
			},
			{
				id = "keypress-su2", timer = skin_values.timer_key_on(k), loop = -1,
				dst = { keyflash_wheel_rect(x, 30), {time = 60} }
			},
			{
				id = "keypress-su3", timer = skin_values.timer_key_on(k), loop = 60,
				dst = { keyflash_wheel_rect(x, 60) }
			},
			{
				id = "keypress-sd1", timer = skin_values.timer_key_on(k + 1), loop = -1,
				dst = { keyflash_wheel_rect(x, 0), {time = 30} }
			},
			{
				id = "keypress-sd2", timer = skin_values.timer_key_on(k + 1), loop = -1,
				dst = { keyflash_wheel_rect(x, 30), {time = 60} }
			},
			{
				id = "keypress-sd3", timer = skin_values.timer_key_on(k + 1), loop = 60,
				dst = { keyflash_wheel_rect(x, 60) }
			},
			{
				id = "keypress-su2", timer = skin_values.timer_key_off(k), loop = -1,
				dst = { keyflash_wheel_rect(x, 0), {time = 30} }
			},
			{
				id = "keypress-su1", timer = skin_values.timer_key_off(k), loop = -1,
				dst = { keyflash_wheel_rect(x, 30), {time = 60} }
			},
			{
				id = "keypress-sd2", timer = skin_values.timer_key_off(k + 1), loop = -1,
				dst = { keyflash_wheel_rect(x, 0), {time = 30} }
			},
			{
				id = "keypress-sd1", timer = skin_values.timer_key_off(k + 1), loop = -1,
				dst = { keyflash_wheel_rect(x, 30), {time = 60} }
			},
		})
	end

	local function add_left_wheel(x, k)
		table.append_all(skin.dst_keyboard, {
			{id = "kb-1pL", dst = {
				{x = x - 40, y = skin.geometry.keyboard_y, w = 97, h = 128}
			}},
		})
		table.insert(skin.geometry.notes_x, x + skin.geometry.note_wheel_x)
		table.insert(skin.geometry.notes_x, x + skin.geometry.note_wheel_x)
		table.insert(skin.geometry.notes_w, skin.geometry.note_wheel_w)
		table.insert(skin.geometry.notes_w, skin.geometry.note_wheel_w)
		add_keypress_wheel(x, k)
		add_lane_dst(x, 57, "1pW")
		table.insert(skin.dst_judgeline, {id = "judgeline-1pW", offset = 3, dst = {{x = x - 10, y = skin.geometry.keyboard_y + 51, w = 66, h = 24 }}})
	end

	local function add_right_wheel(x, k)
		table.append_all(skin.dst_keyboard, {
			{id = "kb-2pR", dst = {
				{x = x - 1, y = skin.geometry.keyboard_y, w = 97, h = 128}
			}},
		})
		table.insert(skin.geometry.notes_x, x + skin.geometry.note_wheel_x)
		table.insert(skin.geometry.notes_x, x + skin.geometry.note_wheel_x)
		table.insert(skin.geometry.notes_w, skin.geometry.note_wheel_w)
		table.insert(skin.geometry.notes_w, skin.geometry.note_wheel_w)
		add_keypress_wheel(x, k)
		add_lane_dst(x, 57, "2pW")
		table.insert(skin.dst_judgeline, {id = "judgeline-2pW", offset = 3, dst = {{x = x, y = skin.geometry.keyboard_y + 51, w = 66, h = 24 }}})
	end

	local function judgeline_key(position_x, octave)
		table.append_all(skin.dst_judgeline, {
			{id = "judgeline-key", offset = 3, dst = {
				{x = position_x + 2, y = skin.geometry.keyboard_y + 59, w = 525, h = 8}
			}},
			{id = "judgeline-keyL", offset = 3, dst = {
				{x = position_x, y = skin.geometry.keyboard_y + 59, w = 2, h = 8}
			}},
			{id = "judgeline-keyR", offset = 3, dst = {
				{x = position_x + octave * skin.geometry.octave_interval - 1, y = skin.geometry.keyboard_y + 59, w = 2, h = 8}
			}},
			{id = "judgeline-glow", timer = 140, loop = 0, blend = 2, offset = 3, dst = {
				{time = 0, x = position_x + 2, y = skin.geometry.keyboard_y + 39, w = 525, h = 48, a = 191},
				{time = 700, a = 31},
				{time = 960, a = 31},
				{time = 1000, a = 63}
			}}
		})
	end

	local k = 1
	for _, cluster in ipairs(skin.key_clusters) do
		if cluster.wheel_side == 1 then
			local x = cluster.position_x + skin.geometry.wheel_lane_width
			for o = 1, cluster.octave do
				add_octave(x, k)
				x = x + skin.geometry.octave_interval
				k = k + 12
			end
			add_left_wheel(cluster.position_x, k)
			k = k + 2
			table.append_all(skin.dst_keyboard, {
				{id = "kb-1pR", dst = {
					{x = x, y = skin.geometry.keyboard_y, w = 21, h = 128}
				}},
			})
			table.insert(skin.geometry.groups, {
				x = cluster.position_x,
				w = x - cluster.position_x + 1,
			})
			judgeline_key(cluster.position_x + skin.geometry.wheel_lane_width, cluster.octave)
		else
			local x = cluster.position_x
			for o = 1, cluster.octave do
				add_octave(x, k)
				x = x + skin.geometry.octave_interval
				k = k + 12
			end
			add_right_wheel(x, k)
			k = k + 2
			table.append_all(skin.dst_keyboard, {
				{id = "kb-2pL", dst = {
					{x = cluster.position_x - 21, y = skin.geometry.keyboard_y, w = 21, h = 128}
				}},
			})
			x = x + skin.geometry.wheel_lane_width
			table.insert(skin.geometry.groups, {
				x = cluster.position_x,
				w = x - cluster.position_x + 1,
			})
			judgeline_key(cluster.position_x, cluster.octave)
		end
	end

	return skin
end

return lane
