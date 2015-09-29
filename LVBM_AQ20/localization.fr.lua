--## Vendetta boss mod ruines d'ahnQiraj ##
  -- ## Traduction fr by Elfik ##

if ( GetLocale() == "frFR" ) then
-- 1. Kurinaxx
LVBM_KURINAXX_NAME	= "Kurinaxx";

-- 2. General Rajaxx
LVBM_RAJAXX_NAME		= "General Rajaxx";
LVBM_RAJAXX_INFO		= "Alertes des arriv\195\169es des vagues.";
LVBM_RAJAXX_WAVE1_EXPR		= "Ils arrivent. Essayez de ne pas vous faire tuer, bleusaille.";
LVBM_RAJAXX_WAVE3_EXPR		= "L'heure de notre vengeance sonne enfin !";
LVBM_RAJAXX_WAVE4_EXPR		= "C'en est fini d'attendre derri\195\168re des portes ferm\195\169es et des murs de pierre !";
LVBM_RAJAXX_WAVE5_EXPR		= "La peur est pour l'ennemi ! La peur et la mort !";
LVBM_RAJAXX_WAVE6_EXPR		= "Staghelm pleurnichera pour avoir la vie sauve, comme l'a fait son morveux de fils !";
LVBM_RAJAXX_WAVE7_EXPR		= "Fandral ! Ton heure est venue !";
LVBM_RAJAXX_WAVE8_EXPR		= "Imb\195\169cile imprudent !";
LVBM_RAJAXX_WAVE_ANNOUNCE 	= "*** ARRIV\195\137E DE LA VAGUE %d/8 ***";
LVBM_RAJAXX_WAVE_RAJAXX		= "*** ARRIV\195\137E DU G\195\137N\195\137RAL RAJAXX ***";
LVBM_RAJAXX_KILL_EXPR		= "^Tuez ([^%s]+) !$";
LVBM_RAJAXX_KILL_ANNOUNCE	= "*** SOIGNEZ %s ***";

-- 3. Moam
LVBM_MOAM_NAME			= "Moam"
LVBM_MOAM_INFO			= "Pr\195\169-alertes de la Forme de pierre";
LVBM_MOAM_COMBAT_START		= "%s sent votre peur.";
LVBM_MOAM_STONE_ANNOUNCE_TIME	= "** %s sec avant Forme de pierre **";
LVBM_MOAM_STONE_GAIN		= "%s absorbe votre mana et se change en pierre.";
LVBM_MOAM_STONE_ANNOUNCE_FADE	= "** %s sec avant Forme normale **";
LVBM_MOAM_STONE_FADE_EXPR	= "Dynamiser sur Moam vient de se dissiper.";
LVBM_MOAM_STONE_FADE_ANNOUNCE	= "*** FIN DE LA FORME DE PIERRE ***";

-- 4. Buru the Gorger
LVBM_BURU_NAME			= "Buru Grandgosier";
LVBM_BURU_INFO 			= "Affiche une alerte lorsque Buru pose ses yeux sur quelqu'un.";
LVBM_BURU_WHISPER_INFO		= "Envoie un message aux cibles";
LVBM_BURU_WHISPER_TEXT		= "You are being watched! Run!";
LVBM_BURU_SETICON_INFO		= "Mettre une icone";
LVBM_BURU_EYE_EXPR		= "pose ses yeux sur (.+) !";
LVBM_BURU_EYE_ANNOUNCE 		= "*** %s EST SURVEILL\195\137 ***";
LVBM_BURU_EYE_SELFWARNING	= "*** TU ES SURVEILL\195\137 ***";

-- 5. Ayamiss the Hunter
LVBM_AYAMISS_NAME		= "Ayamiss le Chasseur";
LVBM_AYAMISS_INFO 		= "Affiche une alerte lorsqu'une personne va \195\170tre sacrifi\195\169e.";
LVBM_AYAMISS_SACRIFICE_EXPR 	= "^([^%s]+) ([^%s]+) les effets de Paralysie%.$";
LVBM_AYAMISS_SACRIFICE_ANNOUNCE	= "*** %s EST SACRIFI\195\137 ***";

