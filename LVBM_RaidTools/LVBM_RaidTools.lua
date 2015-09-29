----------------------------------------------------
-- LV RaidTools - A Raid Support Mod for LVBM     --
----------------------------------------------------
-- (c) by Nitram <La Vendetta> from DE-Azshara    --
----------------------------------------------------
--
--  v0.1
-- Fist Release
-- Added Slashcommand "/lvrt logout <name>"
-- Added Slashcommand "/lvrt pull <x>" aka "/pull <x>" x = sec
-- Added Slashcommand "/lvrt ui" 
--
--  v0.2
-- Added Slashcommand "/lvrt ver" 
-- Added Slashcommand "/lvrt enable <AddOn> <Player>"
-- Added Slashcommand "/lvrt disable <AddOn> <Player>"
-- Added Slashcommand "/lvrt announce <AddOn> <Player> <on|off>"
-- Added Slashcommand "/lvrt bosslist"
-- Added Slashcommand "/lvrt remote <on|off>"
-- Added Slashcommand "/lvrt emote <emote> [target]"
--
--  v0.3
-- Updated Slashcommand "/lvrt remote <option> <on|off>"
-- Added CT RaidAssist Support (if CTRA iss not loaded)
--
--  v0.4
-- Added Slashcommand "/lvrt invite <level>" for mass Guild Invite (simple version... add more options soon)
--
--
--
--
--
-- IsPromoted(name)			// Returns the Rank of an Player by Name
-- IsRaidMember(name)			// Returns true if a Player is in the RaidGroup
-- RaidMsg(msg)				// Sends a Chat Message to "RAID"
-- Msg(msg)				// Prints out a local Message in DefaultChatFrame
--
--

LV_RaidTools = {}
LV_RaidTools["Version"] = "0.4";

function LV_RaidTools:OnLoad()
	this:RegisterEvent("CHAT_MSG_ADDON");
	this:RegisterEvent("VARIABLES_LOADED");

	SLASH_LVRT1 = "/lvrt";
	SlashCmdList["LVRT"] = function(msg) self:Slash_Handler(msg); end;

	SLASH_LVRT_PULL1 = "/pull";
	SlashCmdList["LVRT_PULL"] = function(msg) self:Announce_Pull(msg); end;

end


