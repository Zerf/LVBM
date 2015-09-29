--## Vendetta boss mod other ##
  -- ## Traduction fr by Elfik ##

if ( GetLocale() == "frFR" ) then
-- LVOnyxia
LVBM_ONYXIA_NAME			= "Onyxia";
LVBM_ONYXIA_INFO			= "Affiche les alertes des phases d'Onyxia et lorsqu'elle utilise son souffle en phase 2.";
LVBM_ONYXIA_BREATH_EMOTE 		= "prend une grande inspiration...";
LVBM_ONYXIA_BREATH_ANNOUNCE		= "*** ONYXIA VA SOUFFLER, ECARTEZ VOUS SUR LES COTES ***";
LVBM_ONYXIA_PHASE2_YELL			= "un seul coup !";
LVBM_ONYXIA_PHASE2_ANNOUNCE		= "*** ONYXIA RENTRE EN PHASE 2 ***";
LVBM_ONYXIA_PHASE3_YELL			= "Il semble que vous ayez besoin d'une autre le\195\167on, mortels !";
LVBM_ONYXIA_PHASE3_ANNOUNCE		= "*** ONYXIA RENTRE EN PHASE 3 ***";

-- LVLordKazzak
LVBM_KAZZAK_NAME			= "Seigneur Kazzak";
LVBM_KAZZAK_INFO			= "Announces Lord Kazzak's Supreme Mode and returns the time needed to kill him";
LVBM_KAZZAK_START_YELL			= "For the Legion! For Kil'Jaeden!";
LVBM_KAZZAK_NAME			= "Seigneur Kazzak";
LVBM_KAZZAK_BAR_TEXT			= "Supreme Mode";
LVBM_KAZZAK_DIES			= "Seigneur Kazzak meurt.";
LVBM_KAZZAK_ANNOUNCE_START		= "*** 3 min avant Supreme Mode ***";
LVBM_KAZZAK_ANNOUNCE_TIMENEEDED 	= "*** Killed Lord Kazzak in %d seconds ***";
LVBM_KAZZAK_ANNOUNCE_SEC		= "*** %d sec until Supreme Mode ***";

-- LVAzuregos
LVBM_AZUREGOS_NAME			= "Azuregos";
LVBM_AZUREGOS_INFO			= "Announces Azuregos' Teleport and Magic Shield abilities.";
LVBM_AZUREGOS_SHIELDUP_EXPR		= "^Azuregos gagne Renvoi.";
LVBM_AZUREGOS_SHIELDUP_ANNOUNCE		= "*** BOUCLIER ACTIF - PAS DE SORTS ***";
LVBM_AZUREGOS_SHIELDDOWN_EXPR 		= "^Renvoi sur Azuregos vient de se dissiper.";
LVBM_AZUREGOS_SHIELDDOWN_ANNOUNCE	= "*** BOUCLIER INACTIF ***";
LVBM_AZUREGOS_PORT_EXPR 		= "^Venez m'affronter, mes petits !";
LVBM_AZUREGOS_PORT_ANNOUNCE		= "*** TELEPORTATION ***";


--Outdoor Dragons
LVBM_OUTDOOR_NAME		= "Lethon, Taerar, Emeriss and Ysondre";
LVBM_OUTDOOR_DESCRIPTION	= "Affiche une alerte lorsque vous ou un joueur proche subit les effets de Infection volatile.";
LVBM_OUTDOOR_YSONDRE		= "Ysondre";
LVBM_OUTDOOR_EMERISS		= "Emeriss";
LVBM_OUTDOOR_TAERAR		= "Taerar";
LVBM_OUTDOOR_LETHON		= "Lethon";

LVBM_OUTDOOR_BREATH_NOW		= "*** Souffle naus\195\169abond - prochain 30 sec ***";
LVBM_OUTDOOR_BREATH_WARNING	= "*** Souffle naus\195\169abond in %s sec ***";
LVBM_OUTDOOR_INFECT_WARN	= "*** %s EST AFFLIGE PAR INFECTION VOLATILE ***";
LVBM_OUTDOOR_INFECT_SPECIAL	= "TU ES AFFLIGE PAR INFECTION VOLATILE !";

LVBM_OUTDOOR_NOX_BREATH		= "([^%s]+) (%w+) les effets de Souffle naus\195\169abond";
LVBM_OUTDOOR_NOX_RESIST		= "([^%s]+) Souffle naus\195\169abond est r\195\160sist\195\160 par ([^%s]+)";
LVBM_OUTDOOR_INFECTION		= "^([^%s]+) ([^%s]+) les effets de Infection volatile";

LVBM_OUTDOOR_LOCATION_1		= LVBM_DUSKWOOD;
LVBM_OUTDOOR_LOCATION_2		= LVBM_ASHENVALE;
LVBM_OUTDOOR_LOCATION_3		= LVBM_FERALAS;
LVBM_OUTDOOR_LOCATION_4		= LVBM_HINTERLANDS;


end

