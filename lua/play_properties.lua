
require("lua.lua_ext")
local consts = require("lua.play_consts")
local prop = {}

prop.properties = {}
prop.files = {}
prop.current = {}

prop.properties.play_side = {
	name = "Play Side",
	item = {
		{name = "1P / Top Panel", op = 941},
		{name = "1P / Bottom Panel", op = 942},
		{name = "2P / Top Panel", op = 943},
		{name = "2P / Bottom Panel", op = 944}
	},
	def =  "1P / Top Panel"
}

function prop.current.get_play_side_h()
	local op = skin_config.option[prop.properties.play_side.name]
	if op == 941 or op == 942 then
		return 1
	else
		return 2
	end
end

function prop.current.get_play_side_v()
	local op = skin_config.option[prop.properties.play_side.name]
	if op == 941 or op == 943 then
		return 1
	else
		return 2
	end
end

prop.properties.wheel_position = {
	name = "Wheel Position",
	item = {
		{name = "Left", op = 945},
		{name = "Right", op = 946}
	},
	def = "Left"
}

function prop.current.get_wheel_position()
	local op = skin_config.option[prop.properties.wheel_position.name]
	if op == 945 then
		return 1
	elseif op == 946 then
		return 2
	else
		return 1
	end
end

prop.properties.background = {
	name = "Background Type",
	item = {
		{name = "Generic Image", op = 901},
		{name = "Stagefile", op = 902},
		{name = "BGA", op = 903}
	},
	def =  "Generic Image"
}

function prop.current.is_background_generic_image()
	return skin_config.option[prop.properties.background.name] == 901
end

function prop.current.is_background_stagefile()
	return skin_config.option[prop.properties.background.name] == 902
end

function prop.current.is_background_bga()
	return skin_config.option[prop.properties.background.name] == 903
end

prop.properties.lane_opacity = {
	name = "Lane Opacity",
	item = {
		{name = "Low", op = 906},
		{name = "Middle", op = 907},
		{name = "High", op = 908},
		{name = "Max", op = 909}
	},
	def =  "Middle"
}

function prop.current.get_lane_opacity_255()
	local op = skin_config.option[prop.properties.lane_opacity.name]
	if op == 906 then
		return 0
	elseif op == 907 then
		return 85
	elseif op == 908 then
		return 170
	else
		return 255
	end
end

prop.properties.lane_geometry = {
	name = "Lane Geometry",
	item = {
		{name = "Half Lane (proportional)", op = 920},
		{name = "Half Lane (isosceles)", op = 921},
		{name = "Hybrid Lane", op = 922},
		{name = "Separate Lane", op = 924}
	},
	def =  "Half Lane (proportional)"
}

function prop.current.get_lane_geometry()
	local op = skin_config.option[prop.properties.lane_geometry.name]
	if op == 920 then
		return consts.LANE_GEOMETRY.PROPORTIONAL
	elseif op == 921 then
		return consts.LANE_GEOMETRY.ISOSCELES
	elseif op == 922 then
		return consts.LANE_GEOMETRY.HYBRID
	else
		return consts.LANE_GEOMETRY.SEPARATE
	end
end

prop.properties.judge_detail = {
	name = "Judge Detail",
	item = {
		{name = "Off", op = 910},
		{name = "EARLY/LATE", op = 911},
		{name = "+-ms", op = 912}
	},
	def =  "Off"
}

function prop.current.is_judge_detail_early_late()
	return skin_config.option[prop.properties.judge_detail.name] == 911
end

function prop.current.is_judge_detail_ms()
	return skin_config.option[prop.properties.judge_detail.name] == 912
end

prop.properties.score_graph = {
	name = "Score Graph",
	item = {
		{name = "Off", op = 913},
		{name = "On", op = 914}
	},
	def =  "Off"
}

function prop.current.shows_score_graph()
	return skin_config.option[prop.properties.score_graph.name] == 914
end

prop.properties.sub_bga_size = {
	name = "Sub-BGA Size",
	item = {
		{name = "Normal", op = 930},
		{name = "Full (Trimmed)", op = 931}
	},
	def =  "Normal"
}

function prop.current.get_sub_bga_size()
	local op = skin_config.option[prop.properties.sub_bga_size.name]
	if op == 930 then
		return 1
	else
		return 2
	end
end

prop.properties.title_display = {
	name = "Title Display",
	item = {
		{name = "Off", op = 915},
		{name = "BACKBMP", op = 916},
		{name = "Text", op = 917}
	},
	def = "Off"
}

function prop.current.shows_title_backbmp()
	return skin_config.option[prop.properties.title_display.name] == 916
end

function prop.current.shows_title_text()
	return skin_config.option[prop.properties.title_display.name] == 917
end

prop.properties.main_bga_size = {
	name = "Main BGA Size",
	item = {
		{name = "Normal", op = 934},
		{name = "Full (Trimmed)", op = 935}
	},
	def = "Normal"
}

function prop.current.get_main_bga_size()
	local op = skin_config.option[prop.properties.main_bga_size.name]
	if op == 934 then
		return 1
	else
		return 2
	end
end

prop.files.generic_background = {name = "Generic Background", path = "background/*.png", def =  "Default"}
prop.files.frame = {name = "Frame", path = "frame/HD/*", def =  "Default"}
prop.files.number = {name = "Number", path = "number/*.png", def =  "Default"}
prop.files.keyboard = {name = "Keyboard", path = "keyboard/*.png", def =  "BlueD"}
prop.files.lane = {name = "Lane", path = "lane/*.png", def =  "Default"}
prop.files.object = {name = "Object", path = "object/*.png", def =  "Default"}
prop.files.bomb = {name = "Bomb", path = "bomb/*.png", def =  "Default"}
prop.files.hold = {name = "Hold", path = "hold/*.png", def =  "Default"}
prop.files.laser_type = {name = "Laser", path = "laser/type/*", def =  "Default"}
prop.files.laser_color = {name = "Laser Color", path = "laser/color/*.lua", def =  "Blue"}
prop.files.judge = {name = "Judge", path = "judge/*.png", def =  "Default"}
prop.files.lanecover = {name = "Lane Cover", path = "lanecover/24kHD/*.png", def =  "Default"}
prop.files.fullcombo = {name = "Full Combo", path = "fullcombo/24kHD/*", def = "Default"}

function prop.get_properties(dp, shows_main_bga)
	local p = {
		prop.properties.play_side
	}

	if not dp then
		table.insert(p, prop.properties.wheel_position)
	end

	table.append_all(p, {
		prop.properties.background,
		prop.properties.lane_opacity,
		prop.properties.lane_geometry,
		prop.properties.judge_detail,
		prop.properties.score_graph,
		prop.properties.sub_bga_size
	})
	
	if shows_main_bga then
		table.insert(p, prop.properties.title_display)
		table.insert(p, prop.properties.main_bga_size)
	end
	return p
end

function prop.get_files()
	return {
		prop.files.generic_background,
		prop.files.frame,
		prop.files.number,
		prop.files.keyboard,
		prop.files.lane,
		prop.files.object,
		prop.files.bomb,
		prop.files.hold,
		prop.files.laser_type,
		prop.files.laser_color,
		prop.files.judge,
		prop.files.lanecover,
		prop.files.fullcombo,
	}
end

return prop
