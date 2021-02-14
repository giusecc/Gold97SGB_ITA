	object_const_def ; object_event constants
	const TEAMROCKETBASEB1F_POKE_BALL
	const TEAMROCKETBASEB1F_GRUNTM8
	const TEAMROCKETBASEB1F_GRUNTM9
	const TEAMROCKETBASEB1F_GRUNTM10
	const TEAMROCKETBASEB1F_GRUNTM14
	const TEAMROCKETBASEB1F_GRUNTM15
	const TEAMROCKETBASEB1F_GRUNTM16
	const TEAMROCKETBASEB1F_SCIENTISTROSS
	const TEAMROCKETBASEB1F_SCIENTISTMITCH
	const TEAMROCKETBASEB1F_SILVER
	const TEAMROCKETBASEB1F_IMPOSTOR
	const TEAMROCKETBASEB1F_RAITORA

TeamRocketBaseB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .DamagedSystem
	
.DamagedSystem:
	checkevent EVENT_ROCKET_MACHINE_DAMAGED
	iffalse .Done
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
	changeblock 13, 19, $4B ; damage
	changeblock 15, 19, $49 ; damage
	changeblock 17, 19, $4B ; damage
.Done:
	return

ImposterCompEncounter:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksToImposterComputer
	opentext
	writetext YoureNotOakCompScene
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTOR, 20
	turnobject TEAMROCKETBASEB1F_IMPOSTOR, LEFT
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterJumpsBack
	pause 5
	opentext
	writetext HowDidYouKidsGetDownHereText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_IMPOSTOR, ImposterRunsOff
	opentext
	writetext SilverHeyWaitWhatsGoingOnText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, ImposterRunsOff
	disappear TEAMROCKETBASEB1F_SILVER
	disappear TEAMROCKETBASEB1F_IMPOSTOR
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	setevent EVENT_JADE_FOREST_LASS
	end


TeamRocketBaseB1FTMThief:
	itemball TM_PSYCH_UP

TeamRocketBaseB1FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_FULL_HEAL


TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end


TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end
	

TrainerGruntM16:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end
	
TrainerScientistRoss:
	trainer SCIENTIST, ROSS, EVENT_BEAT_SCIENTIST_ROSS, ScientistRossSeenText, ScientistRossBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRossAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMitch:
	trainer SCIENTIST, MITCH, EVENT_BEAT_SCIENTIST_MITCH, ScientistMitchSeenText, ScientistMitchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMitchAfterBattleText
	waitbutton
	closetext
	end
	
TeamRocketBaseB1FComputerConsole:
;	setevent EVENT_ROUTE_105_BATTLE
	checkevent EVENT_WESTPORT_CITY_ROCKET_SCOUT
	iftrue .SystemIsOff
	opentext
	playsound SFX_BOOT_PC
	pause 50
	writetext TeamRocketBaseB1FComputerConsoleIntroText
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.SystemIsOff
	opentext
	writetext SystemAlreadyOff
	waitbutton
	closetext
	end

TeamRocketBaseB1FComputerConsole_loop:
	writetext ConsoleWhatDo
	loadmenu TeamRocketBaseB1FComputerConsoleMenu
	verticalmenu
	closewindow
	ifequal 1, .consolemenu1
	ifequal 2, .consolemenu2
	ifequal 3, .consolemenu3
	jump TeamRocketBaseB1FComputerConsole_cancel

	
.consolemenu1
	writetext ConsoleMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu2
	writetext ConsoleMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolemenu3
	writetext ConsoleMenu3Text
	waitbutton
	playsound SFX_CHOOSE_PC_OPTION
TeamRocketBaseB1FComputerPower_loop:
	writetext ConsoleWhatDoPower
	loadmenu TeamRocketBaseB1FComputerConsolePowerMenu
	verticalmenu
	closewindow
	ifequal 1, .consolepowermenu1
	ifequal 2, .consolepowermenu2
	ifequal 3, .consolepowermenu3
	jump TeamRocketBaseB1FComputerConsole_loop
	
