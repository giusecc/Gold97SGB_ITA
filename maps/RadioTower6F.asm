	object_const_def ; object_event constants
	const RADIOTOWER6F_TEACHER
	const RADIOTOWER6F_GENTLEMAN
	const RADIOTOWER6F_CLEFABLE
	const RADIOTOWER6F_CLEFABLE_SCARED
	const RADIOTOWER6F_GIOVANNI
	const RADIOTOWER6F_EXECUTIVE

RadioTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower6fClefable:	
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
RadioTower6fClefableTakeover:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iffalse .NormalClefableTemp
	faceplayer
	opentext
	writetext ClefableScaredText
	cry CLEFABLE
	waitbutton
	writetext ClefableScaredText2
	waitbutton
	closetext
	end
	
.NormalClefableTemp
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

RadioTower6fGentleman:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanText
	waitbutton
	closetext
	end
.MidRocketTakeover6fGentleman
	writetext RadioTower6fGentlemanTextTakeover
	waitbutton
	closetext
	end
	

RadioTower6fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherTextTakeover
	waitbutton
	closetext
	end
	
RadioTower6FDirectorsOfficeSign:
	jumptext RadioTower6FDirectorsOfficeSignText
	
RadioTower6fGiovanni:
	end
	

TrainerExecutive6F:
	trainer EXECUTIVEM, EXECUTIVEM_3, EVENT_BEAT_ROCKET_EXECUTIVEM_3, Executive6FSeenText, Executive6FBeatenText, 0, .Script

.Script:
;	endifjustbattled
	opentext
	writetext Executive6FAfterBattleText
	waitbutton
	closetext
	end
	
GiovanniEncounter:
	special FadeOutMusic
	applymovement PLAYER, TwoStepsToGiovanni
	pause 15
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BROCK, BROCK1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	opentext
	writetext GiovanniExitingText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
;	disappear RADIOTOWER6F_CLEFABLE_SCARED
	disappear RADIOTOWER6F_GIOVANNI
	disappear RADIOTOWER6F_EXECUTIVE
;	appear RADIOTOWER6F_CLEFABLE
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_WESTPORT_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_WESTPORT_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_TEAM_ROCKET_DISBANDED
	clearevent EVENT_STAND_CITY_ZOO_MONS
	variablesprite SPRITE_BIRDON_ROCKET, SPRITE_YOUNGSTER
	variablesprite SPRITE_OLD_FUCHSIA_GYM_1, SPRITE_OFFICER
	special PlayMapMusic
	moveobject RADIOTOWER6F_GENTLEMAN, 3, 2
	appear RADIOTOWER6F_GENTLEMAN
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks
	showemote EMOTE_SHOCK, RADIOTOWER6F_GENTLEMAN, 15
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks2
	applymovement PLAYER, PlayerWalksToDirector
	opentext
	writetext DirectorThanksText
	buttonsound
	verbosegiveitem HM_ROCK_SMASH
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext DirectorThanksText2
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER6F_NOTHING; this scene is also set when you meet silver right at the beginning, then re set as part of the jump to radiotowerrockets
	setmapscene WESTPORT_CITY, SCENE_WESTPORT_CITY_RIVAL
	clearevent EVENT_OKERA_NOT_IN_GYM
	clearevent EVENT_OKERA_OWES_YOU_ONE
	variablesprite SPRITE_OLD_FUCHSIA_GYM_2, SPRITE_SILVER
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
DirectorWalks:
	step DOWN
	step DOWN
	step_end
	
DirectorWalks2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end
	
PlayerWalksToDirector:
	step UP
	step RIGHT
	step_end
	
DirectorThanksText:
	text "Oh!"
	para "Dove sono finiti"
	line "quei farabutti?"
	para "Se ne sono andati?"
	para "Ragazzo! Ti"
	line "sei liberato di"
	cont "loro?"
	para "Davvero?"
	line "Ti sarò per sempre"
	cont "riconoscente!"
	para "Mi hanno buttato"
	line "fuori dall'ufficio"
	para "e hanno lasciato"
	line "qui CLEFABLE!"
	para "Non potevo"
	line "lottare!"
	para "Devo darti"
	line "qualcosa per"
	cont "sdebitarmi!"
	para "Ecco, tieni!"
	done
	
