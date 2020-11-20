	object_const_def ; object constants
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_FALKNER

KurtsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneFalknerVisit1 ; SCENE_DEFAULT
	scene_script .SceneKurtsHouseNothing ;

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtCallback
	
.SceneFalknerVisit1
	priorityjump .SceneFalknerVisit2
	end

.SceneFalknerVisit2
	applymovement PLAYER, WalkUpToFalkner
	showemote EMOTE_SHOCK, KURTSHOUSE_FALKNER, 15
	applymovement KURTSHOUSE_FALKNER, FalknerWalksToYou
	opentext
	writetext FalknerGreets
	waitbutton
	closetext
	applymovement KURTSHOUSE_FALKNER, FalknerLeaves
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_FALKNER
	clearevent EVENT_PAGOTA_GYM_FALKNER
	pause 15
	applymovement PLAYER, WalkUpToKurt
	pause 15
	opentext
	writetext KurtTalks
	waitbutton
	closetext
	
	setscene SCENE_KURTS_HOUSE_NOTHING
	end
	
.SceneKurtsHouseNothing:
	end

.KurtCallback:
;	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iffalse .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	return

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
.Done:
	return

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_GOT_5F_SAGE_BLESSING
	iftrue .GotBlessing
	writetext UnknownText_0x18e473
	waitbutton
	closetext
;	special FadeOutMusic
;	setevent EVENT_BIRDON_TOWN_SLOWPOKETAIL_ROCKET
;	checkcode VAR_FACING
;	ifequal UP, .RunAround
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
	end

;.RunAround:
;	turnobject PLAYER, DOWN
;	playsound SFX_FLY
;	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
;	playsound SFX_EXIT_BUILDING
;	disappear KURTSHOUSE_KURT1
;	waitsfx
;	special RestartMapMusic
;	end

.GotBlessing:
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	writetext KurtsHouseKurtBallsFromApricornsText
	promptbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

.KurtMakingBallsScript:
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LEVEL_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem MOON_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FRIEND_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem FAST_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem HEAVY_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitem LOVE_BALL
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat


Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end




Kurt2:
	faceplayer
	opentext
;	checkevent EVENT_GAVE_GS_BALL_TO_KURT
;	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, LEFT
	end
Falkner:
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseLeafeonStatue:
	jumptext KurtsHouseLeafeonStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script
	
WalkUpToKurt:
	step RIGHT
	step UP
	step_end

WalkUpToFalkner:
	slow_step UP
	slow_step UP
	step_end
	
FalknerWalksToYou:
	step LEFT
	turn_head DOWN
	step_end
	
FalknerLeaves:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x18e46c:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

UnknownText_0x18e473:
	text "Sali in cima alla"
	line "PENTATORRE."
	para "È la tua grande"
	line "sfida da"
	cont "allenatore."
	done

UnknownText_0x18e615:
	text "Hai imparato molto"
	line "sui #MON."
	para "Voglio darti una"
	line "mano."
	para "Posso costruire"
	line "delle #BALL"
	para "speciali, che"
	line "potrebbero esserti"
	cont "utili."
	para "Ecco, questa è"
	line "una."
	done

KurtsHouseKurtBallsFromApricornsText:
	text "FRANZ: realizzo"
	line "BALL dalle GHI-"
	cont "COCCHE."
	
	para "Raccoglile dagli"
	line "alberi e portale"
	cont "a me."
	
	para "Ci costruirò"
	line "delle BALL."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "FANZ: hai una"
	line "GHICOCCA?"

	para "Bene, ci farò"
	line "una BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "FRANZ: ci vorrà un"
	line "giorno per la"

	para "BALL. Torna più"
	line "tardi."
	done

KurtsHouseKurtThatsALetdownText:
	text "FRANZ: Oh…"
	line "Che delusione."
	done

KurtsHouseKurtDontBotherMeText:
	text "FRANZ: Sto lavo-"
	line "rando! Non"
	cont "disturbarmi!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "FRANZ: Ah, <PLAYER>!"
	line "Ho appena finito"
	cont "la tua BALL. Ecco!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "FRANZ: È venuta"
	line "bene."

	para "Usala per cat-"
	line "turare i #MON."
	done

