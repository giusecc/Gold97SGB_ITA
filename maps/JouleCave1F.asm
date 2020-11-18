	object_const_def ; object_event constants
	const JOULECAVE1F_BOULDER
	const JOULECAVE1F_POKE_BALL1
	const JOULECAVE1F_POKE_BALL2
	const JOULECAVE1F_POKE_BALL3
	const JOULECAVE1F_POKE_BALL4
	const JOULECAVE1F_POKE_BALL5
	const JOULECAVE1F_SUPER_NERD1
	const JOULECAVE1F_SUPER_NERD2
	const JOULECAVE1F_POKE_BALL6
	const JOULECAVE1F_POKE_BALL7
	const JOULECAVE1F_POKEFAN

JouleCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacMiller:
	trainer POKEMANIAC, MILLER, EVENT_BEAT_POKEMANIAC_MILLER, PokemaniacMillerSeenText, PokemaniacMillerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacMillerAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdMarkus:
	trainer SUPER_NERD, MARKUS, EVENT_BEAT_SUPER_NERD_MARKUS, SupernerdMarkusSeenText, SupernerdMarkusBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdMarkusAfterBattleText
	waitbutton
	closetext
	end
	

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

MountMortar1FBoulder:
	jumpstd StrengthBoulderScript

JouleCave1FEscapeRope:
	itemball ESCAPE_ROPE

JouleCave1FMaxRevive:
	itemball MAX_REVIVE

JouleCave1FHyperPotion:
	itemball HYPER_POTION

JouleCave1FMaxPotion:
	itemball MAX_POTION

JouleCave1FNugget:
	itemball NUGGET

JouleCave1FIron:
	itemball IRON

JouleCave1FUltraBall:
	itemball THUNDER_TAIL

JouleCave1FHiddenMaxRepel:
	hiddenitem MAX_REPEL, EVENT_JOULE_CAVE_1F_HIDDEN_MAX_REPEL
	
HikerErikSeenText:
	text "Preparati a tutto!"

	para "Fammi vedere come"
	line "hai allenato i"
	cont "tuoi #MON!"
	done

HikerErikBeatenText:
	text "Oh, ho perso!"
	done

HikerErikAfterBattleText:
	text "Mi allenero qui"
	line "finché sarò più"
	cont "forte!"
	done

PokemaniacMillerSeenText:
	text "Non perderò!"
	done

PokemaniacMillerBeatenText:
	text "Ho perso con un"
	line "ragazzino…?"
	done

PokemaniacMillerAfterBattleText:
	text "Dicono che ci"
	line "sia un raro #-"
	para "MON uccello che"
	line "riposa in questa"
	cont "montagna."
	para "Tuttavia non l'ho"
	line "mai visto."
	done

SupernerdMarkusSeenText:
	text "Ehi!"
	done

SupernerdMarkusBeatenText:
	text "Mi hai spaventato…"
	done

SupernerdMarkusAfterBattleText:
	text "Volevo esplorare"
	line "la GROTTA JOULE,"
	para "ma non ci ho"
	line "trovato niente."
	done

JouleCave1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 31, SEASIDE_PATH, 2
	warp_event 35, 15, MOUNT_MORTAR_ZAPDOS_ROOM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 28, 19, BGEVENT_ITEM, JouleCave1FHiddenMaxRepel

	db 11 ; object events
	object_event 11, 31, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortar1FBoulder, -1
	object_event 24, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FEscapeRope, EVENT_JOULE_CAVE_1F_ESCAPE_ROPE
	object_event 26,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FMaxRevive, EVENT_JOULE_CAVE_1F_MAX_REVIVE
	object_event  4,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FHyperPotion, EVENT_JOULE_CAVE_1F_HYPER_POTION
	object_event 27, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FMaxPotion, EVENT_JOULE_CAVE_1F_MAX_POTION
	object_event 46,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FNugget, EVENT_JOULE_CAVE_1F_NUGGET
	object_event 13,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacMiller, -1
	object_event 47, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdMarkus, -1
	object_event 24, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FIron, EVENT_JOULE_CAVE_1F_IRON
	object_event 16, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, JouleCave1FUltraBall, EVENT_JOULE_CAVE_1F_ULTRA_BALL
	object_event 25, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerErik, -1