.consolepowermenu1
	writetext ConsolePowerMenu1Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu2
	writetext ConsolePowerMenu2Text
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.consolepowermenu3
	writetext ConsolePowerMenu3Text
	waitbutton
	checkevent EVENT_ROUTE_105_BATTLE
	iftrue .KnowsPasswordShutDown
	jump TeamRocketBaseB1FComputerPower_loop
	
.KnowsPasswordShutDown
	writetext PasswordEntered
.PowerYesOrNo1:
	yesorno
	iftrue .PowerYesOrNo2
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.PowerYesOrNo2
	writetext AreYouSurePowerText
	pause 30
	yesorno
	iftrue .ShutdownTime
	writetext ReturningToPowerMenu
	waitbutton
	jump TeamRocketBaseB1FComputerPower_loop
	
.ShutdownTime
	writetext SystemShuttingDown
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	setevent EVENT_WESTPORT_CITY_ROCKET_SCOUT
	pause 15
	moveobject TEAMROCKETBASEB1F_SILVER, 13, 25
	appear TEAMROCKETBASEB1F_SILVER
	applymovement TEAMROCKETBASEB1F_SILVER, SilverWalksLeftToMachine
	opentext
	writetext WowItsShuttingDown
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	moveobject TEAMROCKETBASEB1F_RAITORA, 14, 20
	appear TEAMROCKETBASEB1F_RAITORA
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	playsound SFX_BALL_POOF
	waitsfx
	cry RAITORA
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	pause 15
	opentext
	writetext RaitoraDestroyThisThing
	waitbutton
	closetext
;	pause 15
;	pause 5
	opentext
	writetext RaitoraDestroyThisThing2
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_RAITORA, RaitoraJumpsUp
	pause 15
	opentext
	writetext RaitoraDestroysTheThing
	waitbutton
	closetext
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 11, 13, $4D ; damage
	changeblock 19, 13, $4F ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 11, 15, $4C ; damage
	changeblock 19, 15, $4E ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_ZAP_CANNON
	earthquake 80
	special FadeOutPalettes
	changeblock 11, 19, $48 ; damage
	changeblock 19, 19, $4A ; damage
	special FadeInPalettes
	reloadmappart	
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applymovement TEAMROCKETBASEB1F_RAITORA, RaitoraJumpsDown
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 13, 19, $4B ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 15, 19, $49 ; damage
	special FadeInPalettes
	reloadmappart
	waitsfx
	playsound SFX_MEGA_PUNCH
	earthquake 80
	special FadeOutPalettes
	changeblock 17, 19, $4B ; damage
	special FadeInPalettes
	reloadmappart
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	playsound SFX_SHUT_DOWN_PC
	waitsfx
	pause 15
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	opentext
	writetext RaitoraDestroyedTheThing
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear TEAMROCKETBASEB1F_RAITORA
	pause 10
	turnobject TEAMROCKETBASEB1F_SILVER, LEFT
	turnobject TEAMROCKETBASEB1F_SILVER, UP
	opentext
	writetext RaitoraDestroyedTheThing2
	waitbutton
	closetext
	moveobject TEAMROCKETBASEB1F_GRUNTM8, 13, 25
	appear TEAMROCKETBASEB1F_GRUNTM8
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyWalksUp
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_GRUNTM8, 20
	opentext
	writetext WhatHaveYouDoneText
	waitbutton
	closetext
	pause 15
	turnobject TEAMROCKETBASEB1F_GRUNTM8, DOWN
	opentext
	writetext WhatHaveYouDoneText2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_GRUNTM8, TeamRocketGuyLeaves
	turnobject TEAMROCKETBASEB1F_SILVER, DOWN
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_SILVER, 20
	opentext
	writetext WaitGottaFindOut
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_SILVER, TeamRocketGuyLeaves
	disappear TEAMROCKETBASEB1F_GRUNTM8
	disappear TEAMROCKETBASEB1F_GRUNTM9
	disappear TEAMROCKETBASEB1F_GRUNTM10
	disappear TEAMROCKETBASEB1F_GRUNTM14
	disappear TEAMROCKETBASEB1F_GRUNTM15
	disappear TEAMROCKETBASEB1F_GRUNTM16
	disappear TEAMROCKETBASEB1F_SCIENTISTROSS
	disappear TEAMROCKETBASEB1F_SCIENTISTMITCH
	disappear TEAMROCKETBASEB1F_SILVER
	setevent EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_ROCKET_MACHINE_DAMAGED
	jumpstd RadioTowerRocketsScript
	end

	