DirectorThanksText2:
	text "Con questa mossa,"
	line "i tuoi #MON"
	para "possono distrug-"
	line "gere le rocce sul"
	cont "tuo cammino."
	para "Ne farai un uso"
	line "migliore di me!"
	para "Non voglio più"
	line "andarmene da"
	cont "questo ufficio!"
	done
	
GiovanniExitingText:
	text "Devo dirtelo."
	para "Il mondo non ha"
	line "ancora visto la"
	para "fine di"
	line "TEAM ROCKET."
	para "Siamo risorti"
	line "dalle nostre"
	para "ceneri, e lo"
	line "rifaremo!"
	done
	
GiovanniWinText:
	text "No! Non di nuovo!"
	
	para "I miei piani…"
	
	para "I miei sforzi…"
	
	para "Tutto ciò per"
	line "nulla!?"
	done
	
GiovanniLossText:
	text "Heh."
	done
	
GiovanniGreeting:
	text "Ah."
	para "Voi due siete i"
	line "ragazzini di cui"
	para "ho sentito"
	line "parlare."
	para "Tu sei <RIVAL>?"
	para "No, devi essere"
	line "<PLAYER>."
	para "Bene, <PLAYER>,"
	line "sai perché ti"
	para "trovi qui di"
	line "fronte a me?"
	para "Lo so il perché."
	
	para "È perchè sei"
	line "coraggioso…"
	para "O molto sciocco."
	
	para "Sono il capo del"
	line "TEAM ROCKET."
	
	para "Ho sofferto molto"
	line "per riportare la"
	para "mia organizzazione"
	line "al vecchio"
	cont "splendore."
	
	para "E tu mi ricordi"
	line "di un altro"
	cont "ragazzo che ho"
	cont "affrontato."

	para "…"
	
	para "Che rabbia."

	para "So benissimo quali"
	line "sono le tue"
	cont "intenzioni."
	
	para "Vuoi fermare i"
	line "miei piani."
	
	para "Non te lo"
	line "permetterò."
	
	para "Non di nuovo!"
	
	para "Io, GIOVANNI il"
	line "CAPO del"
	cont "TEAM ROCKET,"	
	cont "ti distruggerò!"	
	done
	

	
Executive6FSeenText:
	text "GENERALE: No!"

	para "Non andrai oltre!"
	
	para "I marmocchi come"
	line "te non meritano"
	para "di incontrare"
	line "il capo!"
	
	para "Fermati qui!"
	done
	
Executive6FBeatenText:
	text "No!"
	
	para "GIOVANNI,"
	line "perdonami!"
	done
	
Executive6FAfterBattleText:
	text "…"
	para "Non posso più"
	line "fare nulla."
	para "Se vuoi vedere"
	line "GIOVANNI, si"
	para "trova più"
	line "avanti."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "P5 UFFICIO DEL"
	line "   DIRETTORE"
	done
	
RadioTower6FClefableText:
	text "CLEFABLE:"
	line "Cleffa-fa!"
	done

ClefableScaredText:
	text "CLEFABLE:"
	line "Cl..cleffa?"
	done
	
ClefableScaredText2:
	text "Sembra"
	line "impaurito…"
	done

RadioTower6fTeacherText:
	text "Questo è l'ufficio"
	line "del DIRETTORO"
	para "a capo di questa"
	line "operazione!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "Dove è finito il"
	line "DIRETORE?"
	para "Spero stia bene!"
	done

RadioTower6fGentlemanText:
	text "Ho aperto la"
	line "COMPAGNIA RADIO"
	para "per condividere"
	line "l'amore per i"
	cont "#MON!"
	para "Spero che alle-"
	line "natori e #MON"
	para "apprezzino i"
	line "nostri programmi."
	done
	
RadioTower6fGentlemanTextTakeover:
	text "…"
	done
	

RadioTower6F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RADIO_TOWER_5F, 2

	db 1 ; coord events
	coord_event  3,  3, SCENE_DEFAULT, GiovanniEncounter

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower6FDirectorsOfficeSign

	db 6 ; object events
	object_event  6,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fTeacher, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_WESTPORT_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  3,  6, SPRITE_BROCK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

