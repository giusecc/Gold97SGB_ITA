	object_const_def ; object_event constants
	const MERIDIANPATH_YOUNGSTER1
	const MERIDIANPATH_LASS1
	const MERIDIANPATH_YOUNGSTER2
	const MERIDIANPATH_LASS2
	const MERIDIANPATH_YOUNGSTER3
	const MERIDIANPATH_LASS3
	const MERIDIANPATH_SUPER_NERD
	const MERIDIANPATH_COOLTRAINER_M2
	const MERIDIANPATH_POKE_BALL

MeridianPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainermKevinSeenText, CooltrainermKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKevinAfterBattleText
	waitbutton
	closetext
	end


MeridianPathProtein:
	itemball PROTEIN

MeridianPathHiddenPotion:
	hiddenitem POTION, EVENT_MERIDIAN_PATH_HIDDEN_POTION
	
MeridianPathSign:
	jumptext MeridianPathSignText
	
MeridianPathSignText:
	text "CAMMINO MERIDIANO"
	para "VILLAGGIO NAGO -"
	line "CITTÀ DI RYU KYU"
	done


BeautyVictoriaSeenText:
	text "Hai mai scalato"
	line "la CIMA CINEREA?"
	done

BeautyVictoriaBeatenText:
	text "Come? Ho perso?"
	done

BeautyVictoriaAfterBattleText:
	text "La vista da qui"
	line "è mozzafiato."
	done

SchoolboyJoeSeenText:
	text "Hai viaggiato per"
	line "tutta NIHON?"
	para "Fantastico."
	para "Ma riuscirai a"
	line "battere un allena-"
	cont "tore come me?"
	done

SchoolboyJoeBeatenText:
	text "Ahia! Distrutto!"
	done

SchoolboyJoeAfterBattleText:
	text "Sembra che tu"
	line "abbia allenato"
	para "molto i #MON"
	line "viaggiando."
	done

LassLauraSeenText:
	text "Sembra che tu sia"
	line "lontano da casa."
	done

LassLauraBeatenText:
	text "Che botta!"
	done

LassLauraAfterBattleText:
	text "Di dove sei?"
	para "BORGO SILENTE?"
	para "Non ci sono mai"
	line "stata."
	done

CamperLloydSeenText:
	text "Vai alla CIMA"
	line "CINEREA?"
	done

CamperLloydBeatenText:
	text "Questo era troppo!."
	done

CamperLloydAfterBattleText:
	text "Ci sono leggende"
	line "su un #MON"
	cont "raro sulla CIMA."
	para "Sono salito fino"
	line "alla vetta, ma"
	para "non ho trovato"
	line "niente."
	done

LassShannonSeenText:
	text "Lascia che te lo"
	line "dica, sono"
	cont "imbattibile!"
	done

LassShannonBeatenText:
	text "Stai scherzando?"
	done

LassShannonAfterBattleText:
	text "Ho fatto del mio"
	line "meglio."
	cont "Anche tu, credo."
	done

SupernerdPatSeenText:
	text "Fufufufu…"

	para "Lottiamo."
	done

SupernerdPatBeatenText:
	text "Non avresti"
	line "dovuto vincere."
	done

SupernerdPatAfterBattleText:
	text "C'è una ragazza"
	line "al VILLAGGIO NAGO"
	para "che ha moltissimi"
	line "CHARMANDER in"
	cont "casa."
	para "Credo che un"
	line "giorno ci sarà"
	cont "un incendio."
	done


CooltrainermKevinSeenText:
	text "Vuoi lottare,"
	line "vero?"
	done

CooltrainermKevinBeatenText:
	text "Una battaglia"
	line "incredibile!"
	done

CooltrainermKevinAfterBattleText:
	text "È stata una bella"
	line "lotta!"

	para "Siete stati"
	line "fantastici!"
	done


MeridianPath_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 47, MERIDIAN_PATH_RYUKYU_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 14, BGEVENT_ITEM, MeridianPathHiddenPotion
	bg_event 11,  5, BGEVENT_READ, MeridianPathSign

	db 8 ; object events
	object_event  9,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event  8, 47, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyJoe, -1
	object_event 13, 44, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 14, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event  8, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassShannon, -1
	object_event  6, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdPat, -1
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermKevin, -1
	object_event  6, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeridianPathProtein, EVENT_MERIDIAN_PATH_PROTEIN
