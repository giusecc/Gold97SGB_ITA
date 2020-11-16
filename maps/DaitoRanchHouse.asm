ROUTE109FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const DAITOHOUSE_FARMER
	const DAITOHOUSE_WIFE


DaitoRanchHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaitoRanchero_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue DaitoRancheroScript_SellMilk
	writetext DaitoRancheroText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

DaitoRancheroScript_SellMilk:
	checkevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	iffalse .GetOldAmberFromFarmer
	checkitem MOOMOO_MILK
	iftrue DaitoRancheroScript_Milking
	writetext DaitoRancheroText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse DaitoRancheroScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, DaitoRancheroScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse DaitoRancheroScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext DaitoRancheroText_GotMilk
	buttonsound
	itemnotify
	closetext
	end
	
.GetOldAmberFromFarmer
	writetext HeyYouHealedMooMoo
	waitbutton
	verbosegiveitem OLD_AMBER
	writetext HeyYouHealedMooMoo2
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_AMBER_FROM_FARMER
	end

DaitoRancheroScript_NoMoney:
	writetext DaitoRancheroText_NoMoney
	waitbutton
	closetext
	end

DaitoRancheroScript_NoRoom:
	writetext DaitoRancheroText_NoRoom
	waitbutton
	closetext
	end

DaitoRancheroScript_NoSale:
	writetext DaitoRancheroText_NoSale
	waitbutton
	closetext
	end

DaitoRancheroScript_Milking:
	writetext DaitoRancheroText_Milking
	waitbutton
	closetext
	end
	
HeyYouHealedMooMoo:
	text "Oh, eccoti!"
	para "Ti ringrazio"
	line "per aver aiutato"
	para "MILTANK!"
	para "Ti devo un favore,"
	line "ragazzo."
	para "Mentre facevamo"
	line "i lavori per la"
	para "FATTORIA abbiamo"
	line "trovato questo."
	para "Tieni!"
	done
	
HeyYouHealedMooMoo2:
	text "Se hai bisogno"
	line "di LATTE MUMU"
	para "devi solo farmelo"
	line "sapere."
	done


DaitoRancheroText_SickCow:
	text "Il mio MILTANK"
	line "mi dà sempre"
	cont "tanto latte."

	para "Questa FATTORIA"
	line "è rinomata per"
	cont "il suo latte."

	para "Lo bevono tutti"
	line "da queste parti."

	para "Io prendo il suo"
	line "latte e le faccio"

	para "mangiare le nostre"
	line "MELE."
	done

DaitoRancheroText_BuyMilk:
	text "Vuoi un po' di"
	line "LATTE MUMU?"

	para "Fantastico!"
	line "Eccolo."

	para "Dallo a un #MON"
	line "per ristabilire"
	cont "i suoi PS."

	para "Te lo posso dare"
	line "per soli ¥500."
	done

DaitoRancheroText_GotMilk:
	text "Tieni!"
	line "Bevi e divertiti!"
	done

DaitoRancheroText_NoMoney:
	text "Mi spiace."
	line "Niente soldi,"
	cont "niente latte!"
	done

DaitoRancheroText_NoRoom:
	text "Ragazzo, il tuo"
	line "ZAINO è pieno."
	done

DaitoRancheroText_NoSale:
	text "Non lo vuoi?"
	line "Torna presto!"
	done

DaitoRancheroText_Milking:
	text "Meglio tornare"
	line "a mungere."
	done

DaitoHouseWifeScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
;	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end
	
Route26HealHouseRestAWhileText:
	text "I tuoi #MON"
	line "sembrano stanchi."

	para "Dovresti farli"
	line "riposare un po'."
	done

Route26HealHouseKeepAtItText:
	text "Ecco a te!"

	para "I tuoi #MON"
	line "sono in perfetta"
	cont "forma!"

	para "Torna presto!"
	done


DaitoRanchHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 1
	warp_event  5,  7, DAITO_RANCH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DaitoRanchero_DairyFarmer, -1
	object_event  7,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DaitoHouseWifeScript, -1
