local util = require("lua.play_util")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local ext = {}

function ext.load(skin_type, resolution, src_id_fullcombo, lane_geometry)
	local skin = {}

	skin.images = {}
	skin.destinations = {}

	return skin
end

return ext
