	object_const_def ; object_event constants
	const HYDRODAM_OFFICER
	const HYDRODAM_BIKER

HydraulicCave_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_DAM_IS_OPEN
	iftrue .DamIsOpen
	changeblock   1,  7, $0F ; water
	changeblock   3,  7, $0F ; water
	changeblock   5,  7, $0F ; water
	changeblock   7,  7, $0F ; water
	changeblock   9,  7, $0F ; water
	changeblock  11,  7, $0F ; water
	changeblock   1,  9, $0F ; water
	changeblock   3,  9, $0F ; water
	changeblock   5,  9, $0F ; water
	changeblock   7,  9, $0F ; water
	changeblock   9,  9, $0F ; water
	changeblock  11,  9, $0F ; water
	changeblock  13,  9, $3F ; dam
	changeblock  13,  7, $3F ; dam
	changeblock  19,  7, $02 ; land
	changeblock  17,  7, $02 ; land
	changeblock  15,  7, $02 ; land
	changeblock  19,  9, $02 ; land
	changeblock  17,  9, $02 ; land
	changeblock  15,  9, $02 ; land
	return
	
.DamIsOpen
	return
	
DamControlMachine:
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iftrue .LetsNotMessWithIt
	opentext
	writetext DamOpenText
	yesorno
	iffalse DamDoesntOpenScript
	closetext
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	opentext
	writetext DamOpenTextButton
	waitbutton
	closetext
	applymovement PLAYER, PlayerWatchesDamMovement
	opentext
	writetext DamOpenText2
	waitbutton
	closetext
	playsound SFX_MEGA_PUNCH
	changeblock  13,  9, $02 ; dam
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  13,  7, $02 ; dam
	reloadmappart
	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   1,  7, $21 ; water
	reloadmappart
;	playsound SFX_MEGA_PUNCH
	changeblock   1,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   3,  7, $21 ; water
	reloadmappart
	changeblock   3,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   5,  7, $21 ; water
	reloadmappart
	changeblock   5,  9, $21 ; water
	reloadmappart
;	waitsfx
;	playsound SFX_MEGA_PUNCH
	changeblock   7,  7, $21 ; water
	reloadmappart
	changeblock   7,  9, $21 ; water
	reloadmappart
;	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock   9,  7, $21 ; water
	reloadmappart
	changeblock   9,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  11,  7, $21 ; water
	reloadmappart
	changeblock  11,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  13,  7, $21 ; water
	reloadmappart
	changeblock  13,  9, $21 ; water
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  15,  7, $21 ; land
	reloadmappart
	changeblock  15,  9, $21 ; land
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  17,  7, $21 ; land
	reloadmappart
	changeblock  17,  9, $21 ; land
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	changeblock  19,  7, $21 ; land
	reloadmappart
	changeblock  19,  9, $21 ; land
	reloadmappart
	waitsfx
	setevent EVENT_DAM_IS_OPEN
	opentext
	writetext DamOpenText3
	waitbutton
	closetext
	pause 15
	opentext
	writetext OfficerInTheDistance
	waitbutton
	closetext
	pause 15
	showemote EMOTE_SHOCK, HYDRODAM_BIKER, 15
	opentext
	writetext BikerSwansonAfterBattleText2
	waitbutton
	closetext	
	applymovement HYDRODAM_BIKER, BikerRunsOffMovement
	pause 20
	applymovement PLAYER, HydroDummyMovement
	disappear HYDRODAM_BIKER
	setevent EVENT_SWANSON_IS_GONE
	pause 20
	applymovement PLAYER, HydroDummyMovement
	moveobject HYDRODAM_OFFICER, 9, 12
	appear HYDRODAM_OFFICER
	applymovement HYDRODAM_OFFICER, HydroOfficerWalksUp
	applymovement PLAYER, PlayerGreetsOfficer
	opentext
	writetext OfficerThanksYou
	waitbutton
	closetext
	applymovement HYDRODAM_OFFICER, HydroOfficerLeaves
	disappear HYDRODAM_OFFICER
	setevent EVENT_IEJIMA_TOWN_FIXED
	clearevent EVENT_IEJIMA_TOWN_NOT_FIXED
	clearevent EVENT_IEJIMA_TOWN_TRI_WING
	end
	
.LetsNotMessWithIt
	opentext
	writetext LetsNotMessWithItText
	waitbutton
	closetext
	end
	
TrainerBikerSwanson:
	trainer BIKER, SWANSON, EVENT_BEAT_BIKER_SWANSON, BikerSwansonSeenText, BikerSwansonBeatenText, 0, .Script

.Script:
;	endifjustbattled
	opentext
	writetext BikerSwansonAfterBattleText
	waitbutton
	closetext
	end
	
DamDoesntOpenScript:
	closetext
	end
	
BikerRunsOffMovement:
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
HydroDummyMovement:
	step_end

PlayerWatchesDamMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
HydroOfficerWalksUp:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
HydroOfficerLeaves:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
PlayerGreetsOfficer:
	step DOWN
	turn_head LEFT
	step_end
	
BikerSwansonSeenText:
	text "Vattane via,"
	line "moccioso!"
	para "Rovini il nostro"
	line "divertimento!"
	done
	
BikerSwansonBeatenText:
	text "Che fastidio!"
	done
	
BikerSwansonAfterBattleText:
	text "Perché vuoi"
	line "infastidirci?"
	para "Faresti meglio"
	line "a non riaprire"
	cont "la diga!"
	done
	
OfficerInTheDistance:
	text "AGENTE: Ehi!"
	para "Che succede lì?"
	done
	
BikerSwansonAfterBattleText2:
	text "Aaah!"
	line "Gli sbirri!"
	para "Meglio"
	line "filarsela!"
	done
	
	
OfficerThanksYou:
	text "Oh, ecco!"
	para "Grazie per"
	line "l'aiuto!"
	para "Stavo venendo qui"
	line "per questi"
	para "teppisti che si"
	line "sono intrufolati"
	para "nell'IMPIANTO"
	line "IDROELETTRICO."
	para "Ma sei arrivato"
	line "prima tu e li hai"
	para "fermati con i tuoi"
	line "#MON!"
	para "Non vogliono aver"
	line "a che fare con me"
	para "e se la sono data"
	line "a gambe appena"
	cont "sono arrivato!"
	para "Sono sicuro che i"
	line "cittadini di"
	para "IEJIMA saranno"
	line "euforici di avere"
	para "nuovamente la"
	line "loro acqua!"
	para "Dovremo portare"
	line "più agenti qui"
	para "per tenere lontani"
	line "i teppisti!"
	para "Tuttavia, grazie"
	line "ancora!"
	done
	
LetsNotMessWithItText:
	text "Meglio non"
	line "scherzarci di"
	cont "nuovo…"
	done

DamOpenText:
	text "È il pannello di"
	line "controllo per la"
	cont "diga."
	para "Vuoi aprire la"
	line "diga?"
	done
	
DamOpenTextButton:
	text "<PLAYER> preme"
	line "il pulsante."
	done
	
DamOpenText2:
	text "La diga si sta"
	line "aprendo!"
	done
	
DamOpenText3:
	text "L'acqua scorre"
	line "di nuovo a"
	cont "IEJIMA!"
	done

HydraulicCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 17, HYDRO_PLANT, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 11, BGEVENT_READ, DamControlMachine

	db 2 ; object events
	object_event -5, -5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12, 12, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBikerSwanson, EVENT_SWANSON_IS_GONE
