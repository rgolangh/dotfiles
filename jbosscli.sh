#!/bin/sh

function jbosscli() {
  "$JBOSS_HOME"/bin/jboss-cli.sh --controller=remote+http://127.0.0.1:8706 --connect --user=admin@internal $@
}

