local material_has_vow = Material("vgui/ttt/dynamic/roles/has_vow")

-- handle looking at sodas
hook.Add("TTTRenderEntityInfo", "ttt2_crusader_highlight_players", function(tData)
	-- while client is setting up, ignore missing PRIEST
	if not CRUSADER then return end

	local ent = tData:GetEntity()

	-- has to be a player
	if not ent:IsPlayer() then return end

	-- only add text to brotherhood players
	if not CRUSADER_DATA:IsVow(ply) or not CRUSADER_DATA:IsVow(LocalPlayer()) then return end

	tData:AddDescriptionLine(
		LANG.GetTranslation("ttt2_crusader_player_vow"),
		CRUSADER.dkcolor
	)

	tData:AddIcon(
		material_has_vow,
		CRUSADER.dkcolor
	)
end)