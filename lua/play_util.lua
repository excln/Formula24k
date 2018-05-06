
local util = {}

function util.append_all(list, t)
	if t then
		for _, v in pairs(t) do
			table.insert(list, v)
		end
	end
end

local keyboard_wbs = { 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0 }
function util.get_keyboard_wbs(i)
	local k = (i - 1) % 26
	if k >= 24 then
		return 2
	end
	return keyboard_wbs[k % 12 + 1]
end
function util.get_keyboard_wbss(i)
	local k = (i - 1) % 26
	if k == 24 then
		return 2
	elseif k == 25 then
		return 3
	end
	return keyboard_wbs[k % 12 + 1]
end

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

util.timer_key_bomb = key_timer_converter(50, 1000)
util.timer_key_hold = key_timer_converter(70, 1200)
util.timer_key_on = key_timer_converter(100, 1400)
util.timer_key_off = key_timer_converter(120, 1600)
util.value_judge = key_timer_converter(500, 1500)

return util
