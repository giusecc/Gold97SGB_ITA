_CantSurfText::
	text "Non puoi usare"
	line "SURF qui."
	prompt

_AlreadySurfingText::
	text "Stai già usando"
	line "SURF."
	prompt

_AskSurfText::
	text "L'acqua è calma."
	line "Vuoi usare SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " usa"
	line "CASCATA!"
	done

_HugeWaterfallText::
	text "Ma è una"
	line "cascata enorme."
	done

_AskWaterfallText::
	text "Vuoi usare"
	line "CASCATA?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " usa"
	line "FOSSA!"
	done

_UseEscapeRopeText::
	text "<PLAYER> usa"
	line "FUNE DI FUGA."
	done

_CantUseDigText::
	text "Non si può usare"
	line "qui."
	done

_TeleportReturnText::
	text "Torna all'ultimo"
	line "CENTRO #MON."
	done

_CantUseTeleportText::
	text "Non si può usare"
	line "qui."

	para ""
	done

_AlreadyUsingStrengthText::
	text "Un #MON sta già"
	line "usando FORZA."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " usa"
	line "FORZA!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " può"
	line "spostare i massi."
	prompt

_AskStrengthText::
	text "Forse un #MON"
	line "può spostarlo."

	para "Vuoi usare"
	line "FORZA?"
	done

_BouldersMoveText::
	text "Ora è possibile"
	line "spostare oggetti"
	cont "pesanti!"
	done

_BouldersMayMoveText::
	text "Forse un #MON"
	line "può spostarlo."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " usa"
	line "MULINELLO!"
	prompt

_MayPassWhirlpoolText::
	text "È un insidioso"
	line "mulinello."

	para "Forse un #MON"
	line "può attraversarlo."
	done

_AskWhirlpoolText::
	text "C'è un mulinello"
	line "davanti a te."

	para "Vuoi usare"
	line "MULINELLO?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " usa"
	line "BOTTINTESTA!"
	prompt

_HeadbuttNothingText::
	text "Niente…"
	done

_AskHeadbuttText::
	text "Potrebbe esserci"
	line "un #MON"
	cont "nell'albero."

	para "Vuoi usare"
	line "BOTTINTESTA?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " usa"
	line "SPACCAROCCIA!"
	prompt

_MaySmashText::
	text "Forse un #MON"
	line "può frantumarla."
	done

_AskRockSmashText::
	text "La roccia sembra"
	line "frantumabile."

	para "Vuoi usare"
	line "SPACCAROCCIA?"
	done

_RodBiteText::
	text "Ehi!"
	line "Ha abboccato!"
	prompt

_RodNothingText::
	text "Neanche una"
	line "vecchia ciabatta!"
	prompt

; unreferenced
_UnusedNothingHereText::
	text "Sembra che non ci"
	line "sia niente qua."
	prompt

_CantGetOffBikeText::
	text "Non puoi scendere"
	line "qui!"
	done

_GotOnBikeText::
	text "<PLAYER> sale su"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> scende"
	line "da @"
	text_ram wStringBuffer2
	text "."
	done


_CantGetOffBoardText::
	text "Non puoi scendere"
	line "qui!"
	done

_GotOnBoardText::
	text "<PLAYER> sale su"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBoardText::
	text "<PLAYER> scende"
	line "da @"
	text_ram wStringBuffer2
	text "."
	done


_AskCutText::
	text "L'albero si può"
	line "tagliare (TAGLIO)."

	para "Vuoi usare TAGLIO?"
	done

_CanCutText::
	text "L'albero si può"
	line "tagliare (TAGLIO)!"
	done

_FoundItemText::
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "Ma <PLAYER> non"
	line "può trasportare"
	cont "altri strumenti!"
	done

_WhitedOutText::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è"
	line "crollato."
	done

_ItemfinderItemNearbyText::
	text "Bene! Il DETECTOR"
	line "ha rilevato uno"
	cont "strumento vicino."
	prompt

_ItemfinderNopeText::
	text "No! Il DETECTOR"
	line "non risponde."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "è esausto!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è"
	line "crollato.!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text_start
	line "usa PROFUMINO!"
	done

