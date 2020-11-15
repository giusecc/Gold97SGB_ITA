	object_const_def ; object_event constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_YOUNGSTER
;	const BOARDWALK_INSTRUCTOR

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
	
TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_BRENT_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	promptbutton
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_STAND
	iftrue .LoadFight1
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BRENT_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end



	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end



BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkFruitTree:
	fruittree FRUITTREE_BOARDWALK


FledglingHidalgoSeenText:
	text "Posso lottare"
	line "con te?"
	done
	
FledglingHidalgoBeatenText:
	text "È stata dura!"
	done
	
FledglingHidalgoAfterBattleText:
	text "Lavorerò duramente"
	line "per continuare a"
	cont "migliorarmi!"
	done
	

PokemaniacBrentSeenText:
	text "Ehi! Hai qualche"
	line "#MON raro?"
	done

PokemaniacBrentBeatenText:
	text "Oh, i miei #-"
	line "MON!"
	done

PokemaniacBrentAfterBattleText:
	text "Vorrei avere un"
	line "solo #MON"
	cont "raro."
	done

PokemaniacRonSeenText:
	text "Vuoi sapere"
	line "l'ultima?"

	para "Un certo <RIVAL>"
	line "mi ha battuto!"

	para "Ma i miei #-"
	line "MON sono forti!"
	
	para "Certamente vincerò"
	line "contro di te!"
	done

PokemaniacRonBeatenText:
	text "La mia squadra ha"
	line "dato il massimo!"
	done

PokemaniacRonAfterBattleText:
	text "È bello che gli"
	line "allenatori usino"

	para "diversi tipi di"
	line "#MON."

	para "Non serve per"
	line "forza avere sempre"
	cont "quello più forte."
	done

FisherMarvinSeenText:
	text "Non sono in forma."

	para "Dipenderà dall'"
	line "equipaggiamento."

	para "Lottiamo, vediamo"
	line "se mi riprendo!"
	done

FisherMarvinBeatenText:
	text "Ho perso, ma mi"
	line "sento meglio."
	done

FisherMarvinAfterBattleText:
	text "L'ESCA BALL"
	line "di FRANZ è il mas-"

	para "simo per catturare"
	line "i #MON d'acqua."

	para "È molto più"
	line "efficace di una"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "Posso fare così"
	line "tanto con i #-"
	para "MON! Mi diverto un"
	line "sacco!"
	done

CamperSpencerBeatenText:
	text "Perdere non è"
	line "divertente…"
	done

CamperSpencerAfterBattleText:
	text "Sei stato al"
	line "BOSCO GIADA?"

	para "Volevamo"
	line "accamparci lì."
	done

PicnickerTiffanySeenText:
	text "Stai andando al"
	line "CASINÒ?"

	para "Giochiamo un po'"
	line "insieme!"
	done

PicnickerTiffanyBeatenText:
	text "Ho giocato troppo!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Faccio un pic-nic"
	line "con i #MON."

	para "Sei dei nostri?"
	done

PicnickerTiffanyClefairyText:
	text "Il mio CLEFAIRY"
	line "è così adorabile,"
	cont "non è vero?"
	done

BoardwalkSign1Text:
	text "PONTILE"

	para "VESTIGIA -"
	line "TECNOPOLI"
	done

BoardwalkSign2Text:
	text "CASINÒ del"
	line "PONTILE"
	para "Entra e"
	line "divertiti!"
	done

BoardwalkTrainerTipsText:
	text "CONSIGLI UTILI"

	para "Tutti i #MON"
	line "hanno qualità e"

	para "punti deboli,"
	line "dipende dal tipo."

	para "Anche un #MON"
	line "di livello supe-"

	para "riore può perdere,"
	line "secondo il tipo."

	para "Scopri contro"
	line "quali tipi i tuoi"

	para "#MON sono"
	line "più forti."
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  5, BOARDWALK_GATE, 3
	warp_event 14,  2, BOARDWALK_GATE, 1
	warp_event 15,  2, BOARDWALK_GATE, 2
	warp_event 15,  5, BOARDWALK_GATE, 4
	warp_event 10, 21, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 21, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11,  8, BGEVENT_READ, BoardwalkSign1
	bg_event  9, 22, BGEVENT_READ, BoardwalkSign2
	bg_event 13, 38, BGEVENT_READ, BoardwalkTrainerTips

	db 5 ; object events
	object_event 17, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerFledglingHidalgo, -1
	object_event  7, 35, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event  8,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  2, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
;	object_event 14, 21, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerInstructorCliff, -1
