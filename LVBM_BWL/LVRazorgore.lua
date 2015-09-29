LVBM.AddOns.Razorgore = {
	["Name"] = LVBM_RG_NAME,
	["Abbreviation1"] = "rg",
	["Abbreviation2"] = "razor",
	["Version"] = "1.0",
	["Author"] = "Tandanu",
	["Description"] = LVBM_RG_DESCRIPTION,
	["Instance"] = LVBM_BWL,
	["GUITab"] = LVBMGUI_TAB_BWL,
	["Sort"] = 1,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["Enrage"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "LVBM.AddOns.Razorgore.Options.Enrage",
			["text"] = "Enable entrage timer",
			["func"] = function() LVBM.AddOns.Razorgore.Options.Enrage = not LVBM.AddOns.Razorgore.Options.Enrage; end,
		},
	},
	["Events"] = {
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = true,
	},	
	["OnCombatStart"] = function(delay)
		LVBM.StartStatusBarTimer(45 - delay, "Add Spawn");
		if ( LVBM.AddOns.Razorgore.Enrage) then LVBM.StartStatusBarTimer(900 - delay, "Enrage"); end
	end,
	["OnCombatEnd"] = function()
		LVBM.EndTimer("Enrage");
	end,
	["OnEvent"] = function(event, arg1)
		if ( event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" ) then
			if ( string.find(arg1, "ed begins to cast Fireball Volley") ) then
				if ( LVBM.AddOns.Razorgore.Announce) then LVBM.Announce("* Fireball Volley incoming! *"); end
				LVBM.StartStatusBarTimer(2, "Fireball Volley");
				LVBM.StartStatusBarTimer(18, "Next Fireball Volley");
				LVBM.Schedule(14, "LVBM.AddOns.Razorgore.OnEvent", "FireballVolleyWarning", 4);
			end
		elseif ( event == "FireballVolleyWarning" ) then
			if ( LVBM.AddOns.Razorgore.Announce) then  LVBM.Announce(string.format("Fireball Volley in %d seconds!", arg1)); end
		end
	end,		
};