_SweetScentNothingText::
	text "Pare che non ci"
	line "sia nulla qui…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> spruzza"
	line "dell'acqua."

	para "Ma non accade"
	line "nulla…"
	done

_UseSacredAshText::
	text "I #MON di"
	line "<PLAYER> sono"
	cont "guariti!"
	done

_AnEggCantHoldAnItemText::
	text "Un UOVO non può"
	line "tenere strumenti."
	prompt

_PackNoItemText::
	text "Nessuno strumento."
	done

_AskThrowAwayText::
	text "Quantità da"
	line "buttare?"
	done

_AskQuantityThrowAwayText::
	text "Buttare @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text "Hai buttato"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	prompt

_YouDontHaveAMonText::
	text "Non hai #MON!"
	prompt

_RegisteredItemText::
	text "Assegnato:"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "Strumento non"
	line "assegnabile."
	prompt

_AskItemMoveText::
	text "Dove vuoi"
	line "spostarlo?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Non si può usare"
	line "durante la lotta."
	prompt

_ActorNameText::
	text "<USER>@@"

_UsedMove1Text::
	text_start
	line "usa @@"

_UsedMove2Text::
	text_start
	line "usa @@"

_UsedInsteadText::
	text "invece,"
	cont "@@"

_MoveNameText::
	text_ram wStringBuffer2
	db "@@"

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BattleEffectActivate::
	text_ram wStringBuffer2
	text " di"
	line "<USER>"
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>sale di molto!"
	prompt

_BattleStatWentUpText::
	text " sale!"
	prompt

Text_BattleFoeEffectActivate::
	text_ram wStringBuffer2
	text " di"
	line "<TARGET>"
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>cala di molto!"
	prompt

_BattleStatFellText::
	text " cala!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "genera TURBINE!"
	prompt

_BattleTookSunlightText::
	text_start
	line "assorbe la luce!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "abbassa la testa!"
	prompt

_BattleGlowingText::
	text_start
	line "sta brillando!"
	prompt

_BattleFlewText::
	text_start
	line "è volato in alto!"
	prompt

_BattleDugText::
	text_start
	line "scava una fossa!"
	prompt

Text_BreedHuh::
	text "Eh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " esce"
	line "dall'UOVO!@"
	sound_caught_mon
	text_promptbutton
	text_end

_BreedAskNicknameText::
	text "Vuoi dare un"
	line "soprannome a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "È @"
	text_ram wBreedMon2Nick
	text ","
	line "che hai lasciato"
	para "con la PADRONA"
	line "DELLA PENSIONE."
	done

_LeftWithDayCareManText::
	text "È @"
	text_ram wBreedMon1Nick
	text ","
	line "che hai lasciato"
	para "con il PADRONE"
	line "DELLA PENSIONE."
	done

_BreedBrimmingWithEnergyText::
	text "È pieno di"
	line "energia."
	prompt

_BreedNoInterestText::
	text "Nessun interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "Sembra interessato"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "È amichevole con"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "Mostra interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Qui non c'è alcun"
	line "MESSAGGIO."
	prompt

_MailClearedPutAwayText::
	text "Il MESSAGGIO"
	line "cancellato è stato"
	cont "messo via."
	prompt

_MailPackFullText::
	text "Lo ZAINO è pieno."
	prompt

_MailMessageLostText::
	text "Il contenuto del"
	line "MESSAGGIO andrà"
	cont "perso. Continui?"
	done

_MailAlreadyHoldingItemText::
	text "Tiene già uno"
	line "strumento."
	prompt

_MailEggText::
	text "Un UOVO non può"
	line "tenere un"
	cont "MESSAGGIO."
	prompt

_MailMovedFromBoxText::
	text "Tolto il MESSAGGIO"
	line "dal BOX MESSAGGI."
	prompt

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " inviato"
	line "al PC di BILL."
	prompt

_PCGottaHavePokemonText::
	text "Devi avere dei"
	line "#MON per"
	cont "chiamare!"
	prompt

_PCWhatText::
	text "Cosa?"
	done

_PCMonHoldingMailText::
	text "Un #MON ha"
	line "un MESSAGGIO."

	para "Rimuovi il"
	line "MESSAGGIO."
	prompt

