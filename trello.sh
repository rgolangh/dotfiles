#!/bin/bash

# To make this work I added an alias under ~/.mailrc
# with 'alias trello theaddress@ofmyboard.trello.com'
# The mail should arrive into my default board's backlog list.
function todo_trello() {
  echo "$@" | mail trello
}
