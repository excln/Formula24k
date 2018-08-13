
require("lua.lua_ext")
local util = require("lua.play_util")
local prop = require("lua.play_properties")
local consts = require("lua.play_consts")
local frame = {}

function frame.load(skin_type, resolution, src_id_frame, src_id_close, src_id_number, font_id_title)
	local skin = {}

	skin.images = {}
	skin.images.panelT = {id = "panelT", src = src_id_frame, x = 0, y = 0, w = 1280, h = 184}
	skin.images.panelB = {id = "panelB", src = src_id_frame, x = 0, y = 840, w = 1280, h = 184}
	skin.images.emblemT = {id = "emblem_t", src = src_id_frame, x = 0, y = 680, w = 240, h = 33}
	skin.images.emblemB = {id = "emblem_b", src = src_id_frame, x = 0, y = 720, w = 240, h = 33}
	skin.images.fadeout = {id = "fadeout", src = src_id_frame, x = 16, y = 256, w = 8, h = 8}
	skin.images.backmask = {id = "backmask", src = src_id_frame, x = 0, y = 256, w = 8, h = 8}
	skin.images.section_line = {id = "section-line", src = src_id_frame, x = 8, y = 256, w = 8, h = 8}
	skin.images.gauge_n1 = {id = "gauge-n1", src = src_id_frame, x = 301, y = 200, w = 10, h = 28}
	skin.images.gauge_n2 = {id = "gauge-n2", src = src_id_frame, x = 313, y = 200, w = 10, h = 28}
	skin.images.gauge_n3 = {id = "gauge-n3", src = src_id_frame, x = 325, y = 200, w = 10, h = 28}
	skin.images.gauge_n4 = {id = "gauge-n4", src = src_id_frame, x = 337, y = 200, w = 10, h = 28}
	skin.images.gauge_e1 = {id = "gauge-e1", src = src_id_frame, x = 349, y = 200, w = 10, h = 28}
	skin.images.gauge_e2 = {id = "gauge-e2", src = src_id_frame, x = 361, y = 200, w = 10, h = 28}
	skin.images.gauge_e3 = {id = "gauge-e3", src = src_id_frame, x = 373, y = 200, w = 10, h = 28}
	skin.images.gauge_e4 = {id = "gauge-e4", src = src_id_frame, x = 385, y = 200, w = 10, h = 28}
	skin.images.jc_panel = {id = "jc-panel", src = src_id_frame, x = 334, y = 300, w = 152, h = 92}
	skin.images.jc_pg_label = {id = "jc-pg-label", src = src_id_frame, x = 400, y = 200, w = 46, h = 11}
	skin.images.nograph_bg = {id = "nograph-bg", src = src_id_frame, x = 334, y = 410, w = 214, h = 86}
	skin.images.graph_bg = {id = "graph-bg", src = src_id_frame, x = 0, y = 410, w = 294, h = 94}
	skin.images.graph_overlay = {id = "graph-overlay", src = src_id_frame, x = 72, y = 256, w = 221, h = 94}
	skin.images.minorinfo_bg = {id = "minorinfo-bg", src = src_id_frame, x = 334, y = 512, w = 164, h = 86}
	skin.images.subbga_panel = {id = "subbga-panel", src = src_id_frame, x = 72, y = 512, w = 234, h = 162}
	skin.images.loading_ol_L = {id = "loading-overlay-L", src = src_id_frame, x = 64, y = 352, w = 28, h = 56}
	skin.images.loading_ol_C = {id = "loading-overlay-C", src = src_id_frame, x = 92, y = 352, w = 40, h = 56}
	skin.images.loading_ol_R = {id = "loading-overlay-R", src = src_id_frame, x = 132, y = 352, w = 28, h = 56}
	skin.images.loading_bg = {id = "loading-bg", src = src_id_frame, x = 160, y = 365, w = 28, h = 28}
	skin.images.ready = {id = "ready", src = src_id_frame, x = 400, y = 264, w = 75, h = 32, divx = 1, divy = 2, cycle = 200}
	skin.images.frame_1pL = {id = "frame-1pL", src = src_id_frame, x = 560, y = 200, w = 41, h = 540}
	skin.images.frame_dpC = {id = "frame-dpC", src = src_id_frame, x = 624, y = 200, w = 32, h = 540}
	skin.images.frame_2pR = {id = "frame-2pR", src = src_id_frame, x = 679, y = 200, w = 41, h = 540}
	skin.images.frame_bgaT = {id = "frame-bgaT", src = src_id_frame, x = 768, y = 200, w = 480, h = 32}
	skin.images.frame_bgaB = {id = "frame-bgaB", src = src_id_frame, x = 768, y = 234, w = 480, h = 28}
	skin.images.frame_1pC = {id = "frame-1pC", src = src_id_frame, x = 768, y = 264, w = 96, h = 540}
	skin.images.frame_1pR = {id = "frame-1pR", src = src_id_frame, x = 866, y = 264, w = 80, h = 540}
	skin.images.frame_2pL = {id = "frame-2pL", src = src_id_frame, x = 948, y = 264, w = 80, h = 540}
	skin.images.frame_2pC = {id = "frame-2pC", src = src_id_frame, x = 1030, y = 264, w = 96, h = 540}
	skin.images.progress_bg_T = {id = "progressbg-t", src = src_id_frame, x = 492, y = 200, w = 28, h = 16}
	skin.images.progress_bg_C = {id = "progressbg-c", src = src_id_frame, x = 492, y = 216, w = 28, h = 24}
	skin.images.progress_bg_B = {id = "progressbg-b", src = src_id_frame, x = 492, y = 240, w = 28, h = 16}
	skin.images.judgeline_key = {id = "judgeline-key", src = src_id_frame, x = 2, y = 264, w = 12, h = 8}
	skin.images.judgeline_keyL = {id = "judgeline-keyL", src = src_id_frame, x = 0, y = 264, w = 2, h = 8}
	skin.images.judgeline_keyR = {id = "judgeline-keyR", src = src_id_frame, x = 14, y = 264, w = 2, h = 8}
	skin.images.judgeline_1pW = {id = "judgeline-1pW", src = src_id_frame, x = 0, y = 296, w = 66, h = 24}
	skin.images.judgeline_2pW = {id = "judgeline-2pW", src = src_id_frame, x = 0, y = 272, w = 66, h = 24}
	skin.images.judgeline_glow = {id = "judgeline-glow", src = src_id_frame, x = 0, y = 360, w = 64, h = 48}

	skin.gauge_nodes = {
		skin.images.gauge_n1.id,
		skin.images.gauge_n2.id,
		skin.images.gauge_n3.id,
		skin.images.gauge_n4.id,
		skin.images.gauge_e1.id,
		skin.images.gauge_e2.id,
		skin.images.gauge_e3.id,
		skin.images.gauge_e4.id,
	}

	skin.values = {}
	skin.values.bpm = {id = "bpm", src = src_id_number, x = 0, y = 32, w = 220, h = 24, divx = 10, digit = 4, align = 2, ref = 160}
	skin.values.min_bpm = {id = "minbpm", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 4, align = 2, ref = 91}
	skin.values.max_bpm = {id = "maxbpm", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 4, align = 2, ref = 90}
	skin.values.time_m = {id = "time-m", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 2, ref = 163}
	skin.values.time_s = {id = "time-s", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 2, padding = 1, ref = 164}
	skin.values.hispeed_n = {id = "hispeed-n", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 2, ref = 310}
	skin.values.hispeed_f = {id = "hispeed-f", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 2, padding = 1, ref = 311}
	skin.values.duration = {id = "duration", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 4, align = 2, ref = 312}
	skin.values.gauge_n = {id = "gauge-n", src = src_id_number, x = 0, y = 32, w = 242, h = 24, divx = 11, digit = 3, ref = 107}
	skin.values.score_rate = {id = "score-rate", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 4, ref = 102}
	skin.values.score_now = {id = "score-now", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 5, ref = 71}
	skin.values.score_best = {id = "score-best", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 5, ref = 150}
	skin.values.score_target = {id = "score-target", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 5, ref = 121}
	skin.values.max_combo = {id = "maxcombo", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 5, ref = 105}
	skin.values.jc_pg = {id = "jc-pg", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 110}
	skin.values.jc_gr = {id = "jc-gr", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 111}
	skin.values.jc_gd = {id = "jc-gd", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 112}
	skin.values.jc_bd = {id = "jc-bd", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 113}
	skin.values.jc_pr = {id = "jc-pr", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 114}
	skin.values.jc_ms = {id = "jc-ms", src = src_id_number, x = 0, y = 0, w = 110, h = 11, divx = 11, digit = 4, ref = 420}
	skin.values.lanecover = {id = "value-lanecover", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 3, ref = 14}
	skin.values.loading_n = {id = "loading-n", src = src_id_number, x = 0, y = 12, w = 150, h = 16, divx = 10, digit = 3, ref = 165}

	skin.sliders = {
		{id = "progressfg", src = 2, x = 520, y = 200, w = 20, h = 24, angle = 2, range = 368, type = 6},
	}

	skin.graphs = {
		{id = "graph-now", src = src_id_frame, x = 300, y = 260, w = 24, h = 20, angle = 0, type = 110},
		{id = "graph-best", src = src_id_frame, x = 300, y = 293, w = 24, h = 20, angle = 0, type = 113},
		{id = "graph-target", src = src_id_frame, x = 300, y = 326, w = 24, h = 20, angle = 0, type = 115},
		{id = "loading-fg", src = src_id_frame, x = 196, y = 365, w = 28, h = 28, angle = 0, type = 102},
	}

	skin.texts = {}

	local function title_align_for(side_h)
		if side_h == 1 then
			return 0
		else
			return 2
		end
	end
	skin.texts.title = {id = "title", font = font_id_title, size = 24, align = title_align_for(prop.current.get_play_side_h()), ref = 12}

	skin.geometry = {}

	skin.dst_base = {}
	skin.dst_panel = {}
	skin.dst_fore = {}
	skin.dst_close = {}

	if skin_type == consts.SKIN_TYPE_24K_SP then
		local geo = skin.geometry
		if prop.current.get_play_side_v() == 1 then
			geo.frame_main_y = 0
		else
			geo.frame_main_y = 180
		end
		geo.frame_bga_y = geo.frame_main_y + 28
		geo.frame_bga_w = 480
		geo.frame_bga_h = 480
		geo.frame_bga_t = geo.frame_bga_y + 480
		if prop.current.get_play_side_h() == 1 then
			geo.frame_bga_x = 720
			table.append_all(skin.dst_base, {
				{id = skin.images.frame_1pL.id,  dst = {{ x = 0,    y = geo.frame_main_y, w = 41, h = 540 }}},
				{id = skin.images.frame_bgaT.id, dst = {{ x = 720,  y = geo.frame_bga_t, w = 480, h = 32 }}},
				{id = skin.images.frame_bgaB.id, dst = {{ x = 720,  y = geo.frame_main_y, w = 480, h = 28 }}},
				{id = skin.images.frame_1pC.id,  dst = {{ x = 624,  y = geo.frame_main_y, w = 96, h = 540 }}},
				{id = skin.images.frame_1pR.id,  dst = {{ x = 1200, y = geo.frame_main_y, w = 80, h = 540 }}},
			})
		else
			geo.frame_bga_x = 80
			table.append_all(skin.dst_base, {
				{id = skin.images.frame_2pR.id,  dst = {{ x = 1239, y = geo.frame_main_y, w = 41, h = 540 }}},
				{id = skin.images.frame_bgaT.id, dst = {{ x = 80,   y = geo.frame_bga_t, w = 480, h = 32 }}},
				{id = skin.images.frame_bgaB.id, dst = {{ x = 80,   y = geo.frame_main_y, w = 480, h = 28 }}},
				{id = skin.images.frame_2pC.id,  dst = {{ x = 560,  y = geo.frame_main_y, w = 96, h = 540 }}},
				{id = skin.images.frame_2pL.id,  dst = {{ x = 0,    y = geo.frame_main_y, w = 80, h = 540 }}},
			})
		end
	elseif skin_type == consts.SKIN_TYPE_24K_DP then
		local y
		if prop.current.get_play_side_v() == 1 then
			y = 0
		else
			y = 180
		end
		table.append_all(skin.dst_base, {
			{id = skin.images.frame_1pL.id, dst = {{ x = 0, y = y, w = 41, h = 540 }}},
			{id = skin.images.frame_2pR.id, dst = {{ x = 1239, y = y, w = 41, h = 540 }}},
			{id = skin.images.frame_dpC.id, dst = {{ x = 624, y = y, w = 32, h = 540 }}}
		})
	end

	skin.geometry.panel = {}
	do
		local geo = skin.geometry.panel

		if prop.current.get_play_side_v() == 1 then
			geo.title_y = 685
			geo.mbpm_y = 672
			geo.bpm_y = 668
			geo.minor_bg_y = 587
			geo.time_y = 651
			geo.maxcombo_y = 593
			geo.hispeed_y = 624
			geo.gauge_y = 546
			geo.gauge_percent_y = 580
			geo.gauge_number_y = 579
			geo.subbga_panel_y = 548
			geo.subbga_y = 557
			geo.nograph_bg_y = 587
			geo.score_now_y = 651
			geo.score_rate_y = 593
			geo.graph_bg_y = 579
			geo.graph_now_y = 649
			geo.graph_best_y = 616
			geo.graph_target_y = 583
			geo.gscore_now_y = 651
			geo.gscore_best_y = 618
			geo.gscore_target_y = 585
			geo.jc_panel_y = 581
			geo.jc_pg_y = 654
			geo.jc_gr_y = 641
			geo.jc_gd_y = 628
			geo.jc_bd_y = 615
			geo.jc_pr_y = 602
			geo.jc_ms_y = 589
			geo.progressbg_t_y = 518
			geo.progressbg_c_y = 148
			geo.progressbg_b_y = 132
			geo.progressfg_y = 506
			geo.loading_bg_y = 226
			geo.loading_overlay_y = 212
			geo.loading_number_y = 232
			geo.lanecover_value_y = 500
		else
			geo.title_y = 6
			geo.mbpm_y = 32
			geo.bpm_y = 28
			geo.minor_bg_y = 47
			geo.time_y = 111
			geo.maxcombo_y = 53
			geo.hispeed_y = 80
			geo.gauge_y = 146
			geo.gauge_percent_y = 118
			geo.gauge_number_y = 117
			geo.subbga_panel_y = 10
			geo.subbga_y = 19
			geo.nograph_bg_y = 47
			geo.score_now_y = 111
			geo.score_rate_y = 53
			geo.graph_bg_y = 47
			geo.graph_now_y = 117
			geo.graph_best_y = 84
			geo.graph_target_y = 51
			geo.gscore_now_y = 119
			geo.gscore_best_y = 86
			geo.gscore_target_y = 53
			geo.jc_panel_y = 47
			geo.jc_pg_y = 120
			geo.jc_gr_y = 107
			geo.jc_gd_y = 94
			geo.jc_bd_y = 81
			geo.jc_pr_y = 68
			geo.jc_ms_y = 55
			geo.progressbg_t_y = 698
			geo.progressbg_c_y = 328
			geo.progressbg_b_y = 312
			geo.progressfg_y = 686
			geo.loading_bg_y = 406
			geo.loading_overlay_y = 392
			geo.loading_number_y = 412
			geo.lanecover_value_y = 680
		end

		if prop.current.get_play_side_h() == 1 then
			geo.title_x = 10
			geo.minbpm_x = 528
			geo.maxbpm_x = 691
			geo.bpm_x = 596
			geo.minor_bg_x = 794
			geo.time_colon_x = 900
			geo.time_m_x = 869
			geo.time_s_x = 908
			geo.maxcombo_x = 863
			geo.hispeed_p_x = 537
			geo.hispeed_n_x = 506
			geo.hispeed_f_x = 545
			geo.duration_x = 703
			geo.gauge_x = 82
			geo.gauge_percent_x = 591
			geo.gauge_number_x = 520
			geo.subbga_panel_x = 969
			geo.subbga_x = 978
			geo.nograph_bg_x = 74
			geo.score_now_x = 196
			geo.score_rate_p_x = 256
			geo.score_rate_x = 192
			geo.graph_bg_x = 0
			geo.graph_fg_x = 72
			geo.gscore_x = 96
			geo.jc_panel_x = 311
			geo.jc_label_x = 331
			geo.jc_number_x = 400
			geo.lanecover_value_x = 637
		else
			geo.title_x = 1270
			geo.minbpm_x = 528
			geo.maxbpm_x = 691
			geo.bpm_x = 596
			geo.minor_bg_x = 322
			geo.time_colon_x = 428
			geo.time_m_x = 397
			geo.time_s_x = 436
			geo.maxcombo_x = 391
			geo.hispeed_p_x = 537
			geo.hispeed_n_x = 506
			geo.hispeed_f_x = 545
			geo.duration_x = 703
			geo.gauge_x = 1198
			geo.gauge_percent_x = 753
			geo.gauge_number_x = 682
			geo.subbga_panel_x = 77
			geo.subbga_x = 86
			geo.nograph_bg_x = 992
			geo.score_now_x = 1114
			geo.score_rate_p_x = 1174
			geo.score_rate_x = 1110
			geo.graph_bg_x = 976
			geo.graph_fg_x = 1048
			geo.gscore_x = 1072
			geo.jc_panel_x = 817
			geo.jc_label_x = 837
			geo.jc_number_x = 906
			geo.lanecover_value_x = 598
		end
		if skin_type == consts.SKIN_TYPE_24K_DP then
			geo.lanecover_value_x = 617
		end

		if prop.current.get_play_side_h() == 1 then
			geo.gauge_w = 500
		else
			geo.gauge_w = -500
		end

		if prop.current.get_sub_bga_size() == 1 then
			geo.subbga_stretch = 1
		else
			geo.subbga_stretch = 3
		end

		if prop.current.get_play_side_v() == 1 then
			table.append_all(skin.dst_panel, {
				{ id = skin.images.panelT.id, dst = {
					{ x = 0, y = 536, w = 1280, h = 184 }
				}},
				{ id = skin.texts.title.id, dst = {
					{ x = geo.title_x, y = geo.title_y, w = 24, h = 24 }
				}},
				{ id = skin.images.emblemT.id, dst = {
					{ x = 520, y = 683, w = 240, h = 33 }
				}},
			})
		else
			table.append_all(skin.dst_panel, {
				{ id = skin.images.panelB.id, dst = {
					{ x = 0, y = 0, w = 1280, h = 184 }
				}},
				{ id = skin.texts.title.id, dst = {
					{ x = geo.title_x, y = geo.title_y, w = 24, h = 24 }
				}},
				{ id = skin.images.emblemB.id, dst = {
					{ x = 520, y = 4, w = 240, h = 33 }
				}},
			})
		end

		table.append_all(skin.dst_panel, {
			{id = skin.values.min_bpm.id, dst = {
				{x = geo.minbpm_x, y = geo.mbpm_y, w = 15, h = 16}
			}},
			{id = skin.values.max_bpm.id, dst = {
				{x = geo.maxbpm_x, y = geo.mbpm_y, w = 15, h = 16}
			}},
			{id = skin.values.bpm.id, dst = {
				{x = geo.bpm_x, y = geo.bpm_y, w = 22, h = 24}
			}},
			{id = skin.images.minorinfo_bg.id, dst = {
				{x = geo.minor_bg_x, y = geo.minor_bg_y, w = 164, h = 86}
			}},
			{id = "colon", dst = {
				{x = geo.time_colon_x, y = geo.time_y, w = 7, h = 16}
			}},
			{id = skin.values.time_m.id, dst = {
				{x = geo.time_m_x, y = geo.time_y, w = 15, h = 16}
			}},
			{id = skin.values.time_s.id, dst = {
				{x = geo.time_s_x, y = geo.time_y, w = 15, h = 16}
			}},
			{id = skin.values.max_combo.id, dst = {
				{x = geo.maxcombo_x, y = geo.maxcombo_y, w = 15, h = 16}
			}},
			{id = "period", dst = {
				{x = geo.hispeed_p_x, y = geo.hispeed_y, w = 7, h = 16}
			}},
			{id = skin.values.hispeed_n.id, dst = {
				{x = geo.hispeed_n_x, y = geo.hispeed_y, w = 15, h = 16}
			}},
			{id = skin.values.hispeed_f.id, dst = {
				{x = geo.hispeed_f_x, y = geo.hispeed_y, w = 15, h = 16}
			}},
			{id = skin.values.duration.id, dst = {
				{x = geo.duration_x, y = geo.hispeed_y, w = 15, h = 16}
			}},
			{id = "gauge", blend = 2, dst = {
				{x = geo.gauge_x, y = geo.gauge_y, w = geo.gauge_w, h = 28}
			}},
			{id = "percent", dst = {{ x = geo.gauge_percent_x, y = geo.gauge_percent_y, w = 15, h = 16} }},
			{id = skin.values.gauge_n.id, dst = {
				{x = geo.gauge_number_x, y = geo.gauge_number_y, w = 22, h = 24}
			}},
			{id = skin.images.subbga_panel.id, dst = {
				{x = geo.subbga_panel_x, y = geo.subbga_panel_y, w = 234, h = 162}
			}},
			{id = "bga", stretch = geo.subbga_stretch, dst = {
				{x = geo.subbga_x, y = geo.subbga_y, w = 216, h = 144}
			}},
			{id = -100, stretch =  3, op =  {80}, dst = {
				{time = 0, x = geo.subbga_x, y = geo.subbga_y, w = 216, h = 144}
			}},
			{id = -100, stretch =  3, timer =  40, loop =  -1, dst = {
				{time = 0, x = geo.subbga_x, y = geo.subbga_y, w = 216, h = 144},
				{time = 500, a = 255},
				{time = 1000, a = 0}
			}},
			{id = "jc-panel", dst = {
				{x = geo.jc_panel_x, y = geo.jc_panel_y, w = 152, h = 92}
			}},
			{id = "jc-pg-label", loop = 0, dst = {
				{time = 0, x = geo.jc_label_x, y = geo.jc_pg_y, w = 46, h = 11, r = 214, g = 225, b = 255},
				{time = 25, r = 225, g = 255, b = 214},
				{time = 50, r = 226, g = 234, b = 255},
				{time = 100, r = 255, g = 214, b = 225}
			}},
			{id = "jc-pg", loop = 0, dst = {
				{time = 0, x = geo.jc_number_x, y = geo.jc_pg_y, w = 10, h = 11, r = 214, g = 225, b = 255},
				{time = 25, r = 225, g = 255, b = 214},
				{time = 50, r = 226, g = 234, b = 255},
				{time = 100, r = 255, g = 214, b = 225}
			}},
			{id = "jc-gr", dst = {
				{x = geo.jc_number_x, y = geo.jc_gr_y, w = 10, h = 11, r = 226, g = 234, b = 255}
			}},
			{id = "jc-gd", dst = {
				{x = geo.jc_number_x, y = geo.jc_gd_y, w = 10, h = 11, r = 226, g = 234, b = 255}
			}},
			{id = "jc-bd", dst = {
				{x = geo.jc_number_x, y = geo.jc_bd_y, w = 10, h = 11, g = 226, b = 234, r = 255}
			}},
			{id = "jc-pr", dst = {
				{x = geo.jc_number_x, y = geo.jc_pr_y, w = 10, h = 11, g = 226, b = 234, r = 255}
			}},
			{id = "jc-ms", dst = {
				{x = geo.jc_number_x, y = geo.jc_ms_y, w = 10, h = 11, g = 226, b = 234, r = 255}
			}},
		})
		if prop.current.shows_score_graph() then
			table.append_all(skin.dst_panel, {
				{id = skin.images.graph_bg.id, dst = {
					{x = geo.graph_bg_x, y = geo.graph_bg_y, w = 294, h = 94}
				}},
				{id = "graph-now", dst = {
					{x = geo.graph_fg_x, y = geo.graph_now_y, w = 216, h = 20}
				}},
				{id = "graph-best", dst = {
					{x = geo.graph_fg_x, y = geo.graph_best_y, w = 216, h = 20}
				}},
				{id = "graph-target", dst = {
					{x = geo.graph_fg_x, y = geo.graph_target_y, w = 216, h = 20}
				}},
				{id = "graph-overlay", dst = {
					{x = geo.graph_fg_x, y = geo.graph_bg_y, w = 221, h = 94}
				}},
				{id = skin.values.score_now.id, dst = {
					{x = geo.gscore_x, y = geo.gscore_now_y, w = 15, h = 16}
				}},
				{id = skin.values.score_best.id, dst = {
					{x = geo.gscore_x, y = geo.gscore_best_y, w = 15, h = 16}
				}},
				{id = skin.values.score_target.id, dst = {
					{x = geo.gscore_x, y = geo.gscore_target_y, w = 15, h = 16}
				}},
			})
		else
			table.append_all(skin.dst_panel, {
				{id = skin.images.nograph_bg.id, dst = {
					{x = geo.nograph_bg_x, y = geo.nograph_bg_y, w = 214, h = 86}
				}},
				{id = skin.values.score_now.id, dst = {
					{x = geo.score_now_x, y = geo.score_now_y, w = 15, h = 16}
				}},
				{id = "percent", dst = {
					{x = geo.score_rate_p_x, y = geo.score_rate_y, w = 15, h = 16}
				}},
				{id = skin.values.score_rate.id, dst = {
					{x = geo.score_rate_x, y = geo.score_rate_y, w = 15, h = 16}
				}},
			})
		end
		local function progressbar(x)
			table.append_all(skin.dst_fore, {
				{id = "progressbg-t", dst = {
					{x = x + 2, y = geo.progressbg_t_y, w = 28, h = 16}
				}},
				{id = "progressbg-c", dst = {
					{x = x + 2, y = geo.progressbg_c_y, w = 28, h = 370}
				}},
				{id = "progressbg-b", dst = {
					{x = x + 2, y = geo.progressbg_b_y, w = 28, h = 16}
				}},
				{id = "progressfg", blend = 2, dst = {
					{x = x + 6, y = geo.progressfg_y, w = 20, h = 24}
				}},
			})
		end
	
		local function loadingbar(x)
			table.append_all(skin.dst_fore, {
				{id = "loading-bg", op = {80}, dst = {
					{x = x + 104, y = geo.loading_bg_y, w = 456, h = 28}
				}},
				{id = "loading-fg", loop = 0, op = {80}, dst = {
					{x = x + 104, y = geo.loading_bg_y, w = 456, h = 28},
				}},
				{id = "loading-overlay-L", op = {80}, dst = {
					{x = x + 90, y = geo.loading_overlay_y, w = 28, h = 56}
				}},
				{id = "loading-overlay-C", op = {80}, dst = {
					{x = x + 118, y = geo.loading_overlay_y, w = 428, h = 56}
				}},
				{id = "loading-overlay-R", op = {80}, dst = {
					{x = x + 546, y = geo.loading_overlay_y, w = 28, h = 56}
				}},
				{id = "loading-n", op = {80}, dst = {
					{x = x + 299, y = geo.loading_number_y, w = 15, h = 16}
				}},
				{id = "percent", op = {80}, dst = {
					{x = x + 347, y = geo.loading_number_y, w = 15, h = 16}
				}},
				{id = "loading-overlay-L", loop = -1, timer = 40, dst = {
					{x = x + 90, y = geo.loading_overlay_y, w = 28, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "loading-overlay-C", loop = -1, timer = 40, dst = {
					{x = x + 118, y = geo.loading_overlay_y, w = 428, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "loading-overlay-R", loop = -1, timer = 40, dst = {
					{x = x + 546, y = geo.loading_overlay_y, w = 28, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "loading-overlay-L", loop = -1, timer = 40, dst = {
					{x = x + 90, y = geo.loading_overlay_y, w = 28, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "loading-overlay-C", loop = -1, timer = 40, dst = {
					{x = x + 118, y = geo.loading_overlay_y, w = 428, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "loading-overlay-R", loop = -1, timer = 40, dst = {
					{x = x + 546, y = geo.loading_overlay_y, w = 28, h = 56},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
				{id = "ready", loop = -1, timer = 40, dst = {
					{time = 0, x = x + 292, y = geo.loading_number_y, w = 75, h = 16},
					{time = 500, a = 255},
					{time = 1000, a = 0}
				}},
			})
		end
	
		if skin_type == consts.SKIN_TYPE_24K_SP then
			if prop.current.get_play_side_h() == 1 then
				progressbar(0)
				loadingbar(0)
			else
				progressbar(1250)
				loadingbar(616)
			end
		elseif skin_type == consts.SKIN_TYPE_24K_DP then
			progressbar(0)
			progressbar(1250)
			loadingbar(0)
			loadingbar(616)
		end
		table.append_all(skin.dst_fore, {
			{id = "value-lanecover", op = {270}, dst = {
				{time = 0, x = geo.lanecover_value_x, y = geo.lanecover_value_y, w = 15, h = 16}
			}}
		})
	end

	local ext_status, ext = pcall(function()
		local extension_path = skin_config.get_path(prop.files.frame.path)
		local ext_module = dofile(extension_path .. "/skin.lua")
		return ext_module.load(skin_type, resolution, src_id_frame, src_id_close, src_id_number)
	end)
	if ext_status and ext then
		table.append_all(skin.images, ext.images)
		table.append_all(skin.dst_base, ext.dst_base)
		table.append_all(skin.dst_panel, ext.dst_panel)
		table.append_all(skin.dst_fore, ext.dst_fore)
		table.append_all(skin.dst_close, ext.dst_close)
	end

	return skin
end

return frame