function LV_RaidTools:OnEvent()
	if (event == "VARIABLES_LOADED") then
		if type(LVRT_Save) ~= "table" then 	LVRT_Save = {} 	end
		if not LVRT_Save["Remote"] then		LVRT_Save["Remote"] = true; 	end
		if not LVRT_Save["Emote"] then		LVRT_Save["Emote"] = true; 	end
		if not LVRT_Save["Logout"] then		LVRT_Save["Logout"] = true;	end
		if not LVRT_Save["Ctmod"] then		LVRT_Save["Ctmod"] = true;	end


	elseif (event == "CHAT_MSG_ADDON") then
		if (LVRT_Save.Remote and arg1 == "LVBM RT LOGOUT" and arg2 == UnitName("player") and self:IsPromoted(arg4) >= 1) then
			self:RaidMsg( string.format(LVRT_SENDLOGOUT_RAID_NOTICE, arg4) );
			Logout();		-- Shows the default "Logout" dialog (with cancel option)

		elseif (arg1 == "LVBM RT VER") then
			LVBM.SendHiddenWhisper(string.format(LVRT_VERSION_WHISPER, LV_RaidTools["Version"]), arg4);

		elseif (LVRT_Save.Remote and arg1 == "LVBM RT ENABLEADDON" and arg2 and self:IsPromoted(arg4) >= 1) then
			local _, _, xArg1, xArg2 = string.find(arg2, "(.*) ### (.*)");
			if xArg1 and (xArg2 == UnitName("player") or xArg2 == "all") then
				if( LVBM.AddOns[xArg1] and LVBM.AddOns[xArg1].Options.Enabled ~= nil ) then
					LVBM.AddOns[xArg1].Options.Enabled = true;
					LVBM.AddMsg(LVBM_MOD_ENABLED, string.format('%q', LVBM.AddOns[xArg1].Name));
				end
			end

		elseif (LVRT_Save.Remote and arg1 == "LVBM RT DISABLEADDON" and arg2 and self:IsPromoted(arg4) >= 1) then
			local _, _, xArg1, xArg2 = string.find(arg2, "(.*) ### (.*)");
			if xArg1 and (xArg2 == UnitName("player") or xArg2 == "all") then
				if( LVBM.AddOns[xArg1] and LVBM.AddOns[xArg1].Options.Enabled ~= nil ) then
					LVBM.AddOns[xArg1].Options.Enabled = false;
					LVBM.AddMsg(LVBM_MOD_DISABLED, string.format('%q', LVBM.AddOns[xArg1].Name));
				end
			end

		elseif (LVRT_Save.Remote and arg1 == "LVBM RT ANNOUNCEON" and arg2 and self:IsPromoted(arg4) >= 1) then
			local _, _, xArg1, xArg2 = string.find(arg2, "(.*) ### (.*)");
			if xArg1 and (xArg2 == UnitName("player") or xArg2 == "all") then
				if( LVBM.AddOns[xArg1] and LVBM.AddOns[xArg1].Options.Announce ~= nil ) then
					LVBM.AddOns[xArg1].Options.Announce = true;
					LVBM.AddMsg(LVBM_ANNOUNCE_ENABLED, string.format('%q', LVBM.AddOns[xArg1].Name));
				end
			end

		elseif (LVRT_Save.Remote and arg1 == "LVBM RT ANNOUNCEOFF" and arg2 and self:IsPromoted(arg4) >= 1) then
			local _, _, xArg1, xArg2 = string.find(arg2, "(.*) ### (.*)");
			if xArg1 and (xArg2 == UnitName("player") or xArg2 == "all") then
				if( LVBM.AddOns[xArg1] and LVBM.AddOns[xArg1].Options.Announce ~= nil ) then
					LVBM.AddOns[xArg1].Options.Announce = false;
					LVBM.AddMsg(LVBM_ANNOUNCE_DISABLED, string.format('%q', LVBM.AddOns[xArg1].Name));
				end
			end

		elseif (LVRT_Save.Remote and arg1 == "LVBM RT EMOTE" and arg2 and self:IsPromoted(arg4) >= 1) then
			if string.find(arg2, " ") then
				local _, _, xArg1, xArg2 = string.find(arg2, "(.*) (.*)");
				if xArg2 ~= UnitName("player") then
					DoEmote(xArg1, xArg2);
				end
			elseif (arg2 ~= "") then
				DoEmote(arg2);
			else
				return;
			end
			self:Msg( string.format(LVRT_EMOTE_RECIVE, arg4) );

		elseif ( arg1 == "LVBM RT GETDURA" and arg2 ) then
			local currDur, maxDur, brokenItems = self:Durability();
			SendAddonMessage("LVBM RT SETDURA", "DUR "..currDur.." "..maxDur.." "..brokenItems.." "..arg4, arg3);

		elseif (LVRT_Save.Ctmod and arg1 == "CTRA" and not IsAddOnLoaded("CT_RaidAssist") ) then	
			-- We answer some CT Functions if CTRA issn't loaded
			if arg2 == "DURC" then
--				self:Msg(LVRT_DURABILITY_MESSAGE);
				local currDur, maxDur, brokenItems = self:Durability();
				SendAddonMessage("CTRA", "DUR "..currDur.." "..maxDur.." "..brokenItems.." "..arg4, arg3);
			end
		end
	end
end

function LV_RaidTools:Msg(msg)
	LVBM.AddMsg(msg, "LV_RaidTools");
end

function LV_RaidTools:RaidMsg(msg)
	if (LVBM.InRaid) then
		SendChatMessage(msg, "RAID");
	end
end



