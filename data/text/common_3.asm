_SlotsStartText::
	text "Via!"
	done

_SlotsNotEnoughCoinsText::
	text "Non hai abbastanza"
	line "gettoni."
	prompt

_SlotsRanOutOfCoinsText::
	text "Acc… Non"
	line "hai più gettoni…"
	done

_SlotsPlayAgainText::
	text "Rigiochi?"
	done

_SlotsLinedUpText::
	text "allineati!"
	line "@"
	text_ram wStringBuffer2
	text " gettoni!"
	done

_SlotsDarnText::
	text "Che sfortuna!"
	done

_GearTodayText::
	text_today
	text_end

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Sei fuori dall'"
	line "area coperta."
	prompt

_PokegearAskWhoCallText::
	text "Chi desideri"
	line "chiamare?"
	done

_PokegearPressButtonText::
	text "Premi un pulsante"
	line "per uscire."
	done

_PokegearAskDeleteText::
	text "Vuoi cancellare"
	line "questo numero?"
	done

_PhoneWrongNumberText::
	text "Eh? Mi spiace,"
	line "numero errato."
	done

_PhoneClickText::
	text "Clic!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Il numero è fuori"
	line "dall'area coperta."
	done

_PhoneJustTalkToThemText::
	text "Potete parlarvi"
	line "di persona!"
	done

_PhoneThankYouText::
	text "Grazie!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
;	text "Password corretta."
	text "Seleziona CONTINUA"
	line "per modificare le"
	cont "impostazioni."
	prompt

_PasswordWrongText::
	text "Password errata!"
	prompt

_PasswordAskResetClockText::
	text "Regolare l'ora?"
	done

_PasswordAskEnterText::
	text "Inserisci la"
	line "password."
	done

_ClearAllSaveDataText::
	text "Cancellare tutti"
	line "i dati salvati?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " impara"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

_MoveAskForgetText::
	text "Quale mossa vuoi"
	next "che dimentichi?"
	done

_StopLearningMoveText::
	text "Bloccare"
	line "l'apprendimento di"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "non ha imparato"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " sta"
	line "provando ad"
	para "apprendere"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Ma @"
	text_ram wMonOrItemNameBuffer
	text " non"
	line "può conoscere più"
	cont "di quattro mosse."

	para "Vuoi cancellare"
	line "una mossa per"
	para "per far posto a"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 e…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text " puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " scorda"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "E…"
	prompt

_MoveCantForgetHMText::
	text "Ora è impossibile"
	line "scordare mosse MN."
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Punti tre gettoni?"
	done

_CardFlipNotEnoughCoinsText::
	text "Pochi gettoni…"
	prompt

_CardFlipChooseACardText::
	text "Scegli una carta."
	done

_CardFlipPlaceYourBetText::
	text "Fai una puntata."
	done

_CardFlipPlayAgainText::
	text "Vuoi giocare"
	line "ancora?"
	done

_CardFlipShuffledText::
	text "Le carte sono"
	line "state mischiate."
	prompt

_CardFlipYeahText::
	text "Sì!"
	done

_CardFlipDarnText::
	text "Che sfortuna…"
	done

_BallDodgedText::
	text "Ha schivato la"
	line "BALL!"

	para "Questo #MON"
	line "non può essere"
	cont "catturato."
	prompt

_BallMissedText::
	text "Ti è sfuggito"
	line "il #MON!"
	prompt

_BallBrokeFreeText::
	text "Oh no! Il #MON"
	line "si è liberato!"
	prompt

_BallAppearedCaughtText::
	text "Ah! Sembrava preso"
	line "eh? E invece no!"
	prompt

_BallAlmostHadItText::
	text "Argh!"
	line "Per un pelo!"
	prompt

_BallSoCloseText::
	text "Nooo! Era così"
	line "vicino!"
	prompt

Text_BallCaught::
	text "Preso! @"
	text_ram wEnemyMonNick
	text_start
	line "è catturato!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " inviato"
	line "al PC di BILL."
	prompt

_NewDexDataText::
	text "Inseriti dati di"
	line "@"
	text_ram wEnemyMonNick
	text_start
	cont "nel #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

_AskGiveNicknameText::
	text "Dai un soprannome"
	line "a @"
	text_ram wStringBuffer1
	text "?"
	done

_ItemStatRoseText::
	text "Sale @"
	text_ram wStringBuffer1
	text " di"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_ItemCantUseOnMonText::
	text "Non si può usare"
	line "su questo #MON."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "Il REPELLENTE"
	line "usato prima è"
	cont "ancora attivo."
	prompt

