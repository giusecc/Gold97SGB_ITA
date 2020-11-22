	object_const_def ; object_event constants
;	const ROUTE108_STANDING_YOUNGSTER1
;	const ROUTE108_LASS
	const ROUTE108_STANDING_YOUNGSTER2
;	const ROUTE108_SAILOR
	const ROUTE108_FRUIT_TREE
	const ROUTE108_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

;TrainerSailorHarry:
;	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

;.Script
;	endifjustbattled
;	opentext
;	writetext SailorHarryAfterBattleText
;	waitbutton
;	closetext
;	end


TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_ROUTE_108

BirdKeeperTobySeenText:
	text "Volate alti"
	line "nel cielo, miei"
	para "amati #MON"
	line "uccello!"
	done

BirdKeeperTobyBeatenText:
	text "Penso che"
	line "m'involerò."
	done

BirdKeeperTobyAfterBattleText:
	text "Voglio allenarmi"
	line "nel DOJO KARATE"
	cont "di DESMOPOLI."
	para "I #MON VOLANTI"
	line "sono forti contro"
	cont "il tipo LOTTA."
	para "…È un vantaggio"
	line "scorretto?"
	done


UnknownText_0x1a200e:
	text "Devo fare così"
	line "tanti compiti che"

	para "non ho mai tempo"
	line "per i #MON."

	para "Così, quando mi"
	line "capita di giocare"
	para "mi concentro"
	line "molto."
	done

LassDana1SeenText:
	text "Sei bravo come"
	line "allenatore?"

	para "Potresti darmi"
	line "qualche"
	cont "consiglio?"
	done

LassDana1BeatenText:
	text "Capisco, quindi"
	line "lotti così."
	done

UnknownText_0x1a20ec:
	text "Vuoi sapere una"
	line "cosa?"

	para "Il LATTE MUMU è"
	line "fantastico per"
	cont "i #MON!"
	para "Lo puoi comprare"
	line "a INERTOPOLI."
	done


SailorHarrySeenText:
	text "Sono stato oltre-"
	line "mare, perciò"

	para "conosco #MON"
	line "di ogni tipo!"
	done

SailorHarryBeatenText:
	text "La tua classe è"
	line "mondiale!"
	done

SailorHarryAfterBattleText:
	text "Tutti i popoli"
	line "del mondo vivono"

	para "felici con i"
	line "#MON."
	done

BeautyOliviaSeenText:
	text "I miei #MON"
	line "sono stupendi,"
	cont "vero?"
	done

BeautyOliviaBeatenText:
	text "Tengo i #MON"
	line "al meglio."
	done

BeautyOliviaAfterBattleText:
	text "Hai fatto"
	line "tagliare i"
	para "capelli ai"
	line "tuoi #MON?"
	done

Route108SignText:
	text "PERCORSO 108"

	para "DESMOPOLI -"
	line "BIANCASELVA"
	done

Route108TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Quando un #MON"
	line "si sta evolvendo,"
	cont "puoi bloccarlo."

	para "Premi B durante"
	line "l'evoluzione."

	para "Così facendo,"
	line "l'evoluzione del"
	cont "#MON si blocca."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  0, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  1,  0, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 3 ; object events
;	object_event 19,  6, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
;	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event  7, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
;	object_event 24,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 18, 11, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