-- Functions
function LV_RaidTools:Slash_Handler(msg)
	local _, xEnd = string.find(msg, " ");
	local xCommand = string.lower(string.sub(msg, 0, (xEnd or 0)-1));
	local xParams = string.sub(msg, (xEnd or 0)+1);

	if (xCommand == "logout") then
		if (not self:IsRaidMember(LVBM.Capitalize(xParams, true))) then self:Msg(LVRT_SENDLOGOUT_NEED_NAME); return; end
		SendAddonMessage("LVBM RT LOGOUT", LVBM.Capitalize(xParams, true), "RAID");
		self:Msg( string.format(LVRT_SENDLOGOUT, xParams) );

	elseif (xCommand == "pull") then
		xParams = tonumber(xParams);
		
		if LVBM.Rank >= 1 then
			if (xParams) then 	self:Announce_Pull(xParams); 
			else			self:Msg(LVRT_PULLCOMMAND_FAILED);
			end
		else
			self:Msg(LVRT_INVITE_NOPERMISSION);
		end

	elseif (xCommand == "enable" or xCommand == "disable") then
		local _, _, xArg1, xArg2 = string.find(xParams, "(.*) (.*)");
		
		xArg2 = LVBM.Capitalize(xArg2, true);
		
		if LVBM.Rank == 0 then
			self:Msg(LVRT_INVITE_NOPERMISSION);
			return;
		end
		
		if xArg1 and xArg2 then
			if xCommand == "enable" then
				self:Msg( string.format(LVRT_ENABLEADDON_MESSAGE, xArg2) );
				SendAddonMessage("LVBM RT ENABLEADDON", xArg1.." ### "..xArg2, "RAID");
			elseif xCommand == "disable" then
				self:Msg( string.format(LVRT_DISANABLEADDON_MESSAGE, xArg2) );		
				SendAddonMessage("LVBM RT DISABLEADDON", xArg1.." ### "..xArg2, "RAID");
			end
		else 
			self:Msg( LVRT_COMMAND_FAILD );
		end

	elseif (xCommand == "announce") then
		local _, _, xArg1, xArg2, xArg3 = string.find(xParams, "(.*) (.*) (.*)");
		
		xArg2 = LVBM.Capitalize(xArg2, true);
		
		if LVBM.Rank == 0 then
			self:Msg(LVRT_INVITE_NOPERMISSION);
			return;
		end
		
		if xArg1 and xArg2 and (xArg3 == "on" or xArg3 == "off") then
			if xArg3 == "on" then
				self:Msg( string.format(LVRT_ANNOUNCEON_MESSAGE, xArg2) );
				SendAddonMessage("LVBM RT ANNOUNCEON", xArg1.." ### "..xArg2, "RAID");
			elseif xArg3 == "off" then
				self:Msg( string.format(LVRT_ANNOUNCEOFF_MESSAGE, xArg2) );		
				SendAddonMessage("LVBM RT ANNOUNCEOFF", xArg1.." ### "..xArg2, "RAID");
			end
		else 
			self:Msg( LVRT_COMMAND_FAILD );
		end

	elseif (xCommand == "bosslist") then
		for index, value in pairs(LVBM.AddOns) do
			self:Msg(index);
		end

	elseif (xCommand == "emote") then
	
		if LVBM.Rank == 0 then
			self:Msg(LVRT_INVITE_NOPERMISSION);
			return;
		end
	
		self:Msg( string.format(LVRT_EMOTE_MESSAGE, xParams) );
		SendAddonMessage("LVBM RT EMOTE", xParams, "RAID");

	elseif (xCommand == "remote") then
		local _, _, xArg1, xArg2 = string.find(xParams, "(.*) (.*)");
		xArg2 = string.lower(xArg2);
		if( xArg2 == "on" or xArg2 == "off" ) then
			if LVRT_Save[LVBM.Capitalize(xArg1, true)] ~= nil then
				if xArg2 == "on" then
					LVRT_Save[LVBM.Capitalize(xArg1, true)] = true;
					self:Msg( string.format(LVRT_REMOTE_ON, xArg1) );
				else
					LVRT_Save[LVBM.Capitalize(xArg1, true)] = false;
					self:Msg( string.format(LVRT_REMOTE_OFF, xArg1) );
				end
			else
				for index, value in pairs(LVRT_Save) do
					self:Msg( string.format(LVRT_REMOTE_INFO, index) );
				end
			end
		else 
			for index, value in pairs(LVRT_Save) do
				self:Msg( string.format(LVRT_REMOTE_INFO, index) );
			end
		end
	
	elseif (xCommand == "invite") then
		xParams = tonumber(xParams);
		if( xParams ~= nil ) then
			if not GetGuildInfo("player") then
				self:Msg(LVRT_INVITE_NOGUILD);
				return;
			end
			if LVBM.InRaid and LVBM.Rank < 1 then
				self:Msg(LVRT_INVITE_NOPERMISSION);
				return;
			end
			SendChatMessage(LVRT_INVITE_GUILD_MESSAGE, "GUILD");
			GuildRoster();
			LVBM.Schedule(10, "LV_RaidTools:Raid_Invite", xParams);
		else
			self:Msg(LVRT_INVITE_SYNTAX);
		end

	elseif (xCommand == "ver") then
		self:Msg( LVRT_VERSION_MESSAGE );
		SendAddonMessage("LVBM RT VER", "-nil-", "RAID");

	elseif (xCommand == "ui") then
		ReloadUI()

	else
		for index, value in pairs(LVRT_SLASHHELP) do self:Msg(value); end
	end
