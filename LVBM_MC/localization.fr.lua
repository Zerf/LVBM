--## Vendetta boss mod molten core ##
  -- ## Traduction fr by Elfik ##

if ( GetLocale() == "frFR" ) then
-- 1. Lucifron
LVBM_LUCIFRON_NAME					= "Lucifron";
LVBM_LUCIFRON_INFO					= "Affiche les alertes des Mal\195\169dictions de Lucifron";
LVBM_LUCIFRON_CURSE_SOON_WARNING	= "*** MALEDICTION DE LUCIFRON dans %s sec ***";
LVBM_LUCIFRON_DOOM_SOON_WARNING		= "*** MALEDICTION IMMINENTE in %s sec ***";
LVBM_LUCIFRON_CURSE_WARNING			= "*** MALEDICTION DE LUCIFRON - 20 sec avant prochaine ***";
LVBM_LUCIFRON_DOOM_WARNING			= "*** MALEDICTION IMMINENTE - 20 sec avant prochaine ***";
LVBM_LUCIFRON_CURSE_REGEXP			= "(%w+) subit les effets de Mal\195\169diction de Lucifron.";
LVBM_LUCIFRON_DOOM_REGEXP			= "(%w+) subit les effets de Mal\195\169diction imminente.";

-- 2. Magmadar
LVBM_MAGMADAR_NAME				= "Magmadar";
LVBM_MAGMADAR_INFO				= "Affiche les alertes de la Fr\195\169n\195\169sie de Magmadar et des AE Fears.";
LVBM_MAGMADAR_ANNOUNCE_FRENZY	= "Alerte Fr\195\169n\195\169sie";
LVBM_MAGMADAR_FRENZY_WARNING	= "*** ALERTE FRENESIE - Tir tranquilisant ***";
LVBM_MAGMADAR_FEAR_WARNING1		= "*** FEAR - 30 sec avant prochain ***";
LVBM_MAGMADAR_FEAR_WARNING2		= "*** FEAR DANS 5 SECONDES ***";
LVBM_MAGMADAR_FRENZY 			= "%s entre dans une fr\195\169n\195\169sie sanglante !";
LVBM_MAGMADAR_FEAR				= "Panique.";

-- 3. Gehennas
LVBM_GEHENNAS_NAME				= "Gehennas";
LVBM_GEHENNAS_INFO				= "Affiche une alerte de la Mal\195\169diction Anti-Soins de Gehennas.";
LVBM_GEHENNAS_CURSE_SOON_WARN	= "*** MALEDICTION DE ZONE dans %s seconds ***";
LVBM_GEHENNAS_CURSE_WARNING		= "*** ALERTE MALEDICTION DE ZONE - 30 sec avant prochaine ***";	
LVBM_GEHENNAS_CURSE_REGEXP		= "(%w+) subit les effets de Mal\195\169diction de Gehennas.";

-- 4. Garr
LVBM_GARR_NAME	= "Garr";

-- 5. Geddon
LVBM_BARON_NAME				= "Baron Geddon";
LVBM_BARON_INFO 			= "Affiche une alerte lorsque vous ou un joueur proche devient la bombe.";
LVBM_BARON_SEND_WHISPER		= "Envoi un message priv\195\169 aux joueurs qui deviennent la bombe";
LVBM_BARON_SET_ICON			= "Mettre une icone";
LVBM_BARON_BOMB_WHISPER		= "TU ES LA BOMBE !";
LVBM_BARON_BOMB_WARNING    	= "*** %s EST LA BOMBE ***";
LVBM_BARON_INFERNO_WARNING	= "*** INFERNO - 25 sec avant prochain ***";
LVBM_BARON_BOMB_REGEXP	 	= "^([^%s]+) ([^%s]+) les effets de Bombe vivante.";
LVBM_BARON_INFERNO			= "Baron Geddon gagne Inferno.";

