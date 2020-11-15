	object_const_def ; object_event constants
	const AMAMIPORTPASSAGE_TEACHER
	const AMAMIPORTPASSAGE_GRAMPS
	const AMAMIPORTPASSAGE_ABRA
	const AMAMIPORTPASSAGE_CLERK

AmamiPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollFriday

.DollFriday:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .DollFridayAppears
	disappear AMAMIPORTPASSAGE_CLERK
	return

.DollFridayAppears:
	appear AMAMIPORTPASSAGE_CLERK
	return
	

;-------------
	
TravelingDollSalesmanFriday:
	faceplayer
	opentext
	writetext DollSalesmanTextFriday
	waitbutton
DollSalesmanFriday_LoopScript:
	writetext DollSalesmanTextFriday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanFridayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanFriday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_VOLTORB_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VOLTORB_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_WEEDLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_WEEDLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanFridayNoMoney
	writetext SendItemToPCTextDollFriday
	yesorno
	iffalse DollSalesmanFriday_Cancel
	checkevent EVENT_DECO_GEODUDE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_GEODUDE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanFriday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanFriday
	waitbutton
	jump DollSalesmanFriday_LoopScript

	
DollSalesmanFridayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "VOLTORB     ¥5000@"
	db "WEEDLE      ¥5000@"
	db "GEODUDE     ¥5000@"
	db "ESCI@"
	
DollSalesmanFriday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanFriday_HereYouGoText
	waitbutton
	jump DollSalesmanFriday_LoopScript

DollSalesmanFriday_Cancel:
	writetext DollSalesmanFridayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanFridayNoMoney:
	writetext DollSalesmanFridayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollFriday:
	text "Inviare BAMBOLA"
	line "al tuo PC?"
	done

AlreadyHaveDecorItemTextSalesmanFriday:
	text "Possiedi già"
	line "questa BAMBOLA!"
	done

DollSalesmanFriday_HereYouGoText:
	text "Ecco a te!"
	done
	
DollSalesmanFridayComeAgain:
	text "Spero di rivederti"
	line "presto!"
	done
	
DollSalesmanFridayNoMoneyText:
	text "Mi spiace, ti"
	line "servono più soldi!"
	done
	
DollSalesmanTextFriday:
	text "Ehi!"
	para "Sono un venditore"
	line "di BAMBOLE!"
	para "Cosa significa?"
	para "Significa che devi"
	line "parlare con me se"
	para "vuoi decorare la"
	line "tua camera!"
	para "La mia merce e"
	line "la mia posizione"
	para "cambiano ogni"
	line "giorno!"
	done
	
DollSalesmanTextFriday_AskWhichPrizeText:
	text "Ora, quale"
	line "BAMBOLA vuoi?"
	done
	
;---------------------------------



AmamiPortPassageTeacherScript:
	jumptextfaceplayer AmamiPortPassageTeacherText
	
TeleportGuyScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue .SkipTeleportTextAmami
	writetext TeleportGuyText1
	buttonsound
	setevent EVENT_EXPLODING_TRAP_1
.SkipTeleportTextAmami
	writetext TeleportGuyText1_2
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp WESTPORT_PORT_PASSAGE, 13, 2
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end


AmamiPortPassageTeacherText:
	text "La M/N ACQUA salpa"
	line "per PORTOVEST di"
	para "mercoledì e"
	line "domenica."
	done
	

TeleportGuyText1:
	text "Non vuoi prendere"
	line "la nave?"
	para "O forse non"
	line "salpa oggi?"
	para "Guarda qua!"
	para "Il mio amato ABRA"
	line "può mandarti"
	para "sulla terraferma"
	line "all'istante!"
	para "Ho un amico al"
	line "MOLO di"
	cont "PORTOVEST."
	para "Posso mandarti da"
	line "lui!"
	para "Che ne dici?"
	done
	
TeleportGuyText1_2:
	text "Vuoi andare a"
	line "PORTOVEST?"
	done

TeleportGuyYesText:
	text "Ok. Ora pensa"
	line "a PORTOVEST…"
	done

TeleportGuyNoText:
	text "Ok. Ti aspeterò"
	line "qui!"
	done

AbraText:
	text "ABRA: Aabra…"
	done


AmamiPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, AMAMI_TOWN, 1
	warp_event 19,  5, AMAMI_TOWN, 2
	warp_event 15, 14, AMAMI_PORT_PASSAGE, 4
	warp_event 15,  4, AMAMI_PORT_PASSAGE, 3
	warp_event  3, 14, AMAMI_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiPortPassageTeacherScript, EVENT_TELEPORT_GUY
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
	object_event  5, 13, SPRITE_CLERK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanFriday, EVENT_DOLL_SALESMAN_FRIDAY
