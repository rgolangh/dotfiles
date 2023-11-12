# functions to produce symbols on the terminal

checkmark='\u2714'
music='\u266b'
fail='\u2718'

function s_loop() {
	for i in $(seq 1 "${1}"); do echo -ne "$2"; done
	echo -ne "\n"
}

function symbol.v() {
	s_loop "${1-1}" '\u2705' 
}

function symbol.checkmark() {
	s_loop "${1-1}" $checkmark
}
function symbol.music() { 
	s_loop "${1-1}" $music
}

function symbol.fail() {
	s_loop "${1-1}" $fail
}

# vi: nospell
