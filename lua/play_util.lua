
require("lua.lua_ext")
local util = {}

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

return util
