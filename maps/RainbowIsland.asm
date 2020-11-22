	object_const_def ; object_event constants
	const RAINBOWISLAND_BLUE

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueScriptRI:
	special FadeOutMusic
	faceplayer
	opentext
	writetext BlueSeenText
	waitbutton
	closetext
	winlosstext BlueWinLossText, BlueWinLossText
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RAINBOWISLAND_BLUE
	setevent EVENT_BLUE_ON_RAINBOW_ISLAND
	setevent EVENT_DECO_SILVER_TROPHY; blue trophy
	clearevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
BlueWinLossText:
	text "È finita!"
	
	para "Una lotta degna"
	line "dei libri di"
	para "storia, senza"
	line "dubbio!"
	done

BlueSeenText:
	text "Ciao, <PLAYER>!"
	para "Sono qui per"
	line "studiare le"
	para "specie di #MON"
	line "che vivono su"
	cont "island."
	
	
	para "Vedo una luce"
	line "nei tuoi occhi."
	
	para "Conosco quello"
	line "sguardo."
	
	para "È lo stesso che"
	line "mi ha spinto a"
	para "diventare"
	line "CAMPIONE."
	
	para "Dunque… C'è"
	line "una sola cosa"
	para "che vuoi fare,"
	line "vero?"
	
	para "<PLAYER>!"
	
	para "In qualità di"
	line "EX CAMPIONE della"
	para "LEGA #MON,"
	line "ti sfido!"
	done
	
BlueLeavesText:
	text "Uff…"
	
	para "Nessuno mi aveva"
	line "dato così tanto"
	para "filo da torcere"
	line "da quando ho"
	para "lottato contro"
	line "il mio amico"
	cont "da CAMPIONE!"
	
	para "Eh… Sembra quasi"
	line "ieri…"
	
	para "Bene! Credo sia"
	line "giunta ora di"
	para "concludere il"
	line "mio viaggio."
	
	
	para "<PLAYER>! Credo"
	line "che…"
	
	para "Ci vediamo!"
	done

RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 30,  8, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRI, EVENT_BLUE_ON_RAINBOW_ISLAND
