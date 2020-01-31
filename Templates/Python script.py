#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
ScriptName description...

"""
__author__    = "Tomasz Pieczerak <tphaster AT gmail.com>"
__copyright__ = "Copyright (C) 2020 Tomasz Pieczerak"
__license__   = "GPL"
__version__   = "1.0"
__status__    = "development"
__email__     = "tphaster AT gmail.com"


# imports
import os
import sys
import types
import argparse

# global variables
__script_name__ = os.path.basename(sys.argv[0])


### Parsing arguments ###

# Method overrides for argparse #
def format_usage(self):
    formatter = self._get_formatter()
    formatter.add_usage(self.usage, self._actions, self._mutually_exclusive_groups)
    formatter.add_text("Try `%s --help' for more options." % self.prog)

    return formatter.format_help()

### End of argparse overrides ###

class CustomFormatter(argparse.RawTextHelpFormatter):
    def _format_action_invocation(self, action):
        if not action.option_strings:
            metavar, = self._metavar_formatter(action, action.dest)(1)
            return metavar
        else:
            parts = []
            # if the Optional doesn't take a value, format is:
            #   -s, --long
            if action.nargs == 0:
                parts.extend(action.option_strings)

            # if the Optional takes a value, format is:
            #   -s, --long ARGS
            else:
                default = action.dest.upper()
                args_string = self._format_args(action, default)
                for option_string in action.option_strings:
                    parts.append('%s' % option_string)
                parts[-1] += '=%s'%args_string
            return ', '.join(parts)

        return help

    def add_usage(self, usage, actions, groups, prefix="Usage: "):
        if usage is not argparse.SUPPRESS:
            args = usage, actions, groups, prefix
            self._add_item(self._format_usage, args)

# end of CustomFormatter

def format_version():
    """Format version string."""
    return \
"""ScriptName %(version)s (status: %(status)s)

%(copy)s

Written and maintained by %(author)s.
Please send bug reports and questions to <%(email)s>.""" \
% {"version": __version__, "status": __status__, "copy": __copyright__,
   "author": __author__, "email": __email__}

# end of format_version()

### End of parsing arguments ###


######################
### CODE GOES HERE ###
######################


def parse_arguments(argv):
    """ Parse arguments for ScriptName. """
    parser = argparse.ArgumentParser(
            prog=__script_name__,
            description=__doc__,
            epilog="Mail bug reports and suggestions to <%s>." % __email__,
            formatter_class=CustomFormatter
            )
    parser._optionals.title = "Startup"

    # optional startup arguments
    parser.add_argument('-V', '--version', action='version',
            version=format_version())

    # override argparse functions
    parser.format_usage = types.MethodType(format_usage, parser)

    args = parser.parse_args(args=argv)

    return parser, args

# end of parse_arguments()

def main(argv=None):
    """ main() function. """

    ## deal with command line arguments ##
    if argv is None:
        argv = sys.argv

    parser, args = parse_arguments(argv[1:])

    ## run script ##
    try:
        pass
    except Exception as e:
        sys.exit(1)

    return 0 # exit success

# end of main()

if __name__ == "__main__":
    sys.exit(main())
