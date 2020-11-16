	object_const_def ; object_event constants
	const BILLSHOUSE_GRAMPS
	const EARLMUSEUM_BIRD
	const EARLMUSEUM_DRAGON
	const EARLMUSEUM_LASS
	const EARLMUSEUM_POKEFAN_M

EarlsMuseum_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ArtHousePagotaTreeGone
	
.ArtHousePagotaTreeGone
	setevent EVENT_PAGOTA_TREE_CUT
	return

BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

ArtistEarl:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext ArtistEarlIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext ArtistEarlLickitungText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal MADAME, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump .ShowedLickitung

.GotEverstone:
	writetext ArtistEarlOddishText
	buttonsound
	writetext ArtistEarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon; edit here, change back to dratini
	scall .CorrectPokemon
	clearevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump .ShowedOddish


.ShowedOddish:
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	clearevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ExcitedToSee:
	writetext ArtistEarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext ArtistEarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext ArtistEarlShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext ArtistEarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext ArtistEarlComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext ArtistEarlShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext ArtistEarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end
	
EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText
	
ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText
	
ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText
	
ArtHousePokefanMText:
	text "Quest'opera d'arte"
	line "è davvero"
	cont "incredibile!"
	done
	
ArtHouseLassText:
	text "Sai, mi piace un"
	line "sacco questo UOVO."
	done

EggStatueText:
	text "STATUA UOVO"
	line "di PRIMO"
	done
	
ArtSignText:
	text "GALLERIA D'ARTE"
	para "Guardare, ma"
	line "non toccare."
	done

ArtistEarlIntroText:
	text "Oh, che amarezza."
	para "Sono un fallimento"
	line "vivente."
	para "Non chiedere il"
	line "perché!"
	para "Ve bene, te lo"
	line "dirò."
	para "Io sono PRIMO e"
	line "sono un artista."
	para "O meglio, vorrei"
	line "esserne capace."
	para "Non ho mai nessuna"
	line "ispirazione."
	para "Ho aperto questa"
	line "GALLERIA per"
	para "esporre i miei"
	line "lavori, ma l'unica"
	para "scultura che abbia"
	line "mai portato a"
	para "termine è quella"
	line "di un UOVO."
	para "Devo fare qualcosa"
	line "di soprendente!"
	para "Sto lavorando alla"
	line "statua del #-"
	para "MON MADAME,"
	line "ma non è ancora"
	para "finita."
	done

ArtistEarlAskToSeeMonText:
	text "Hai per caso quel"
	line "#MON?"
	done

ArtistEarlExcitedToSeeText:
	text "Puoi farmelo"
	line "vedere? Grazie!"
	done

ArtistEarlYouDontHaveItTextText:
	text "Non ce l'hai?"
	line "Che peccato…"
	done

ArtistEarlShownPokemonText:
	text "Oh, sì! Ecco"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Grazie mille! Ecco"
	line "l'ispirazione!"
	done

ArtistEarlTokenOfAppreciationText:
	text "Questo è un segno"
	line "di ringraziamento."
	done

ArtistEarlComeAgainText:
	text "Torna qui"
	line "qualche volta."
	done

ArtistEarlShownAllThePokemonText:
	text "Grazie per avermi"
	line "mostrato quei"
	cont "#MON!"
	para "Con il tuo aiuto"
	line "ho fatto passi"
	para "da gigante nel"
	line "mio lavoro!"
	done

ArtistEarlWrongPokemonText:
	text "Eh?"

	para "Quello non è il"
	line "#MON a cui"
	cont "stavo pensando."
	done

ArtistEarlLickitungText:
	text "Se potessi vedere"
	line "un MADAME dal vivo"
	para "potrei trovare"
	line "l'ispirazione per"
	cont "finire la statua."
	done
	

ArtistEarlOddishText:
	text "Ho finito la"
	line "statua di MADAME!"
	para "Ora vorrei finire"
	line "la statua di un"
	cont "DRATINI."
	text "Se potessi vedere"
	line "un DRATINI"
	para "potrei trovare"
	line "l'ispirazione per"
	cont "finire la statua."
	done

	
BirdText:
	text "STATUA MADAME"
	line "di PRIMO"
	done
	
DragonText:
	text "STATUA DRATINI"
	line "di PRIMO"
	done

EarlsMuseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 13
	warp_event  3,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtistEarl, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
