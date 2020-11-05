	
TrainerInstructorCliff:
	trainer INSTRUCTOR, CLIFF, EVENT_BEAT_INSTRUCTOR_CLIFF, InstructorCliffSeenText, InstructorCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorCliffAfterBattleText
	waitbutton
	closetext
	end



InstructorCliffSeenText:
	text "Questo nuovo"
	line "CASINÒ è grande!"
	para "È il modo migliore"
	line "per fare una pausa"
	cont "dalle valutazioni."
	done

InstructorCliffBeatenText:
	text "Meglio perdere"
	line "alle slot machines"
	cont "che con i #MON…"
	done

InstructorCliffAfterBattleText:
	text "Non rimane mai"
	line "abbastanza tempo"
	para "dopo la"
	line "valutazione."
	done
