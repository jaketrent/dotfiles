#!/bin/bash

### lint all the things

changes=$(git diff --cached --name-only --diff-filter=AM)

ruby_changes=$(printf "%b\n" $changes | grep -E "\.e?rb$")
js_changes=$(printf "%b\n" $changes | grep -E ".*\.js$" | grep -v ^test)
js_test_changes=$(printf "%b\n" $changes | grep -E "^test/.*\.js$")

root=$(git rev-parse --show-toplevel)
eslint=node_modules/.bin/eslint

pushd $root > /dev/null

if [ -n "$ruby_changes" ]; then
  rubocop $ruby_changes --force-exclusion
  ex1=$?
else
  ex1=0
fi

if [ -n "$js_changes" ]; then
  $eslint -c .eslintrc $js_changes
  ex2=$?
else
  ex2=0
fi

if [ -n "$js_test_changes" ]; then
  $jshint -c test/.jshintrc $js_test_changes
  ex3=$?
else
  ex3=0
fi

popd > /dev/null

if (( $ex1 | $ex2 | $ex3 > 0 )); then
  exit 1
fi

