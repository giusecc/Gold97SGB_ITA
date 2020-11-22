	object_const_def ; object_event constants
	const OAK2SLAB_OAK2
	const OAK2SLAB_OAK2S_AIDE
	const OAK2SLAB_POKE_BALL1
	const OAK2SLAB_POKE_BALL2
	const OAK2SLAB_POKE_BALL3
	const OAK2SLAB_BLUE
	const OAK2SLAB_SILVER

OakLabBackRoom_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak2 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAK2SLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAK2SLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAK2SLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAK2SLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAK2SLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOak2Callback

.MeetOak2:
	priorityjump .WalkUpToOak2
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOak2Callback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAK2SLAB_OAK2, 4, 2
.Skip:
	return

.WalkUpToOak2:
	applymovement PLAYER, OakLabBackRoom_WalkUpToOak2Movement
	showemote EMOTE_SHOCK, OAK2SLAB_OAK2, 15
	opentext
	writetext Oak2Text_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAK2SLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAK2SLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement OAK2SLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
;	buttonsound
;	waitsfx
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAK2SLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAK2SLAB_SILVER, MoveHeadUp
	setscene SCENE_OAK2SLAB_CANT_LEAVE
	end

OakLabBackRoomSilverScript:
	jumptextfaceplayer Text_Best
	
OakLabBackRoomBlueScript:
	checkevent EVENT_BLUE_ON_RAINBOW_ISLAND
	iftrue .BlueAfterBlueBattle
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext Oak2Text_Accepted2
	waitbutton
	closetext
	end
	
.BlueAfterBlueBattle
	faceplayer
	opentext
	writetext Oak2Text_Accepted3
	waitbutton
	closetext
	end

ProfOak2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue Oak2CheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2GiveTicketScript
Oak2CheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue Oak2CheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue Oak2GiveMasterBallScript
Oak2CheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_OAK
	iftrue Oak2Script_CallYou
	checkevent EVENT_TOLD_OAK2_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse Oak2CheckTogepiEgg
	waitbutton
	closetext
	end

Oak2CheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Oak2AfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue Oak2AfterRadioTowerInPerson
	checkevent EVENT_103_SLOWPOKE_SALESMAN
	iftrue Oak2RocketsReturnedScript
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_OAKS_AIDE ; why are we checking it again?
	iftrue OakHearsYouChallengeLeagueScript ; gonna make this about league challenge
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue Oak2DescribesMrPokemonScript
	writetext Oak2Text_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAK2SLAB_OAK2, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OakLabBackRoom_CantLeaveMovement
	end
	
OakHearsYouChallengeLeagueScript:
	writetext OakHearsYouChallengeLeagueText
	waitbutton
	closetext
	end
	
Oak2RocketsReturnedScript:
	writetext Oak2RocketsReturnedText
	waitbutton
	closetext
	end
	
Oak2AfterRadioTowerInPerson:
	writetext Oak2YoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
Oak2AfterLeagueInPerson:
	writetext Oak2AfterLeagueInPersonText
	waitbutton
	closetext
	end

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem FLAMBEAR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke FLAMBEAR, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CRUISEAL_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic CRUISEAL
	cry CRUISEAL
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL2
	setevent EVENT_GOT_CRUISEAL_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CRUISEAL, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CRUISEAL, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetHappaMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetHappa
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_HAPPA_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

HappaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOak2PokeBallScript
	turnobject OAK2SLAB_OAK2, DOWN
	refreshscreen
	pokepic HAPPA
	cry HAPPA
	waitbutton
	closepokepic
	opentext
	writetext TakeHappaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAK2SLAB_POKE_BALL3
	setevent EVENT_GOT_HAPPA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem HAPPA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke HAPPA, 5, BERRY
	closetext
	applymovement OAK2SLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAK2SLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_OAK_LAB_BACK_ROOM
;	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
;	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump Oak2DirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

Oak2DirectionsScript:
	applymovement OAK2SLAB_OAK2, Oak2ToTable
	turnobject PLAYER, UP
	opentext
	writetext Oak2DirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_OAK2
	opentext
	writetext GotOak2sNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext Oak2DirectionsText2
	waitbutton
	closetext
	opentext
	writetext Oak2DirectionsText3
	waitbutton
	closetext
	applymovement OAK2SLAB_OAK2, Oak2BackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CROWN_CITY
	setscene SCENE_OAK2SLAB_NOTHING
	setmapscene SILENT_TOWN, SCENE_SILENT_NOTHING
	setmapscene OAK_LAB_FRONT_ROOM, SCENE_OAK_LAB_FRONT_ROOM_BATTLE
	setevent EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
	clearevent EVENT_DAISY_OAK_LAB_FRONT_ROOM
	end

