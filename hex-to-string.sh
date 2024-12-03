#!/usr/bin/env bash

# this function consumes the stdin as a sequence of 2-digit hexadecimal
# and converts it to its characters in ascii.
# E.g lets convert 414243 to its ascii ABC:
# 41 in hexa is 65 - printf "%d" 0x41 = 65 = A
#
# ${#var} syntax return the length of a var
# ${var:2} syntax return the substring of var from the 2 place
# ${var:2:1} syntax return the first character substring of var from the 2 place 
# printf "\x41" prints the ascii value of hexa value 41 which A
# printf "%x" "'A" prints the hex value of A which is 41
#
function hex_to_string() {
    s="$1"
    if [ -z "$s" ];then
      s=$(cat /dev/stdin)   
    fi
    for (( i=0; i<${#s}; i=i+2 ));do
        printf "\x${s:i:2}" 
    done

}

function string_to_hex() {
    s="$1"
    if [ -z "$s" ];then
      s=$(cat /dev/stdin)   
    fi
    for (( i=0; i<${#s}; i=i+1 ));do
        printf "%x" "'${s:i:1}" 
    done

}
