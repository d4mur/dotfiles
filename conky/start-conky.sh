#!/bin/bash
killall conky
THEME_PATH=~/.conky/fiery_insight
sleep 2

conky -d -c "${THEME_PATH}/Sys.conf"
conky -d -c "${THEME_PATH}/ProcessCpu.conf"
conky -d -c "${THEME_PATH}/ProcessRam.conf"
conky -d -c "${THEME_PATH}/StorageAndMem.conf"
conky -d -c "${THEME_PATH}/GPU.conf"
conky -d -c "${THEME_PATH}/Graphs.conf"
conky -d -c "${THEME_PATH}/DateTime.conf"