UnknownText_0x18e863:
	text "Credo di essere"
	line "migliorato, ora"

	para "riesco a lavorare"
	line "più velocemente."
	done

UnknownText_0x18e8ab:
	text "C-Cos'è questo?"

	para "Non ne ho mai"
	line "vista una."

	para "Ha l'aspetto di"
	line "una # BALL,"

	para "ma sembra essere"
	line "altro."

	para "Lascia che la"
	line "guardi."
	done

UnknownText_0x18e934:
	text "Sto controllando."
	done

UnknownText_0x18e949:
	text "Ah! Ecco!"
	line "Dunque…"
	done

UnknownText_0x18e95c:
	text "<PLAYER>!"

	para "Questa BALL si è"
	line "mossa mentre la"
	cont "controllavo."

	para "C'è qualcosa di"
	line "strano!"
	done



KurtsHouseSlowpokeText:
	text "SLOWPOKE: …"
	line "Ooouuh!"
	done

KurtsHouseOakPhotoText:
	text "È FRANZ nella"
	line "TORRE con un"
	para "SAGGIO e un tipo"
	line "con un cappello"
	cont "da CAPITANO."
	done

KurtsHouseLeafeonStatueText:
	text "È la statua del"
	line "protettore del"
	cont "bosco."
	done
	
FalknerGreets:
	text "VALERIO: e tu"
	line "chi sei?"
	para "<PLAYER>, eh?"
	line "Cosa ti porta"
	cont "qui?"
	para "Sono sicuro che"
	line "sia perché non"
	para "sono dove dovrei"
	line "essere."
	para "Tornerò alla"
	line "PALESTRA così"
	para "potrai sfidarmi!"
	para "…"
	para "Eh?"
	para "Non vuoi sfidare"
	line "la LEGA #MON?"
	para "Perché sei ad"
	line "ANCESTRALIA?"
	para "…"
	para "È incredibile che"
	line "il PROF.OAK ti"
	para "abbia chiesto di"
	line "aiutarlo con le"
	cont "sue ricerche."
	para "Ma vedo una luce"
	line "nei tuoi occhi!"
	para "Tu vuoi essere"
	line "CAMPIONE della"
	cont "LEGA!"
	para "Quando vuoi, vieni"
	line "a sfidarmi!"
	para "Ora devo andare."
	para "Spero di vederti"
	line "presto!"
	done
	
KurtTalks:
	text "FRANZ: L'ho capito"
	line "quando sei"
	cont "entrato."
	para "Hai un enorme"
	line "potenziale come"
	cont "allenatore."
	para "Lo pensa anche"
	line "VALERIO."
	para "Dovresti davvero"
	line "provare a"
	para "conquistare la"
	line "LEGA."
	para "Ma a parte questo,"
	line "voglio aiutarti"
	para "con le tue"
	line "ricerche dandoti"
	para "qualcosa con cui"
	line "catturare i"
	cont "#MON."
	para "Ma prima devi"
	line "superare una"
	cont "prova."
	para "La PENTATORRE di"
	line "ANCESTRALIA è"
	para "un luogo sacro in"
	line "cui ho trascorso"
	para "molti anni per"
	line "affinare le mie"
	para "conoscenze sul"
	line "legame tra persone"
	cont "e #MON."
	para "Ti chiedo di"
	line "salire in cima"
	cont "alla TORRE."
	para "Fallo, poi torna"
	line "da me."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 10
	warp_event  4,  7, PAGOTA_CITY, 10

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  0, BGEVENT_READ, KurtsHouseRadio
	bg_event 14,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event 15,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  0, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  7,  0, BGEVENT_READ, KurtsHouseLeafeonStatue

	db 3 ; object events
	object_event  4,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event 15,  4, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event  4,  3, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Falkner, EVENT_KURTS_HOUSE_FALKNER
