#!/bin/sh

function enginestart() {
 screen -t "ovirt-engine - running" share/ovirt-engine/services/ovirt-engine/ovirt-engine.py start
}
