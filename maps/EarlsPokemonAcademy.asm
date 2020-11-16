	object_const_def ; object_event constants
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
;	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	jump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	jump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	jump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	jump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	jump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "VLN@"
	db "PAR@"
	db "DRM@"
	db "BRU@"
	db "CON@"
	db "ESCI@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Ciao!"

	para "Benvenuto alla"
	line "scuola per "
	para "allenatori di"
	line "ANCESTRALIA."
	
	para "Vuoi imparare come"
	line "funzionano le"
	cont "lotte?"
	done

AcademyEarlTeachHowToWinText:
	text "In una lotta, il"
	line "primo #MON"
	para "della squadra è"
	line "mandato in campo!"

	para "Bisogna pensare"
	line "con attenzione a"
	para "quale #MON"
	line "mettere in cima"
	cont "alla squadra."

	para "Vuoi sapere altro?"
	done

AcademyEarlTeachMoreText:
	text "Vuoi imparare come"
	line "allenare al meglio"
	cont "i #MON?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Se un #MON"
	line "entra in una lotta"

	para "anche per poco,"
	line "riceve punti ESP."

	para "Puoi mandare un"
	line "#MON debole"
	para "in battaglia e"
	line "scambiarlo subito"
	para "con uno più forte."
	line "In questo modo,"
	para "entrambi otterran-"
	line "no punti ESP."
	done

AcademyEarlNoMoreToTeachText:
	text "Ormai sei un"
	line "esperto di"
	cont "#MON!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Sto prendendo"
	line "appunti della"
	cont "lezione."

	para "Farei bene a"
	line "copiare anche la"
	cont "lavagna."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Ho scambiato il"
	line "mio #MON più"
	para "forte al ragazzo"
	line "vicino a me."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Un #MON otte-"
	line "nuto tramite"
	para "scambio cresce"
	line "più velocemente."

	para "Ma se non hai la"
	line "MEDAGLIA giusta,"

	para "potrebbe non"
	line "obbedire."
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #MON che"
	line "tiene una BACCA"
	para "può curarsi"
	line "durante la lotta."

	para "Possono tenere"
	line "molti altri"
	cont "strumenti…"

	para "È dura prendere"
	line "appunti…"
	done

AcademyBlackboardText:
	text "Sulla lavagna sono"
	line "descritte le modi-"

	para "fiche di stato dei"
	line "#MON durante"
	cont "la lotta."
	done

AcademyBlackboardText2:
; unused
	text "Che argomento vuoi"
	line "leggere?"
	done

AcademyPoisonText:
	text "Un #MON perde"
	line "costantemente"
	cont "PS."

	para "Il veleno agisce"
	line "anche dopo la"

	para "lotta, continuando"
	line "a far perdere PS."

	para "Contro il veleno"
	line "serve un ANTIDOTO."
	done

AcademyParalysisText:
	text "La paralisi riduce"
	line "la velocità e può"
	para "impedire il"
	line "movimento."

	para "Permane anche"
	line "dopo la lotta:"
	cont "usa ANTIPARALISI!"
	done

AcademySleepText:
	text "Un #MON che"
	line "dorme non può"
	cont "muoversi."

	para "Un #MON"
	line "addormentato non"
	para "si sveglierà dopo"
	cont "la lotta."

	para "Sveglialo con la"
	line "SVEGLIA!"
	done

AcademyBurnText:
	text "Le scottature"
	line "continuano a"
	para "ridurre i PS e"
	line "la forza"
	cont "degli attacchi."

	para "Le scottature"
	line "persistono anche"
	cont "dopo la lotta."

	para "Curale con"
	line "ANTISCOTTATURA."
	done

AcademyFreezeText:
	text "Se il tuo #MON"
	line "è congelato non"
	cont "può fare nulla."

	para "Il congelamento"
	line "resta anche dopo"
	cont "la lotta."

	para "Usa l'ANTIGELO"
	line "per guarirlo."
	done

AcademyNotebookText:
	text "Sono gli appunti"
	line "di qualcuno…"

	para "Cattura i #MON"
	line "con le # BALL."

	para "Ne puoi avere fino"
	line "a sei in squadra."

	para "Leggi ancora?"
	done

AcademyNotebookText1:
	text "Indebolisci"
	line "l'avversario prima"
	para "di tirare una"
	line "# BALL."

	para "Un #MON"
	line "avvelenato o scot-"
	para "tato si cattura"
	line "più facilmente."

	para "Leggi ancora?"
	done

AcademyNotebookText2:
	text "Certe mosse cau-"
	line "sano confusione."

	para "Un #MON confuso"
	line "può attaccare se"
	cont "stesso."

	para "Ma dopo la lotta"
	line "la confusione"
	cont "svanisce."

	para "Leggi ancora?"
	done

AcademyNotebookText3:
	text "Chi cattura e"
	line "fa lottare i"

	para "#MON si chiama"
	line "allenatore."

	para "Un allenatore"
	line "visita le PALESTRE"

	para "#MON per"
	line "sfidare altri"
	cont "allenatori."

	para "La pagina dopo"
	line "è… vuota!"

	para "Scolara: Eh eh eh…"
	line "Non ho scritto"
	cont "altro…"
	done

AcademyStickerMachineText:
	text "Questa super-"
	line "macchina stampa i"

	para "dati come"
	line "figurine!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, PAGOTA_CITY, 6
	warp_event  4, 15, PAGOTA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, -1
	object_event  2,  5, SPRITE_JANINE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
