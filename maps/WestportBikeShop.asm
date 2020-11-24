	object_const_def ; object_event constants
	const WESTPORTBIKESHOP_CLERK

WestportBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

WestportBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext WestportBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext WestportBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext WestportBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext WestportBikeShopClerkRefusedText
	waitbutton
	closetext
	end

WestportBikeShopJustReleasedCompactBike:
; unused
	jumptext WestportBikeShopJustReleasedCompactBikeText

WestportBikeShopBicycle:
	jumptext WestportBikeShopBicycleText

WestportBikeShopClerkIntroText:
	text "…Sigh… Dopo"
	line "aver spostato il"

	para "negozio qui, non"
	line "vendo più nulla."

	para "Puoi andare un po'"
	line "in BICICLETTA per"
	cont "farmi pubblicità?"
	done

WestportBikeShopClerkAgreedText:
	text "Davvero? Grande!"

	para "Dammi nome e"
	line "numero telefonico,"

	para "ti presterò una"
	line "BICICLETTA!"
	done

BorrowedABicycleText:
	text "<PLAYER> prende una"
	line "BICICLETTA in"
	cont "prestito."
	done

WestportBikeShopClerkFirstRateBikesText:
	text "Le mie BICICLETTE"
	line "sono di prima"

	para "qualità! Puoi"
	line "andarci ovunque!"
	done

WestportBikeShopClerkRefusedText:
	text "…Sigh… Oh, se la"
	line "gente fosse"
	cont "gentile…"
	done

WestportBikeShopJustReleasedCompactBikeText:
	text "Ultimo modello!"

	para "Una BICICLETTA"
	line "richiudibile di"
	cont "prima qualità!"
	done

WestportBikeShopBicycleText:
	text "È una BICICLETTA"
	line "nuova di zecca!"
	done

WestportBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, WESTPORT_UNDERGROUND, 2
	warp_event  3,  7, WESTPORT_UNDERGROUND, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, WestportBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, WestportBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportBikeShopClerkScript, -1
