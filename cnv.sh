#!/bin/bash

case `uname` in
  Linux)
    READLINK=readlink
    SED=sed
  ;;
  Darwin)
    # assumes brew install coreutils in order to support readlink -f on macOS
    READLINK=greadlink
    SED=gsed
  ;;
esac

cat greek | $SED 's/^\(.\) \\\(.\)\([^ ]*\) \(.\)/\\\2\3 \1\n\\\u\2\3 \4/g' | $SED 's/^\([^ ]*\) \(.*\)$/$type{"\\\1"}="string";\n$contents{"\\\1"}="\2";\n/g'
