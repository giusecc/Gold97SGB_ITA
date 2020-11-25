	object_const_def ; object_event constants
	const WESTPORTGYM_BUGSY
	const WESTPORTGYM_BUG_CATCHER1
	const WESTPORTGYM_BUG_CATCHER2
	const WESTPORTGYM_BUG_CATCHER3
	const WESTPORTGYM_TWIN1
	const WESTPORTGYM_TWIN2
	const WESTPORTGYM_GYM_GUY

WestportGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportGymBugsyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_BUGSY
	iftrue RematchScriptBugsy
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptBugsy
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkcode VAR_BADGES
	scall WestportGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	setevent EVENT_TEKNOS_CITY_GRAMPS
	setevent EVENT_BIRDON_GYM_GRAMPS
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_BOULDER_MINE_WHITNEY
	setevent EVENT_WHITNEY_BACK_IN_TEKNOS_GYM
	clearevent EVENT_ROCKETS_TAKE_OVER_AQUARIUM
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end
	
RematchScriptBugsy:
	opentext
	writetext BugsyRematchText
	waitbutton
	closetext
	winlosstext BugsyRematchWinText, 0
	loadtrainer BUGSY, BUGSY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_BUGSY
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptBugsy:
	opentext
	writetext BugsyAfterRematchText
	waitbutton
	closetext
	end

BugsyRematchText:
	text "Ho continuato"
	line "i miei studi"
	para "sui #MON"
	line "COLEOTTERO."
	
	para "Lasciami mostrare"
	line "i frutti del mio"
	cont "lavoro!"
	done

BugsyRematchWinText:
	text "Fantastico!"
	
	para "Ho ancora molto"
	line "da imparare!"
	done

BugsyAfterRematchText:
	text "CAMPIONE, eh?"
	
	para "Quindi sei un"
	line "esperti di"
	para "tutti i tipi"
	line "di #MON!"
	
	para "Io continuerò"
	line "a specializzarmi"
	para "nei #MON"
	line "COLEOTTERO."
	
	para "C'è molto da"
	line "imparare su"
	para "ogni tipo di"
	line "#MON!"
	done


WestportGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

WestportGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .WestportGymGuyWinScript
	opentext
	writetext WestportGymGuyText
	waitbutton
	closetext
	end

.WestportGymGuyWinScript:
	opentext
	writetext WestportGymGuyWinText
	waitbutton
	closetext
	end

WestportGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext BUGSY, BUGSY1, MEM_BUFFER_1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "Sono RAFFAELLO!"
	para "Ho dedicato la"
	line "mia vita allo"
	para "studio dei #-"
	line "MON COLEOTTERO!"
	para "La mia famiglia"
	line "è disgustata"
	para "dagli insetti,"
	line "ma non io!"
	para "I #MON COLEOT-"
	line "TERO sono"
	para "affascinanti e"
	line "crescono in"
	cont "fretta!"
	para "Ecco, lasciami"
	line "mostrare cosa"
	cont "ho imparato!"
	done

BugsyText_ResearchIncomplete:
	text "Fantastico!"
	line "Sei un esperto"
	cont "di #MON!"

	para "La mia ricerca"
	line "non è completa."

	para "Ok, hai vinto!"
	line "Ecco la MEDAGLIA."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA ALVEARE."
	done

BugsyText_HiveBadgeSpeech:
	text "Conosci i benefici"
	line "della MEDAGLIA"
	cont "ALVEARE?"

	para "I #MON ti"
	line "obbediranno fino"

	para "al livello 30,"
	line "anche quelli"
	cont "scambiati."

	para "#MON che"
	line "conoscono FORZA"

	para "possono usarla"
	line "al di fuori"
	cont "della lotta."

	para "Ecco, tieni anche"
	line "questa."
	done

BugsyText_FuryCutterSpeech:
	text "La MT49 contiene"
	line "TAGLIOFURIA."

	para "Se non fallisce,"
	line "diventa più forte"
	cont "a ogni turno."

	para "Più la battaglia"
	line "è lunga, più"
	cont "diventa forte."

	para "Non è fantastico?"
	line "L'ho scoperta io!"
	done

BugsyText_BugMonsAreDeep:
	text "I #MON COLEOT-"
	line "TERO sono"
	cont "incredibili."

	para "Hanno un sacco di"
	line "misteri da"
	cont "esplorare."

	para "Studia i tuoi"
	line "preferiti."
	done

BugCatcherBennySeenText:
	text "I #MON COLEOT-"
	line "TERO si evolvono"
	cont "velocemente."
	done

BugCatcherBennyBeatenText:
	text "L'evoluzione"
	line "non è abbastanza!"
	done

BugCatcherBennyAfterBattleText:
	text "I #MON diven-"
	line "tano più forti"
	cont "con l'evoluzione!"
	done

BugCatcherAlSeenText:
	text "I #MON COLEOT-"
	line "TERO sono"
	cont "stupendi!"

	para "Te lo dimostrerò!"
	done

BugCatcherAlBeatenText:
	text "Hai mostrato"
	line "quanto sei forte…"
	done

BugCatcherAlAfterBattleText:
	text "Sono stupendi,"
	line "ma a molte"

	para "ragazze non"
	line "piacciono."

	para "Non capisco"
	line "il perché…"
	done

BugCatcherJoshSeenText:
	text "I #MON COLEOT-"
	line "TERO si rafforzano"
	cont "velocemente!"
	para "Vuoi vedere?"
	done

BugCatcherJoshBeatenText:
	text "Uuaaah!"
	done

BugCatcherJoshAfterBattleText:
	text "Dovrei insegnare"
	line "mosse migliori…"
	done

TwinsAmyandmay1SeenText:
	text "AMI: Vuoi sfidare"
	line "il CAPOPALESTRA?"
	cont "Non si passa!"
	done

TwinsAmyandmay1BeatenText:
	text "AMI&MIMI: Che"
	line "doppia disdetta!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMI: Sei davvero"
	line "forte!"
	done

TwinsAmyandmay2SeenText:
	text "MIMI: Vai dal"
	line "CAPOPALESTRA? Ci"
	cont "siamo prima noi!"
	done

TwinsAmyandmay2BeatenText:
	text "AMI&MIMI: Che"
	line "doppia disdetta!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MIMI: I nostri"
	line "#MON COLEOTTERO"
	para "hanno perso: che"
	line "vergogna!"
	done

WestportGymGuyText:
	text "Ehi sfidante!!"

	para "RAFFAELLO è"
	line "giovane ha già"

	para "esperienza con i"
	line "#MON"
	cont "COLEOTTERO."

	para "Sarà dura se non"
	line "segui i miei"
	cont "consigli."

	para "Vediamo… I"
	line "#MON COLEOTTERO"
	cont "odiano il fuoco."

	para "Anche le mosse di"
	line "tipo volante sono"
	cont "molto efficaci."
	done

WestportGymGuyWinText:
	text "Ben fatto! Una"
	line "grande lotta tra"

	para "giovani allenatori"
	line "di talento."

	para "Con gente come te"
	line "i #MON avranno"
	cont "un grande futuro!"
	done

WestportGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, WESTPORT_CITY, 1
	warp_event  5, 15, WESTPORT_CITY, 12

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, WestportGymStatue
	bg_event  6, 13, BGEVENT_READ, WestportGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportGymBugsyScript, -1
	object_event  6,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportGymGuyScript, -1
