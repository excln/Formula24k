
require("lua.lua_ext")

local skin_values = {}

skin_values.skin_type = {
	PLAY_7KEYS = 0,
	PLAY_5KEYS = 1,
	PLAY_14KEYS = 2,
	PLAY_10KEYS = 3,
	PLAY_9KEYS = 4,
	MUSIC_SELECT = 5,
	DECIDE = 6,
	RESULT = 7,
	KEY_CONFIG = 8,
	SKIN_SELECT = 9,
	SOUND_SET = 10,
	THEME = 11,
	PLAY_7KEYS_BATTLE = 12,
	PLAY_5KEYS_BATTLE = 13,
	PLAY_9KEYS_BATTLE = 14,
	COURSE_RESULT = 15,
	PLAY_24KEYS = 16,
	PLAY_24KEYS_DOUBLE = 17,
	PLAY_24KEYS_BATTLE = 18,
}

local function key_timer_converter(base_normal, base_extended)
	return function (i)
		if i <= 26 then
			if i <= 9 then
				return base_normal + i
			else
				return base_extended + i
			end
		else
			j = i - 26
			if j <= 9 then
				return base_normal + 10 + j
			else
				return base_extended + 100 + j
			end
		end
	end
end

skin_values.timer_key_bomb = key_timer_converter(50, 1000)
skin_values.timer_key_hold = key_timer_converter(70, 1200)
skin_values.timer_key_on = key_timer_converter(100, 1400)
skin_values.timer_key_off = key_timer_converter(120, 1600)
skin_values.value_judge = key_timer_converter(500, 1500)

return skin_values
