# functions to produce symbols on the terminal

checkmark='\u2714'
music='\u266b'
fail='\u2718'

s_loop() {
 for i in $(seq 1 ${1}); do echo -ne $2; done 
 echo -ne "\n"
}

s_checkmark() {
  s_loop ${1-1} $checkmark
}

s_music() { 
  s_loop ${1-1} $music 
}

s_fail() {
  s_loop ${1-1} $fail
}

# vi: nospell
