	object_const_def ; object_event constants
	const ROUTE118SUNPOINTGATE_OFFICER
	const ROUTE118SUNPOINTGATE_CLERK

Route118SunpointGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollTuesday

.DollTuesday:
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .DollTuesdayAppears
	disappear ROUTE118SUNPOINTGATE_CLERK
	return

.DollTuesdayAppears:
	appear ROUTE118SUNPOINTGATE_CLERK
	return


Route118SunpointGuardScript:
	jumptextfaceplayer Route118SunpointGuardSeriousText
	
	
;-------------
	
TravelingDollSalesmanTuesday:
	faceplayer
	opentext
	writetext DollSalesmanTextTuesday
	waitbutton
DollSalesmanTuesday_LoopScript:
	writetext DollSalesmanTextTuesday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanTuesdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanTuesday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_CHARMANDER_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_CHARMANDER_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_DIGLETT_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_DIGLETT_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanTuesdayNoMoney
	writetext SendItemToPCTextDollTuesday
	yesorno
	iffalse DollSalesmanTuesday_Cancel
	checkevent EVENT_DECO_STARMIE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_STARMIE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanTuesday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanTuesday
	waitbutton
	jump DollSalesmanTuesday_LoopScript

	
DollSalesmanTuesdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "CHARMANDER  ¥5000@"
	db "DIGLETT     ¥5000@"
	db "STARYU      ¥5000@"
	db "ESCI@"
	
DollSalesmanTuesday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanTuesday_HereYouGoText
	waitbutton
	jump DollSalesmanTuesday_LoopScript

DollSalesmanTuesday_Cancel:
	writetext DollSalesmanTuesdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanTuesdayNoMoney:
	writetext DollSalesmanTuesdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollTuesday:
	text "Inviare BAMBOLA"
	line "al tuo PC?"
	done

AlreadyHaveDecorItemTextSalesmanTuesday:
	text "Hai già questa"
	line "BAMBOLA!"
	done

DollSalesmanTuesday_HereYouGoText:
	text "Ecco a te!"
	done
	
DollSalesmanTuesdayComeAgain:
	text "Spero di vederti"
	line "presto!"
	done
	
DollSalesmanTuesdayNoMoneyText:
	text "Mi spiace, ti"
	line "servono più"
	cont "soldi!"
	done
	
DollSalesmanTextTuesday:
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
	
DollSalesmanTextTuesday_AskWhichPrizeText:
	text "Ora, quale"
	line "BAMBOLA vuoi?"
	done
	
;---------------------------------

Route118SunpointGuardSeriousText:
	text "ELIOPOLI è un"
	line "grande centro di"
	para "scambio per le"
	line "merci che arrivano"
	cont "a NIHON."
	para "I MOLI a nord sono"
	line "sempre trafficati."
	done

Route118SunpointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, SUNPOINT_CITY, 6
	warp_event  1,  7, SUNPOINT_CITY, 6
	warp_event  8,  7, ROUTE_118, 1
	warp_event  9,  7, ROUTE_118, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route118SunpointGuardScript, -1
	object_event  0,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanTuesday, EVENT_DOLL_SALESMAN_TUESDAY
