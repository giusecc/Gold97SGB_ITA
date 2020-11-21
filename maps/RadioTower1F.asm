	object_const_def ; object_event constants
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_GENTLEMAN
	const RADIOTOWER1F_COOLTRAINER_F
	const RADIOTOWER1F_GRUNTM12

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext UnknownText_0x5ceba
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext UnknownText_0x5cf3a
	buttonsound
	closetext
	;applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce71
	opentext
	writetext UnknownText_0x5cf5a
	buttonsound
	waitsfx
	writetext UnknownText_0x5cf79
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	;applymovement RADIOTOWER1F_GENTLEMAN, MovementData_0x5ce74
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	jump .NoPrize

.GameOver:
	writetext UnknownText_0x5cf7e
	waitbutton
	closetext
	end

.FirstPlace:
	writetext UnknownText_0x5cfb5
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.SecondPlace:
	writetext UnknownText_0x5d023
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.ThirdPlace:
	writetext UnknownText_0x5d076
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	jump .GameOver

.NoPrize:
	writetext UnknownText_0x5d0c0
	waitbutton
	closetext
	end

.BagFull:
	writetext UnknownText_0x5d0e6
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .ReceptionistTakeover
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext UnknownText_0x5d12d
	yesorno
	iffalse .NoQuiz
	writetext UnknownText_0x5d1f2
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d231
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d282
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d2bc
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d30e
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext UnknownText_0x5d37b
	buttonsound
	stringtotext .RadioCardText, MEM_BUFFER_1
	scall .ReceiveItem
	writetext UnknownText_0x5d3c0
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext UnknownText_0x5d3e5
	waitbutton
	closetext
	end
.ReceptionistTakeover:
	writetext ReceptionistTakeoverText
	waitbutton
	closetext
	end

.RadioCardText:
	db "SCHEDA RADIO@"

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext UnknownText_0x5d409
	waitbutton
	closetext
	end

.NoQuiz:
	writetext UnknownText_0x5d443
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText


RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText
	
TrainerGruntM12:
	trainer GRUNTM, GRUNTM_12, EVENT_BEAT_ROCKET_GRUNTM_12, GruntM12SeenText, GruntM12BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM12AfterBattleText
	waitbutton
	closetext
	end

MovementData_0x5ce71:
	step RIGHT
	turn_head UP
	step_end

MovementData_0x5ce74:
	step LEFT
	turn_head UP
	step_end
	
GruntM12SeenText:
	text "Benvenuto alla"
	line "TORRE RADIO!"
	para "Il TEAM ROCKET"
	line "ti darà tutto"
	para "ciò di cui hai"
	line "bisogno!"
	done
	
GruntM12BeatenText:
	text "Non intendevo"
	line "perdere la lotta…"
	done
	
GruntM12AfterBattleText:
	text "Il TEAM ROCKET"
	line "sta lavorando per"
	para "farci sentire"
	line "a casa qui!"
	done

ReceptionistTakeoverText:
	text "Ciao."
	para "Non abbiamo eventi"
	line "in programma,"
	para "finché non si"
	line "risolve la"
	cont "situazione."
	done

UnknownText_0x5ce77:
	text "Benvenuto!"
	done



UnknownText_0x5ceba:
	text "Ciao, sei qui per"
	line "lo SHOW del NUMERO"
	cont "FORTUNATO?"

	para "Puoi vincere con i"
	line "Numeri d'Identità"
	cont "dei tuoi #MON."

	para "Se hai fortuna"
	line "puoi vincere"
	cont "un bel premio."
	done

UnknownText_0x5cf3a:
	text "Il Numero d'Iden-"
	line "tità di questa"
	para "settimana è"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

UnknownText_0x5cf5a:
	text "Vediamo se"
	line "corrisponde."
	done

UnknownText_0x5cf79:
	text "<……>"
	line "<……>"
	done

UnknownText_0x5cf7e:
	text "Torna la prossima"
	line "settimana, per il"
	para "prossimo NUMERO"
	line "FORTUNATO."
	done

UnknownText_0x5cfb5:
	text "Incredibile! Tutti"
	line "i cinque numeri"
	cont "corrispondono!"

	para "Sei il vincitore"
	line "del primo premio!"

	para "Hai vinto una"
	line "MASTER BALL!"
	done

