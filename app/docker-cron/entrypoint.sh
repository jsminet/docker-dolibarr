#!/bin/bash

# usage: get_env_value VAR [DEFAULT]
#    ie: get_env_value 'XYZ_DB_PASSWORD' 'example'
# (will allow for "$XYZ_DB_PASSWORD_FILE" to fill in the value of
#  "$XYZ_DB_PASSWORD" from a file, especially for Docker's secrets feature)
function get_env_value() {
	local varName="${1}"
	local fileVarName="${varName}_FILE"
	local defaultValue="${2:-}"

	if [ "${!varName:-}" ] && [ "${!fileVarName:-}" ]; then
		echo >&2 "error: both ${varName} and ${fileVarName} are set (but are exclusive)"
		exit 1
	fi

	local value="${defaultValue}"
	if [ "${!varName:-}" ]; then
	  value="${!varName}"
	elif [ "${!fileVarName:-}" ]; then
		value="$(< "${!fileVarName}")"
	fi

	echo ${value}
	exit 0
}

DOLI_DB_USER=$(get_env_value 'DOLI_DB_USER' 'doli')
DOLI_DB_PASSWORD=$(get_env_value 'DOLI_DB_PASSWORD' 'doli_pass')
DOLI_ADMIN_LOGIN=$(get_env_value 'DOLI_ADMIN_LOGIN' 'admin')
DOLI_ADMIN_PASSWORD=$(get_env_value 'DOLI_ADMIN_PASSWORD' 'admin')

env >> /etc/environment

# execute CMD
echo "$@"
exec "$@"