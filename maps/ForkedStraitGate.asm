	object_const_def ; object_event constants
	const FSG_COP
	const FSG_SCIENTIST1
	const FSG_SCIENTIST2
	const FSG_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM ; blue no longer in the lab at silent town
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end
	

CredCheckRight:
	checkevent EVENT_DONE_FS_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	checkevent EVENT_IEJIMA_TOWN_FIXED
	iffalse .NoEntryYet2
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FS_GATE_CHECK
	setevent EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_INIT_RIC_OBJECTS_HIDDEN
	setevent EVENT_RIC_BLUE_HIDDEN
	setevent EVENT_RI_BLUEBATTLE_HIDDEN
.finish
	end
	
.NoEntryYet2
	writetext NoEntryYetText
	waitbutton
	closetext
	applymovement PLAYER, OneStepUpNoEntryYet
	end

OneStepUpNoEntryYet:
	step UP
	step_end
	
NoEntryYetText:
	text "Abbiamo un gruppo"
	line "di ricercatori"
	para "sulle ISOLE"
	line "MERIDIONALI che"
	para "sta facendo studi"
	line "sui #MON."
	para "Non possiamo far"
	line "entrare nessuno,"
	para "neanche chi"
	line "potrebbe farlo"
	cont "normalmente."
	para "Torna con delle"
	line "valide credenziali"
	cont "se vuoi passare."
	done

EventCopHALT:
	text "ALT!"
	done

EventCopText:
	text "Quest'area è"
	line "riservata!"
	
	para "Nessun allenatore"
	line "è autorizzato a"
	cont "passare olt-"
	
	para "Aspetta."
	
	para "… … …"
	line "… … …"
	
	para "Tu sei…"
	
	para "<PLAYER>, sei"
	line "il nuovo CAMPIONE"
	cont "della LEGA?"
	
	para "Sì che lo sei!"
	line "Perdonami!"
	
	para "Le due ISOLE"
	line "MERIDIONALI non"
	para "sono accessibili"
	line "alle persone"
	para "comuni, ma per"
	line "un allenatore"
	para "del tuo livello"
	line "è diverso."
	
	para "Queste isole sono"
	line "un paradiso per"
	para "i #MON, mai"
	line "toccate dall'uomo."
	
	para "In quanto tali"
	line "hanno un valore"
	para "immenso per la"
	line "ricerca."
	
	para "Credo che tu"
	line "sia stato"
	cont "informato da BLU."
	
	para "È passato di qui"
	line "per condurre le"
	para "sue ricerche a"
	line "IRIDISOLA,"
	cont "a ovest."
	
	para "Vai pure!"
	done

FSGCopScript:
	jumptextfaceplayer FSGCopNormalText
	
FSGCopNormalText:
	text "<PLAYER>!"
	line "Puoi passare!"
	done


FSGScientist1Script:
	jumptextfaceplayer FSGScientist1Text
	
FSGScientist1Text:
	text "ISOLA TROPICALE"
	line "a est è piena"
	para "di specie #-"
	line "MON rare!"
	
	para "Sto cercando"
	line "una possibile"
	para "NUOVA SPECIE"
	line "sull'isola."
	done

FSGScientist2Script:
	jumptextfaceplayer FSGScientist2Text
	
FSGScientist2Text:
	text "Sono uno dei pochi"
	line "fortunati che ha"
	para "avuto l'autorizza-"
	line "zione necessaria"
	para "per studiare le"
	line "ISOLE MERIDIONALI."
	
	para "Stanno anche"
	line "stampando delle"
	para "carte promozionali"
	line "con le incredibili"
	para "foto scattate"
	line "durante le nostre"
	cont "ricerche!"
	done


FSGScientist3Script:
	jumptextfaceplayer FSGScientist3Text
	
FSGScientist3Text:
	text "Un antico"
	line "manoscritto"
	para "descrive IRIDISOLA"
	line "come un luogo"
	para "miracoloso, sempre"
	line "avvolto dalla luce"
	cont "dell'arcobaleno."
	
	para "Mi chiedo se sia"
	line "solo una leggenda"
	para "o se l'isola abbia"
	line "davvero qualche"
	cont "potere…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "ISOLA TROPICALE"
	line "TUTTO A EST"
	done
	
RainbowSignText:
	text "IRIDISOLA"
	line "TUTTO A OVEST"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18,  0,  FORKED_STRAIT_NORTH, 1
	warp_event 19,  0,  FORKED_STRAIT_NORTH, 2
	warp_event 37, 13,  FORKED_STRAIT_EAST, 1
	warp_event 36, 13,  FORKED_STRAIT_EAST, 1
	warp_event  0, 13, FORKED_STRAIT_WEST, 1
	warp_event  1, 13, FORKED_STRAIT_WEST, 1

	db 2 ; coord events
	coord_event 18,  4, SCENE_DEFAULT, CredCheckLeft
	coord_event 19,  4, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 34,  6, BGEVENT_READ, TropicalSign
	bg_event  2,  6, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event 16,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist1Script, -1
	object_event  8,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist2Script, -1
	object_event 28,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FSGScientist3Script, -1
	