UnknownText_0x5d023:
	text "Grande! Gli ultimi"
	line "tre numeri"
	cont "corrispondono!"

	para "Hai vinto il"
	line "secondo premio,"
	cont "CONDIV. ESP.!"
	done

UnknownText_0x5d076:
	text "Oh, i due ultimi"
	line "numeri"
	cont "corrispondono."

	para "Hai vinto il terzo"
	line "premio, PP-SU."
	done

UnknownText_0x5d0c0:
	text "Peccato, neppure"
	line "un numero"
	cont "corrisponde."
	done

UnknownText_0x5d0e6:
	text "Non hai posto per"
	line "ricevere"
	cont "il premio."

	para "Libera uno spazio"
	line "e poi torna qui."
	done

UnknownText_0x5d12d:
	text "Partecipa al quiz"
	line "che si sta svol-"
	cont "gendo proprio ora!"

	para "Se rispondi"
	line "correttamente a"
	para "5 domande vinci"
	line "una SCHEDA RADIO."

	para "Se la inserisci"
	line "nel #GEAR,"
	para "puoi ascoltare la"
	line "radio quando vuoi."

	para "Vuoi partecipare"
	line "al quiz?"
	done

UnknownText_0x5d1f2:
	text "Domanda 1:"

	para "C'è un #MON"
	line "che appare solo"
	cont "di mattina?"
	done

UnknownText_0x5d231:
	text "Esatto!"
	line "Domanda 2:"

	para "Questa frase è"
	line "esatta?"

	para "Non puoi comprare"
	line "BACCHE in un"
	cont "#MON-MARKET."
	done

UnknownText_0x5d282:
	text "Giusto!"
	line "Domanda 3:"

	para "La MN01 contiene"
	line "la mossa FLASH?"
	done

UnknownText_0x5d2bc:
	text "Finora è tutto ok!"
	line "DOMANDA 4:"

	para "VALERIO, il"
	line "CAPOPALESTRA di"
	para "ANCESTRALIA usa"
	line "#MON VOLANTE?"
	done

UnknownText_0x5d30e:
	text "Hai indovinato"
	line "ancora! E adesso"
	cont "la domanda finale:"

	para "La strada a nord"
	line "di PORTOVEST è il"
	cont "PERCORSO 102?"
	done

UnknownText_0x5d37b:
	text "Ce l'hai fatta!!!"
	line "Complimenti!"

	para "Hai vinto una"
	line "SCHEDA RADIO!"
	done

UnknownText_0x5d3c0:
	text "Il #GEAR di"
	line "<PLAYER> ora può"
	para "funzionare come"
	line "una RADIO."
	done

UnknownText_0x5d3e5:
	text "Ascolta i nostri"
	line "programmi!"
	done

UnknownText_0x5d409:
	text "Peccato!"
	line "Mi dispiace, hai"

	para "sbagliato."
	line "Riprova!"
	done

UnknownText_0x5d443:
	text "Come vuoi. Se"
	line "cambi idea, noi"
	cont "siamo qui."
	done

RadioTower1FLassText:
	text "KEN è un DJ"
	line "favoloso."

	para "La sua voce è"
	line "incredibile."
	done

RadioTower1FYoungsterText:
	text "Adoro LORI del"
	line "#MON TALK."

	para "L'ho conosciuta"
	line "di persona. È"
	cont "incredibile!"
	done


RadioTower1FDirectoryText:
	text "PT RECEPTION"
	line "P1 STUDIO 1"

	para "P2 PERSONALE"
	line "P3 STUDIO 2"

	para "P4 STUDIO 3"
	line "P5 UFFICIO DEL"
	cont "   DIRETTORE"
	done

RadioTower1FLuckyChannelSignText:
	text "RADIO FORTUNA!"

	para "Vinci con Numeri"
	line "d'Identità dei"
	cont "tuoi #MON."

	para "Scambia i #MON"
	line "per avere più"
	cont "Numeri d'Identità!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, WESTPORT_CITY, 6
	warp_event  3,  7, WESTPORT_CITY, 11
	warp_event  7,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event  3,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 5 ; object events
	object_event  4,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  7,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, -1
	object_event  0,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGruntM12, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
