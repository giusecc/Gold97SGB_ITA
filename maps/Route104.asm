	object_const_def ; object_event constants
	const ROUTE104_LASS
	const ROUTE104_FRUIT_TREE
	const ROUTE104_GARDENER
	const ROUTE104_SUPER_NERD
	const ROUTE104_POKEFAN_M
	const ROUTE104_FIREBREATHER
	const ROUTE104_CAMPER
	const ROUTE104_TEACHER
	const ROUTE104_OFFICER
	const ROUTE104_TUSCANY
	const ROUTE104_ITEMBALL

Route104_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute104Gardener ; SCENE_DEFAULT
	scene_script .SceneRoute104Nothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany


.SceneRoute104Gardener
	end

.SceneRoute104Nothing
	end

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE104_TUSCANY
	return

.DoesTuscanyAppear:
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE104_TUSCANY
	return
	
GardenerStopsYou:
	jump Route104GardenerScript
	end

GardenerStopsYou2:
	jump Route104GardenerScript
	end

Route104GardenerScript:
	showemote EMOTE_SHOCK, ROUTE104_GARDENER, 15
	opentext
	writetext DontStepFlowers
	waitbutton
	closetext
	applymovement PLAYER, Movement_1LEFT
	end
	
Route104GardenerWateringScript:
	opentext
	writetext LaDiDa
	waitbutton
	closetext
	end
	
Route104LassScript:
	jumptextfaceplayer Route104LassText

Route104TeacherScript:
	jumptextfaceplayer Route104TeacherText


Route104Sign:
	jumptext Route104SignText
	
Route104SignActual:
	jumptext Route104SignActualText

Route104FruitTree:
	fruittree FRUITTREE_ROUTE_104
	
Movement_1LEFT:
	step LEFT
	step_end

TrainerSupernerdSam:
	trainer SUPER_NERD, SAM, EVENT_BEAT_SUPER_NERD_SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end


TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end


TrainerCamperElliot:
	trainer CAMPER, ELLIOT, EVENT_BEAT_CAMPER_ELLIOT, CamperElliotSeenText, CamperElliotBeatenText, 0, .Script
	
.Script:
	endifjustbattled
	opentext
	writetext CamperElliotAfterBattleText
	waitbutton
	closetext
	end

TrainerOfficerDirk:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_OFFICER_DIRK
	iftrue .AfterBattle
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerDirkSeenText
	waitbutton
	closetext
	winlosstext OfficerDirkBeatenText, 0
	loadtrainer OFFICER, DIRK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_DIRK
	closetext
	end

.AfterBattle:
	writetext OfficerDirkAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext OfficerDirkPrettyToughText
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end
	
Route104TMEndure:
	itemball TM_ENDURE


Route104LassText:
	text "Uff, uff…"

	para "È stata lunga"
	line "fino a qui."
	para "Ma c'è ancora"
	line "molta strada prima"
	cont "di DESMOPOLI."
	para "BOSCO GIADA è un"
	line "labirinto."
	para "Devo prepararmi."
	done

Route104TeacherText:
	text "C'è qualcosa che"
	line "non mi torna."
	para "Non riesco a"
	line "capire come"
	para "tornare indietro"
	line "verso AVIOPOLI."
	para "Non ci capisco"
	line "niente…"
	done

DontStepFlowers:
	text "Ehi!"
	para "Non stare lì!"
	para "Lavoro duramente"
	line "per curare il"
	para "mio giardino in"
	line "una zona così"
	cont "arida!"
	para "Non calpestare"
	line "i miei fiori!"
	done

LaDiDa:
	text "La-Di-Da!"
	para "Che bello"
	line "curare il mio"
	cont "giardino!"
	done


SupernerdSamSeenText:
	text "Collezioni #MON"
	line "rari?"
	done

SupernerdSamBeatenText:
	text "Oi!"
	done

SupernerdSamAfterBattleText:
	text "Io colleziono"
	line "#MON rari."
	para "O almeno,"
	line "vorrei farlo."
	done
	
