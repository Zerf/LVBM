LVBM.AddOns.Shazzrah = { 
	["Name"] = LVBM_SHAZZRAH_NAME,
	["Abbreviation1"] = "Shazz", 
	["Version"] = "1.1",
	["Author"] = "La Vendetta|Nitram",
	["Description"] = LVBM_SHAZZRAH_INFO,
	["Instance"] = LVBM_MC,
	["GUITab"] = LVBMGUI_TAB_MC,
	["Sort"] = 6,
	["Options"] = {  
		["Enabled"] = true,
		["Announce"] = false,
	},
	["Curse"] = false,
	["Events"] = {
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = true,
		["CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE"] = true,
		["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"] = true,
		["CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"] = true,
	},
	["OnCombatStart"] = function(delay)
		LVBM.Schedule(16 - delay, "LVBM.AddOns.Shazzrah.OnEvent", "CounterspellWarning", 5);
		LVBM.StartStatusBarTimer(16 - delay, "Counterspell"); -- first one seems to be @16 more likely than not
	end,
	["OnCombatEnd"] = function()
		LVBM.EndTimer("Counterspell");
	end,
	["OnEvent"] = function(event, arg1)
		if ( event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS" ) then
			if ( arg1 == LVBM_SHAZZRAH_DEADEN_MAGIC ) then
				if ( LVBM.AddOns.Shazzrah.Announce) then  LVBM.Announce(LVBM_SHAZZRAH_DEADEN_WARN); end
			end
		elseif ( event == "CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE" or event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" or event == "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE" ) then
			if ( string.find(arg1, LVBM_SHAZZRAH_CURSE_REGEXP) ) and not LVBM.AddOns.Shazzrah.Curse then
				LVBM.AddOns.Shazzrah.Curse = true;
				if ( LVBM.AddOns.Shazzrah.Announce) then LVBM.Announce(LVBM_SHAZZRAH_CURSE_WARNING); end
				LVBM.Schedule(15, "LVBM.AddOns.Shazzrah.OnEvent", "CurseWarning", 5);
				LVBM.EndStatusBarTimer("Curse");
				LVBM.StartStatusBarTimer(20, "Curse");
			end
		elseif ( event == "CurseWarning" ) then
			if arg1 then
				if ( LVBM.AddOns.Shazzrah.Announce) then LVBM.Announce(string.format(LVBM_SHAZZRAH_CURSE_SOON_WARNING, arg1)); end
				LVBM.AddOns.Shazzrah.Curse = false;
			end
		elseif ( event == "CounterspellWarning" ) then
			LVBM.StartRepeatingStatusBarTimer(18, "Counterspell", 50); -- its random 16/20s
		end
	end,		
};