-- 6. Shazzrah
LVBM_SHAZZRAH_NAME					= "Shazzrah";
LVBM_SHAZZRAH_INFO					= "Affiche les alertes du Transfert et du buff Anti-Magie de Shazzrah.";
LVBM_SHAZZRAH_BLINK_WARN1			= "*** TRANSFERT - 30 sec avant prochain ***";
LVBM_SHAZZRAH_BLINK_WARN2			= "*** TRANSFERT DANS %s sec ***";
LVBM_SHAZZRAH_DEADEN_WARN			= "*** SHAZZRAH SE BUFF - DISSIPEZ LE ***";
LVBM_SHAZZRAH_CURSE_WARNING			= "*** buff - next in 20 sec ***";
LVBM_SHAZZRAH_CURSE_SOON_WARNING	= "*** buff dans %s sec ***";
LVBM_SHAZZRAH_BLINK		 			= "Porte de Shazzrah";
LVBM_SHAZZRAH_DEADEN_MAGIC			= "Shazzrah gagne Magie diminu\195\169e";
LVBM_SHAZZRAH_CURSE_REGEXP			= "(%w+) est afflig\195/160 par magie de shazzrah.";

-- 7. Sulfuron
LVBM_SULFURON_NAME	= "Sulfuron Harbinger";

-- 8. Golemagg
LVBM_GOLEMAGG_NAME	= "Golemagg the Incinerator";

-- 9. Majordomo
LVBM_DOMO_NAME				= "Chambellan Executus";
LVBM_DOMO_INFO 				= "Affiche les alertes du Bouclier de sorts et du Bouclier de d\195\169g\195\162ts p\195\169riodiques.";
LVBM_DOMO_SHIELD_WARNING1 	= "*** %s pour 10 sec ***";
LVBM_DOMO_SHIELD_WARNING2	= "*** %s dans %s sec ***";
LVBM_DOMO_SHIELD_FADED		= "*** %s faded ***";
LVBM_DOMO_DAMAGE_SHIELD		= "BOUCLIER DEGATS";
LVBM_DOMO_MAGIC_REFLECTION	= "BOUCLIER SORTS";
LVBM_DOMO_GAIN_MAGIC		= "gagne Renvoi de la magie";
LVBM_DOMO_GAIN_DAMAGE		= "gagne Bouclier de d\195\169g\195\162ts";
LVBM_DOMO_FADE_MAGIC 		= "Renvoi de la magie sur .+ Attise%-flammes vient de se dissiper";
LVBM_DOMO_FADE_DAMAGE	 	= "Bouclier de d\195\169g\195\162ts sur .+ Attise%-flammes vient de se dissiper";

-- 10. Ragnaros
LVBM_RAGNAROS_NAME			= "Ragnaros";
LVBM_RAGNAROS_INFO			= "Affiche les alertes du Knockback de Ragnaros et de l'arriv\195\169e des Fils des Flammes.";
LVBM_RAGNAROS_EMERGED		= "*** 3 min avant l'arriv\195\169e des Fils des flammes ***";
LVBM_RAGNAROS_SUBMERGE_WARN	= "*** Arriv\195\160 de ragnaros dans %s %s ***";
LVBM_RAGNAROS_SUBMERGED		= "*** Ragnaros dispara\195\174t pour 90 sec. Arriv\195\169e des Fils des flammes ***";
LVBM_RAGNAROS_EMERGE_WARN	= "*** Disparition dans %s %s ***";
LVBM_RAGNAROS_WRATH_WARN1	= "*** AE KNOCKBACK - prochain dans 30 sec ***";
LVBM_RAGNAROS_WRATH_WARN2	= "*** AE KNOCKBACK dans %s sec ***";
LVBM_RAGNAROS_HITS			= "Ragnaros ([hitscr]+) ([^%s]+) for (%d+)";
LVBM_RAGNAROS_WRATH	 		= "^GO\195\155TEZ ";
LVBM_RAGNAROS_SUBMERGE 		= "^VENEZ, MES SERVITEURS";

end