_PCNoSingleMonText::
	text "Non hai neanche"
	line "un #MON!"
	prompt

_PCCantDepositLastMonText::
	text "Non puoi: è il tuo"
	line "ultimo #MON!"
	prompt

_PCCantTakeText::
	text "Non puoi portare"
	line "altri #MON."
	prompt

_ContestCaughtMonText::
	text "Preso @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Spostare #MON?"
	done

_ContestAlreadyCaughtText::
	text "Hai già un"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "Vince la Gara"
	line "Pigliamosche @"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "che ha catturato"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "Il vincitore ha"
	line "@"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punti!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Al secondo posto è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punti!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Al terzo posto c'è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punti!"
	prompt

_MagikarpGuruMeasureText::
	text "Fammi misurare"
	line "quel MAGIKARP."

	para "… Misura"
	line "@"
	text_ram wStringBuffer1
	text "cm."
	prompt

_KarpGuruRecordText::
	text "RECORD ATTUALE:"

	para "@"
	text_ram wStringBuffer1
	text " cm preso da"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

_LuckyNumberMatchPartyText::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id"

	para "di @"
	text_ram wStringBuffer1
	text ","
	line "della tua squadra."
	prompt

_LuckyNumberMatchPCText::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id"

	para "di @"
	text_ram wStringBuffer1
	text ""
	line "nel tuo BOX PC."
	prompt

_CaughtAskNicknameText::
	text "Dai un soprannome"
	line "a @"
	text_ram wStringBuffer1
	text_start
	cont "che hai ricevuto?"
	done

_PokecenterPCCantUseText::
	text "Ehi! Devi avere un"
	line "#MON per"
	cont "usare questo!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> accende"
	line "il PC."
	prompt

_PlayersPCAskWhatDoText::
	text "Cosa vuoi fare?"
	done

_PlayersPCHowManyWithdrawText::
	text "Quantità da"
	line "ritirare?"
	done

_PlayersPCWithdrewItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Non hai spazio per"
	line "altri strumenti."
	prompt

_PlayersPCNoItemsText::
	text "Non hai strumenti"
	line "da depositare."
	prompt

_PlayersPCHowManyDepositText::
	text "Quantità da"
	line "depositare?"
	done

_PlayersPCDepositItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomDepositText::
	text "Non c'è spazio per"
	line "altri strumenti."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> accende"
	line "il PC."
	prompt

_PokecenterPCWhoseText::
	text "A quale PC"
	line "vuoi accedere?"
	done

_PokecenterBillsPCText::
	text "Accesso al"
	line "PC di BILL."

	para "Aperto il Sistema"
	line "Memoria #MON."
	prompt

_PokecenterPlayersPCText::
	text "Accesso al tuo PC."

	para "Aperto il Sistema"
	line "Memoria Strumenti."
	prompt

_PokecenterOaksPCText::
	text "Accesso al PC del"
	line "PROF.OAK."

	para "Aperto il Sistema"
	line "Valutaz. #DEX."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Fine collegamento…"
	done

_OakPCText1::
	text "Vuoi far valutare"
	line "il tuo #DEX?"
	done

_OakPCText2::
	text "Attuale livello di"
	line "completamento del"
	cont "#DEX:"
	prompt

_OakPCText3::
	text "#MON visti: @"
	text_ram wStringBuffer3
	text_start
	line "#MON presi: @"
	text_ram wStringBuffer4
	text_start

	para "Valutazione del"
	line "PROF.OAK:"
	done

_OakRating01::
	text "Cerca i #MON"
	line "nelle aree erbose!"
	done

_OakRating02::
	text "Bene, vedo che hai"
	line "capito come usare"
	cont "le # BALLS."
	done

_OakRating03::
	text "Stai diventando"
	line "bravo."

	para "Ma devi fare molta"
	line "strada ancora."
	done

_OakRating04::
	text "Devi riempire il"
	line "#DEX."

	para "Cattura #MON"
	line "di diverso tipo!"
	done

_OakRating05::
	text "Ti impegni, si"
	line "vede."

	para "Il tuo #DEX sta"
	line "prendendo forma."
	done

