
require("lua.lua_ext")
local util = require("lua.play_util")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local judge = {}

function judge.load(skin_type, resolution, src_id_judge)
	local skin = {}

	skin.images = {
		{id = "judgef-pg", src = src_id_judge, x = 0, y = 0, w = 220, h = 192, divy = 4, cycle = 132},
		{id = "judgef-gr", src = src_id_judge, x = 0, y = 192, w = 220, h = 96, divy = 2, cycle = 132},
		{id = "judgef-gd", src = src_id_judge, x = 0, y = 288, w = 220, h = 96, divy = 2, cycle = 132},
		{id = "judgef-bd", src = src_id_judge, x = 0, y = 384, w = 220, h = 96, divy = 2, cycle = 132},
		{id = "judgef-pr", src = src_id_judge, x = 220, y = 384, w = 220, h = 96, divy = 2, cycle = 132},
		{id = "judgef-ms", src = src_id_judge, x = 220, y = 384, w = 220, h = 96, divy = 2, cycle = 132},
		{id = "judge-early", src = src_id_judge, x = 0, y = 480, w = 73, h = 16},
		{id = "judge-late", src = src_id_judge, x = 0, y = 496, w = 73, h = 16}
	}

	local judges
	if skin_type == consts.SKIN_TYPE_24K_SP then
		if prop.current.get_play_side_h() == 1 then
			judges = {
				{ id = "judge1", index = 0, x = 212 },
			}
		else
			judges = {
				{ id = "judge1", index = 0, x = 828 },
			}
		end
	elseif skin_type == consts.SKIN_TYPE_24K_DP then
		judges = {
			{ id = "judge1", index = 0, x = 212 },
			{ id = "judge2", index = 1, x = 828 },
		}
	elseif skin_type == consts.SKIN_TYPE_24K_SP_WIDE then
	end

	local judge_y
	if prop.current.get_play_side_v() == 1 then
		judge_y = 160
	else
		judge_y = 340
	end

	skin.values = {
		{id = "judgen-pg", src = src_id_judge, x = 240, y = 0, w = 450, h = 192, divx = 10, divy = 4, digit = 6, ref = 75, cycle = 132},
		{id = "judgen-gr", src = src_id_judge, x = 240, y = 192, w = 450, h = 96, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 132},
		{id = "judgen-gd", src = src_id_judge, x = 240, y = 288, w = 450, h = 96, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 132},	
	}
	for i, judge in ipairs(judges) do
		table.append_all(skin.values, {
			{id = "judgems-"..i.."pp", src = src_id_judge, x = 80, y = 480, w = 180, h = 32, divx = 12, divy = 2, digit = 4, ref = 525 + judge.index},
			{id = "judgems-"..i.."pg", src = src_id_judge, x = 260, y = 480, w = 180, h = 32, divx = 12, divy = 2, digit = 4, ref = 525 + judge.index},
		})
	end

	local function timer_show_judge(j)
		return 46 + j.index
	end
	local function op_early(j)
		return 1242 + j.index * 20
	end
	local function op_late(j)
		return 1243 + j.index * 20
	end
	local function op_perfect(j)
		return 241 + j.index * 20
	end

	skin.judges = {}
	for _, judge in ipairs(judges) do
		table.insert(skin.judges, {
			id = judge.id,
			index = judge.index,
			images = {
				{id = "judgef-pg", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
				{id = "judgef-gr", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
				{id = "judgef-gd", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
				{id = "judgef-bd", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x + 10, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
				{id = "judgef-pr", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x + 10, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
				{id = "judgef-ms", loop = -1, timer = timer_show_judge(judge), offset = 3, dst = {
					{time = 0, x = judge.x + 10, y = judge_y, w = 220, h = 48},
					{time = 500}
				}},
			},
			numbers = {
				{id = "judgen-pg", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 240, y = 0, w = 45, h = 48},
					{time = 500}
				}},
				{id = "judgen-gr", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 240, y = 0, w = 45, h = 48},
					{time = 500}
				}},
				{id = "judgen-gd", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 240, y = 0, w = 45, h = 48},
					{time = 500}
				}},
				{id = "judgen-gd", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 200, y = 0, w = 0, h = 0}
				}},
				{id = "judgen-gd", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 200, y = 0, w = 0, h = 0}
				}},
				{id = "judgen-gd", loop = -1, timer = timer_show_judge(judge), dst = {
					{time = 0, x = 200, y = 0, w = 0, h = 0}
				}},
			},
			shift = true
		})
	end

	skin.destinations = {}
	for i, judge in ipairs(judges) do
		table.append_all(skin.destinations, {
			{id = judge.id},
		})
		if prop.current.is_judge_detail_early_late() then
			table.append_all(skin.destinations, {
				{id = "judge-early", loop = -1, timer = timer_show_judge(judge), op = {op_early(judge)}, offset = 3, dst = {
					{time = 0, x = judge.x + 76, y = judge_y + 56, w = 73, h = 16},
					{time = 500}
				}},
				{id = "judge-late", loop = -1, timer = timer_show_judge(judge), op = {op_late(judge)}, offset = 3, dst = {
					{time = 0, x = judge.x + 76, y = judge_y + 56, w = 73, h = 16},
					{time = 500}
				}},
			})
		end
		if prop.current.is_judge_detail_ms() then
			table.append_all(skin.destinations, {
				{id = "judgems-"..i.."pp", loop = -1, timer = timer_show_judge(judge), op = {op_perfect(judge)}, offset = 3, dst = {
					{time = 0, x = judge.x + 76, y = judge_y + 56, w = 15, h = 16},
					{time = 500}
				}},
				{id = "judgems-"..i.."pg", loop = -1, timer = timer_show_judge(judge), op = {-op_perfect(judge)}, offset = 3, dst = {
					{time = 0, x = judge.x + 76, y = judge_y + 56, w = 15, h = 16},
					{time = 500}
				}},
			})
		end
	end

	return skin
end

return judge
