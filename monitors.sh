#!/bin/bash

function monitors() {
  if [[ "$1" == "" ]]; then 
      echo "usage: monitors [home, office]"
      return 0
  fi

  if [[ "$1" == "home" ]]; then 
      gdctl set \
          --logical-monitor --monitor eDP-1 \
          --logical-monitor --monitor DP-2 --primary --above eDP-1
  fi

  if [[ "$1" == "office" ]]; then 
      gdctl set \
          --logical-monitor --monitor eDP-1 \
          --logical-monitor --monitor DP-2 --primary --left-of eDP-1
      #--logical-monitor --monitor DP-3 --primary --left-of eDP-1
  fi
}

