	const_def 1 ; object constants
	const ROUTE105ROUTE106GATE_OFFICER
	const ROUTE105ROUTE106GATE_ROCKER
	const ROUTE105ROUTE106GATE_CLERK

Route105Route106Gate_MapScripts:
	db 1 ; scene scripts
	callback MAPCALLBACK_OBJECTS, .DollWednesday

.DollWednesday:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .DollWednesdayAppears
	disappear ROUTE105ROUTE106GATE_CLERK
	return

.DollWednesdayAppears:
	appear ROUTE105ROUTE106GATE_CLERK
	return

	db 0 ; callbacks

Route105Route106GateOfficerScript:
	jumptextfaceplayer Route105Route106GateOfficerText
	
Route105Route106GateRockerScript:
	jumptextfaceplayer Route105Route106GateRockerText


;-------------
	
TravelingDollSalesmanWednesday:
	faceplayer
	opentext
	writetext DollSalesmanTextWednesday
	waitbutton
DollSalesmanWednesday_LoopScript:
	writetext DollSalesmanTextWednesday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanWednesdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	ifequal 3, .Doll3
	jump DollSalesmanWednesday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_SQUIRTLE_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SQUIRTLE_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_MAGIKARP_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.Doll3
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanWednesdayNoMoney
	writetext SendItemToPCTextDollWednesday
	yesorno
	iffalse DollSalesmanWednesday_Cancel
	checkevent EVENT_DECO_ODDISH_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_ODDISH_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanWednesday_FinishScript
	end
	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanWednesday
	waitbutton
	jump DollSalesmanWednesday_LoopScript

	
DollSalesmanWednesdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SQUIRTLE    ¥5000@"
	db "MAGIKARP    ¥5000@"
	db "ODDISH      ¥5000@"
	db "ESCI@"
	
DollSalesmanWednesday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanWednesday_HereYouGoText
	waitbutton
	jump DollSalesmanWednesday_LoopScript

DollSalesmanWednesday_Cancel:
	writetext DollSalesmanWednesdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanWednesdayNoMoney:
	writetext DollSalesmanWednesdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollWednesday:
	text "Inviare BAMBOLA"
	line "al tuo PC?"
	done

AlreadyHaveDecorItemTextSalesmanWednesday:
	text "Possiedi già"
	line "questa BAMBOLA!"
	done

DollSalesmanWednesday_HereYouGoText:
	text "Ecco a te!"
	done
	
DollSalesmanWednesdayComeAgain:
	text "Spero di rivederti"
	line "presto!"
	done
	
DollSalesmanWednesdayNoMoneyText:
	text "Mi spiace, ti"
	line "servono più soldi!"
	done
	
DollSalesmanTextWednesday:
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
	
DollSalesmanTextWednesday_AskWhichPrizeText:
	text "Ora, quale"
	line "BAMBOLA vuoi?"
	done
	
;---------------------------------


Route105Route106GateOfficerText:
	text "BOSCO GIADA è una"
	line "zona misteriosa."
	para "Trattala con"
	line "rispetto."
	done

Route105Route106GateRockerText:
	text "Mi piace passeg-"
	line "giare nel"
	cont "BOSCO GIADA."
	para "È molto meno"
	line "spaventoso se"
	para "sai come"
	line "orientarti."
	done

Route105Route106Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_105, 1
	warp_event  5,  0, ROUTE_105, 2
	warp_event  4,  7, ROUTE_106, 1
	warp_event  5,  7, ROUTE_106, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateOfficerScript, -1
	object_event  6,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105Route106GateRockerScript, -1
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanWednesday, EVENT_DOLL_SALESMAN_WEDNESDAY

