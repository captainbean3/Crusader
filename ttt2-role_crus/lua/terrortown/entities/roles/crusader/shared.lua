AddCSLuaFile()

if SERVER then
	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_crus.vmt")
end

function ROLE:PreInitialize()
	self.color = Color(204, 153, 0, 255)

	self.abbr = "crus" -- abbreviation
	self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
	self.scoreKillsMultiplier = 1 -- multiplier for kill of player of another team
	self.scoreTeamKillsMultiplier = -8 -- multiplier for teamkill
	self.unknownTeam = true -- player don't know their teammates

	self.defaultTeam = TEAM_INNOCENT -- the team name: roles with same team name are working together
	

	self.conVarData = {
		pct = 0.10, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 6, -- minimum amount of players until this role is able to get selected
		credits = 0,
		shopFallback = SHOP_DISABLED,
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 100
}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_INNOCENT)
end

if SERVER then
	-- Give Loadout on respawn and rolechange	
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("weapon_ttt_sandwich")
		ply:GiveArmor(GetConVar("ttt_crus_armor"):GetInt())
		end
		
	    function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("weapon_ttt_sandwich")
		ply:RemoveArmor(GetConVar("ttt_crus_armor"):GetInt())
	end
		end