_PlayedFluteText::
	text "Hai suonato il"
	line "# FLAUTO."

	para "Ah, che melodia"
	line "orecchiabile!"
	prompt

_FluteWakeUpText::
	text "Tutti i #MON"
	line "addormentati si"
	cont "sono svegliati"
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> suona"
	line "il # FLAUTO.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

; BUG: "done" is not a valid terminator here, needs to change to "text_end"
_CoinCaseCountText::
	text "Gettoni:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end
	;done

_RaiseThePPOfWhichMoveText::
	text "Aumenta i PP di"
	line "quale mossa?"
	done

_RestoreThePPOfWhichMoveText::
	text "Ricarica i PP di"
	line "quale mossa?"
	done

_PPIsMaxedOutText::
	text "PP di @"
	text_ram wStringBuffer2
	text_start
	line "al massimo."
	prompt

_PPsIncreasedText::
	text "Aumentati i PP"
	line "di @"
	text_ram wStringBuffer2
	text "."
	prompt

_PPRestoredText::
	text "PP ricaricati."
	prompt

_SentTrophyHomeText::
	text "Dentro c'era un"
	line "trofeo!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " manda"
	line "il trofeo a casa."
	prompt

_ItemLooksBitterText::
	text "Sembra amara…"
	prompt

_ItemCantUseOnEggText::
	text "Non si può usare"
	line "con un UOVO."
	prompt

_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento opportuno!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Appartiene a"
	line "qualcun altro!"
	prompt

_ItemWontHaveEffectText::
	text "Non avrebbe alcun"
	line "effetto."
	prompt

_BallBlockedText::
	text "L'allenatore ha"
	line "bloccato la BALL!"
	prompt

_BallDontBeAThiefText::
	text "Non fare il ladro!"
	prompt

_NoCyclingText::
	text "Non si può andare"
	line "in bici qui."
	prompt

_ItemCantGetOnText::
	text "Non puoi salire su"
	line "@"
	text_ram wStringBuffer1
	text " ora."
	prompt

_BallBoxFullText::
	text "Il BOX #MON è"
	line "pieno! Non puoi"
	para "usare questo"
	line "strumento ora."
	prompt

_ItemUsedText::
	text "<PLAYER> usa"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_ItemGotOnText::
	text "<PLAYER> sale sulla@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> scende"
	line "@"
	text_low
	text "da @"
	text_ram wStringBuffer2
	text "."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " sa"
	line "già @"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Quel #MON sa"
	line "solo una mossa."
	done

_AskDeleteMoveText::
	text "Vuoi che scordi"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Il #MON ha"
	line "scordato la mossa."
	done

_DeleterEggText::
	text "Un UOVO non"
	line "conosce mosse!"
	done

_DeleterNoComeAgainText::
	text "No? Torna quando"
	line "vuoi."
	done

_DeleterAskWhichMoveText::
	text "Quale mossa vuoi"
	line "che dimentichi?"
	prompt

_DeleterIntroText::
	text "Ecco… Sono"
	line "l'ELIMINAMOSSE."

	para "Posso far scordare"
	line "delle mosse ai"
	cont "tuoi #MON."

	para "Vuoi che faccia"
	line "scordare una mossa"
	cont "ad un tuo #MON?"
	done

_DeleterAskWhichMonText::
	text "A quale #MON?"
	prompt

_DSTIsThatOKText::
	text " OL, vero?"
	done

_TimeAskOkayText::
	text ","
	line "è giusto?"
	done

_TimesetAskDSTText::
	text "Vuoi passare"
	line "all'ora legale?"
	done

_TimesetDSTText::
	text "Ho spostato"
	line "l'orologio avanti"
	cont "di un'ora."
	prompt

_TimesetAskNotDSTText::
	text "Vuoi tornare"
	line "all'ora solare?"
	done

_TimesetNotDSTText::
	text "Ho spostato l'"
	line "orologio indietro"
	cont "di un'ora."
	prompt

_TimesetAskAdjustDSTText::
	text "Vuoi spostare"
	line "l'orologio in"

	para "avanti per l'ora"
	line "legale?"
	done

_MomLostGearBookletText::
	text "Ho perso il manua-"
	line "le d'istruzioni"
	cont "del #GEAR."

	para "Puoi tornare fra"
	line "un po'?"
	prompt
