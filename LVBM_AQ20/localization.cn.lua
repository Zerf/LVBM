-- -------------------------------------------- --
-- La Vendetta Boss Mods - Chinese localization --
--       by Diablohu<白银之手>@轻风之语         --
--          http://www.dreamgen.net             --
--                11/18/2006                    --
-- -------------------------------------------- --

if (GetLocale() == "zhCN") then


-- 1. Kurinaxx
	LVBM_KURINAXX_NAME	= "库林纳克斯";


-- 2. General Rajaxx
	LVBM_RAJAXX_NAME			= "拉贾克斯将军";
	LVBM_RAJAXX_INFO			= "警报敌人数量";
	LVBM_RAJAXX_WAVE1_EXPR		= "它们来了。尽量别被它们干掉，新兵。";
	LVBM_RAJAXX_WAVE3_EXPR		= "我们复仇的时刻到了！让敌人的内心被黑暗吞噬吧！";
	LVBM_RAJAXX_WAVE4_EXPR		= "我们不用再呆在这座石墙里面了！我们很快就能报仇了！在我们的怒火面前，就连那些龙也会战栗！";
	LVBM_RAJAXX_WAVE5_EXPR		= "让敌人胆战心惊吧！让他们在恐惧中死去！";
	LVBM_RAJAXX_WAVE6_EXPR		= "鹿盔将会呜咽着哀求我饶他一命，就像他那懦弱的儿子一样！一千年来的屈辱会在今天洗清！";
	LVBM_RAJAXX_WAVE7_EXPR		= "范达尔！你的死期到了！藏到翡翠梦境里去吧，祈祷我们永远都找不到你！";
	LVBM_RAJAXX_WAVE8_EXPR		= "无礼的蠢货！我会亲自要了你们的命！";
	LVBM_RAJAXX_WAVE_ANNOUNCE 	= "*** 第%d/8波敌人到来 ***";
	LVBM_RAJAXX_WAVE_RAJAXX		= "*** 拉贾克斯将军上阵 ***";
	LVBM_RAJAXX_KILL_EXPR		= "杀了([^%s]+)！";
	LVBM_RAJAXX_KILL_ANNOUNCE	= "*** %s需要治疗 ***";


-- 3. Moam
	LVBM_MOAM_NAME					= "莫阿姆"
	LVBM_MOAM_INFO					= "警报石化形态";
	LVBM_MOAM_COMBAT_START			= "%s感觉到了你的恐惧。";
	LVBM_MOAM_STONE_ANNOUNCE_TIME	= "*** %d秒后变成石化形态 ***";
	LVBM_MOAM_STONE_GAIN			= "%s吸取了你的魔法能量，并变成了石头。";
	LVBM_MOAM_STONE_ANNOUNCE_FADE	= "*** %d秒后石化形态消失 ***";
	LVBM_MOAM_STONE_FADE_EXPR		= "充能效果从莫阿姆身上消失。";
	LVBM_MOAM_STONE_FADE_ANNOUNCE	= "*** 石化形态消失 ***";
	
	LVBM_SBT["Stone form"]			= "石化形态";


-- 4. Buru the Gorger
	LVBM_BURU_NAME				= "吞咽者布鲁";
	LVBM_BURU_INFO 				= "警报凝视";
	LVBM_BURU_WHISPER_INFO		= "密语玩家";
	LVBM_BURU_WHISPER_TEXT		= "你被凝视了！快跑！";
	LVBM_BURU_SETICON_INFO		= "添加标注";
	LVBM_BURU_EYE_EXPR			= "凝视着([^%s]+)！";
	LVBM_BURU_EYE_ANNOUNCE 		= "*** %s被凝视了 ***";
	LVBM_BURU_EYE_SELFWARNING	= "你被凝视了！";


