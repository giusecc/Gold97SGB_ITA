BillPhoneMornGreetingText:
	text "Buondì!"

	para "Questo è il SER-"
	line "VIZIO di AMMINI-"

	para "STRAZIONE del"
	line "SISTEMA MEMORIA"
	
	para "#MON"
	
	done

BillPhoneDayGreetingText:
	text "Buongiorno!"

	para "Questo è il SER-"
	line "VIZIO di AMMINI-"

	para "STRAZIONE del"
	line "SISTEMA MEMORIA"
	
	para "#MON"
	done

BillPhoneNiteGreetingText:
	text "Buonasera!"

	para "Questo è il SER-"
	line "VIZIO di AMMINI-"

	para "STRAZIONE del"
	line "SISTEMA MEMORIA"
	
	para "#MON"
	
	done

BillPhoneGenericText:
	text "Pronto? Chi è?"

	para "<PLAYER>, sei tu?"
	line "Aspetta un att…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
	text "Grazie per la tua"
	line "pazienza!"

	para "<PLAYER>, nel BOX"
	line "ci sono ancora @"
	text_ram wStringBuffer3
	text_start
	cont "posti."

	para "Cosa aspetti a"
	line "riempirlo!"
	done

BillPhoneNearlyFullText:
	text "Scusa se hai"
	line "dovuto attendere!"

	para "<PLAYER>, nel tuo"
	line "BOX c'è posto per"
	cont "@"
	text_ram wStringBuffer3
	text "#MON."

	para "Perché non cambi"
	line "BOX?"
	done

BillPhoneFullText:
	text "Grazie per la tua"
	line "pazienza!"

	para "<PLAYER>, il tuo"
	line "BOX è pieno!"

	para "Devi cambiare"
	line "BOX se vuoi"

	para "catturare altri"
	line "#MON."
	done

BillPhoneNewlyFullText:
	text "Pronto, <PLAYER>?"
	line "Sono io, BILL!"

	para "Grazie per usare"
	line "il SISTEMA MEMORIA"
	cont "#MON"

	para "L'ultimo #MON"
	line "che hai mandato"
	
	para "ha riempito"
	line "il BOX."

	para "Dovrai cambiare"
	line "BOX se vuoi"

	para "catturare altri"
	line "#MON."

	para "Ora ti saluto!"
	done
