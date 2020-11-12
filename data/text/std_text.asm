NurseMornText:
	text "Buongiorno! Sei al"
	line "CENTRO #MON."
	done

NurseDayText:
	text "Salve! Sei al"
	line "CENTRO #MON."
	done

NurseNiteText:
	text "Buonasera! Vedo"
	line "che stai in giro"

	para "fino a tardi! Sei"
	line "al CENTRO #MON."
	done

NurseAskHealText:
	text "Rimettiano in"
	line "sesto i #MON."

	para "Vuoi che guariamo"
	line "anche i tuoi?"
	done

NurseTakePokemonText:
	text "Benissimo. Posso"
	line "vederli?"
	done

NurseReturnPokemonText:
	text "Grazie per"
	line "l'attesa."

	para "Ora i tuoi #MON"
	line "sono in perfetta"
	cont "forma!"
	done

NurseGoodbyeText:
	text "Arrivederci!"
	done

; not used
	text "Arrivederci!"
	done

NursePokerusText:
	text "Pare che strani"
	line "organismi viventi"

	para "si siano legati"
	line "ai tuoi #MON."

	para "I #MON sono"
	line "in salute e"
	para "sembrano non avere"
	line "problemi."

	para "Ma non possiamo"
	line "dirti di più qui"
	cont "al CENTRO #MON."
	done

DifficultBookshelfText:
	text "È pieno di libri"
	line "complicati."
	done

PictureBookshelfText:
	text "Un'intera"
	line "collezione di"
	para "libri illustrati"
	line "dei #MON!"
	done

MagazineBookshelfText:
	text "Riviste #MON…"
	line "AMICO #MON,"

	para "MANUALE #MON,"
	line "GRAFICA #MON…"
	done

TeamRocketOathText:
	text "Il GIURAMENTO"
	line "di TEAM ROCKET"

	para "Ruba i #MON per"
	line "trarne profitto!"

	para "Sfrutta i #MON"
	line "per trarne"
	cont "profitto!"

	para "I #MON esistono"
	line "solo per la gloria"
	cont "di TEAM ROCKET!"
	done

IncenseBurnerText:
	text "E questo cos'è?"

	para "Ah, un incensiere:"
	line "serve per bruciare"
	cont "l'incenso."
	done

MerchandiseShelfText:
	text "È tutta merce de-"
	line "dicata ai #MON!"
	done

LookTownMapText:
	text "È la MAPPA CITTÀ."
	done

WindowText:
	text "La mia immagine"
	line "riflessa!"
	cont "Niente male!"
	done

TVText:
	text "Un televisore."
	done

HomepageText:
	text "La HOME PAGE del"
	line "GIORNALE #MON…"

	para "Non è ancora stata"
	line "aggiornata…"
	done

; not used
	text "RADIO #MON!"

	para "Chiama ora e fai"
	line "la tua dedica!"
	done

TrashCanText:
	text "Qui non c'è"
	line "proprio niente…"
	done

; not used
	text "Forse un #MON"
	line "è in grado di"
	cont "spostarlo."
	done

; not used
	text "Forse un #MON"
	line "è in grado di"
	cont "frantumarla."
	done

PokecenterSignText:
	text "CENTRO #MON"
	line "Rimetti in sesto"
	cont "i tuoi #MON!"
	done

MartSignText:
	text "Per ogni esigenza"
	line "dei tuoi #MON"

	para "#MON-MARKET"
	done

ContestResults_ReadyToJudgeText:
	text "Ora giudicheremo"
	line "i #MON da voi"
	cont "catturati."

	para "<……>"
	line "<……>"

	para "Abbiamo scelto i"
	line "vincitori!"

	para "Allora, siete"
	line "pronti?"
	done

AskNumber1MText:
	text "Caspita! Sei un"
	line "osso duro."

	para "Mi dai il tuo"
	line "numero?"

	para "Ti chiamerò per"
	line "la rivincita."
	done

AskNumber2MText:
	text "Vuoi registrare il"
	line "numero?"
	done

RegisteredNumberMText:
	text "<PLAYER> registra"
	line "il numero di"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done

NumberAcceptedMText:
	text "Ti telefono se"
	line "succede qualcosa."
	done