-- 5. Ayamiss the Hunter
	LVBM_AYAMISS_NAME				= "狩猎者阿亚米斯";
	LVBM_AYAMISS_INFO 				= "警报祭品";
	LVBM_AYAMISS_SACRIFICE_EXPR 	= "([^%s]+)受([^%s]+)麻痹效果的影响。";
	LVBM_AYAMISS_SACRIFICE_ANNOUNCE	= "*** %s成为了祭品 ***";


-- Anubisath Guardians  (奥斯里安)
	LVBM_GUARDIAN_NAME 						= "阿努比萨斯守卫";
	LVBM_GUARDIAN_INFO 						= "警报各种技能";
	LVBM_GUARDIAN_SUMMON_INFO				= "警报召唤技能 (战士/虫群卫士)";
	LVBM_GUARDIAN_THUNDERCLAP_EXPR	 		= "阿努比萨斯守卫者的雷霆一击击中([^%s]+)造成";
	LVBM_GUARDIAN_THUNDERCLAP_ANNOUNCE		= "*** 雷霆一击 ***";
	LVBM_GUARDIAN_EXPLODE_EXPR	 			= "阿努比萨斯守卫者获得了爆炸的效果。";
	LVBM_GUARDIAN_EXPLODE_ANNOUNCE			= "*** 爆炸 ***";
	LVBM_GUARDIAN_ENRAGE_EXPR				= "阿努比萨斯守卫者获得了狂怒的效果。";
	LVBM_GUARDIAN_ENRAGE_ANNOUNCE			= "*** 狂怒 ***";

	LVBM_GUARDIAN_PLAGUE_EXPR				= "([^%s]+)受([^%s]+)瘟疫效果的影响。";
	LVBM_GUARDIAN_PLAGUE_ANNOUNCE			= "*** %s中了瘟疫 ***";
	LVBM_GUARDIAN_PLAGUE_WHISPER			= "你中了瘟疫！离开人群！";

	LVBM_GUARDIAN_SUMMONGUARD_EXPR 			= "阿努比萨斯守卫者施放了召唤阿努比萨斯虫群卫士。";
	LVBM_GUARDIAN_SUMMONEDGUARD_ANNOUNCE	= "*** 虫群卫士出现 ***";
	LVBM_GUARDIAN_SUMMONWARRIOR_EXPR 		= "阿努比萨斯守卫者施放了召唤阿努比萨斯战士。";
	LVBM_GUARDIAN_SUMMONEDWARRIOR_ANNOUNCE	= "*** 战士出现 ***";


-- 6. Ossirian the Unscarred
	LVBM_OSSIRIAN_NAME				= "无疤者奥斯里安";
	LVBM_OSSIRIAN_INFO				= "警报抗性弱点和上帝模式";
	LVBM_OSSIRIAN_CURSE_INFO		= "警报语言诅咒";
	LVBM_OSSIRIAN_CURSE_EXPR 		= "([^%s]+)受到了语言诅咒效果的影响。";
	LVBM_OSSIRIAN_CURSE_ANNOUNCE	= "*** 语言诅咒 - 25秒后再次施放 ***";
	LVBM_OSSIRIAN_CURSE_PREANNOUNCE	= "*** 语言诅咒 - 5秒后施放 ***";
	LVBM_OSSIRIAN_WEAK_ANNOUNCE		= "*** 新的弱点：%s - 持续45秒 ***";
	LVBM_OSSIRIAN_WEAK_EXPR			= "无疤者奥斯里安受到了([^%s]+)虚弱效果的影响。";
	LVBM_OSSIRIAN_WEAK_RUNOUT		= "*** %d秒后上帝模式 ***";
	LVBM_OSSIRIAN_SUPREME_EXPR		= "无疤者奥斯里安获得了奥斯里安之力的效果。";
	LVBM_OSSIRIAN_SUPREME_ANNOUNCE	= "*** 上帝模式 ***";
	LVBM_OSSIRIAN_DEATH_EXPR		= "我……败……了。";

	LVBM_SBT["Ossirians Curse"]		= "语言诅咒";
	
	LVBM_SBT["Ossirian"] = {
		[1]	= {" vulnerability","虚弱"};
	};

end