_OakRating06::
	text "Certi #MON si"
	line "evolvono crescendo"

	para "di livello, altri"
	line "usano le PIETRE."
	done

_OakRating07::
	text "Hai un AMO?"
	line "Pescando puoi"

	para "catturare dei"
	line "#MON."
	done

_OakRating08::
	text "Eccellente! Ti"
	line "piacciono le"
	cont "collezioni, vero?"
	done

_OakRating09::
	text "Certi #MON si"
	line "fanno vedere solo"

	para "in determinate ore"
	line "del giorno."
	done

_OakRating10::
	text "Il tuo #DEX sta"
	line "facendo progressi:"
	cont "continua così!"
	done

_OakRating11::
	text "Bene, vedo che fai"
	line "evolvere i #MON"

	para "senza limitarti a"
	line "cacciarli."
	done

_OakRating12::
	text "Hai già incontrato"
	line "FRANZ? Le sue #"
	para "BALLS potrebbero"
	line "servirti."
	done

_OakRating13::
	text "Ehi. Hai catturato"
	line "più #MON tu"

	para "che nell'ultima"
	line "ricerca #DEX."
	done

_OakRating14::
	text "Scambi i tuoi"
	line "#MON?"

	para "È dura farcela"
	line "da soli!"
	done

_OakRating15::
	text "Hai raggiunto i"
	line "200! Il tuo"
	cont "#DEX è super!"
	done

_OakRating16::
	text "Hai catturato"
	line "tanti #MON!"

	para "Stai dando un"
	line "grande aiuto"
	cont "ai miei studi!"
	done

_OakRating17::
	text "Magnifico!"
	line "Potresti già"

	para "diventare uno"
	line "studioso dei"
	cont "#MON!"
	done

_OakRating18::
	text "Il tuo #DEX è"
	line "impressionante!"

	para "Sei pronto per"
	line "diventare un"
	cont "professionista."
	done

_OakRating19::
	text "Ma questo è un"
	line "#DEX perfetto!"

	para "È sempre stato il"
	line "mio sogno."
	cont "Complimenti!"
	done

_OakPCText4::
	text "Collegamento con"
	line "il PC del PROF."
	cont "OAK terminato."
	done

_DummyGameYeahText::
	text " , sì!"
	done

_DummyGameDarnText::
	text "Acc…"
	done

_StartMenuContestEndText::
	text "Vuoi terminare la"
	line "Gara?"
	done

_ItemsTossOutHowManyText::
	text "Quantità da"
	line "buttare?"
	done

_ItemsThrowAwayText::
	text_ram wStringBuffer2
	text ":"
	line "ne butti @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	
	text "?"
	done

_ItemsDiscardedText::
	text "Operazione"
	line "completata."
	prompt

_ItemsTooImportantText::
	text "Troppo importante"
	line "per disfarsene!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>! Non"
	line "puoi usare quello"
	cont "strumento ora!"
	done

_PokemonSwapItemText::
	text "Preso(a)"
	line "@"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "da @"
	text_ram wStringBuffer1
	text " e"

	para "sostituito(a) con"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text_ram wMonOrItemNameBuffer
	text "tiene"
	line "@"
	text_ram wStringBuffer2
	text " ora."
	prompt

_PokemonRemoveMailText::
	text "Prima devi"
	line "togliere il"
	cont "MESSAGGIO!"
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " non"
	line "sta tenendo nulla."
	prompt

_ItemStorageFullText::
	text "Non hai più spazio"
	line "per gli strumenti."
	prompt

_PokemonTookItemText::
	text "Togli @"
	text_ram wStringBuffer1
	text_start
	line "a @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tiene già"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Sostituire?"
	done

_ItemCantHeldText::
	text "Questo strumento"
	line "non si può tenere."
	prompt

_MailLoseMessageText::
	text "Il MESSAGGIO per-"
	line "derà il contenuto."
	cont "Proseguire?"
	done

_MailDetachedText::
	text "Preso MESSAGGIO da"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Non c'è spazio per"
	line "spostare il"
	cont "MESSAGGIO."
	prompt

_MailAskSendToPCText::
	text "Vuoi spedire il"
	line "MESSAGGIO"
	cont "al tuo PC?"
	done

