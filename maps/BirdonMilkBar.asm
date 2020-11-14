	object_const_def ; object_event constants
	const MILK_BAR_POKEFAN_M
	const MILK_BAR_POKEFAN_F
	const BAR_FISHER
	const BAR_LASS
	const BAR_N64_YOUNGSTER

BirdonMilkBar_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BarFisherScript:
	jumptextfaceplayer BarFisherScriptText
	
BarLassScript:
	jumptextfaceplayer BarLassScriptText

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	jumptextfaceplayer FarmerFText_SnoreSpeech


FarmhouseBookshelf:
	jumpstd PictureBookshelfScript
	
BarN64YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	waitbutton
	closetext
	end

.SendN64YoungsterOff
	writetext BarN64YoungsterBoredText
	buttonsound
	writetext SendN64YoungsterOffText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal DOWN, BarN64YoungsterDownScript
	jump BarN64YoungsterLeftScript
	end
	
BarN64YoungsterDownScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterDownMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	waitsfx
	end
	
BarN64YoungsterLeftScript:
	applymovement BAR_N64_YOUNGSTER, BarN64YoungsterLeftMovement
	playsound SFX_EXIT_BUILDING
	disappear BAR_N64_YOUNGSTER
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	clearevent EVENT_WESTPORT_DEPT_STORE_B1F_LAYOUT_1
	waitsfx
	end
	
BarN64YoungsterLeftMovement:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterDownMovement:
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
BarN64YoungsterBoredText:
	text "Che noia! Non c'è"
	para "niente da fare in"
	line "questa città."
	para "Vorrei incontrare"
	line "altri allenatori,"
	para "uscire e giocare"
	line "ai videogiochi con"
	cont "loro."
	para "Ma qui non c'è"
	line "speranza che"
	cont "accada."
	done
	
SendN64YoungsterOffText:
	text "Come?"
	para "Un posto vicino a"
	line "PORTOVEST in cui"
	cont "potrei andare?"
	para "Non credo di aver"
	line "niente di meglio"
	cont "da fare."
	para "Proverò ad"
	line "andarci, grazie!"
	done
	
BarFisherScriptText:
	text "Vengo qui ogni"
	line "giorno."
	para "Il LATTE MUMU"
	line "è fantastico!"
	done
	
BarLassScriptText:
	text "Non c'è molto da"
	line "fare in questa"
	cont "città."
	para "Molti di noi"
	line "passano il tempo"
	cont "bevendo latte."
	done

FarmerMText_BuyMilk:
	text "Che ne dici di"
	line "una bevuta?"
	para "Serviamo LATTE"
	line "MUMU qui."
	para "Che ne dici?"
	done

FarmerMText_GotMilk:
	text "Ecco a te!"
	line "Alla salute!"
	done

FarmerMText_NoMoney:
	text "Eh no, bello."
	line "Niente soldi,"
	cont "niente latte."
	done

FarmerMText_NoRoom:
	text "Dai, il tuo"
	line "ZAINO è pieno."
	done

FarmerMText_NoSale:
	text "Neanche un goccio?"
	line "So che tornerai."
	done

FarmerMText_Milking:
	text "È una gioia per"
	line "il palato."
	para "Anche i #MON"
	line "lo adorano!"
	done


FarmerFText_SnoreSpeech:
	text "Il LATTE MUMU"
	line "è delizioso!"
	done

BirdonMilkBar_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BIRDON_TOWN, 2
	warp_event  3,  7, BIRDON_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  4,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarFisherScript, -1
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarLassScript, -1
	object_event  0,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BarN64YoungsterScript, EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