HikerDanielSeenText:
	text "Mi sto preparando"
	line "per una scalata."
	para "Vediamo quanto"
	line "sono pronto!"
	done

HikerDanielBeatenText:
	text "Crampi ai piedi!"
	done

HikerDanielAfterBattleText:
	text "Sembra che io"
	line "non sia ancora"
	cont "pronto."
	done

FirebreatherBurtSeenText:
	text "Senti il calore?"
	done

FirebreatherBurtBeatenText:
	text "Oh, caldo!"
	done

FirebreatherBurtAfterBattleText:
	text "Questo PERCORSO è"
	line "troppo caldo!"
	done


CamperElliotSeenText:
	text "Andrò in"
	line "campeggio nel"
	cont "BOSCO!"
	done

CamperElliotBeatenText:
	text "Battuto!"
	done

CamperElliotAfterBattleText:
	text "Quest'area è"
	line "molto arida."
	para "Ma il BOSCO qui"
	line "vicino è molto"
	cont "meno secco."
	done
	

OfficerDirkSeenText:
	text "Il pericolo si"
	line "cela nella notte!"
	done

OfficerDirkBeatenText:
	text "Ops!"
	done

OfficerDirkAfterBattleText:
	text "Sai, anche la"
	line "notte può essere"
	cont "divertente."

	para "Ma non esagerare!"
	done

OfficerDirkPrettyToughText:
	text "I tuoi #MON"
	line "sono forti."

	para "Puoi andare in"
	line "giro senza"
	cont "problemi."
	done

Route104SignText:
	text "Casa di GOFFREDO"
	line "il Giardiniere"
	done
	
Route104SignActualText:
	text "PERCORSO 104"
	line "AVIOPOLI -"
	cont "DESMOPOLI"
	done
	

MeetTuscanyText:
	text "MARTA: Credo"
	line "proprio che sia la"

	para "prima volta che ci"
	line "incontriamo?"

	para "Permettimi di pre-"
	line "sentarmi, sono"

	para "MARTA del"
	line "martedì."
	done

TuscanyGivesGiftText:
	text "Accetta questo"
	line "FIOCCO ROSA in"

	para "ricordo di questo"
	line "incontro."
	done

TuscanyGaveGiftText:
	text "MARTA: Non lo"
	line "trovi davvero"
	cont "adorabile?"

	para "Potenzia le mosse"
	line "di tipo normale."

	para "Sono certa che ti"
	line "sarà utile."
	done

TuscanyTuesdayText:
	text "MARTA: Conosci"
	line "già mia sorella"
	cont "maggiore, LUANA?"

	para "E mio fratello mi-"
	line "nore, ERCOLE?"

	para "Io sono la seconda"
	line "di sette fratelli."
	done

TuscanyNotTuesdayText:
	text "MARTA: Oggi non"
	line "è martedì, vero?"
	cont "Che disdetta…"
	done

Route104_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 55,  7, ROUTE_104_GEOFFS_HOUSE, 1

	db 2 ; coord events
	coord_event 52, 12, SCENE_DEFAULT, GardenerStopsYou
	coord_event 52, 13, SCENE_DEFAULT, GardenerStopsYou2

	db 2 ; bg events
	bg_event 56,  8, BGEVENT_READ, Route104Sign
	bg_event  6,  8, BGEVENT_READ, Route104SignActual

	db 11 ; object events
	object_event 88,  7, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104LassScript, -1
	object_event 61,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104FruitTree, -1
	object_event 52, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route104GardenerWateringScript, EVENT_ROCKETS_IN_BOAT_AT_SUNPOINT
	object_event 59,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerSupernerdSam, -1
	object_event 12, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event 82, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
	object_event 45,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerCamperElliot, -1
	object_event 24, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route104TeacherScript, -1
	object_event 76, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerOfficerDirk, -1
	object_event 48,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_101_TUSCANY_OF_TUESDAY
	object_event 68,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route104TMEndure, EVENT_BURNED_TOWER_B1F_TM_ENDURE

