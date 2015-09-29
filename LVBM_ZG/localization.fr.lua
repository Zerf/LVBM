--## Vendetta boss mod zul'gurub ##
  -- ## Traduction fr by Elfik ##

if ( GetLocale() == "frFR" ) then

-- High Priestess Jeklik
LVBM_JEKLIK_NAME		= "Grande pr\195\170tresse Jeklik";
LVBM_JEKLIK_INFO		= "Affiche une alerte lorsque Grande Pr\195\170tresse Jeklik se soigne et appelle les chauves-souris.";
LVBM_JEKLIK_BOMBBATS_EXPR	= "Qu'une pluie de feu s'abatte sur les envahisseurs !";
LVBM_JEKLIK_BOMBBATS_ANNOUNCE	= "*** CHAUVES-SOURIS EN APPROCHE ***";
LVBM_JEKLIK_CASTHEAL_EXPR	= "%s commence \195\160 lancer un sort de Soins exceptionnels !";
LVBM_JEKLIK_CASTHEAL_ANNOUNCE	= "*** COMMENCE A SE SOIGNER ***";
LVBM_JEKLIK_BATS_EXPR		= "%s \195\160met un cri perçant assourdissant!";
LVBM_JEKLIK_BATS_ANNOUNCE	= "*** COMMENCE A SE SOIGNER ***";

-- High Priest Venoxis
LVBM_VENOXIS_NAME		= "Grand%-pr\195\170tre Venoxis";
LVBM_VENOXIS_INFO		= "Affiche une alerte lorsque Grande Pr\195\170tresse Venoxis se lance R\195\169novation.";
LVBM_VENOXIS_RENEW_EXPR		= "Grand%-pr\195\170tre Venoxis gagne R\195\169novation.";
LVBM_VENOXIS_RENEW_ANNOUNCE	= "*** RENOVATION - DISSIPEZ LE ***";
LVBM_VENOXIS_TRANSFORM_EXPR	= "Que se d\165\160roulent les anneaux de la haine!";
LVBM_VENOXIS_TRANSFORM_ANNOUNCE = "*** Phase 2 - Attention au poisson ***";

-- High Priestess Mar'li
LVBM_MARLI_NAME			= "Grande pr\195\170tresse Mar'li";
LVBM_MARLI_INFO			= "Affiche une alerte lorsque Grande Pr\195\170tresse Mar'li appelle les araign\195\169es.";
LVBM_MARLI_SPIDER_EXPR		= "., mes enfants !$";
LVBM_MARLI_SPIDER_ANNOUNCE	= "*** ARAIGNEES EN APPROCHE ***";

-- Bloodlord Mandokir
LVBM_MANDOKIR_INFO		= "Affiche une alerte lorsque vous ou un joueur proche est surveill\195\169.";
LVBM_MANDOKIR_WATCH_EXPR	= "([^%s]+), je vous ai \195\160 l'\197\147il";
LVBM_MANDOKIR_WATCH_ANNOUNCE	= "*** %s EST SURVEILLE ***";
LVBM_MANDOKIR_SETICON_INFO	= "Mettre une icone";
LVBM_MANDOKIR_WHISPER_INFO	= "Envoie un messsage priv\195\169 aux joueurs qui sont surveill\195\169s";
LVBM_MANDOKIR_WHISPER_TEXT	= "TU ES SURVEILLE !";
LVBM_MANDOKIR_SELFWARN		= "TU ES SURVEILLE !";

-- Thekal - eg heal ability
LVBM_THEKAL_NAME	= "Grand pr\195\170tre Thekal";

-- High Priestess Arlokk
LVBM_ARLOKK_NAME		= "Grande pr\195\170tresse Arlokk";
LVBM_ARLOKK_INFO		= "Affiche une alerte lorsque Grande Pr\195\170tresse Arlokk choisi une cible pour ses panth\195\169res.";
LVBM_ARLOKK_MARK_EXPR		= "D\195\169vorez ([^%s]+), mes jolies !";
LVBM_ARLOKK_MARK_ANNOUNCE	= "*** %s EST MARQUE - heal ! ***";
LVBM_ARLOKK_MARK_WHISPER	= "TU ES MARQUE !";
LVBM_ARLOKK_WHISPER_INFO	= "Envoie des messages priv\195\169s aux cibles";

-- Hakkar
LVBM_HAKKAR_NAME		= "Hakkar";
LVBM_HAKKAR_INFO		= "Affiche une alerte lorsque Hakkar utilise son drain de vie.";
LVBM_HAKKAR_SUFFERLIFE_EXPR	= "^Siphon de sang .+ (.+) inflige \195\160 Hakkar (.+).";
LVBM_HAKKAR_SUFFERLIFE_ANNOUNCE	= "*** %d sec avant drain de vie ***";
LVBM_HAKKAR_SUFFERLIFE_NOW	= "*** DRAIN DE VIE - 90 sec avant prochain ***";
LVBM_HAKKAR_COMBAT_START_YELL	= "ANNONCE LA FIN DE VOTRE MONDE";

-- Jin'do the Hexxer
LVBM_JINDO_NAME				= "Jin'do le Mal\195\160ficieur";
LVBM_JINDO_INFO				= "Affiche une alerte des afflictions de Illusions de Jin'do.";
LVBM_JINDO_CURSE_INFO			= "Annonce curse";
LVBM_JINDO_HEAL_TOTEM_INFO		= "Annonce totems de heal";
LVBM_JINDO_MC_TOTEM_INFO		= "Announce totems de control mental";
LVBM_JINDO_CURSE_EXPR			= "^([^%s]+) ([^%s]+) les effets de Illusions de Jin'do";
LVBM_JINDO_CURSE_SELF_ANNOUNCE		= "TU ES MAUDIT !";
LVBM_JINDO_CURSE_ANNOUNCE		= "*** %s EST MAUDIT - NE PAS LE DECURSE ***";
LVBM_JINDO_HEAL_TOTEM_WARNING		= "*** Totem de heal ! ***";
LVBM_JINDO_MC_TOTEM_WARNING		= "*** Totem de controle mental ! ***";
LVBM_JINDO_WHISPER_INFO			= "Envoie des messages priv\195\169s aux cibles";
LVBM_JINDO_WHISPER_TEXT			= "TU ES MAUDIT !";
LVBM_JINDO_HEAL_TOTEM			= "Jin'do le Mal\195\160ficieur lance ";
LVBM_JINDO_MIND_CONTROL_TOTEM		= "Jin'do le Mal\195\160ficieur lance Totem ";

end

