CreateConVar("ttt_crus_armor", 30, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_crus_vow_attack", 15, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_crus_vow_defense", 20, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_crus_vow_amount", 3, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_crus_vow_innocent", 0, {FCVAR_NOTIFY, FCVAR_ARCHIVE})
CreateConVar("ttt_crus_sandwich", 1, {FCVAR_NOTIFY, FCVAR_ARCHIVE})


hook.Add("TTTUlxDynamicRCVars", "ttt2_ulx_dynamic_crusader_convars", function(tbl)
	tbl[ROLE_CRUSADER] = tbl[ROLE_CRUSADER] or {}
table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_armor",
		slider = true,
		min = 0,
		max = 180,
		decimal = 0,
		desc = "ttt_crus_armor (def. 30)"
	})
	table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_vow_attack",
		slider = true,
		min = 0,
		max = 100,
		decimal = 0,
		desc = "ttt_crus_armor (def. 15)"
	})
	table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_vow_defense",
		slider = true,
		min = 0,
		max = 50,
		decimal = 0,
		desc = "ttt_crus_vow_defense (def. 20)"
	})
	table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_vow_amount",
		slider = true,
		min = 0,
		max = 10,
		decimal = 0,
		desc = "ttt_crus_vow_amount (def. 3)"
	})
	
	table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_vow_innocent",
		slider = true,
		min = 0,
		max = 1,
		decimal = 0,
		desc = "ttt_crus_vow_innocent (def. 0)"
	})
	
	table.insert(tbl[ROLE_CRUSADER], {
		cvar = "ttt_crus_sandwich",
		slider = true,
		min = 0,
		max = 1,
		decimal = 0,
		desc = "ttt_crus_sandwich (def. 1)"
	})
	
	end)
	
	