_MailboxFullText::
	text "Il BOX MESSAGGI"
	line "del PC è pieno."
	prompt

_MailSentToPCText::
	text "MESSAGGIO spedito"
	line "al tuo PC."
	prompt

_PokemonNotEnoughHPText::
	text "PS insufficienti!"
	prompt

_MayRegisterItemText::
	text "Puoi assegnare uno"
	line "strumento dello"

	para "ZAINO al pulsante"
	line "SELECT."
	done

_MainMenuTimeUnknownText::
	text "Ora sconosciuta"
	done

_OakText1::
	text "Ciao! Scusa se"
	line "ti ho fatto"
	cont "attendere."

	para "Benvenuto nel"
	line "mondo dei #MON!"

	para "Mi chiamo OAK."

	para "Ma per tutti sono"
	line "PROF.#MON."
	prompt

_OakText2::
	text "Questo mondo è"
	line "abitato da"
	cont "creature che"
	cont "chiamiamo #MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

_OakText4::
	text "I #MON e gli"
	line "umani convivono"

	para "aiutandosi a"
	line "vicenda."

	para "Alcuni giocano con"
	line "i #MON, altri"
	cont "li fanno lottare."
	prompt

_OakText5::
	text "Ma sappiamo ancora"
	line "troppo poco sui"
	cont "#MON."

	para "Molti misteri"
	line "devono ancora"
	cont "essere svelati."

	para "Per questo studio"
	line "i #MON tutti"
	cont "i giorni."
	prompt

_OakText6::
	text "Come hai detto"
	line "che ti chiami?"
	prompt

_OakText7::
	text "<PLAYER>, sei"
	line "pronto?"

	para "Stai per scrivere"
	line "la tua personalis-"
	cont "sima storia nel"
	para "mondo dei"
	line "#MON."

	para "Vivrai esperienze"
	line "divertenti e"
	para "affronterai"
	line "impegnative sfide."

	para "Con i #MON ti"
	line "attende un mondo"

	para "di sogno"
	line "e avventura."
	cont "Cosa aspetti?"

	para "Ci vediamo fra un"
	line "po'!"
	done

_ClockTimeMayBeWrongText::
	text "L'ora potrebbe"
	line "essere sbagliata."

	para "Regola di nuovo"
	line "l'orologio."
	prompt

_ClockSetWithControlPadText::
	text "Regola con la"
	line "pulsantiera di"
	cont "comanto."

	para "Conferma: A"
	line "Annulla:  B"
	done

_ClockIsThisOKText::
	text "Va bene?"
	done

_ClockHasResetText::
	text "Hai regolato"
	line "l'orologio."
	done

_LinkTimeoutText::
	text "È trascorso"
	line "troppo tempo"
	cont "Riprova."
	prompt

_LinkTradeCantBattleText::
	text "Se scambi quel"
	line "#MON non"
	cont "potrai lottare."
	prompt

_LinkAbnormalMonText::
	text_ram wStringBuffer1
	text_start
	line "del tuo amico"
	cont "sembra irregolare."
	prompt

_LinkAskTradeForText::
	text "Scambi @"
	text_ram wceef
	text_start
	line "per @"
	text_ram wStringBuffer1
	text "?"
	done

_WouldYouLikeToSaveTheGameText::
	text "Vuoi salvare il"
	line "gioco?"
	done

_SavingDontTurnOffThePowerText::
	text "SALVATAGGIO…"
	line "NON SPEGNERE."
	done

_SavedTheGameText::
	text "<PLAYER> ha"
	line "salvato il gioco."
	done

_AlreadyASaveFileText::
	text "C'è già un gioco"
	line "salvato in"
	para "memoria. Vuoi"
	line "sostituirlo?"
	done

_AnotherSaveFileText::
	text "C'è già un file di"
	line "salvataggio. Vuoi"
	cont "sostituirlo?"
	done

_SaveFileCorruptedText::
	text "Il file di"
	line "salvataggio è"
	cont "danneggiato!"
	prompt

_ChangeBoxSaveText::
	text "Quando cambi"
	line "BOX #MON i"
	para "dati vengono"
	line "salvati. Va bene?"
	done

