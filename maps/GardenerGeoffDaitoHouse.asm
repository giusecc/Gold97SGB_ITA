	object_const_def ; object_event constants
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

GardenerGeoffDaitoHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "Vuoi sapere"
	line "qualcosa delle"
	para "piante tropicali"
	line "che sto"
	cont "coltivando?"
	done
	
AhOkText:
	text "Va bene,"
	line "magari un'altra"
	cont "volta."
	done
	
PapayaText:
	text "Le papaye sono"
	line "il frutto tropi-"
	para "cale più facile"
	line "da coltivare."
	para "Tutto quello che"
	line "devi fare è"
	para "gettare i semi"
	line "nel campo e"
	cont "vederle crescere!"
	done
	
	para "Crescono così"
	line "bene da diventare"
	para "quasi erbacce!"
	
	para "Le piante maschili"
	line "non fanno frutti,"
	para "sentiti libero"
	line "di abbatterle."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
	text "Molti credono"
	line "che il cocco"
	para "cresca come una"
	line "sfera pelosa."
	
	para "Tuttavia, diventa-"
	line "no così solo dopo"
	para "aver rimosso la"
	line "loro buccia"
	cont "fibrosa."
	
	para "Il miglior modo"
	line "per sbucciarli è"
	para "con l'estremità"
	line "appuntita di un"
	para "martello, facendo"
	line "delle tacche"
	para "nella buccia e"
	line "poi separando"
	cont "le varie parti!"
	
	para "Ricordatelo,"
	line "se mai dovessi"
	para "trovarti disperso"
	line "su un'isola con"
	cont "un falegname."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
	text "I manghi"
	line "richiedono alcuni"
	para "mesi per maturare"
	line "sull'albero."
	
	para "Anche gli alberi"
	line "ci mettono anni"
	para "per diventare"
	line "abbastanza grandi"
	para "da produrre un"
	line "singolo mango."
	
	para "In alcune culture"
	line "si mangia il mango"
	cont "ancora acerbo."
	
	para "È terribilmente"
	line "duro da mordere"
	para "e molto acido."
	
	para "Tuttavia, io li"
	line "mangio sempre"
	para "così perché sono"
	line "impaziente!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
	text "Le banane sono il"
	line "frutto più"
	para "riconoscibile di"
	line "tutti."
	
	para "Ma lo sapevi che"
	line "le banane che si"
	para "vendono nei negozi"
	line "sono geneticamente"
	para "tutte uguali?"
	
	para "Le banane da"
	line "piantagione non"
	para "hanno semi, per"
	line "domesticazione."
	para "Devono essere"
	line "propagate tramite"
	cont "talee."
	
	para "Questo significa"
	line "che tutte le"
	para "banane da coltura"
	line "sono identiche!"
	
	para "Questo diede"
	line "problemi quando"
	para "un batterio"
	line "distrusse una"
	para "piantagione"
	line "intera e i"
	para "coltivatori"
	line "furono costretti"
	para "a piantare"
	line "una specie"
	cont "immune!"
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
	text "Come le banane,"
	line "molti ananas"
	para "sono esattamente"
	line "gli stessi, a"
	para "causa di come"
	line "sono propagati!"
	
	para "Se vivi in un"
	line "posto abbastanza"
	para "caldo, devi"
	line "provare questo:"
	
	para "Prendi le spine"
	line "in cima agli"
	para "ananas che compri"
	line "e piantale"
	para "direttamente"
	line "nel terriccio."
	
	para "Bagnale e prendi-"
	line "tene cura e"
	para "presto le vedrai"
	line "crescere di nuovo."
	para "A un certo punto"
	line "vedrai germogliare"
	cont "un ananas!"

	para "Ripeti questo"
	line "processo per una"
	para "fornitura di"
	line "ananas per sempre."
	done

GeoffInsideMeetText:
	text "Ehi! Non ci siamo"
	line "già visti sul"
	cont "PERCORSO 104?"
	
	para "Ero stanco di"
	line "provare a seminare"
	para "nel deserto, così"
	line "mi sono trasferito"
	para "qui per lavorare"
	line "in questa"
	cont "fattoria!"

	para "Visto che sei"
	line "venuto da lontano"
	para "fin qui, lascia"
	line "che ti offra"
	para "qualcosa!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
	text "Sono uscito a"
	line "fare compere."
	cont "Torno più tardi." 
	para "- GOFFREDO"
	done

GardenerGeoffDaitoHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
