	object_const_def ; object_event constants
	const RYUKYUURASOEPARKGATE_OFFICER
	const RYUKYUURASOEPARKGATE_CLERK

RyukyuUrasoeParkGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollSaturday

.DollSaturday:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DollSaturdayAppears
	disappear RYUKYUURASOEPARKGATE_CLERK
	return

.DollSaturdayAppears:
	appear RYUKYUURASOEPARKGATE_CLERK
	return


.DummyScene:
	end

Route101NRyukyuGuardScript:
	jumptextfaceplayer Route101NRyukyuGuardWelcomeText

;-------------
	
TravelingDollSalesmanSaturday:
	faceplayer
	opentext
	writetext DollSalesmanTextSaturday
	waitbutton
DollSalesmanSaturday_LoopScript:
	writetext DollSalesmanTextSaturday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanSaturdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	jump DollSalesmanSaturday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanSaturdayNoMoney
	writetext SendItemToPCTextDollSaturday
	yesorno
	iffalse DollSalesmanSaturday_Cancel
	checkevent EVENT_DECO_MACHOP_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_MACHOP_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanSaturday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanSaturdayNoMoney
	writetext SendItemToPCTextDollSaturday
	yesorno
	iffalse DollSalesmanSaturday_Cancel
	checkevent EVENT_DECO_TENTACOOL_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_TENTACOOL_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanSaturday_FinishScript
	end
	

	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanSaturday
	waitbutton
	jump DollSalesmanSaturday_LoopScript

	
DollSalesmanSaturdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "MACHOP      ¥5000@"
	db "TENTACOOL   ¥5000@"
	db "ESCI@"
	
DollSalesmanSaturday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanSaturday_HereYouGoText
	waitbutton
	jump DollSalesmanSaturday_LoopScript

DollSalesmanSaturday_Cancel:
	writetext DollSalesmanSaturdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanSaturdayNoMoney:
	writetext DollSalesmanSaturdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollSaturday:
	text "Inviare BAMBOLA"
	line "al tuo PC?"
	done

AlreadyHaveDecorItemTextSalesmanSaturday:
	text "Possiedi già"
	line "questa BAMBOLA!"
	done

DollSalesmanSaturday_HereYouGoText:
	text "Ecco a te!"
	done
	
DollSalesmanSaturdayComeAgain:
	text "Spero di rivederti"
	line "presto!"
	done
	
DollSalesmanSaturdayNoMoneyText:
	text "Mi spiace, ti"
	line "servono più soldi!"
	done
	
DollSalesmanTextSaturday:
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
	
DollSalesmanTextSaturday_AskWhichPrizeText:
	text "Ora, quale"
	line "BAMBOLA vuoi?"
	done
	
;---------------------------------



Route101NRyukyuGuardWelcomeText:
	text "A volte vorrei"
	line "lasciare il mio"
	para "posto di guardia"
	line "e riposarmi"
	cont "sulla spiaggia."
	done


RyukyuUrasoeParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, RYUKYU_CITY, 4
	warp_event  5,  0, RYUKYU_CITY, 5
	warp_event  4,  7, URASOE_PARK, 1
	warp_event  5,  7, URASOE_PARK, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101NRyukyuGuardScript, -1
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanSaturday, EVENT_DOLL_SALESMAN_SATURDAY