_MoveMonWOMailSaveText::
	text "Quando sposti un"
	line "#MON i dati"
	para "vengono salvati."
	line "Va bene?"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "La finestra di"
	line "area was exceeded."
	done

_WindowPoppingErrorText::
	text "No windows avail-"
	line "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG event"
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> mette"
	line "@"
	text_ram wStringBuffer1
	text " nella"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "La @"
	text_ram wStringBuffer3
	text_start
	line "è piena…"
	prompt

_CongratulationsYourPokemonText::
	text "Complimenti! Il"
	line "tuo @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "si è evoluto in"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Bloccata evoluzio-"
	line "ne di @"
	text_ram wStringBuffer2
	text "."
	prompt

_EvolvingText::
	text "Cosa?! @"
	text_ram wStringBuffer2
	text_start
	line "si sta evolvendo!"
	done

_MartHowManyText::
	text "Quanti/e?"
	done

_MartFinalPriceText::
	text_ram wStringBuffer2
	text ":"
	line "in tutto fa"
	cont "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Ciao!"

	para "Vendo erbe"
	line "medicinali a"
	cont "basso prezzo."

	para "Fanno bene, ma"
	line "sono un po' amare."

	para "Forse ai #MON"
	line "non piaceranno."

	para "Eheheh…"
	done

_HerbalLadyHowManyText::
	text "Quanti/e?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text ":"
	line "spendi ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Grazie caro."
	line "Eheheh…"
	done

_HerbalLadyPackFullText::
	text "Oh, il tuo ZAINO"
	line "è pieno."
	done

_HerbalLadyNoMoneyText::
	text "Eheheh… Non hai"
	line "abbastanza soldi."
	done

_HerbalLadyComeAgainText::
	text "Torna a trovarmi."
	line "Eheheh…"
	done

_BargainShopIntroText::
	text "Ehi, vuoi fare un"
	line "affare?"

	para "Vendo strumenti"
	line "che ho solo io, ma"

	para "solo un esemplare"
	line "per ognuno."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costa"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Va bene?"
	done

_BargainShopThanksText::
	text "Grazie."
	done

_BargainShopPackFullText::
	text "Ops, il tuo ZAINO"
	line "è pieno zeppo."
	done

_BargainShopSoldOutText::
	text "Hai già acquistato"
	line "questo strumento."
	cont "Non ne ho più."
	done

_BargainShopNoFundsText::
	text "Ops, sei a corto"
	line "di denaro."
	done

_BargainShopComeAgainText::
	text "Torna a trovarmi"
	line "quando vuoi."
	done

_PharmacyIntroText::
	text "Che c'è? Vuoi"
	line "qualche medicina?"
	done

_PharmacyHowManyText::
	text "Quanti/e?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text ":"
	line "spendi ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Grazie mille!"
	done

_PharmacyPackFullText::
	text "Non hai abbastanza"
	line "spazio."
	done

_PharmacyNoMoneyText::
	text "Come? Non hai"
	line "abbastanza soldi."
	done

_PharmacyComeAgainText::
	text "Ok."
	line "Ci si vede."
	done

;unused
_NothingToSellText::
	text "Non hai nulla da"
	line "vendere."
	prompt

_MartSellHowManyText::
	text "Quanti/e?"
	done

_MartSellPriceText::
	text "Posso darti"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Che ne dici?"
	done

_MartWelcomeText::
	text "Salve, cosa posso"
	line "fare per te?"
	done

_MartThanksText::
	text "Ecco qui."
	line "Grazie."
	done

_MartNoMoneyText::
	text "Non hai abbastanza"
	line "denaro."
	done

_MartPackFullText::
	text "Non puoi portare"
	line "altri strumenti."
	done

_MartCantBuyText::
	text "Spiacente, non"
	line "posso comprarlo."
	done

_MartComeAgainText::
	text "Torna a trovarmi!"
	done

_MartAskMoreText::
	text "Cos'altro posso"
	line "fare per te?"
	done

_MartBoughtText::
	text "Ricevuti ¥@"
	text_decimal hMoneyTemp, 3, 6
	text_start
	line "per @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Quanto vuoi"
	line "puntare?"
	done