Oak2DescribesMrPokemonScript:
	writetext Oak2DescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtOak2PokeBallScript:
	opentext
	writetext Oak2PokeBallText
	waitbutton
	closetext
	end



Oak2GiveEverstoneScript:
	writetext Oak2GiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse Oak2Script_NoRoomForEverstone
	writetext Oak2GiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_OAK
	end

Oak2Script_CallYou:
	writetext Oak2Text_CallYou
	waitbutton
Oak2Script_NoRoomForEverstone:
	closetext
	end

Oak2GiveMasterBallScript:
	writetext Oak2GiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext Oak2GiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

Oak2GiveTicketScript:
	writetext Oak2GiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext Oak2GiveTicketText2
	waitbutton
	closetext
	end

Oak2JumpBackScript1:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpDownScript
	ifequal UP, Oak2JumpUpScript
	ifequal LEFT, Oak2JumpLeftScript
	ifequal RIGHT, Oak2JumpRightScript
	end

Oak2JumpBackScript2:
	closetext
	checkcode VAR_FACING
	ifequal DOWN, Oak2JumpUpScript
	ifequal UP, Oak2JumpDownScript
	ifequal LEFT, Oak2JumpRightScript
	ifequal RIGHT, Oak2JumpLeftScript
	end

Oak2JumpUpScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpUpMovement
	opentext
	end

Oak2JumpDownScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpDownMovement
	opentext
	end

Oak2JumpLeftScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpLeftMovement
	opentext
	end

Oak2JumpRightScript:
	applymovement OAK2SLAB_OAK2, Oak2JumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement OAK2SLAB_OAK2S_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_OAK2SLAB_NOTHING
	end


AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

Oak2sAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

OakLabBackRoomTrashcan:
	jumptext OakLabBackRoomTrashcanText


OakLabBackRoomBookshelf:
	jumpstd DifficultBookshelfScript
	
Oak2BackFromTable:
	step LEFT
	step LEFT
	step DOWN
;	turn_head DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
Oak2ToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetFlambearMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetHappaMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OakLabBackRoom_WalkUpToOak2Movement:
	step UP
	step UP
	step_end

OakLabBackRoom_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksRight2:
	step DOWN
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

AideWalksLeft1:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

Oak2JumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

Oak2JumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

Oak2JumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

Oak2JumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement1:
	step UP
	step_end

OakLabBackRoom_Oak2ToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterFlambearMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterCruiseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterHappaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
Oak2Text_Accepted3:
	text "Ciao <PLAYER>!"
	para "Grazie per la"
	line "lotta!"
	para "Mi sento carico"
	line "come non mai!"
	done
	
Oak2Text_Accepted2:
	text "Come vanno le"
	line "cose, ora che"
	para "hai conquistato"
	line "la LEGA?"
	para "Spero tutto"
	line "bene."
	para "Hai visto <RIVAL>"
	line "di recente?"
	para "So che si sta"
	line "allenando con"
	cont "i suoi #MON."
	para "Credo che abbia"
	line "imparato il"
	para "lavoro di"
	line "squadra."
	done
	
Text_SilverTakeThisOne:
	text "Sicuro della tua"
	line "scelta, <PLAYER>?"
	para "Questo #MON"
	line "sembra più forte!"
	done
	
Text_SilverGetCruise:
	text "<RIVAL> riceve"
	line "CRUISEAL!"
	done
	
Text_SilverGetFlambear:
	text "<RIVAL> riceve"
	line "FLAMBEAR!"
	done
	
Text_SilverGetHappa:
	text "<RIVAL> riceve"
	line "HAPPA!"
	done
		
Text_Best:
	text "Il mio #MON"
	line "sarà il migliore!"
	done

