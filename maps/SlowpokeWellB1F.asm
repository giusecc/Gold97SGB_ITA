	object_const_def ; object_event constants
	const SLOWPOKE_WELL_B1F_SILVER


SlowpokeWellB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneSlowpoke1Rival ; SCENE_DEFAULT
	scene_script .SceneSlowpoke1Nothing ;

	db 0 ; callbacks

.SceneSlowpoke1Rival:
	showemote EMOTE_SHOCK, SLOWPOKE_WELL_B1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject SLOWPOKE_WELL_B1F_SILVER, DOWN
	pause 15
	applymovement PLAYER, WellPlayerWalksToSilver
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUISEAL_FROM_OAK
	iftrue .cruiseal
	checkevent EVENT_GOT_HAPPA_FROM_OAK
	iftrue .happa
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CRUISEAL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruiseal
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_HAPPA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.happa
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	;setlasttalked SLOWPOKE_WELL_B1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	applymovement SLOWPOKE_WELL_B1F_SILVER, WellSilverWalksToRoom2
	playsound SFX_EXIT_BUILDING
	disappear SLOWPOKE_WELL_B1F_SILVER
	setscene SCENE_SLOWPOKE1_NOTHING
	setevent EVENT_GOT_SQUIRTBOTTLE
	setevent EVENT_EXPLODING_TRAP_21
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end
	


.SceneSlowpoke1Nothing
	end
	
WellPlayerWalksToSilver:
	step UP
	step UP
	step_end
	
WellSilverWalksToPlayer:
	step RIGHT
	turn_head DOWN
	step_end
	
WellSilverWalksToRoom2:
	step UP
	step UP
	step UP
	step_end

SlowpokeWellB1FSilverScript:
	end
;<……>
BurnedTowerSilver_BeforeText:
	text "<PLAYER>!"
	para "BLU e il PROF.OAK"
	line "ci aspettano più"
	cont "avanti nel pozzo."
	para "Volevo aspettarti"
	line "qui perché sapevo"
	para "che saresti"
	line "arrivato presto!"
	para "La mia squadra è"
	line "molto più forte"
	cont "dell'ultima volta."
	para "Ecco! Lascia che"
	line "te lo mostri!"
	done

BurnedTowerSilver_WinText:
	text "Oh."

	para "Ho allenato i"
	line "miei #MON"
	para "duramente, ma"
	line "ho perso…"
	done
BurnedTowerSilver_AfterText1:
	text "Ah, non importa."
	para "Devo farli"
	line "diventare ancora"
	cont "più forti!"
	para "Comunque, dobbiamo"
	line "andare avanti"
	para "per incontrarci"
	line "con gli altri!"
	done

BurnedTowerSilver_LossText:
	text "Sì!"
	para "Sono il migliore!"
	done

BurnedTowerSilver_AfterText2:
	text "Uff!"

	para "Cosa credi di"
	line "fare cadendo in"

	para "un buco?"

	para "Ti sta bene!"
	done
	
Text_RivalGreets:
	text "Ehi!"
	done


SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 13, BIRDON_TOWN, 6
	warp_event 11,  7, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSilverScript, EVENT_GOT_SQUIRTBOTTLE

