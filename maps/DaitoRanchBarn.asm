	object_const_def ; object_event constants
	const ROUTE39BARN_TWIN1
	const ROUTE39BARN_TWIN2
	const ROUTE39BARN_MOOMOO
	

DaitoRanchBarn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


Route39BarnTwin1Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN1, RIGHT
	end

Route39BarnTwin2Script:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .FeedingMooMoo
	writetext Route39BarnTwinMoomooIsSickText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

.FeedingMooMoo:
	writetext Route39BarnTwinWereFeedingMoomooText
	waitbutton
	closetext
	turnobject ROUTE39BARN_TWIN2, LEFT
	end

MoomooScript:
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue .HappyCow
	writetext MoomooWeakMooText
	writebyte MILTANK
	special PlaySlowCry
	buttonsound
	writetext Route39BarnItsCryIsWeakText
	checkevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	iftrue .GiveBerry
	waitbutton
	closetext
	end

.GiveBerry:
	buttonsound
	writetext Route39BarnAskGiveBerryText
	yesorno
	iffalse .Refused
	checkitem APPLE
	iffalse .NoBerriesInBag
	takeitem APPLE
	copybytetovar wMooMooBerries
	addvar 1
	copyvartobyte wMooMooBerries
	ifequal 3, .ThreeBerries
	ifequal 5, .FiveBerries
	ifequal 7, .SevenBerries
	writetext Route39BarnGaveBerryText
	waitbutton
	closetext
	end

.ThreeBerries:
	writetext Route39BarnGaveBerryText
	buttonsound
	writetext Route39BarnLittleHealthierText
	waitbutton
	closetext
	end

.FiveBerries:
	writetext Route39BarnGaveBerryText
	buttonsound
	writetext Route39BarnQuiteHealthyText
	waitbutton
	closetext
	end

.SevenBerries:
	playmusic MUSIC_HEAL
	writetext Route39BarnGaveBerryText
	pause 60
	buttonsound
	special RestartMapMusic
	writetext Route39BarnTotallyHealthyText
	waitbutton
	closetext
	setevent EVENT_HEALED_MOOMOO
	end

.NoBerriesInBag:
	writetext Route39BarnNoBerriesText
	waitbutton
	closetext
	end

.Refused:
	writetext Route39BarnRefusedBerryText
	waitbutton
	closetext
	end

.HappyCow:
	writetext MoomooHappyMooText
	cry MILTANK
	waitbutton
	closetext
	end

Route39BarnTwinMoomooIsSickText:
	text "MUMU sta male…"

	para "Spero che si"
	line "riprenda"
	cont "presto…"
	done

Route39BarnTwinWereFeedingMoomooText:
	text "Diamo da mangiare"
	line "a MUMU!"
	done

MoomooWeakMooText:
	text "MILTANK: …Muuu…"
	done

Route39BarnItsCryIsWeakText:
	text "Non riesce quasi"
	line "a muggire…"
	done

MoomooHappyMooText:
	text "MILTANK: Muuu!"
	done

Route39BarnAskGiveBerryText:
	text "Dai una MELA"
	line "a MILTANK?"
	done

Route39BarnGaveBerryText:
	text "<PLAYER> dà una"
	line "MELA a MILTANK."
	done

Route39BarnLittleHealthierText:
	text "Ora MILTANK sta"
	line "un po' meglio!"
	done

Route39BarnQuiteHealthyText:
	text "Ora MILTANK sta"
	line "molto meglio!"
	done

Route39BarnTotallyHealthyText:
	text "Ora MILTANK sta"
	line "benissimo!"
	done

Route39BarnNoBerriesText:
	text "<PLAYER> non ha"
	line "MELE…"
	done

Route39BarnRefusedBerryText:
	text "<PLAYER> non dà"
	line "una MELA."

	para "MILTANK è triste."
	done



DaitoRanchBarn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, DAITO_RANCH, 2
	warp_event  4,  7, DAITO_RANCH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin1Script, -1
	object_event  4,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route39BarnTwin2Script, -1
	object_event  3,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
