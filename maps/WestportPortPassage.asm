	object_const_def ; object_event constants
	const WESTPORTPORTPASSAGE_POKEFAN_M
	const WESTPORTPORTPASSAGE_GRAMPS
	const WESTPORTPORTPASSAGE_ABRA
	const WESTPORTPORTPASSAGE_CLERK

WestportPortPassage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollMonday

.DollMonday:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .DollMondayAppears
	disappear WESTPORTPORTPASSAGE_CLERK
	return

.DollMondayAppears:
	appear WESTPORTPORTPASSAGE_CLERK
	return

WestportPortPassagePokefanMScript:
	jumptextfaceplayer WestportPortPassagePokefanMText
	
;-------------
	
TravelingDollSalesmanMonday:
	faceplayer
	opentext
	writetext DollSalesmanTextMonday
	waitbutton
DollSalesmanMonday_LoopScript:
	writetext DollSalesmanTextMonday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanMondayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanMonday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_SURFING_PIKACHU_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SURFING_PIKACHU_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_JIGGLYPUFF_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_JIGGLYPUFF_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanMondayNoMoney
	writetext SendItemToPCTextDollMonday
	yesorno
	iffalse DollSalesmanMonday_Cancel
	checkevent EVENT_DECO_BULBASAUR_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BULBASAUR_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanMonday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanMonday
	waitbutton
	jump DollSalesmanMonday_LoopScript

	
DollSalesmanMondayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "POLIWRATH   ¥5000@"
	db "JIGGLYPUFF  ¥5000@"
	db "BULBASAUR   ¥5000@"
	db "ESCI@"
	
DollSalesmanMonday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanMonday_HereYouGoText
	waitbutton
	jump DollSalesmanMonday_LoopScript

DollSalesmanMonday_Cancel:
	writetext DollSalesmanMondayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanMondayNoMoney:
	writetext DollSalesmanMondayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollMonday:
	text "Inviare BAMBOLA"
	line "al tuo PC?"
	done

AlreadyHaveDecorItemTextSalesmanMonday:
	text "Possiedi già"
	line "questa BAMBOLA!"
	done

DollSalesmanMonday_HereYouGoText:
	text "Ecco a te!"
	done
	
DollSalesmanMondayComeAgain:
	text "Spero di rivederti"
	line "presto!"
	done
	
DollSalesmanMondayNoMoneyText:
	text "Mi spiace, ti"
	line "servono più soldi!"
	done
	
DollSalesmanTextMonday:
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
	
DollSalesmanTextMonday_AskWhichPrizeText:
	text "Ora, quale"
	line "BAMBOLA vuoi?"
	done
	
;---------------------------------
	
TeleportGuyScript2:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue .SkipTeleportTextWest
	writetext TeleportGuyText12
	buttonsound
	setevent EVENT_EXPLODING_TRAP_2
.SkipTeleportTextWest
	writetext TeleportGuyText12_2	
	yesorno
	iffalse .No2
	writetext TeleportGuyYesText2
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AMAMI_PORT_PASSAGE, 13, 2
	end

.No2:
	writetext TeleportGuyNoText2
	waitbutton
	closetext
	end

AbraScript2:
	opentext
	writetext AbraText2
	cry ABRA
	waitbutton
	closetext
	end


	

TeleportGuyText12:
	text "Non vuoi prendere"
	line "la nave?"
	para "O sei stanco?"
	para "Guarda qua!"
	para "Il mio ABRA"
	line "può portarti"
	para "alle isole in"
	line "un attimo!"
	para "Ho un amico"
	line "che attende a"
	cont "NAZE."
	para "Ti manderò da"
	line "lui!"
	para "Che ne dici?"
	done
	
TeleportGuyText12_2:
	text "Vuoi andare"
	line "a NAZE?"
	done

TeleportGuyYesText2:
	text "Ok, Ok. Pensa"
	line "intensamente"
	cont "a NAZE…"
	done

TeleportGuyNoText2:
	text "Ok, Ok. Quando"
	line "vuoi, sono qui!"
	done

AbraText2:
	text "ABRA: Aabra…"
	done


WestportPortPassagePokefanMText:
	text "La NAVE VELOCE"
	line "M/N ACQUA salpa"
	para "per NAZE di lunedì"
	line "e venerdì."
	done

WestportPortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19,  4, WESTPORT_CITY, 14
	warp_event 19,  5, WESTPORT_CITY, 15
	warp_event 15,  4, WESTPORT_PORT_PASSAGE, 4
	warp_event  3,  2, WESTPORT_PORT_PASSAGE, 3
	warp_event  3, 14, WESTPORT_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 18,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortPassagePokefanMScript, EVENT_WESTPORT_PORT_PASSAGE_POKEFAN_M
	object_event 13,  1, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript2, EVENT_TELEPORT_GUY
	object_event 14,  1, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript2, EVENT_TELEPORT_GUY
	object_event  1, 10, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanMonday, EVENT_DOLL_SALESMAN_MONDAY
