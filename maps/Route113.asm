	object_const_def ; object_event constants
	const ROUTE113_YOUNGSTER3
	const ROUTE113_OFFICER
	const ROUTE113_POKEFAN_M
	const ROUTE113_POKE_BALL
	const ROUTE113_OFFICER2
	const ROUTE113_TREE

Route113_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTodd1AfterText
	waitbutton
	closetext
	end

SoldierGeraldScript:
	trainer SOLDIER, GERALD, EVENT_BEAT_SOLDIER_GERALD, SoldierGeraldSeenText, SoldierGeraldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierGeraldAfterText
	waitbutton
	closetext
	end

Route113Tree:
	fruittree FRUITTREE_GREAT_EAST_STRAIT_2


OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end



Route113JadeForestSign:
; unused
	jumptext Route113JadeForestSignText

Route113Sign:
	jumptext Route113SignText

Route113TrainerTips:
	jumptext Route113TrainerTipsText


Route113Nugget:
	itemball NUGGET

Route113HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_113_HIDDEN_RARE_CANDY

Route113HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_113_HIDDEN_SUPER_POTION


CamperTodd1SeenText:
	text "Credo nelle mie"
	line "capacità come"
	para "allenatore di"
	line "#MON."

	para "Vuoi vedere?"
	done

CamperTodd1BeatenText:
	text "Ho sbagliato"
	line "allenamento?"
	done

CamperTodd1AfterText:
	text "Forse dovrei"
	line "iniziare un alle-"
	cont "namento speciale."
	done



OfficerKeithSeenText:
	text "Chi va la?"
	line "Non sei un membro"
	para "del TEAM ROCKET,"
	line "vero?"
	done

OfficerKeithWinText:
	text "Sei un ragazzo"
	line "forte."
	done

OfficerKeithAfterText:
	text "Già, niente di"
	line "strano oggi."
	para "Abbiamo avuto"
	line "problemi con TEAM"
	para "ROCKET di recente,"
	line "ma sembra che se"
	cont "ne siano andati."
	done

OfficerKeithDaytimeText:
	text "Sto cercando"
	line "degli individui"
	cont "sospetti."
	done

PokefanmBrandonSeenText:
	text "Credo che un"
	line "giorno sarò"
	para "abbastanza forte"
	line "da conquistare"
	cont "la LEGA."
	done

PokefanmBrandonBeatenText:
	text "Perché è andata"
	line "così?"
	done

PokefanmBrandonAfterText:
	text "Credo di non"
	line "avere la giusta"
	para "motivazione per"
	line "conquistare la"
	cont "LEAGA."
	done


Route113JadeForestSignText:
; unused
	text "BOSCO GIADA"
	line "OLTRE IL PASSAGGIO"
	done

Route113SignText:
	text "PERCORSO 113"

	para "INERTOPOLI -"
	line "KANTO"
	done

Route113TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Le piante di"
	line "BACCHE fanno ogni"
	para "giorno nuovi"
	line "frutti."

	para "Ogni tipo di"
	line "pianta produce"
	cont "una diversa BACCA."
	done
	
SoldierGeraldSeenText:
	text "Fermati e lotta!"
	para "È un ordine!"
	done	
	
SoldierGeraldBeatenText:
	text "Liquidato!"
	done
	
SoldierGeraldAfterText:
	text "Una bella lotta"
	line "solleva gli"
	cont "spiriti!"
	done



Route113_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 48, ROUTE_113_ROUTE_114_GATE, 1
	warp_event  9, 48, ROUTE_113_ROUTE_114_GATE, 2


	db 0 ; coord events

	db 4 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route113Sign
	bg_event  9, 31, BGEVENT_READ, Route113TrainerTips
	bg_event  3, 39, BGEVENT_ITEM, Route113HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route113HiddenSuperPotion

	db 6 ; object events
	object_event 13, 22, SPRITE_BIRDON_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperTodd1, -1
	object_event  6,  6, SPRITE_OLD_FUCHSIA_GYM_1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 14, 47, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 19, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route113Nugget, EVENT_ROUTE_113_NUGGET
	object_event 17, 44, SPRITE_OLD_FUCHSIA_GYM_1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, SoldierGeraldScript, -1
	object_event 12, 13, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route113Tree, -1