TeamRocketBaseB1FComputerConsoleMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataConsole
	db 1 ; default option

.MenuDataConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "SISTEMA@"
	db "STATO CORRENTE@"
	db "POTENZA@"
	db "DISCONNETTI@"
	
TeamRocketBaseB1FComputerConsolePowerMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuDataPowerConsole
	db 1 ; default option

.MenuDataPowerConsole:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "AUMENTA POTENZA@"
	db "RIDUCI POTENZA@"
	db "SPEGNI@"
	db "MENU PRECEDENTE@"
	
TeamRocketBaseB1FComputerConsole_cancel:
	writetext TeamRocketBaseB1FComputerConsoleCancelText
	waitbutton
	playsound SFX_SHUT_DOWN_PC
	closetext
	end
	
TeamRocketGuyLeaves:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ImposterRunsOff:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
ImposterJumpsBack:
	turn_head LEFT
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end
	
SilverWalksToImposterComputer:
	step RIGHT
	step UP
	turn_head RIGHT
	step_end
	
SilverWalksLeftToMachine:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step_end
	
TeamRocketGuyWalksUp:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end
	
RaitoraJumpsUp:
	jump_step UP
	step_end

RaitoraJumpsDown:
	jump_step DOWN
	step_end
	
WaitGottaFindOut:
	text "<RIVAL>: Fermo!"
	line "Ce ne sono"
	cont "ancora!?"
	para "Forza,"
	line "<PLAYER>!"
	para "Vedrò cosa"
	line "significa!"
	para "Vieni anche tu!"
	para "Dobbiamo farli"
	line "fuori, una volta"
	cont "per tutte!"
	done
	
WhatHaveYouDoneText:
	text "GENERALE: No!"
	para "Cos'hai fatto?!"
	para "Hai rovinato il"
	line "nostro duro"
	cont "lavoro!"
	para "GIOVANNI sarà"
	line "furioso quando"
	para "verrà a"
	line "saperlo!"
	para "Ma sarà ancora"
	line "più furioso con"
	para "voi due se mai"
	line "vi incontrerà!"
	done
	
WhatHaveYouDoneText2:
	text "…"
	para "Speravo che non"
	line "si arrivasse a"
	cont "questo."
	para "Ma il TEAM ROCKET"
	line "non è ancora"
	cont "finito!"
	para "Abbiamo ancora"
	line "un piano."
	para "E vogliamo"
	line "attuarlo!"
	done
	
RaitoraDestroyedTheThing:
	text "<RIVAL>: Bel"
	line "lavoro, RAITORA!"
	para "Ce l'hai fatta!"
	done
	
RaitoraDestroyedTheThing2:
	text "Ora questa cosa"
	line "non farà più"
	cont "male ai #MON!"
	done
	
RaitoraDestroysTheThing:
	text "RAITORA:"
	line "Raiiiii!!"
	done
	
RaitoraDestroyThisThing:
	text "Vai! RAITORA!"
	done
	
RaitoraDestroyThisThing2:
	text "Mettiti qui e"
	line "distruggilo con"
	para "il tuo"
	line "FULMINE!"
	done
	
WowItsShuttingDown:
	text "<RIVAL>: Ehi,"
	line "<PLAYER>!"
	para "L'hai spento!"
	para "Sai cosa ho"
	line "scoperto?"
	para "Questo macchinario"
	line "era in grado di"
	para "controllare le"
	line "menti dei #MON!"
	para "Questo era il"
	line "piano del TEAM"
	cont "ROCKET!"
	para "È terribile!"
	para "Non credo sia"
	line "abbastanza"
	cont "spegnerlo!"
	para "Bisogna"
	line "distruggerlo!"
	done
	
