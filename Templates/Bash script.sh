#!/bin/bash

# script-name, a short script description
# Author: Tomasz Pieczerak (tph) <tphaster AT gmail.com>

VERSION="0.1"

set -e

# configuration
SOME_CONST="value"

# display usage info function
usage(){
    cat 1>&2 <<EOT
Usage: `basename $0` [OPTION]

Try '`basename $0` --help' for more options.
EOT
}

# check number of arguments
if [ $# -gt 1 ]; then
    echo "`basename $0`: only one OPTION allowed" 1>&2
    usage
    exit 1
fi

# display help on '-h' or '--help' option
if [ "x$1" = "x--help" -o "x$1" = "x-h" ]; then
    cat <<EOT
script-name $VERSION, a short script descriptiog

Usage: `basename $0` [OPTION]

Startup:
    -V, --version   display the version of script and exit.
    -h, --help      print this help.

Options:
    -d, --default-option    option description. [default]
    --some-option           option description.
    ...

Mail bug reports and suggestions to <tphaster AT gmail.com>.
EOT
    exit 0
fi

# print program version on '-V' or '--version' option
if [ "x$1" = "x--version" -o "x$1" = "x-V" ]; then
    cat <<EOT
script-name $VERSION

Copyright (C) 2019 Tomasz Pieczerak
License GPLv3+: GNU GPL version 3 or later
<http://www.gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written and maintained by Tomasz Pieczerak (tph) <tphaster AT gmail.com>.
Please send bug reports and questions to <tphaster AT gmail.com>.
EOT
    exit 0
fi

# default action
if [ $# -eq 0 -o "x$1" = "x--default-option" -o "x$1" = "x-d" ]; then
    exit 0
fi

# process OPTIONS
if [ "x$1" = "x--some-option" -o "x$1" = "x-s" ]; then
	:
else
    echo "`basename $0`: unrecognized option '$1'" 1>&2
    usage
    exit 1
fi

# do something else
