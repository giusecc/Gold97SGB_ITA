	object_const_def ; object_event constants
	const ALLOYHOUSEBETA_ELDER
;	const ALLOYHOUSEBETA_RHYDON

AlloyHouseBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyHouseBetaElderScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingHoOh
	faceplayer
	opentext
	writetext AlloyHouseBetaElderIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyHouseBetaElderEvilText
	waitbutton
	closetext
	end
	
.NoEvilLeft
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .NotBlessed
	writetext AlloyHouseBetaElderText2
	yesorno
	iffalse AlloyElderNoStory
	writetext AlloyElderStoryText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .ElderWalkAroundPlayer
	applymovement ALLOYHOUSEBETA_ELDER, ElderWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYHOUSEBETA_ELDER
	setevent EVENT_PAGOTA_CITY_EARL
	setevent EVENT_EARLS_ACADEMY_EARL
	clearevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
.ElderWalkAroundPlayer
	applymovement ALLOYHOUSEBETA_ELDER, ElderWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYHOUSEBETA_ELDER
	setevent EVENT_PAGOTA_CITY_EARL
	setevent EVENT_EARLS_ACADEMY_EARL
	clearevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene FIVE_FLOOR_TOWER_5F, SCENE_HO_OH_EVENT
	end
	
.NotBlessed
	writetext AlloyHouseBetaElderNotBlessedText
	waitbutton
	closetext
	end
	
.AfterEverythingHoOh
	faceplayer
	opentext
	writetext SometimesYouLiveLongEnough
	waitbutton
	closetext
	end
	
AlloyElderNoStory:
	writetext AlloyHouseBetaElderAnotherTime
	waitbutton
	closetext
	end
	
ElderWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
ElderWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnough:
	text "A volte vivi tanto"
	line "a lungo da vedere"
	para "cose che non ti"
	line "saresti mai"
	cont "aspettato."
	para "Io ho incontrato"
	line "l'uccello della"
	cont "leggenda."
	para "Un evento davvero"
	line "magico."
	para "Sai, dovresti"
	line "andare in cerca"
	para "dei #MON"
	line "leggendari di"
	cont "NIHON."
	para "Se HO-OH tornasse,"
	line "tutto sarebbe"
	cont "possibile."
	done
	
AlloyElderStoryText:
	text "Ascolta bene…"
	para "Molti anni fa,"
	line "NIHON era protetta"
	para "da un nobile"
	line "uccello, dalle ali"
	cont "come il fuoco."
	para "L'uccello fece il"
	line "suo nido sulla"
	para "punta della"
	line "PENTATORRE di"
	cont "ANCESTRALIA."
	para "Lì riposò"
	line "per anni e anni."
	para "Alcuni dicono che"
	line "attese per secoli."
	para "Tuttavia,"
	line "divenne irrequieto"
	para "e un giorno"
	line "funesto lasciò la"
	cont "cima della torre."
	para "Quando spiegò le"
	line "sue ali, ne cadde"
	cont "cenere."
	para "Da questa cenere"
	line "nacquero tre"
	para "bestie, per"
	line "proteggere NIHON"
	para "in attesa del"
	line "suo ritorno."
	para "Le bestie si"
	line "divisero e"
	para "da allora nessuno"
	line "le ha mai"
	cont "più viste."
	para "Ma si sa che"
	line "sono rimaste"
	para "a NIHON, vegliando"
	line "sulla regione"
	cont "in segreto."
	para "Si dice che un"
	line "giorno l'uccello"
	cont "farà ritorno."
	para "…"
	para "Credo che il"
	line "giorno sia vicino."
	para "Sarà così?"
	done
	
AlloyHouseBetaElderAnotherTime:
	text "Sarà per un'altra"
	line "volta."
	done

AlloyHouseBetaElderText2:
	text "Vuoi sentire una"
	line "leggenda"
	cont "di NIHON?"
	done
	
AlloyHouseBetaElderIntroText:
	text "Spero un giorno"
	line "di assistere"
	para "alla conclusione"
	line "della leggenda."
	done

AlloyHouseBetaElderEvilText:
	text "Percepisco una"
	line "presenza malvagia"
	cont "sopra NIHON."
	para "L'uccello non"
	line "ritornerà con"
	cont "questa ombra."
	done
	
AlloyHouseBetaElderNotBlessedText:
	text "Potrebbe accadere"
	line "da un momento"
	cont "all'altro."
	para "Non so se tu"
	line "potresti essere"
	para "l'allenatore"
	line "a cui l'uccello"
	para "si presenterà."
	done

AlloyHouseBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyHouseBetaElderScript, EVENT_PAGOTA_CITY_EARL
