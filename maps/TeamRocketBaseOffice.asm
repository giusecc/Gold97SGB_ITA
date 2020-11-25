	object_const_def ; object_event constants
	const TEAMROCKETBASEOFFICE_POKE_BALL1
	const TEAMROCKETBASEOFFICE_POKE_BALL2
	const TEAMROCKETBASEOFFICE_POKE_BALL3
	const TEAMROCKETBASEOFFICE_GRUNT1
	const TEAMROCKETBASEOFFICE_GRUNT2
	const TEAMROCKETBASEOFFICE_GRUNT3
	const TEAMROCKETBASEOFFICE_GRUNT4
	const TEAMROCKETBASEOFFICE_GRUNT5
	const TEAMROCKETBASEOFFICE_IMPOSTOR
	const TEAMROCKETBASEOFFICE_EXECUTIVE

TeamRocketBaseOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseOfficeNugget:
	itemball NUGGET

TeamRocketBaseOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_OFFICE_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ExecutiveConfrontationScene:
	turnobject PLAYER, UP
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerStepsUpToImposter
	jump ExecutiveConfrontationScript
	end
	
ExecutiveConfrontationScript:
	pause 15
	opentext
	writetext ImposterTellsYouToSeeExecutive
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalksToExecutive
	pause 20
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEOFFICE_EXECUTIVE, ExecutiveLeavesOffice
	disappear TEAMROCKETBASEOFFICE_EXECUTIVE
	disappear TEAMROCKETBASEOFFICE_IMPOSTOR
	setevent EVENT_TEAM_ROCKET_BASE_B1F_ELECTRODE_1
	setscene SCENE_TEAMROCKETBASEOFFICE_NOTHING
	end
	
TeamRocketBaseOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_105_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
PlayerWalksToExecutive:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
ExecutiveLeavesOffice:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
RocketBossRoomGrunt1Text:
	text "Siamo ai"
	line "preparativi finali"
	para "prima che il"
	line "macchinario entri"
	cont "in funzione."
	para "Nulla può andare"
	line "storto adesso!"
	done
	
RocketBossRoomGrunt2Text:
	text "OAK IMPOSTORE ha"
	line "fatto un ottimo"
	para "lavoro a"
	line "convincere i"
	para "cittadini di"
	line "INERTOPOLI."
	done
	
RocketBossRoomGrunt3Text:
	text "Solo il GENERALE"
	line "conosce la"
	para "password per"
	line "spegnere"
	cont "l'antenna."
	para "È anche un po'"
	line "smemorato…"
	done
	
RocketBossRoomGrunt4Text:
	text "Sarà bellissimo"
	line "quando il nostro"
	para "macchinario sarà"
	line "a piena potenza"
	para "e potremo"
	line "avere i #MON"
	cont "sotto controllo!"
	done
	
RocketBossRoomGrunt5Text:
	text "Secondo i miei"
	line "calcoli, il"
	para "segnale dovrebbe"
	line "essere a piena"
	para "potenza nel giro"
	line "di una"
	cont "settimana!"
	done
	
BadSecurityPractices:
	text "Cos'è questo?"
	para "È una nota del"
	line "GENERALE…"
	para "È la password"
	line "delle console!"
	para "…"
	para "<PLAYER>"
	line "impara la"
	cont "password!"
	done
	
ExecutiveSceneAfterBattleText:
	text "Aah!"
	para "Potresti avermi"
	line "sconfitto in una"
	para "lotta, ma ormai"
	line "conta poco."
	para "Il macchinario è"
	line "quasi a piena"
	cont "potenza!"
	para "I tuoi #MON"
	line "saranno presto"
	para "sotto il mio"
	line "controllo!"
	para "Ora scusami,"
	line "ma ho altro da"
	cont "fare!"
	done
	
ExecutiveWinText:
	text "Non posso"
	line "crederci!"
	done
	
ExecutiveLossText:
	text "HA!"
	done
	
TheExecutiveGreeting:
	text "Capisci in cosa"
	line "ti sei cacciato?"
	para "Ovviamente no,"
	line "altrimenti non"
	cont "saresti qui."
	para "…"
	para "Ti ricordi di me,"
	line "vero?"
	para "Ero il CAPITANO"
	line "della nave cargo."
	para "Ma soprattutto"
	line "sono il GENERALE"
	cont "del TEAM ROCKET."
	para "Secondo solo al"
	line "capo, GIOVANNI."
	para "Credo che tu"
	line "abbia capito cosa"
	cont "facciamo qui!"
	para "Tutto il denaro"
	line "e le merci ci"
	para "servivano per"
	line "questo scopo!"
	para "Abbiamo costruito"
	line "un dispositivo in"
	para "grado di control-"
	line "lare le menti"
	para "dei #MON con"
	line "un segnale!"
	para "Controlleremo"
	line "tutti i #MON"
	cont "del mondo!"
	para "Non ti lascerò"
	line "intralciare i"
	para "piani del"
	line "TEAM ROCKET!"
	done
	
	
ImposterTellsYouToSeeExecutive:
	text "Sembra che nessuna"
	line "RECLUTA sia"
	para "riuscita a"
	line "fermarti."
	para "Onestamente, me"
	line "l'aspettavo."
	para "Rimane solo il"
	line "GENERALE."
	para "Non è molto"
	line "felice della"
	cont "situazione."
	para "Avrei paura se"
	line "fossi in te."
	done


TeamRocketBaseOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 2 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ExecutiveConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ExecutiveConfrontationScene2


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseOfficePassword


	db 10 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_OFFICE_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeNugget, EVENT_TEAM_ROCKET_BASE_OFFICE_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_OFFICE_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  7, 11, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B1F_ELECTRODE_1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B1F_ELECTRODE_1