Text_OakDream:
	text "OAK: Realizzare"
	line "una guida completa"
	para "sui #MON di"
	line "tutto il mondo…"
	para "Era il mio sogno!"
	line "Ma #MON nuovi"
	para "vengono scoperti"
	line "anche mentre"
	cont "parliamo!"
	para "Non mi rimane"
	line "molto tempo."
	para "Quindi voi due"
	line "mi aiuterete a"
	para "realizzare il"
	line "mio sogno!"
	para "Vi serve solo un"
	line "#MON!"
	para "Sul tavolo ci sono"
	line "tre # BALL."
	para "Scegliete un"
	line "#MON come"
	cont "compagno!"
	done
	
Text_RivalGenerous:
	text "<RIVAL>: Ti lascio"
	line "scegliere per"
	para "primo <PLAYER>,"
	line "perché sono un"
	para "ragazzo"
	line "generoso!"
	done

Lab_GetDexText:
	text "<PLAYER> riceve"
	line "il #DEX!"
	done
	
Text_OakSpeech:
	text "OAK: Sono il"
	line "PROF.OAK! Avete"
	para "una bella"
	line "faccia tosta!"
	para "Avete tempo per"
	line "ascoltarmi?"
	para "Un anno fa, a"
	line "KANTO, ho affi-"
	para "dato a due ragazzi"
	line "un #MON e un"
	para "#DEX ciascuno"
	line "per aiutarmi"
	cont "nella ricerca."
	para "Alla fine hanno"
	line "fatto un lavoro"
	cont "incredibile!"
	para "Hanno documentato"
	line "150 specie di"
	cont "#MON!"
	para "Comunque, nuovi"
	line "#MON vengono"
	para "scoperti in"
	line "tutta NIHON!"
	para "Per questo mi sono"
	line "spostato da KANTO"
	para "a qui, BORGO"
	line "SILENTE per le"
	cont "mie ricerche."
	para "Mio nipote BLU e"
	line "i miei ASSISTENTI,"
	para "mi aiutano, ma non"
	line "è abbastanza!"
	para "<PLAYER>!"
	para "<RIVAL>!"
	para "Aiutatemi nella"
	line "ricerca!"
	done
	
Text_OakIsOld:
	text "<RIVAL>: Non"
	line "riesco a credere"
	para "che questo vecchio"
	line "sia il PROF.OAK…"
	done

Oak2Text_Intro:
	text "OAK: <PLAYER>!"
	line "Ecco a te!"

	done

Oak2Text_Accepted:
	text "Grazie, <PLAYER>!"

	para "Sono felice che"
	line "aiuterai il"
	cont "nonno."
	done

BlueText_Pokedex:
	text "BLU: In passato"
	line "volevo essere"
	para "l'allenatore più"
	line "forte."
	para "Ma ero troppo"
	line "arrogante…"
	para "Ma qualcuno mi"
	line "fece conoscere"
	cont "l'umiltà."
	para "<PLAYER>, tu mi"
	line "ricordi di lui."
	para "E <RIVAL>!"
	line "Tu mi ricordi di"
	cont "me stesso!"
	para "Bene, allora!"
	para "Ho qualcosa per"
	line "tutti e due!"
	para "Ecco! Tenete"
	line "questi #DEX!"
	para "Registra automa-"
	line "ticamente i dati"
	para "dei #MON"
	line "visti o presi!"
	done

Text_Interesting:
	text "<RIVAL>: Ehi,"
	line "<PLAYER>!"

	para "Si sta facendo"
	line "interessante!"

	done

Oak2Text_LetYourMonBattleIt:
	text "Se un #MON"
	line "selvatico appare,"
	para "fallo lottare con"
	line "il tuo #MON."
	done

LabWhereGoingText:
	text "OAK: Aspettate!"
	line "Dove andate?"
	done

TakeFlambearText:
	text "OAK: Vuoi"
	line "FLAMBEAR, il"
	cont "#MON FUOCO?"
	done

TakeCruiseText:
	text "OAK: Vuoi"
	line "CRUISEAL, il"
	cont "#MON ACQUA?"
	done

TakeHappaText:
	text "OAK: Vuoi"
	line "HAPPA, il"
	cont "#MON ERBA?"
	done

DidntChooseStarterText:
	text "OAK: Pensaci"
	line "attentamente."

	para "Il tuo compagno"
	line "è importante."
	done

ChoseStarterText:
	text "OAK: Credo sia"
	line "un grande"
	cont "#MON!"
	done

