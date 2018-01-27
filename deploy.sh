#!/bin/bash

abspath() {
  echo "$(cd $(dirname $1) && pwd)/$(basename $1)"
}

cd "$(dirname "$0")"

cat .symlinks | sed -e 's/^ *//;s/ *$//;/^$/d' | while read link; do
  read from to <<< $link
  to=$(eval echo $to)
  [ ! -e `dirname $to` ] && mkdir -p "$(dirname "$to")"
  from=$(abspath $from)
  to=$(abspath $to)
  ln -sfnv $from $to
done
