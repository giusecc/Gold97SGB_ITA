	object_const_def ; object_event constants
	const KANTOMANSION3F_COOLTRAINER_M
	const KANTOMANSION3F_GYM_GUY
	const KANTOMANSION3F_SUPER_NERD
	const KANTOMANSION3F_FISHER

KantoMansion3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	checkcode VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Leafeon
	waitbutton
	closetext
	end

.CompletedPokedex:
	buttonsound
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	buttonsound
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting:
; unused
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

KantoMansion3FDevRoomSign:
	jumptext KantoMansion3FDevRoomSignText

KantoMansion3FDrawing:
	jumptext KantoMansion3FDrawingText

KantoMansion3FGameProgram:
	jumptext KantoMansion3FGameProgramText

KantoMansion3FReferenceMaterial:
	jumptext KantoMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "Che te ne pare?"

	para "Ho progettato io"
	line "questo gioco!"

	para "Completare il tuo"
	line "#DEX è"
	para "difficile, ma"
	line "non arrenderti!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Uauh! Eccellente!"
	line "Hai completato il"
	cont "tuo #DEX!"

	para "Congratulazioni!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "…"
	done

GameFreakGameDesignerAfterDiplomaText:
	text "Ora il GRAFICO"
	line "ti stamperà"
	cont "un DIPLOMA."

	para "Mostralo a tutti,"
	line "mi raccomando!"
	done

GameFreakGraphicArtistText:
	text "Io sono il"
	line "GRAFICO."

	para "Ti ho disegnato"
	line "io!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Io sono il"
	line "GRAFICO."

	para "Hai completato il"
	line "tuo #DEX?"

	para "Vuoi che ti stampi"
	line "il tuo DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Quando vuoi che ti"
	line "stampi il DIPLOMA,"
	cont "vieni a dirmelo!"
	done

GameFreakGraphicArtistErrorText:
	text "C'è qualcosa che"
	line "non va: devo"
	text "annullare la"
	line "stampa."
	done

GameFreakProgrammerText:
	text "Io? Sono il"
	line "PROGRAMMATORE."

	para "Gioca alle"
	line "slot machine!"
	done

GameFreakCharacterDesignerText:
	text "Le GEMELLE sono"
	line "deliziose, vero?"

	para "Anche JASMINE è"
	line "carina."

	para "Oh, le adoro!"
	done

KantoMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "SALA SVILUPPO"
	done

KantoMansion3FDrawingText:
	text "È il disegno"
	line "dettagliato di una"
	cont "bella ragazza."
	done

KantoMansion3FGameProgramText:
	text "È il programma"
	line "del gioco! Non lo"

	para "toccare, potresti"
	line "causare un errore"
	cont "dentro al gioco!"
	done

KantoMansion3FReferenceMaterialText:
	text "È pieno di"
	line "materiale da"
	para "consultare. C'è"
	line "anche una"
	cont "# BAMBOLA."
	done

KantoMansion3F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  0, KANTO_MANSION_ROOF, 1
	warp_event  4,  0, KANTO_MANSION_2F, 2
	warp_event  6,  0, KANTO_MANSION_2F, 3
	warp_event  7,  0, KANTO_MANSION_ROOF, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event  4,  9, BGEVENT_UP, KantoMansion3FDevRoomSign
	bg_event  3,  3, BGEVENT_UP, KantoMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, KantoMansion3FGameProgram
	bg_event  1,  4, BGEVENT_UP, KantoMansion3FReferenceMaterial

	db 4 ; object events
	object_event  0,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  2,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
