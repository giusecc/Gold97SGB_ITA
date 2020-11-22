	object_const_def ; object_event constants
	const PAGOTAGYM_FALKNER
	const PAGOTAGYM_YOUNGSTER1
	const PAGOTAGYM_YOUNGSTER2
	const PAGOTAGYM_GYM_GUY

PagotaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PagotaGymFalknerScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_FALKNER
	iftrue RematchScriptFalkner
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue PostRematchScriptFalkner
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall PagotaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
;	setmapscene ROUTE_102, SCENE_ROUTE102_SILVER; 
	clearevent EVENT_ROUTE_102_SILVER; 
;	setmapscene OAK_LAB_BACK_ROOM, SCENE_OAK2SLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end
	

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end
	
RematchScriptFalkner:
	opentext
	writetext FalknerRematchText
	waitbutton
	closetext
	winlosstext FalknerRematchWinText, 0
	loadtrainer FALKNER, FALKNER2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_FALKNER
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

PostRematchScriptFalkner:
	opentext
	writetext FalknerAfterRematchText
	waitbutton
	closetext
	end

FalknerRematchText:
	text "Ho saputo che hai"
	line "conquistato la"
	cont "LEGA #MON."
	para "Complimenti!"
	
	para "Mi sto allenando"
	line "molto qui nella"
	cont "PALESTRA."
	
	para "Vediamo se puoi"
	line "ancora battermi!"
	done

FalknerRematchWinText:
	text "Niente da fare,"
	line "hai vinto!"
	done

FalknerAfterRematchText:
	text "Sono contento"
	line "di essere stato"
	para "il tuo primo"
	line "passo per la"
	cont "gloria!"
	
	para "Continua così!"
	done



PagotaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .WestportRockets
	end

.WestportRockets:
	jumpstd WestportRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end


PagotaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PAGOTA_GYM_FALKNER
	iftrue .nothere
	checkevent EVENT_BEAT_FALKNER
	iftrue .PagotaGymGuyWinScript
	writetext PagotaGymGuyText
	waitbutton
	closetext
	end
	
.nothere
	writetext PagotaGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.PagotaGymGuyWinScript:
	writetext PagotaGymGuyWinText
	waitbutton
	closetext
	end

PagotaGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	trainertotext FALKNER, FALKNER1, MEM_BUFFER_1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "Lo sapevo che"
	line "saresti venuto"
	cont "qui presto!"
	
	para "È sempre bello"
	line "vedere un nuovo"
	para "allenatore!"

	para "Ma sei pronto a"
	line "sfidarmi?"

	para "Ti mostrerò la"
	line "bellezza dei miei"

	para "#MON uccello!"
	done

FalknerWinLossText:
	text "…No! Gli"
	line "amati #MON"
	cont "di mio padre…"

	para "E va bene. Devo"
	line "darti qualcosa!"

	para "Hai la MEDAGLIA"
	line "ZEFIRO della LEGA"
	cont "#MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA ZEFIRO."
	done

FalknerZephyrBadgeText:
	text "La MEDAGLIA ZEFIRO"
	line "migliora l'attacco"
	cont "dei #MON."

	para "Inoltre, permette"
	line "ai #MON che"

	para "hanno TAGLIO di"
	line "usarlo quando"
	cont "preferiscono."

	para "Puoi avere anche"
	line "questo: tieni!"
	done

FalknerTMMudSlapText:
	text "Se usi una MT, i"
	line "#MON potranno"

	para "subito imparare"
	line "una nuova mossa."

	para "Attenzione, però:"
	line "ogni MT si usa"
	cont "solo na volta!"

	para "La MT31 contiene"
	line "FANGOSBERLA."

	para "Danneggia il"
	line "nemico e ne"

	para "riduce la"
	line "precisione."

	para "Quindi è un'arma"
	line "sia offensiva che"
	cont "difensiva."
	done

FalknerFightDoneText:
	text "Incontrarai molte"
	line "PALESTRE #MON"
	cont "sulla tua strada."

	para "Metti alla prova"
	line "le tue capacità"
	cont "nelle PALESTRE."

	para "Io devo allenarmi"
	line "sodo per diventare"

	para "il più grande"
	line "allenatore di"
	cont "#MON uccello."
	done

BirdKeeperRodSeenText:
	text "Fegato è la parola"
	line "d'ordine!"

	para "Qui ci si allena"
	line "giorno e notte per"

	para "diventare maestri"
	line "di #MON"
	cont "uccello."

	para "Fatti sotto!"
	done

BirdKeeperRodBeatenText:
	text "Aaah!"
	done

BirdKeeperRodAfterBattleText:
	text "La qualità di"
	line "VALERIO non sono"
	cont "da sottovalutare."

	para "Non ti esaltare"
	line "troppo per aver"
	cont "battuto me!"
	done

BirdKeeperAbeSeenText:
	text "Vediamo se hai la"
	line "stoffa per sfidare"
	cont "VALERIO!"
	done

BirdKeeperAbeBeatenText:
	text "No, non ci posso"
	line "credere!"
	done

BirdKeeperAbeAfterBattleText:
	text "Perdere contro un"
	line "principiante è"
	cont "patetico…"
	done

PagotaGymGuyText:
	text "Ciao, io non sono"
	line "un allenatore, ma"
	cont "ho un consiglio."

	para "Però devi credere:"
	line "solo così il tuo"

	para "sogno di CAMPIONE"
	line "potrà avverarsi."

	para "Mi credi? Allora"
	line "ascolta qui:"

	para "il tipo erba è"
	line "debole contro il"

	para "tipo volante. Non"
	line "dimenticarlo!"
	done

PagotaGymGuyTextNotHere:
	text "Ehi! Sei qui"
	line "per sfidare"
	cont "VALERIO?"
	
	para "Odio dovertelo"
	line "dire, ma non"
	cont "è qui!"
	
	para "VALERIO è uscito"
	line "poco fa."
	
	para "Forse lo puoi"
	line "trovare in città."
	para "Non dev'essere"
	line "andato lontano."
	done

PagotaGymGuyWinText:
	text "Bene: continua"
	line "così e"

	para "sarai presto"
	line "CAMPIONE!"
	done

PagotaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 2
	warp_event  4, 15, PAGOTA_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 13, BGEVENT_READ, PagotaGymStatue
	bg_event  5, 13, BGEVENT_READ, PagotaGymStatue

	db 4 ; object events
	object_event  4,  4, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaGymFalknerScript, EVENT_PAGOTA_GYM_FALKNER
	object_event  7,  0, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  0,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  6, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaGymGuyScript, -1
