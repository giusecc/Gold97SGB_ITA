	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	jumptextfaceplayer RedsMomText1

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Ciao!"

	para "Mio figlio ROSSO è"
	line "il CAPOPALESTRA."
	
	para "Ha conquistato"
	line "anche la LEGA."
	
	para "Sono così"
	line "orgogliosa di"
	cont "lui."
	done


RedsHouse1FTVText:
	text "Non ho mai visto"
	line "questo programma…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, KANTO_REGION, 20
	warp_event  3,  7, KANTO_REGION, 20
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
