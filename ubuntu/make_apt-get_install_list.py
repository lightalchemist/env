#!/usr/bin/env python
# encoding: utf-8


import os
import sys

import argparse


def main():
    parser = argparse.ArgumentParser(description=
                                     "Parse bash script containing "
                                     "lines of 'sudo apt-get install'" \
                                     " and output one package name per line")
    parser.add_argument("inputfile", help="Path to file to parse", type=str)
    parser.add_argument("-v", "--verbose", help="Include parse errors in output", action="store_true")
    args = parser.parse_args()

    with open(args.inputfile) as infile:
        for i, line in enumerate(infile, 1):

            # Skip comments and empty lines
            if line.startswith('#') or len(line) == 1:
                continue

            try:
                # Get line after the word "install"
                line = line.strip()
                packages = line[line.index("install") + len("install"):].split()
                for p in packages:
                    print("{}".format(p))
            except ValueError:
                # Cannot find "install" in line
                if args.verbose:
                    print("# Invalid line {}: {}".format(i, line))



if __name__ == '__main__':
    main()