NumberDeclinedMText:
	text "Come vuoi…"
	line "Se vuoi il mio"

	para "numero, basta"
	line "dirmelo."
	done

PhoneFullMText:
	text "Il tuo telefono"
	line "non può memoriz-"
	cont "zare altri numeri."
	done

RematchMText:
	text "Ti stavo"
	line "aspettando."
	cont "Dai, lottiamo!"
	done

AskNumber1FText:
	text "La tua classe è"
	line "eccezionale."

	para "Mi dai il tuo"
	line "numero telefonico?"

	para "Ti chiamerò per"
	line "una rivincita."
	done

AskNumber2FText:
	text "Vuoi registrare il"
	line "numero telefonico?"
	done

RegisteredNumberFText:
	text "<PLAYER> registra"
	line "il numero di"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done

NumberAcceptedFText:
	text "Ti chiamo se"
	line "succede qualcosa."
	done

NumberDeclinedFText:
	text "Come vuoi…"
	line "Quando vuoi il mio"

	para "numero, basta"
	line "dirmelo."
	done

PhoneFullFText:
	text "Il tuo telefono"
	line "non può memoriz-"
	cont "zare altri numeri."
	done

RematchFText:
	text "Ti stavo proprio"
	line "aspettando."
	cont "Dai, lottiamo!"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER> vince il"
	line "premio N. @"
	text_ram wStringBuffer3
	text ","
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Partecipa alla"
	line "prossima Gara!"
	done

ContestResults_ConsolationPrizeText:
	text "Tutti gli altri"
	line "avranno una BACCA"
	cont "come consolazione."
	done

ContestResults_DidNotWinText:
	text "Andrà meglio la"
	line "prossima volta."
	done

ContestResults_ReturnPartyText:
	text "Vi restituiamo i"
	line "#MON che vi"

	para "abbiamo tenuto."
	line "Ecco qui."
	done

ContestResults_PartyFullText:
	text "La tua squadra è"
	line "completa, il"

	para "#MON è stato"
	line "mandato al BOX"
	cont "del PC di BILL."
	done

GymStatue_CityGymText:
	text "PALESTRA di"
	line "@"
	text_ram wStringBuffer3
	text ""
	done

GymStatue_WinningTrainersText:
	text "CAPO: @"
	text_ram wStringBuffer4
	text_start
	para "ALLENAT. VINCENTI:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Questo è il"
	line "CASINÒ."
	done

CoinVendor_NoCoinCaseText:
	text "Ti servono"
	line "dei gettoni?"

	para "Oh, ti manca un"
	line "SALVADANAIO per i"
	cont "gettoni."
	done

CoinVendor_IntroText:
	text "Ti servono altri"
	line "gettoni?"

	para "50 gettoni"
	line "costano ¥1000."
	cont "Quanti ne vuoi?"
	done

CoinVendor_Buy50CoinsText:
	text "Grazie!"
	line "Eccoti 50 gettoni."
	done

CoinVendor_Buy500CoinsText:
	text "Grazie. Eccoti"
	line "500 gettoni."
	done

CoinVendor_NotEnoughMoneyText:
	text "Non hai abbastanza"
	line "denaro."
	done

CoinVendor_CoinCaseFullText:
	text "Ah, il tuo SALVA-"
	line "DANAIO è pieno."
	done

CoinVendor_CancelText:
	text "Nessun gettone?"
	line "Arrivederci."
	done

BugContestPrizeNoRoomText:
	text "Eh? Il tuo ZAINO"
	line "è pieno."

	para "Per oggi te lo"
	line "terremo noi, torna"

	para "dopo aver liberato"
	line "del posto."
	done

HappinessText3:
	text "Grande! Tu e i"
	line "tuoi #MON siete"
	cont "proprio affiatati!"
	done

HappinessText2:
	text "I #MON sono"
	line "più amichevoli se"

	para "dedichi loro un"
	line "po' del tuo tempo."
	done

HappinessText1:
	text "Il tuo #MON non"
	line "è ben"
	cont "addomesticato."

	para "Se non lo tratti"
	line "con amore mette"
	cont "il broncio."
	done