ReceivedStarterText:
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Oak2DirectionsText1:
	text "Il PERCORSO 101 e"
	line "le PIANE SILENTI"
	
	para "sono un ottimo"
	line "posto per cercare"
	
	para "#MON. Se volete"
	line "prendere delle"
	
	para "# BALL, dovere"
	line "dirigervi ad"
	
	para "ANCESTRALIA e"
	line "prenderne"
	
	para "un po' al"
	line "#MON-MARKET."
	
	para "Sono sicuro che"
	line "ce la farete!"

	para "Ma se vi servirà,"
	line "ecco il mio numero"

	para "di telefono. Chia-"
	line "matemi se succede"
	cont "qualcosa!"
	done

Oak2DirectionsText2:
	text "Se un #MON è"
	line "ferito, si può"

	para "curare nel"
	line "CENTRO #MON"
	
	para "dietro al"
	line "laboratorio."

	para "Usatelo quando"
	line "volete."
	done

Oak2DirectionsText3:
	text "<PLAYER>."
	para "<RIVAL>."
	para "Conto su di voi!"
	done

GotOak2sNumberText:
	text "<PLAYER> riceve il"
	line "numero telefonico"
	cont "di OAK."
	done

Oak2DescribesMrPokemonText:
	text "È un'opportunità"
	line "incredibile!"
	done

Oak2PokeBallText:
	text "Contiene un"
	line "#MON preso dal"
	cont "PROF.OAK."
	done

OakLabBackRoomHealingMachineText1:
	text "Mi chiedo a cosa"
	line "serva?"
	done

OakLabBackRoomHealingMachineText2:
	text "Vuoi curare i"
	line "tuoi #MON?"
	done

Oak2AfterTheftText1:
	text "OAK: <PLAYER>, è"
	line "is terribile…"

	para "Ah, sì! Qual era"
	line "la scoperta di"
	cont "MR.#MON?"
	done

Oak2AfterTheftText2:
	text "<PLAYER> porge"
	line "al PROF.OAK"
	cont "l'UOVO MISTERO."
	done

Oak2AfterTheftText3:
	text "OAK: Questo?"
	done

Oak2AfterTheftText4:
	text "Ma questo… è un"
	line "UOVO #MON?"

	para "Se è così, è una"
	line "grande scoperta!"
	done

Oak2AfterTheftText5:
	text "OAK: What?!?"

	para ""
	done

Oak2AfterTheftText6:
	text "…<PLAYER>. È"
	line "lunga la strada"

	para "per diventare un"
	line "CAMPIONE."

	para "Prima di partire,"
	line "parla con la"
	cont "mamma."
	done

Oak2StudyingEggText:
	text "OAK: Non arrender-"
	line "ti! Se scopro"

	para "qualcosa sull'UOVO"
	line "ti chiamo!"
	done

Oak2AideHasEggText:
	text "OAK: <PLAYER>?"
	line "Hai visto il mio"
	cont "assistente?"

	para "Ti aspettava con"
	line "l'UOVO al CENTRO"

	para "#MON di"
	line "ANCESTRALIA."

	para "Ma non vi siete"
	line "visti: vai, lo"
	cont "trovi ancora là."
	done

OakHearsYouChallengeLeagueText:
	text "E quindi vuoi"
	line "conquistare la"
	para "LEGA #MON"
	line "di NIHON."
	para "Grandioso!"
	line "Sono sicuro che"
	para "hai tutte le"
	line "capacità per"
	cont "fare grandi cose!"
	done


Oak2GiveEverstoneText1:
	text "Grazie, <PLAYER>!"
	line "Stai aiutando a"

	para "risolvere misteri"
	line "sui #MON!"

	para "Prendi questo come"
	line "segno della nostra"
	cont "gratitudine."
	done



AideText_AfterTheft:
	text "Appreziamo molto"
	line "il tuo aiuto!"
	done

Oak2GiveMasterBallText1:
	text "OAK: Ehi,"
	line "<PLAYER>! Grazie"

	para "al tuo aiuto le"
	line "ricerche vanno"
	cont "alla grande!"

	para "Prendi questo come"
	line "segno di"
	cont "gratitudine."
	done

Oak2GiveMasterBallText2:
	text "La MASTER BALL è"
	line "il massimo!"

	para "È la regina delle"
	line "BALL! Cattura"

	para "qualsiasi #MON,"
	line "e non sbaglia mai."

	para "È conferita solo"
	line "agli scienziati"
	cont "#MON."

	para "Ma credo che tu ne"
	line "possa fare miglior"

	para "uso di me,"
	line "<PLAYER>!"
	done

