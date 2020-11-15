	object_const_def ; object_event constants
	const ROUTE105_YOUNGSTER3
	const ROUTE105_YOUNGSTER4
	;const ROUTE105_FRUIT_TREE1
	;const ROUTE105_FRUIT_TREE2
	const ROUTE105_COOLTRAINER_F
	const ROUTE105_POKE_BALL

Route105_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks





TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end



Route105YoungsterScript:
	jumptextfaceplayer Route105YoungsterText_DirectionsToMrPokemonsHouse

Route105CooltrainerFScript:
	jumptextfaceplayer Route105CooltrainerFText

Route105Sign:
	jumptext Route105SignText


Route105Antidote:
	itemball ANTIDOTE



Route105HiddenPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_105_HIDDEN_POTION




YoungsterMikeySeenText:
	text "You're a #MON"
	line "trainer, right?"

	para "Then you have to"
	line "battle!"
	done

YoungsterMikeyBeatenText:
	text "That's strange."
	line "I won before."
	done

YoungsterMikeyAfterText:
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done





Route105YoungsterText_DirectionsToMrPokemonsHouse:
	text "I'm tired."
	para "I don't want to"
	line "walk anymore."
	para "I wish my #MON"
	line "could FLY me to"
	cont "another town."
	done

Route105CooltrainerFText:
	text "I'm looking for"
	line "ELECTRIC-TYPE"
	cont "#MON."
	para "I know there's a"
	line "few different"
	para "species that live"
	line "in this grass."
	done

Route105SignText:
	text "ROUTE 105"

	para "JADE FOREST"
	line "just up ahead!"
	done



Route105_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 30, ROUTE_105_ROUTE_106_GATE, 1
	warp_event  9, 30, ROUTE_105_ROUTE_106_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route105Sign
	bg_event 13, 30, BGEVENT_ITEM, Route105HiddenPotion

	db 4 ; object events
	object_event  8, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterMikey, -1
	object_event  7, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105YoungsterScript, -1
	object_event 10,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105CooltrainerFScript, -1
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105Antidote, EVENT_ROUTE_105_ANTIDOTE
