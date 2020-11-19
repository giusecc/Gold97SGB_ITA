	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY
	const KANTOHOUSE_2_POKEFANM

KantoHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkcode VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end
	
KantoHouse2PokefanMScript:
	jumptextfaceplayer KantoHouse2PokefanMText

KantoHouse2PokefanMText:
	text "Ciao!"
	para "Che bello avere"
	line "ospiti."
	para "Mia moglie"
	line "parla con"
	cont "chiunque."
	done

DaisyHelloText:
	text "Oh, ciao! Che"
	para "bello conoscere"
	line "nuove persone."
	para "Quando vuoi vieni"
	line "qui per una tazza"
	cont "di té."
	done

DaisyOfferGroomingText:
	text "Ciao! Che"
	line "tempismo! Sto"
	cont "preparando il té."

	para "Vuoi unirti?"

	para "Oh, i tuoi #-"
	line "MON sono un po'"
	cont "sporchi."

	para "Vuoi che ne"
	line "pulisca uno?"
	done

DaisyWhichMonText:
	text "Quale devo"
	line "pulire?"
	done

DaisyAlrightText:
	text "Tornerà splendido"
	line "in un attimo!"
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " è"
	line "felice."
	done

DaisyAllDoneText:
	text "Ecco a te!"

	para "Vedi? Non è"
	line "stupendo?"

	para "È un #MON"
	line "così bello."
	done

DaisyAlreadyGroomedText:
	text "Prendo sempre il"
	line "té a quest'ora."
	para "Vieni anche tu"
	line "quando vuoi."
	done

DaisyRefusedText:
	text "Non vuoi?"

	para "Ok, godiamoci"
	line "il té."
	done

DaisyCantGroomEggText:
	text "Oh, scusa."
	para "Non posso pulire"
	line "un UOVO."
	done

KantoHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 25
	warp_event  5,  7, KANTO_REGION, 25

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  7,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse2PokefanMScript, -1
