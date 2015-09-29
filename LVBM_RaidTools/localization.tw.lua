if (GetLocale() == "zhTW") then


LVRT_SLASHHELP			= {
	"歡迎使用 La Vendetta 團隊工具 /lvrt",
	"命令列表:",
	" ",
	"/lvrt logout <name> - this logs a player out of the game after 20 sec",
	"/lvrt pull <x> - Announces a pull in X sec (alias: /pull <x>)",
	"/lvrt enable <addon> <player> - Enables an AddOn for the specific player (player can be 'all')",
	"/lvrt disable <addon> <player> - Disables an AddOn for the specific player (player can be 'all')",
	"/lvrt announce <addon> <player> <on|off> - Disables/enables announce for an AddOn for the specific player (player can be 'all')",
	"/lvrt bosslist - shows a list of correct AddOn names",
	"/lvrt emote <emote> [target] - Forces a raid member to do an emote on 'target' (optional)",
	"/lvrt remote <option> <on|off> - Enables/Disables remote commands",
	"/lvrt ver - Checks for other versions of LV Raid Tools",
	" ",
	"感謝你使用 La Vendetta 團隊工具",
}

LVRT_CHAT_PREFIX		= "<LV_RaidTools> ";
LVRT_SENDLOGOUT			= "對 %s 發送登出命令";
LVRT_SENDLOGOUT_RAID_NOTICE	= LVRT_CHAT_PREFIX.."收到 %s 發出的登出命令 - 即將登出...";
LVRT_SENDLOGOUT_NEED_NAME	= "不正確的名稱或是不明問題, 無法發送登出命令";

LVRT_PULLCOMMAND_ANNOUNCE	= "*** Incoming Pull ***";
LVRT_PULLCOMMAND_SELFWARN	= "PULL NOW";
LVRT_PULLCOMMAND_PREWARN	= "*** %d 秒後拉怪 ***";
LVRT_PULLCOMMAND_FAILED		= "請使用 /pull 10 或是 /lvrt pull 10";

LVRT_VERSION_WHISPER		= "LV RaidTools v%s";
LVRT_VERSION_MESSAGE		= "檢查其他人的 LVBM RaidTools 版本";

LVRT_COMMAND_FAILD		= "Please check the '/lvrt help' command, your command is unknown";

LVRT_ENABLEADDON_MESSAGE	= "發送 '啟用' 插件命令給 '%s'";
LVRT_DISANABLEADDON_MESSAGE	= "發送 '停用' 插件命令給 '%s'";

LVRT_ANNOUNCEON_MESSAGE		= "發送 '開啟廣播' 插件命令給 '%s'";
LVRT_ANNOUNCEOFF_MESSAGE	= "發送 '關閉廣播' 插件命令給 '%s'";

LVRT_REMOTE_ON			= "Remote commands for '%s' enabled";
LVRT_REMOTE_OFF			= "Remote commands for '%s' disabled";
LVRT_REMOTE_INFO		= "Available Option: %s";

LVRT_EMOTE_MESSAGE		= "Sending raid emote '%s'";
LVRT_EMOTE_RECIVE		= "Recived emote command from '%s'";

LVRT_DURABILITY_MESSAGE		= "Sending Durability response for CT_RaidAssist";
LVRT_TOOLTIP_DURABILITY		= "^Durability (%d+) / (%d+)$";
-- LVRT_TOOLTIP_DURABILITY	= "^Haltbarkeit (%d+) / (%d+)$";
end


