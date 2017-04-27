#!/bin/sh

# ##################################################
#
version="1.0.0"
#
# HISTORY:
#
# * 17/04/09 - v1.0.0  - First Creation
#
# ##################################################

function mainScript() {
 echo -n
}

function usage() {
    cat <<EOF
$(basename ${0}) is a tool for ...

Usage:
    $(basename ${0}) [command] [<options>]

Options:
    --version, -v     print $(basename ${0}) ${version}
    --help, -h        print help
EOF
}

# Check Arguments
if [ $# -eq 0 ]; then
  usage
  exit 1
fi

# Handle Options
while [ $# -gt 0 ];
do
    case ${1} in

        --debug|-d)
            set -x
        ;;

        --version|-v)
            echo "$(basename ${0}) ${version}"
            exit 0
        ;;

        --host|-h)
            HOST=${2}
            shift
        ;;

        --port|-p)
            PORT=${2}
            shift
        ;;

        *)
            echo "[ERROR] Invalid option '${1}'"
            usage
            exit 1
        ;;
    esac
    shift
done