-- 6. Ossirian the Unscarred
LVBM_OSSIRIAN_NAME		= "Ossirian l'Intouch\195\137";
LVBM_OSSIRIAN_INFO		= "Affiche des alertes sur les caract\195\169ristiques d'Ossirian l'Intouch\195\169";
LVBM_OSSIRIAN_CURSE_INFO	= "Announce curse";
LVBM_OSSIRIAN_CURSE_EXPR 	= "([^%s]+) is afflicted by Curse of Tongues.";
LVBM_OSSIRIAN_CURSE_ANNOUNCE	= "** MALEDICTION - 25 sec avant prochaine **";
LVBM_OSSIRIAN_CURSE_PREANNOUNCE	= "** Mal\195\169diction dans moins de 5 sec **";
LVBM_OSSIRIAN_WEAK_ANNOUNCE	= "*** %s vulnerabilit\195\169 pour 45 sec ***";
LVBM_OSSIRIAN_WEAK_EXPR		= "^Ossirian l'Intouch\195\169 subit les effets de Sensibilit\195\169 .* l?'?(.+)%.$";
LVBM_OSSIRIAN_WEAK_RUNOUT	= "*** MODE SUPREME DANS %d SECONDES ***";
LVBM_OSSIRIAN_SUPREME_EXPR	= "Ossirian l'Intouch\195\169 gagne Force d'Ossirian.";
LVBM_OSSIRIAN_SUPREME_ANNOUNCE	= "*** OSSIRIAN EST EN MODE SUPREME ***";
LVBM_OSSIRIAN_DEATH_EXPR	= "J'ai... \195\169chou\195\169.";


-- Anubisath Guardians  (Ossirian)
LVBM_GUARDIAN_INFO 			= "Alerte des caract\195\169ristiques des Gardiens Anubisath";
LVBM_GUARDIAN_SUMMON_INFO		= "Affiche une alerte lorsque l'Anubisath invoque un add.";
LVBM_GUARDIAN_THUNDERCLAP_EXPR	 	= "^Gardien Anubisath lance Coup de tonnerre et vous inflige %d+ .";
LVBM_GUARDIAN_THUNDERCLAP_ANNOUNCE	= "*** COUP DE TONNERRE ***";
LVBM_GUARDIAN_EXPLODE_EXPR	 	= "Gardien Anubisath gagne Exploser.";
LVBM_GUARDIAN_EXPLODE_ANNOUNCE		= "*** EXPLOSION IMMINENTE ***";
LVBM_GUARDIAN_ENRAGE_EXPR		= "Gardien Anubisath gagne Enrager.";
LVBM_GUARDIAN_ENRAGE_ANNOUNCE		= "*** ENRAGER ***";

LVBM_GUARDIAN_PLAGUE_EXPR		= "^([^%s]+) ([^%s]+) les effets de Peste%.$";
LVBM_GUARDIAN_PLAGUE_ANNOUNCE		= "*** %s A LA PESTE ***";
LVBM_GUARDIAN_PLAGUE_WHISPER		= "TU AS LA PESTE !";

LVBM_GUARDIAN_SUMMONGUARD_EXPR 		= "Gardien Anubisath lance Invocation d'un Garde-essaim Anubisath.";
LVBM_GUARDIAN_SUMMONEDGUARD_ANNOUNCE	= "*** INVOCATION D'UN GARDE-ESSAIM ***";
LVBM_GUARDIAN_SUMMONWARRIOR_EXPR 	= "Gardien Anubisath lance Invocation d'un Guerrier Anubisath.";
LVBM_GUARDIAN_SUMMONEDWARRIOR_ANNOUNCE	= "*** INVOCATION D'UN GUERRIER ***";

end

