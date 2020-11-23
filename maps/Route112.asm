	object_const_def ; object_event constants
	const ROUTE112_YOUNGSTER2
	const ROUTE112_YOUNGSTER3
	const ROUTE112_LASS1
	const ROUTE112_POKE_BALL1
	const ROUTE112_FRIEDA
	const ROUTE112_POKE_BALL2
	const ROUTE112_OFFICER
	const ROUTE112_WORKER1
	const ROUTE112_WORKER2
	const ROUTE112_LASS
	const ROUTE112_TREE

Route112_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE112_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE112_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE112_FRIEDA
	return

.FriedaAppears:
	appear ROUTE112_FRIEDA
	return


TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GINA_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_GINA
	iftrue .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerGina1AfterText
	promptbutton
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	checkflag ENGINE_FLYPOINT_AMAMI
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_CROWN
	iftrue .LoadFight1
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_GINA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_GINA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_GINA_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end


TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end


TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	checkflag ENGINE_FLYPOINT_AMAMI
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_CROWN
	iftrue .LoadFight1
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	clearevent EVENT_LIZ_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end




TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end


FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route112GreatBall:
	itemball GREAT_BALL

Route112Tree:
	fruittree FRUITTREE_BOARDWALK

Route112Repel:
	itemball REPEL

Route112Sign:
	jumptext Route112SignText


Route112HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_112_HIDDEN_GREAT_BALL

Route112HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_112_HIDDEN_SUPER_POTION


Route112OfficerScript:
	jumptextfaceplayer Route112OfficerText
	
Route112Worker1Script:
	jumptextfaceplayer Route112Worker1Text

Route112Worker2Script:
	jumptextfaceplayer Route112Worker2Text

Route112OfficerText:
	text "Il maltempo ha"
	line "fatto cadere"
	para "molta neve."
	para "Ha danneggiato"
	line "le porte e"
	para "rotto le"
	line "finestre."
	para "Stiamo cercando"
	line "di ripararle."
	done
	
Route112Worker1Text:
	text "Già!"
	para "INERTOPOLI è"
	line "molto più in"
	para "basso di"
	line "BIANCASELVA."
	para "La neve e i forti"
	line "venti che soffiano"
	para "dall'alto sono"
	line "troppo per questo"
	cont "passaggio!"
	done
	
Route112Worker2Text:
	text "Fai attenzione!"
	para "Potrebbero"
	line "esserci pezzi"
	cont "di vetro in giro."
	para "Dovresti tornare"
	line "quando abbiamo"
	cont "finito i lavori."
	done

YoungsterGordonSeenText:
	text "Ho trovato molti"
	line "#MON nell'erba!"
	done

YoungsterGordonBeatenText:
	text "Uffa. Credevo di"
	line "poter vincere."
	done

YoungsterGordonAfterText:
	text "L'erba è piena"
	line "di sorprese."
	done

CamperRolandSeenText:
	text "Passo il tempo"
	line "campeggiando alla"
	para "base di questo"
	line "colle innevato."
	done

CamperRolandBeatenText:
	text "Oooh. Che"
	line "disdetta."
	done

CamperRolandAfterText:
	text "I luoghi innevati"
	line "sono i migliori"
	cont "per il campeggio!"
	done

PicnickerLiz1SeenText:
	text "Oh, certo. Lo"
	line "sai che…"

	para "Scusa? Una lotta?"
	line "Sono al telefono."

	para "Oh, va bene. Ma"
	line "fai veloce."
	done

PicnickerLiz1BeatenText:
	text "Oh! Devo contenere"
	line "la rabbia!"
	done

PicnickerLiz1AfterText:
	text "Era una bella"
	line "chiamata."
	done



MeetFriedaText:
	text "VERONICA: Sììì!"
	line "È venerdì!"

	para "E io sono VERONICA"
	line "del venerdì!"

	para "Piacere!"
	done

FriedaGivesGiftText:
	text "Eccoti un"
	line "VELENACULEO!"
	done

FriedaGaveGiftText:
	text "VERONICA: Dallo ad"
	line "un #MON con"
	cont "mosse veleno."

	para "Oh!"

	para "È terribile!"

	para "Vedrai come"
	line "migliorerà le"
	cont "mosse veleno!"
	done

FriedaFridayText:
	text "VERONICA: Quale"
	line "giorno preferisci?"

	para "Io il venerdì,"
	line "senza dubbio!"

	para "Non pensi anche tu"
	line "che sia stupendo?"
	done

FriedaNotFridayText:
	text "VERONICA: Oggi è"
	line "venerd', vero?"

	para "Gli altri giorni"
	line "mi annoiano!"
	done

Route112SignText:
	text "PERCORSO 112"

	para "BIANCASELVA -"
	line "INERTOPOLI"
	done
	

PicnickerGina1SeenText:
	text "Sei un allenatore?"

	para "Allora lottiamo!"
	done

PicnickerGina1BeatenText:
	text "Oh, no! Non"
	line "potevo vincere…"
	done

PicnickerGina1AfterText:
	text "Sei troppo forte"
	line "per essere un"
	cont "principiante."
	done


Route112_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 48, ROUTE_112_STAND_GATE, 1
	warp_event 11, 48, ROUTE_112_STAND_GATE, 2
;	warp_event 10, 43, ROUTE_106_POKECENTER_1F, 2


	db 0 ; coord events


	db 3 ; bg events
	bg_event  8,  2, BGEVENT_READ, Route112Sign
	bg_event 15, 48, BGEVENT_ITEM, Route112HiddenGreatBall
	bg_event 14,  4, BGEVENT_ITEM, Route112HiddenSuperPotion

	db 11 ; object events
	object_event 10, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  8, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event  6, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  2, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route112GreatBall, EVENT_ROUTE_112_GREAT_BALL
	object_event 14, 12, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_112_FRIEDA_OF_FRIDAY
	object_event 16, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route112Repel, EVENT_ROUTE_112_REPEL
	object_event 10, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112OfficerScript, EVENT_BLUE_FOREST_SUPER_NERD_BLOCKS_GYM
	object_event 11, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112Worker1Script, EVENT_BLUE_FOREST_SUPER_NERD_BLOCKS_GYM
	object_event 13, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112Worker2Script, EVENT_BLUE_FOREST_SUPER_NERD_BLOCKS_GYM
	object_event  4,  9, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerGina1, -1
	object_event  4, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112Tree, -1