end

function LV_RaidTools:Raid_Invite(xArg1)
	GuildRoster();
	SetGuildRosterShowOffline(true);
	CloseGuildRoster();

	for i=1, GetNumGuildMembers(true) do
		local name, _, _, level, class, zone, _, _, online = GetGuildRosterInfo(i);
		if not self:IsRaidMember(name) and online and name ~= UnitName("player") and level == xArg1 then
			InviteByName(name);
		elseif xArg1 == 0 then
			InviteByName(name);
		end

	end
end

function LV_RaidTools:IsPromoted(name)
	if (LVBM.InRaid and LVBM.Raid[name]) then	return LVBM.Raid[name];
	else						return 0;
	end
end

function LV_RaidTools:IsRaidMember(name)
	if (LVBM.InRaid and LVBM.Raid[name]) then	return true;
	else						return false;
	end
end

function LV_RaidTools:Announce_Pull(msg, announce)
	if( msg == nil and type(announce) == "number" ) then
		LVBM.Announce(string.format(LVRT_PULLCOMMAND_PREWARN, announce));
	elseif( msg == "pull" ) then
		LVBM.Announce(LVRT_PULLCOMMAND_ANNOUNCE);
		LVBM.AddSpecialWarning(LVRT_PULLCOMMAND_SELFWARN);
	else
		LVBM.UnSchedule("LV_RaidTools:Announce_Pull");

		local time = tonumber(msg);
		if( time == nil or time > 30 ) then time = 10;	end

		for i=1, (time-1), 1 do
			LVBM.Schedule(time-i, "LV_RaidTools:Announce_Pull", nil, i);
		end
		LVBM.Schedule(time, "LV_RaidTools:Announce_Pull", "pull");
		LVBM.StartStatusBarTimer(time, "Incoming Pull");
	end
end

function LV_RaidTools:Durability()
	local currDur, maxDur, brokenItems = 0, 0, 0;
	local itemIds = { 1, 2, 3, 5, 6, 7, 8, 9, 10, 16, 17, 18 };
	for k, v in itemIds do
		LVBMTooltip:ClearLines();
		LVBMTooltip:SetInventoryItem("player", v);
		for i = 1, LVBMTooltip:NumLines(), 1 do
			local useless, useless, sMin, sMax = string.find(getglobal("LVBMTooltipTextLeft" .. i):GetText() or "", LVRT_TOOLTIP_DURABILITY);
			if ( sMin and sMax ) then
				local iMin, iMax = tonumber(sMin), tonumber(sMax);
				if ( iMin == 0 ) then
					brokenItems = brokenItems + 1;
				end
				currDur = currDur + iMin;
				maxDur = maxDur + iMax;
				break;
			end
		end
	end
	return currDur, maxDur, brokenItems;
end