HowDidYouKidsGetDownHereText:
	text "OAK IMPOSTORE: Ehi"
	line "come siete arriva-"
	cont "ti qui sotto!"
	para "Nessuno dei non"
	line "autorizzati"
	para "dovrebbe stare"
	line "vicino al"
	cont "macchinario!"
	para "È un'antenna"
	line "molto potente e"
	para "richiede molto"
	line "tempo per"
	cont "caricarsi!"
	para "Non importa,"
	line "non potete"
	para "spegnerlo finché"
	line "non conoscete"
	cont "la password!"
	para "Non la potrete"
	line "scoprirla in"
	cont "nessun modo!"
	para "Dirò al capo che"
	line "abbiamo degli"
	cont "intrusi!"
	done
	
SilverHeyWaitWhatsGoingOnText:
	text "Ehi, aspetta!"
	para "Cos'è tutto"
	line "questo!?"
	para "Esigo una"
	line "risposta!"
	done
	
YoureNotOakCompScene:
	text "<RIVAL>: Ehi,"
	para "cosa succede"
	line "qui!?"
	para "Tu non sei il"
	line "PROF.OAK!"
	done
	
SystemAlreadyOff:
	text "Il sistema non"
	line "fa rumore e"
	para "sembra"
	line "inutilizzabile…"
	done
	
SystemShuttingDown:
	text "CONFERMA"
	para "SPEGNIMENTO"
	line "POTENZA"
	para "---------"
	para "--------"
	para "-------"
	para "------"
	para "-----"
	para "----"
	para "---"
	para "--"
	para "-"
	done
	
AreYouSurePowerText:
	text "SEI ASSOLUTAMENTE"
	line "SICURO?"
	done
	
ReturningToPowerMenu:
	text "RITORNA AL"
	line "MENU PRECEDENTE…"
	done
	
PasswordEntered:
	text "<PLAYER> inserisce"
	line "la password…"
	para "'VIVA GIOVANNI'"
	para "…"
	para "ATTENZIONE!"
	line "L'AZIONE NON PUÒ"
	para "ESSERE"
	line "ANNULLATA!"
	para "CONFERMARE DI"
	line "NUOVO."
	para "VUOI SPEGNERE"
	line "TUTTO IL"
	cont "SISTEMA?"
	done
	
ConsoleWhatDoPower:
	text "SELEZIONA"
	line "REGOLAZIONI"
	cont "DI POTENZA"
	done
	
ConsolePowerMenu1Text:
	text "LA POTENZA"
	line "STA AUMENTANDO!"
	done
	
ConsolePowerMenu2Text:
	text "QUESTA FUNZIONE"
	line "NON È"
	cont "DISPONIBILE"
	done
	
ConsolePowerMenu3Text:
	text "PASSWORD RICHIESTA"
	line "PER QUESTA"
	cont "FUNZIONE"
	done
	
ConsoleWhatDo:
	text "MENU -"
	line "SCEGLI AZIONE"
	done
	
ConsoleMenu1Text:
	text "SISTEMA CONTROLLO"
	line "MENTALE"
	cont "VERSIONE 1.03"	
	done
	
ConsoleMenu2Text:
	text "CAPACITÀ CORRENTE-"
	line "74 PERCENTO…"
	done
	
ConsoleMenu3Text:
	text "MENU IMPOSTAZIONI"
	line "POTENZA"
	done
	
TeamRocketBaseB1FComputerConsoleCancelText:
	text "SPEGNIMENTO"
	line "CONSOLE…"
	done
	
TeamRocketBaseB1FComputerConsoleIntroText:
	text "AVVIO"
	line "CONSOLE CONTROLLO"
	cont "TEAM ROCKET"
	done

ScientistMitchSeenText:
	text "Il nostro segnale"
	line "di controllo ci"
	para "farà comandare"
	line "il mondo!"
	done
	
ScientistMitchBeatenText:
	text "Finché sarà"
	line "funzionante."
	done
	
ScientistMitchAfterBattleText:
	text "I risultati"
	line "scientifici del"
	para "TEAM ROCKET sono"
	line "incredibili!"
	done


