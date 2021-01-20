CRUSADER_DATA = {}
CRUSADER_DATA.vow = {}

if CLIENT then
	CRUSADER_DATA.local_crusader = {}
	
	
	net.Receive("ttt2_role_crusader_new_vow", function()
		local new_vow = net.ReadEntity()
		if not new_vow or not new_vow:IsPlayer() then return end

		local new_vow_id = tostring(new_vow:SteamID64() or new_vow:EntIndex())
		CRUSADER_DATA.vowhood[new_vow_id] = true

		CRUSADER_DATA:UpdateScoreboard()
	end)
	
	net.Receive("ttt2_role_crusader_clear_vow", function()
		CRUSADER_DATA.vow = {}

		CRUSADER_DATA:UpdateScoreboard()
	end)
	
	hook.Add("TTTScoreboardColumns", "ttt2_crusader_brotherhood_column", function(pnl)
		local client = LocalPlayer()

		-- this prevention is needed when a player connects in the moment that a round starts
		if not client or not IsValid(client) or not client:IsPlayer() then return end

		if not GetSubRole() ~= ROLE_CRUSADER then return end
		pnl:AddColumn("Vow", function(ply, label)
			if CRUSADER_DATA:IsVow(ply) then
				return "yes"
			else
				return "-"
			end
		end, 70)
	end)
	
	hook.Add("TTTBeginRound", "SelectVows", function( 
		 players = RecipientFilter()
		 players:AddAllPlayers()
		 players[ math.random( #players ) ]
		 if #vows = GetConVar("ttt_crus_vow_amount"):GetInt() then break end
		 if not client or not IsValid(client) or not client:IsPlayer() then return end
		 if self.vow[tostring(ply:SteamID64() or ply:EntIndex())] = true then return end
		 if GetSubRole() ~= ROLE_UNKNOWN or GetSubRole() ~= ROLE_JESTER then return end
		 CRUSADER_DATA:AddToVow(ply)
		 end)

	net.Receive("ttt2_role_crusader_remove_vow", function()
		local rem_vow = net.ReadEntity()
		if not rem_vow or not rem_vow:IsPlayer() then return end

		local rem_vow_id = tostring(rem_vow:SteamID64() or rem_vow:EntIndex())
		CRUSADER_DATA.vow[rem_vow_id] = nil

		CRUSADER_DATA:UpdateScoreboard()
	end)
	
	end --if client end
	if SERVER then
	util.AddNetworkString("ttt2_role_crusader_new_vow")
	util.AddNetworkString("ttt2_role_crusader_clear_vow")
	util.AddNetworkString("ttt2_role_crusader_remove_vow")
	util.AddNetworkString("SelectVows")
	
	function CRUSADER_DATA:AddToVow(ply)
		-- add vow to player
		self.vow[tostring(ply:SteamID64() or ply:EntIndex())] = true

		net.Start("ttt2_role_crusader_new_vow")
		net.WriteEntity(ply)
		net.Send(player.GetAll()) -- send to all players
	end
	
	function CRUSADER_DATA:ClearVow()
		STATUS:RemoveStatus(player.GetAll(), "ttt2_role_crusader_vow")

		self.vow = {}

		net.Start("ttt2_role_crusader_clear_vow")
		net.Send(player.GetAll())
	end
	
	hook.Add("TTTEndRound", "ttt2_crusader_update_scorboard_end", function()
		CRUSADER_DATA:ClearVow()
	end)
	
	function CRUSADER_DATA:IsVow(ply)
	if not IsValid(ply) or not ply:IsPlayer() then return false end
	if not isfunction(ply.SteamID64) and not isfunction(ply.EntIndex) then return false end

	return self.vow[tostring(ply:SteamID64() or ply:EntIndex())] or false
end



function CRUSADER_DATA:RemoveFromVow(ply)
		STATUS:RemoveStatus(ply, "ttt2_role_crusader_vow")

		self.vow[tostring(ply:SteamID64() or ply:EntIndex())] = nil

		net.Start("ttt2_role_crusader_remove_vow")
		net.WriteEntity(ply)
		net.Send(player.GetAll()) -- send to all players
end

function CRUSADER_DATA:GetVows()
	  vows = {}

	for _, p in pairs(self.vow) do
		vows[#vows] = p
	end
function CRUSADER_DATA:SelectVows

	return vows

 




	end -- is If server end