Oak2GiveTicketText1:
	text "OAK: <PLAYER>!"
	line "Eccoti qui!"

	para "Ti ho fatto venire"
	line "perché ho qualcosa"
	cont "per te."

	para "È un BIGLIETTO"
	line "NAVE."
	done
Oak2GiveTicketText2:
	text "Dal MOLO di"
	line "PORTOVEST partono"
	para "navi per le"
	line "ISOLE MERIDIONALI."
	para "Lì ci sono molti"
	line "#MON rari che"
	para "non si trovano"
	line "sulla terraferma."
	para "Dovresti andarci"
	line "il prima"
	cont "possibile."
	done


AideText_GiveYouPotion:
	text "<PLAYER>, Voglio"
	line "darti qualcosa"
	para "che possa"
	line "esserti utile."
	done

AideText_AlwaysBusy:
	text "Appreziamo il"
	line "tuo aiuto!"
	done

AideText_TheftTestimony:
	text "Appreziamo il"
	line "tuo aiuto!"
	done



OakLabBackRoomTravelTip1Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 1:"

	para "Premi START per"
	line "aprire il MENU."
	done

OakLabBackRoomTravelTip2Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 2:"

	para "Con SALVA puoi"
	line "salvare la tua"
	cont "posizione!"
	done

OakLabBackRoomTravelTip3Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 3:"

	para "Apri lo ZAINO e"
	line "premi SELECT per"
	para "spostare gli"
	line "strumenti."
	done

OakLabBackRoomTravelTip4Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 4"

	para "Premendo A puoi"
	line "spostare le mosse"
	cont "dei tuoi #MON."
	done

OakLabBackRoomTrashcanText:
	text "C'è la carta di"
	line "uno snack del"
	cont "PROF.OAK…"
	done

Oak2GiveEverstoneText2:
	text "È PIETRASTANTE."

	para "Alcune specie di"
	line "#MON si"

	para "evolvono quando"
	line "raggiungono un"
	cont "certo livello."

	para "Se un #MON ha"
	line "una PIETRASTANTE"
	cont "non si evolve."

	para "Dalla ad un #-"
	line "MON che non vuoi"
	cont "far evolvere."
	done

Oak2Text_CallYou:
	text "OAK: <PLAYER>, ti"
	line "chiamerò se suc-"
	cont "cede qualcosa."
	done
	
Oak2RocketsReturnedText:
	text "Ho paura che il"
	line "TEAM ROCKET stia"
	para "organizzando"
	line "qualcosa di"
	cont "terribile…"
	done
	
Oak2YoureBasicallyAHeroText:
	text "È incredibile che"
	line "tu e <RIVAL>"
	para "abbiate sconfitto"
	line "il TEAM ROCKET!"
	para "Siete degli eroi"
	line "per tutti i"
	cont "#MON!"
	para "Continua così e"
	line "aspira al"
	cont "MONTE FUJI!"
	done
	
Oak2AfterLeagueInPersonText:
	text "Complimenti per"
	line "aver conquistato"
	cont "la LEGA!"
	para "È un risultato"
	line "incredibile!"
	para "Grazie ancora"
	line "per avermi aiutato"
	cont "con le ricerche."
	para "Se sei arrivato"
	line "fin qui, hai un"
	para "grande futuro"
	line "davanti a te!"
	done

OakLabBackRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAK_LAB_FRONT_ROOM, 3
	warp_event  4,  7, OAK_LAB_FRONT_ROOM, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAK2SLAB_CANT_LEAVE, LabTryToLeaveScript
;	coord_event  3,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
;	coord_event  4,  7, SCENE_OAK2SLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  2,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  3,  1, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  0,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  1,  0, BGEVENT_READ, OakLabBackRoomBookshelf
	bg_event  9,  3, BGEVENT_READ, OakLabBackRoomTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_OAK2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOak2Script, -1
	object_event  7,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Oak2sAideScript, EVENT_OAK2S_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUISEAL_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HappaPokeBallScript, EVENT_HAPPA_POKEBALL_IN_OAK_LAB_BACK_ROOM
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomBlueScript, EVENT_BLUE_IN_OAK_LAB_BACK_ROOM
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OakLabBackRoomSilverScript, EVENT_SILVER_IN_OAK_LAB_BACK_ROOM