ScientistRossSeenText:
	text "Cosa stiamo"
	line "facendo qui?"
	para "Niente di che."
	para "Vogliamo solo"
	line "prendere il"
	para "controllo dei"
	line "#MON nel mondo!"
	done
	
ScientistRossBeatenText:
	text "Tu non sei sotto"
	line "il nostro"
	cont "controllo…"
	done
	
ScientistRossAfterBattleText:
	text "L'antenna non è"
	line "a massima potenza."
	para "Ci mette un sacco"
	line "di tempo per"
	cont "caricarsi."
	done

GruntM16SeenText:
	text "Di nuovo?"
	para "Sono stanco di"
	line "vederti in giro."
	done
	
GruntM16BeatenText:
	text "Sono stanco di"
	line "perdere."
	done
	
GruntM16AfterBattleText:
	text "Sono stanco di"
	line "lavorare per il"
	para "TEAM ROCKET."
	done


GruntM15SeenText:
	text "Sei una spina"
	line "nel fianco, lo"
	cont "sai?"
	done
	
GruntM15BeatenText:
	text "Anche questo"
	line "fa male!"
	done
	
GruntM15AfterBattleText:
	text "Sai, per noi"
	line "è un problema"
	para "avere voi"
	line "ragazzini in giro."
	done


GruntM14SeenText:
	text "Siamo esaltati"
	line "da quello che"
	cont "sta succedendo!"
	para "Non voglio vedere"
	line "ragazzini qui!"
	done
	
GruntM14BeatenText:
	text "Come osi!"
	done
	
GruntM14AfterBattleText:
	text "Non provare a"
	line "fermarci!"
	done


GruntM10SeenText:
	text "Ti farò vedere"
	line "cosa succede a"
	cont "chi si intromette!"
	done
	
GruntM10BeatenText:
	text "Ho perso…"
	done
	
GruntM10AfterBattleText:
	text "Ho perso quando"
	line "sei comparso…"
	done

GruntM9SeenText:
	text "Sarò io a"
	line "fermarti!"
	done
	
GruntM9BeatenText:
	text "Perché mi"
	line "aspettavo altro?"
	done
	
GruntM9AfterBattleText:
	text "Noi RECLUTE non"
	line "abbiamo tempo per"
	para "allenare i"
	line "#MON."
	done
	
GruntM8SeenText:
	text "Non sei di qui!"
	para "Solo membri del"
	line "TEAM ROCKET!"
	done
	
GruntM8BeatenText:
	text "Non devi stare"
	line "qui…"
	done
	
GruntM8AfterBattleText:
	text "Vai avanti."
	para "Non posso fare"
	line "niente per"
	cont "fermarti."
	done

TeamRocketBaseB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2, 10, STAND_CITY_ROCKET_HOUSE, 3
	warp_event 15,  3, TEAM_ROCKET_BASE_B2F, 1
	warp_event 23, 15, TEAM_ROCKET_BASE_B2F, 2
	warp_event 26, 26, TEAM_ROCKET_BASE_B2F, 3


	db 3 ; coord events
	coord_event 10, 20, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 21, SCENE_DEFAULT, ImposterCompEncounter
	coord_event 10, 22, SCENE_DEFAULT, ImposterCompEncounter


	db 5 ; bg events
	bg_event 25, 16, BGEVENT_ITEM, TeamRocketBaseB1FHiddenFullHeal
	bg_event 12, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 13, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 16, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole
	bg_event 17, 19, BGEVENT_READ, TeamRocketBaseB1FComputerConsole

	db 12 ; object events
	object_event  7, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB1FTMThief, EVENT_TEAM_ROCKET_BASE_B1F_TM_THIEF
	object_event  3, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM8, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 19,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntM9, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 25,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 27, 13, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGruntM14, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  2,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntM15, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 25, 25, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGruntM16, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event  6, 26, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRoss, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 26, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistMitch, EVENT_BLUE_FOREST_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 11, 21, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_LASS
	object_event 13, 20, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_LASS
	object_event -5, -5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JADE_FOREST_LASS
