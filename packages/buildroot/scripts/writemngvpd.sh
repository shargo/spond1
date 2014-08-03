#!/bin/sh
VPDSTR=$1

########        10        20        30        40        50        60        70        80        90       100       110     128
########1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567100123456789012345128
SPACES="                                                                                                                      "
eeprom-provisioning.sh
wtf /sys/bus/i2c/devices/0-0050/eeprom 61 "${SPACES:0:128}"
wtf /sys/bus/i2c/devices/0-0050/eeprom 61 "${VPDSTR:0:23}"
