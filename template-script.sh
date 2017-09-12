#!/bin/sh

# ##################################################
#
PROGNAME=$(basename $0)
VERSION="1.0.0"
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
    -v, --version     print $(basename ${0}) ${VERSION}
    -h, --help        print help
EOF
}

# Check Arguments
if [ $# -eq 0 ]; then
  usage
  exit 1
fi

# Handle Options
for OPT in "$@"
do
  case "$OPT" in
    '-v'|'--version' )
      echo "$(basename ${0}) ${VERSION}"
      exit 0
      ;;
    '-h'|'--help' )
      usage
      exit 0
      ;;
    '-d'|'--debug' )
      set -x
      ;;
    '-a'|'--aoption' )
      if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
        echo "$PROGNAME: option requires an argument -- $1" 1>&2
        exit 1
      fi
      ARG_A="$2"
      shift 2
      ;;
    '-b'|'--long-b' )
      if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
        shift
      else
        shift 2
      fi
      ;;
    '-c'|'--long-c' )
      shift 1
      ;;
    '--'|'-' )
      shift 1
      param+=( "$@" )
      break
      ;;
    -*)
      echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
      exit 1
      ;;
    *)
      if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
        param+=( "$1" )
        shift 1
      fi
      ;;
  esac
done

if [ -z $param ]; then
  echo "$PROGNAME: too few arguments" 1>&2
  echo "Try '$PROGNAME --help' for more information." 1>&2
  exit 1
fi
