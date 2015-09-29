LVBM.AddOns.Heigan = {
	["Name"] = LVBM_HTU_NAME,
	["Abbreviation1"] = "Heigan",
	["Abbreviation2"] = "htu",
	["Version"] = "1.0",
	["Author"] = "Tandanu",
	["Description"] = LVBM_HTU_DESCRIPTION,
	["Instance"] = LVBM_NAXX,
	["GUITab"] = LVBMGUI_TAB_NAXX,
	["Sort"] = 32,
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
	},
	["InCombat"] = false,
	["Events"] = {
	},
	["OnCombatStart"] = function(delay)
		LVBM.AddOns.Heigan.OnEvent("TeleportBackWarning", 0);
		LVBM.AddOns.Heigan.InCombat = true;
	end,
	["OnCombatEnd"] = function()
		LVBM.AddOns.Heigan.InCombat = false;
	end,
	["OnEvent"] = function(event, arg1)
		if event == "TeleportWarning" then
			if arg1 and arg1 > 0 then
				LVBM.Announce(string.format(LVBM_HTU_TELEPORT_WARNING, arg1));
			elseif arg1 == 0 then
				LVBM.Announce(string.format(LVBM_HTU_TELEPORT_BACK_WARNING, 45));
				LVBM.Schedule(20, "LVBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 25);
				LVBM.Schedule(35, "LVBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 10);
				LVBM.Schedule(45, "LVBM.AddOns.Heigan.OnEvent", "TeleportBackWarning", 0);
				LVBM.EndStatusBarTimer("Teleport Back");
				LVBM.StartStatusBarTimer(45, "Teleport Back");	
			end
		elseif event == "TeleportBackWarning" then
			if arg1 and arg1 > 0 then
				LVBM.Announce(string.format(LVBM_HTU_TELEPORT_BACK_WARNING, arg1));
			elseif arg1 == 0 then
				LVBM.Announce(string.format(LVBM_HTU_TELEPORT_WARNING, 90));
				LVBM.Schedule(30, "LVBM.AddOns.Heigan.OnEvent", "TeleportWarning", 60);
				LVBM.Schedule(60, "LVBM.AddOns.Heigan.OnEvent", "TeleportWarning", 30);
				LVBM.Schedule(80, "LVBM.AddOns.Heigan.OnEvent", "TeleportWarning", 10);
				LVBM.Schedule(90, "LVBM.AddOns.Heigan.OnEvent", "TeleportWarning", 0);
				LVBM.EndStatusBarTimer("Teleport");
				LVBM.StartStatusBarTimer(90, "Teleport");
			end
		end
	end,
};
