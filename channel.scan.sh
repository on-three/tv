#!/bin/bash

# atsc channel scan off dvb card

# tools
WSCAN=w_scan
SCAN=scan

# options
ATSC=a
OVER_THE_AIR=1
COUNTRY=US
# initial tuning data format (lowercase x)
OUTPUT_FORMAT=x

# intermediates
INITIAL_TUNING_DATA=/tmp/initial_tuning_data.txt

# outputs
OUTPUT_DIR=${HOME}/.azap
OUTPUT_FILE=${OUTPUT_DIR}/channels.conf

# w_scan -fa -c US -X -R N -O N > channels.conf
${WSCAN} -f${ATSC} -A${OVER_THE_AIR} -c ${COUNTRY} -${OUTPUT_FORMAT} >> ${INITIAL_TUNING_DATA}

mkdir -p ${OUTPUT_DIR}
${SCAN} -A2 ${INITIAL_TUNING_DATA} > ${OUTPUT_FILE}
