#!/bin/bash

KEY_DIR=/etc/openvpn/client/keys
OUTPUT_DIR=/etc/openvpn/client/files
BASE_CONFIG=/etc/openvpn/client/plantilla.conf

cat ${BASE_CONFIG} \
        <(echo -e '<ca>') \
        ${KEY_DIR}/ca.crt \
	<(echo -e '</ca>\n<cert>') \
	${KEY_DIR}/${1}.crt \
	<(echo -e '</cert>\n<key>') \
	${KEY_DIR}/${1}.key \
	<(echo -e '</key>\n<tls-crypt>') \
	${KEY_DIR}/ta.key \
	<(echo -e '</tls-crypt>') \
	> ${OUTPUT_DIR}/S{$1}.ovpn