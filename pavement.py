#vim: set fileencoding=utf-8


from __future__ import print_function

import os
import sys

from paver.easy import consume_args, sh, task


HOME = os.path.expanduser("~")


@task
@consume_args
def install(args):
    """Install dot files into the user's home directory."""
    replace_all = "-a" in args

    for file in os.listdir("."):
        if file.startswith("."):
            continue

        ignore = ("pavement.py", "README", "LICENSE")
        if any(i in file for i in ignore):
            continue

        if os.path.lexists(os.path.join(HOME, "." + file)):
            if replace_all:
                replace_file(file)
            else:
                print("Overwrite ~/.{} [ynaq]".format(file))
                c = sys.stdin.readline().strip()
                if c == "a":
                    replace_all = True
                    replace_file(file)
                elif c == "y":
                    replace_file(file)
                elif c == "q":
                    sys.exit(1)
                else:
                    print("Skipping ~/{}".format(file))
        else:
            link_file(file)


def replace_file(file):
    sh("rm {}/.{}".format(HOME, file))
    link_file(file)


def link_file(file):
    print("Linking ~/.{}".format(file))
    sh("ln -s {}/{} {}/.{}".format(os.getcwd(), file, HOME, file))
