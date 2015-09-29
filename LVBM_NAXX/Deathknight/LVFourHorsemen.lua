--
-- Four Horsemen Raidwarning AddOn
--


LVBM.AddOns.FourHorsemen = {
	["Name"] = LVBM_FOURHORSEMEN_NAME,
	["Abbreviation1"] = "horsemen",
	["Version"] = "1.4",
	["Author"] = "Nitram",
	["MinVersionToSync"] = 1.93,	-- old versions are buggy, we dont want to sync with them
	["Description"] = LVBM_FOURHORSEMEN_INFO,
	["Instance"] = LVBM_NAXX,
	["GUITab"] = LVBMGUI_TAB_NAXX,
	["Sort"] = 23,
	["lastTarget"] = "",
	["lastVoid"] = GetTime(),
	["Options"] = {
		["Enabled"] = true,
		["Announce"] = false,
		["ShowMarkPreWarning"] = true,
		["SyncMark"] = true,
		["WhisperVoid"] = false,
		["FlashVoidAlways"] = true,
		["TauntResist"] = true,
		["InfoFrame"] = true,
	},
	["DropdownMenu"] = {
		[1] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning",
			["text"] = LVBM_FOURHORSEMEN_SHOW_5SEC_MARK_WARNING,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning = not LVBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning; end,
		},	
		[2] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.SyncMark",
			["text"] = LVBM_FOURHORSEMEN_SYNC_INFO,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.SyncMark = not LVBM.AddOns.FourHorsemen.Options.SyncMark; end,
		},	
		[3] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.WhisperVoid",
			["text"] = LVBM_FOURHORSEMEN_WHISPER_INFO,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.WhisperVoid = not LVBM.AddOns.FourHorsemen.Options.WhisperVoid; end,
		},	
		[4] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.FlashVoidAlways",
			["text"] = LVBM_FOURHORSEMEN_VOID_ALLWAYS_INFO,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.FlashVoidAlways = not LVBM.AddOns.FourHorsemen.Options.FlashVoidAlways; end,
		},	
		[5] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.TauntResist",
			["text"] = LVBM_FOURHORSEMEN_TAUNTRESIST_INFO,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.TauntResist = not LVBM.AddOns.FourHorsemen.Options.TauntResist; end,
		},	
		[6] = {
			["variable"] = "LVBM.AddOns.FourHorsemen.Options.InfoFrame",
			["text"] = LVBM_FOURHORSEMEN_INFOFRAME_INFO,
			["func"] = function() LVBM.AddOns.FourHorsemen.Options.InfoFrame = not LVBM.AddOns.FourHorsemen.Options.InfoFrame; end,
		},	
	},
	["SlashCmdHelpText"] = {
		[1] = "/horsemen hp - shows/hides the InfoFrame",
	},
	["OnSlashCommand"] = function(msg)
		if string.lower(msg) == "hp" then
			if LVBMFourHorsemenFrame then		-- no need to create a new Frame
				if LVBMFourHorsemenFrame:GetObject():IsShown() then
					LVBMFourHorsemenFrame:Hide();
				else
					LVBMFourHorsemenFrame:Show();
				end
			else
				LVBM.AddOns.FourHorsemen.CreateInfoFrame();
			end
			return true;
		end
	end,
	["Events"] = {
		["CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"] = true,		-- ShieldWall
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF"] = true,		-- Meteor // Wrath // Void
		["CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"] = true,		-- Meteor // Wrath // Void
		["CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE"] = true,		-- Meteor
		["CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"] = true,			-- Mark
		["CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"] = true,	-- Mark
		["CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE"] = true,		-- Mark
		["CHAT_MSG_SPELL_SELF_DAMAGE"] = true,				-- Taunt Resist
		["CHAT_MSG_ADDON"] = true, 					-- Void Zone // Mark sync
	},
	["LastMark"] = 0,
	["CountMark"] = 0,
	["OnCombatStart"] = function(delay)
		LVBM.AddOns.FourHorsemen.InCombat = true;
		LVBM.AddOns.FourHorsemen.LastMark = 0;
		LVBM.AddOns.FourHorsemen.CountMark = 0;
		LVBM.Schedule(20 - 5 - delay, "LVBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
		LVBM.StartStatusBarTimer(1200 - delay, "Enrage");	-- Not sure, but seems to be correct ( = ~100 marks)
		LVBM.StartStatusBarTimer(20 - delay, "Mark #1");

		if LVBM.AddOns.FourHorsemen.Options.InfoFrame then
			LVBM.AddOns.FourHorsemen.CreateInfoFrame(true);
		end
	end,
	["OnCombatEnd"] = function()
		LVBM.AddOns.FourHorsemen.InCombat = false;
		LVBM.AddOns.FourHorsemen.LastMark = 0;
		LVBM.AddOns.FourHorsemen.CountMark = 0;
		LVBM.AddOns.FourHorsemen.HighSyncMark = 0;

		LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE]	= 100;
		LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY]	= 100;
		LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE]	= 100;
		LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK]	= 100;

		if LVBM.AddOns.FourHorsemen.Options.InfoFrame then
			LVBM.AddOns.FourHorsemen.CreateInfoFrame(false);
		end
	end,
	["HighSyncMark"] = 0,
	["OnEvent"] = function(event, arg1)

		------------------
		-- Taunt Resist --
		------------------
		if (event == "CHAT_MSG_SPELL_SELF_DAMAGE"
		    and LVBM.AddOns.FourHorsemen.InCombat
		    and LVBM.AddOns.FourHorsemen.Options.TauntResist
		    and UnitClass("player") == LVBM_WARRIOR) then

			if((string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_TAUNT) and string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_RESIST))
			or (string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_CSHOUT) and string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_RESIST))
			or (string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_MOKING) and (string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_PARRY) 
										      or string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_MISS)
										      or string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_BLOCK)
										      or string.find(arg1, LVBM_FOURHORSEMEN_TAUNTRESIST_DODGE))))then
				-- We don't check for Evade, because i don't think this is needed by the 4H encounter
				LVBM.AddSpecialWarning(LVBM_FOURHORSEMEN_TAUNTRESIST_SELFWARN);
				SendChatMessage(LVBM_FOURHORSEMEN_TAUNTRESIST_MESSAGE, "SAY");
			end
		end

		-----------------
		-- Mark Debuff --
		-----------------
		if (event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" 
		 or event == "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE"
		 or event == "CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE") then
			if (string.find(arg1, LVBM_FOURHORSEMEN_MARK_EXPR)) then
				if( time() - LVBM.AddOns.FourHorsemen.LastMark > 11.5 )then
					LVBM.AddOns.FourHorsemen.LastMark = time();
					LVBM.AddOns.FourHorsemen.CountMark = LVBM.AddOns.FourHorsemen.CountMark + 1;

					if( LVBM.AddOns.FourHorsemen.Options.SyncMark ) then
						SendAddonMessage("LVFH MARK", LVBM.AddOns.FourHorsemen.CountMark, "RAID");
					end

					LVBM.Announce( string.format(LVBM_FOURHORSEMEN_MARK_ANNOUNCE, LVBM.AddOns.FourHorsemen.CountMark) );
					LVBM.Schedule(7, "LVBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
					LVBM.StartStatusBarTimer(12, "Mark #"..LVBM.AddOns.FourHorsemen.CountMark+1);
				end
			end

		elseif (event == "CHAT_MSG_ADDON" and LVBM.AddOns.FourHorsemen.InCombat and LVBM.AddOns.FourHorsemen.Options.SyncMark
		   and arg1 == "LVFH MARK" and arg2 and arg3 == "RAID") then
			arg2 = tonumber(arg2) or 0;
			if( time() - LVBM.AddOns.FourHorsemen.LastMark > 11.5 )then
				LVBM.AddOns.FourHorsemen.LastMark = time();
				LVBM.AddOns.FourHorsemen.CountMark = LVBM.AddOns.FourHorsemen.CountMark + 1;	-- Count Mark if not countet by own client

				LVBM.Announce( string.format(LVBM_FOURHORSEMEN_MARK_ANNOUNCE, LVBM.AddOns.FourHorsemen.CountMark) );
				LVBM.Schedule(7, "LVBM.AddOns.FourHorsemen.OnEvent", "MarkWarn5");
				LVBM.EndStatusBarTimer("Mark #"..LVBM.AddOns.FourHorsemen.CountMark);
				LVBM.StartStatusBarTimer(12, "Mark #"..LVBM.AddOns.FourHorsemen.CountMark+1);
			end

		elseif (event == "MarkWarn5") and LVBM.AddOns.FourHorsemen.Options.ShowMarkPreWarning then
			LVBM.Announce(string.format(LVBM_FOURHORSEMEN_MARK_WARNING, (LVBM.AddOns.FourHorsemen.CountMark+1)));
		end

		
		---------------
		-- Void Zone --
		---------------
		if (event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"
		 or event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF") then
			if (string.find(arg1, LVBM_FOURHORSEMEN_VOID_EXPR)) then		-- Void
				-- after a lot of tests, its between 12 an 16 seconds
				LVBM.StartStatusBarTimer(12, "Void Zone");
				if( LVBM.AddOns.FourHorsemen.Options.FlashVoidAlways ) then
					LVBM.AddSpecialWarning(LVBM_FOURHORSEMEN_VOID_ANNOUNCE);
				end
			end

		elseif (event == "CHAT_MSG_ADDON") then
			if LVBM.AddOns.FourHorsemen.InCombat and arg1 == "LVFH VOID" and arg2 and arg3 == "RAID" then
				if LVBM.Raid[arg2] and arg2 ~= LVBM.AddOns.FourHorsemen.lastTarget then
					LVBM.AddOns.FourHorsemen.lastTarget = arg2;
					LVBM.AddOns.FourHorsemen.OnEvent("DetectVoidZone", arg2);
				end
			end

		elseif (event == "DetectVoidZone") and arg1 then
			if (GetTime() - LVBM.AddOns.FourHorsemen.lastVoid) > 9 then
				LVBM.AddOns.FourHorsemen.lastVoid = GetTime();
				if arg1 == UnitName("player") and not LVBM.AddOns.FourHorsemen.Options.FlashVoidAlways then
					LVBM.AddSpecialWarning(LVBM_FOURHORSEMEN_VOID_ANNOUNCE);
				end
				if LVBM.AddOns.FourHorsemen.Options.WhisperVoid and LVBM.Rank >= 1 then
					LVBM.SendHiddenWhisper(LVBM_FOURHORSEMEN_VOID_WHISPER, arg1);
				end
			end
		end
		
		------------
		-- Meteor --
		------------
		if (event == "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE" or event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE") then
			if (string.find(arg1, LVBM_FOURHORSEMEN_METEOR_EXPR)) then		-- Meteor 
				LVBM.EndStatusBarTimer("Meteor");
				LVBM.StartStatusBarTimer(12, "Meteor");
			end
		end

		----------------
		-- ShieldWall --
		----------------
		if (event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS") then
			local _, _, sArg1 = string.find(arg1, LVBM_FOURHORSEMEN_SHIELDWALL_EXPR);
			if( sArg1 ) then
				LVBM.Announce(string.format(LVBM_FOURHORSEMEN_SHIELDWALL_ANNOUNCE, sArg1));
				LVBM.Schedule(20, "LVBM.AddOns.FourHorsemen.OnEvent", "ShieldWallWarn5", sArg1);
				--german localization
				sArg1 = string.gsub(sArg1, "Hochlord", "Highlord");
				sArg1 = string.gsub(sArg1, "Sire", "Sir");
				
				LVBM.StartStatusBarTimer(20, "Shield Wall: "..sArg1);
			end

		elseif (event == "ShieldWallWarn5") then
			LVBM.Announce(string.format(LVBM_FOURHORSEMEN_SHIELDWALL_FADE, arg1));

		end

	end,
	["OnUpdate"] = function(elapsed)	-- Void Zone Detection - not always true, but thats all we can do :(
		if not LVBM.AddOns.FourHorsemen.InCombat then
			return;
		end
		local ladyUnitID;
		if UnitName("target") == LVBM_FOURHORSEMEN_LADY then
			ladyUnitID = "target";
		end
		if not ladyUnitID then
			for i = 1, GetNumRaidMembers() do
				if UnitName("raid"..i.."target") == LVBM_FOURHORSEMEN_LADY then
					ladyUnitID = "raid"..i.."target";
					LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == LVBM_FOURHORSEMEN_THANE then
					LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == LVBM_FOURHORSEMEN_MOGRAINE then
					LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE] = UnitHealth("raid"..i.."target");

				elseif UnitName("raid"..i.."target") == LVBM_FOURHORSEMEN_ZELIEK then
					LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK] = UnitHealth("raid"..i.."target");
				end
			end
		end

		if ladyUnitID and UnitExists(ladyUnitID.."target") and UnitClass(ladyUnitID.."target") ~= LVBM_WARRIOR then
			local newTarget = UnitName(ladyUnitID.."target");
			if newTarget ~= LVBM.AddOns.FourHorsemen.lastTarget and LVBM.Raid[newTarget] then
				LVBM.AddOns.FourHorsemen.lastTarget = newTarget;
				LVBM.AddOns.FourHorsemen.OnEvent("DetectVoidZone", newTarget);
				SendAddonMessage("LVFH VOID", newTarget, "RAID");
			end
		end
	end,
	[LVBM_FOURHORSEMEN_THANE] = 100,
	[LVBM_FOURHORSEMEN_LADY] = 100,
	[LVBM_FOURHORSEMEN_MOGRAINE] = 100,
	[LVBM_FOURHORSEMEN_ZELIEK] = 100,
	["CreateInfoFrame"] = function(xshow)		-- LVBM.AddOns.FourHorsemen.CreateInfoFrame();
		if not LVBMGui then return; end

		if LVBMFourHorsemenFrame then		-- no need to create a new Frame
			if (xshow == false) then -- or (LVBMFourHorsemenFrame:GetObject():IsShown() and not xshow)) then
				LVBMFourHorsemenFrame:Hide();
			elseif (xshow == true) then -- or (LVBMFourHorsemenFrame:GetObject():IsShown() and xshow)) then
				LVBMFourHorsemenFrame:Show();
			end
			return;
		elseif xshow == false then --we don't want to create a frame if we call this function to hide a info frame that does not exist
			return;
		end
		
		LVBMFourHorsemenFrame = LVBMGui:CreateInfoFrame("Four Horsemen", "Shows HP of the Horsemen");
		if( not LVBMFourHorsemenFrame ) then 
			LVBM.AddMsg("Can't get frame from CreateInfoFrame()");
			return false; 
		end
		LVBMFourHorsemenFrame:GetObject():SetScript("OnUpdate", function() 
						LVBM_InfoFrameTemplate_OnUpdate(this, arg1); 
						LVBM.AddOns.FourHorsemen.FrameUpdate(); 
					end);
	
		LVBMFourHorsemenFrameR1 = LVBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, LVBM_FOURHORSEMEN_MOGRAINE, 100);
		LVBMFourHorsemenFrameR2 = LVBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, LVBM_FOURHORSEMEN_THANE, 100);
		LVBMFourHorsemenFrameR3 = LVBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, LVBM_FOURHORSEMEN_LADY, 100);
		LVBMFourHorsemenFrameR4 = LVBMFourHorsemenFrame:CreateStatusBar(0, 100, 100, nil, LVBM_FOURHORSEMEN_ZELIEK, 100);
	end,
	["FrameUpdate"] = function()
		LVBMFourHorsemenFrameR1:SetValue( LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE] );
		getglobal(LVBMFourHorsemenFrameR1:GetObject():GetName().."RightText"):SetText(LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE]);

		LVBMFourHorsemenFrameR2:SetValue( LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE] );
		getglobal(LVBMFourHorsemenFrameR2:GetObject():GetName().."RightText"):SetText(LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE]);

		LVBMFourHorsemenFrameR3:SetValue( LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY] );
		getglobal(LVBMFourHorsemenFrameR3:GetObject():GetName().."RightText"):SetText(LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY]);

		LVBMFourHorsemenFrameR4:SetValue( LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK] );
		getglobal(LVBMFourHorsemenFrameR4:GetObject():GetName().."RightText"):SetText(LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK]);

		-- Make the bars look better :)
		if LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE] > 50 then	LVBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(0, 1, 0);
		elseif LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_MOGRAINE] > 20 then	LVBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									LVBMFourHorsemenFrameR1:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE] > 50 then		LVBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(0, 1, 0);
		elseif LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_THANE] > 20 then	LVBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									LVBMFourHorsemenFrameR2:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY] > 50 then		LVBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(0, 1, 0);
		elseif LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_LADY] > 20 then	LVBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									LVBMFourHorsemenFrameR3:GetObject():SetStatusBarColor(1, 0, 0);
		end

		if LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK] > 50 then		LVBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(0, 1, 0);
		elseif LVBM.AddOns.FourHorsemen[LVBM_FOURHORSEMEN_ZELIEK] > 20 then	LVBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(1, 0.6, 0);
		else									LVBMFourHorsemenFrameR4:GetObject():SetStatusBarColor(1, 0, 0);
		end
		-- End Bar Colors
	end,
};



