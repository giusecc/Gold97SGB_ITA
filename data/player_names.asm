NameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NUOVO@"

PlayerNameArray:
IF DEF(_GOLD)
	db "ORO@"
	db "PAOLO@"
	db "DIEGO@"
	db "CARLO@"
ELIF DEF(_SILVER)
	db "ARGENTO@"
	db "LUCA@"
	db "PAOLO@"
	db "MAX@"
ENDC
	db 2
	db " NOME @" ; title
