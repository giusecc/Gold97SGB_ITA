	object_const_def ; object_event constants
	const AMAMI_PUBLIC_POOL_SQUIRTLE_GIRL
	const AMAMI_PUBLIC_POOL_SWIMMER_GUY
	const AMAMI_PUBLIC_POOL_SWIMMER_GIRL
	const AMAMI_PUBLIC_POOL_GRANNY
	const AMAMI_PUBLIC_POOL_BUG_CATCHER
	const AMAMI_PUBLIC_POOL_LASS

AmamiPublicPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiPublicPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_13
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_EXPLODING_TRAP_13
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiPublicPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGuyText
	
AmamiPublicPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiPublicPoolSwimmerGirlText
	
AmamiPublicPoolGrannyScript:
	jumptextfaceplayer AmamiPublicPoolGrannyText
	
AmamiPublicPoolBugCatcherScript:
	jumptextfaceplayer AmamiPublicPoolBugCatcherText

AmamiPublicPoolLassScript:
	jumptextfaceplayer AmamiPublicPoolLassText
	
AmamiPublicPoolLassText:
	text "Un ambiente con-"
	line "trollato come una"
	para "piscina può essere"
	line "un posto migliore"
	para "rispetto al mare"
	line "per allenare #-"
	cont "MON ACQUA deboli."
	done
	
AmamiPublicPoolBugCatcherText:
	text "Voglio andare a"
	line "nuotare!"
	done
	
AmamiPublicPoolGrannyText:
	text "Non so più nuotare"
	line "come un tempo,"
	para "ma il mio #MON"
	line "adora l'acqua,"
	para "quindi lo porto"
	line "spesso qui."
	done
	
AmamiPublicPoolSwimmerGirlText:
	text "I #MON acqua"
	line "amano l'acqua!"
	para "Sembra sensato,"
	line "no?"
	done
	
AmamiPublicPoolSwimmerGuyText:
	text "Il nuoto è una"
	line "ottima attività"
	para "per persone e"
	line "#MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> riceve"
	line "SQUIRTLE."
	done
	
AlreadyGotSquirtleText:
	text "Vengo qui per"
	line "nuotare con"
	para "SQUIRTLE quasi"
	line "ogni giorno!"
	done
	
PartyFullSquirtleText:
	text "Hai già troppi"
	line "#MON con te!"
	done
	
NoSquirtleText:
	text "Sei sicuro?"
	para "Sono dei #MON"
	line "incredibili!"
	done
	
	
ILoveSquirtleText:
	text "Gli SQUIRTLE sono"
	line "grandi nuotatori!"
	para "Sei mai andato a"
	line "nuotare con uno"
	cont "SQUIRTLE?"
	para "Dovresti provarci"
	line "una volta!"
	para "Sono fantastici"
	line "anche da allevare!"
	para "Ne ho con me uno"
	line "che ha bisogno di"
	para "qualcuno che lo"
	line "alleni."
	para "Ecco, dovresti"
	line "allevarlo!"
	done
	
GiveSquirtleText:
	text "Fallo crescere"
	line "grande e forte!"
	done
	
AmamiPublicPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 5
	warp_event  7, 17, AMAMI_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGuyScript, -1
	object_event  11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolBugCatcherScript, -1
	object_event 18,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiPublicPoolLassScript, -1
