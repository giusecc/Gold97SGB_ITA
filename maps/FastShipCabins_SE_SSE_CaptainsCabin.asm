	object_const_def ; object_event constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iffalse .FirstCaptainTalk
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end
	
.FirstCaptainTalk
	writetext SSAquaCaptainShipIsBrokenText
	waitbutton
	closetext
;	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN, DOWN
;	pause 20
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
;	closetext
	end
	

.LaterTrip:
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iffalse .GiveMetalCoatCaptain
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
.GiveMetalCoatCaptain
	writetext SSAquaCaptainThankYouText
	waitbutton
	verbosegiveitem METAL_COAT
	iffalse SSCaptain_NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end
	
SSCaptain_NoRoom:
	writetext SSCaptain_NoRoomText
	waitbutton
	closetext
	end
	
;.NoRoom:
;	closetext
;	waitsfx
;	playsound SFX_ELEVATOR_END
;	pause 30
;	opentext
;	writetext SSAquaHasArrivedAmamiText
;	waitbutton
;	setevent EVENT_FAST_SHIP_HAS_ARRIVED
;	setevent EVENT_FAST_SHIP_FOUND_GIRL
;	closetext
;	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end
	
SSCaptain_NoRoomText:
	text "Non hai posto per"
	line "il mio regalo!"
	done
	
SSAquaCaptainThankYouText:
	text "Ah, sei tu!"
	para "Il ragazzo che ha"
	line "aiutato a riparare"
	cont "la nave!"
	para "Grazie mille!"
	para "Come segno di"
	line "gratitudine vorrei"
	para "che prendessi"
	line "questo."
	done
	
	
SSAquaCaptainShipIsBrokenText:
	text "Oooh."
	para "Abbiamo un bel"
	line "problema qui."
	para "A causa del mal-"
	line "tempo il sistema"
	para "del CARBURANTE si"
	line "è danneggiato."
	para "Abbiamo bisogno di"
	line "un TUBO nuovo."
	para "Possiamo arrivare"
	line "fino a NAZE."
	para "Ma non riusciremo"
	line "a tornare indietro"
	para "finché la nave non"
	line "sarà riparata!"
	para "Forse chiedo"
	line "troppo, ma puoi"
	cont "aiutarci?"
	para "C'è un tipo a KUME"
	line "che ripara navi."
	para "Avrà i pezzi di"
	line "cui abbiamo"
	cont "bisogno."
	para "Quando arriviamo,"
	line "potresti aiutarci"
	para "e andare a prende-"
	line "re il pezzo di"
	cont "ricambio?"
	para "Non possiamo"
	line "tornare alla ter-"
	para "raferma senza quel"
	line "pezzo!"
	done

SSAquaCaptainExhaustingText:
	text "Ci aiuterai?"
	done

SSAquaCaptainHowDoYouLikeText:
	text "Senti come naviga"
	line "la M/N ACQUA?"

	para "Scivola dolcemente"
	line "sulle onde."
	done

PokefanmColinSeenText:
	text "Ehi ragazzo! Vuoi"
	line "lottare con me?"
	done

PokefanmColinBeatenText:
	text "Ma sei forte!"
	done

PokefanmColinAfterBattleText:
	text "Viaggi tutto"
	line "solo?"

	para "E tua mamma non"
	line "si preoccupa?"
	done

TwinsMegandpeg1SeenText:
	text "Mi consideri una"
	line "bimba?"
	cont "Non è giusto!"
	done

TwinsMegandpeg1BeatenText:
	text "No, abbiamo perso!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Chiamare bimba una"
	line "ragazza è proprio"
	cont "offensivo!"
	done

TwinsMegandpeg2SeenText:
	text "Bimba non è un bel"

	line "nome per una"
	cont "signora!"
	done

TwinsMegandpeg2BeatenText:
	text "Che sconfitta!"
	done

TwinsMegandpeg2AfterBattleText:
	text "A volte i bambini"
	line "hanno più cervello"
	cont "degli adulti!"
	done

PsychicRodneySeenText:
	text "Silenzio, il mio"
	line "cervello capta dei"
	cont "segnali radio!"
	done

PsychicRodneyBeatenText:
	text "…Sento"
	line "qualcosa!"
	done

PsychicRodneyAfterBattleText:
	text "La sento. Puoi"
	line "sentire la radio"
	cont "di NIHON."
	done

PokefanmJeremySeenText:
	text "Tu che dici? Belli"
	line "i miei #MON,"
	cont "vero?"
	done

PokefanmJeremyBeatenText:
	text "Oh, no! I miei bei"
	line "#MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Devo andare al"
	line "SALONE #MON per"
	para "farli rimettere"
	line "in ordine!"
	done

PokefanfGeorgiaSeenText:
	text "Prima vado al"
	line "CENTRO COMMERCIALE"
	cont "e poi…"
	done

PokefanfGeorgiaBeatenText:
	text "Cosa volevo fare?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Ah, devo ritirare"
	line "i miei #MON"
	cont "dalla PENSIONE!"
	done

SupernerdShawnSeenText:
	text "Che tipi di BALL"
	line "hai con te?"
	done

SupernerdShawnBeatenText:
	text "No! Aspetta!"
	line "Ti prego!"
	done

SupernerdShawnAfterBattleText:
	text "Devi avere le BALL"
	line "giuste per ogni"
	cont "situazione."
	done

SSAquaHasArrivedAmamiText:
	text "La NAVE VELOCE M/N"
	line "ACQUA è giunta"
	cont "a NAZE."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  4, 33, FAST_SHIP_1F, 10
	warp_event  5, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 8 ; object events
	object_event  5, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
