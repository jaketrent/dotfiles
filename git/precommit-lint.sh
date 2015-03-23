#!/bin/bash

### lint all the things

changes=$(git diff --cached --name-only --diff-filter=AM)

ruby_changes=$(printf "%b\n" $changes | grep -E "\.e?rb$")
js_changes=$(printf "%b\n" $changes | grep -E ".*\.js$" | grep -v ^test)
js_test_changes=$(printf "%b\n" $changes | grep -E "^test/.*\.js$")

root=$(git rev-parse --show-toplevel)
jshint=node_modules/.bin/jsxhint

pushd $root > /dev/null

if [ -n "$ruby_changes" ]; then
  rubocop $ruby_changes --force-exclusion
  ex1=$?
else
  ex1=0
fi

if [ -n "$js_changes" ]; then
  $jshint -c .jshintrc $js_changes
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

### check for existence of tests with commit 

if git rev-parse --verify HEAD >/dev/null 2>&1; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Redirect output to stderr
exec 1>&2

js_file='(jsapp|javascripts|public).+\.js$'
js_test='(spec|test).+\.js$'
ruby_file='(app|gems|lib).+\.rb$'
ruby_test='spec.+_spec\.rb$'

files=$(git diff --staged --name-only $against)

file_is() {
  echo $files| grep -Eq "$1"
}

is_candidate() {
  if $(file_is "$js_file") || $(file_is "$ruby_file"); then
    return 0
  else
    return 1
  fi
}

has_tests() {
  if $(file_is "$js_test") || $(file_is "$ruby_test"); then
    return 0
  else
    return 1
  fi
}

echo "Searching for tests..."

if is_candidate; then
  if has_tests; then
    echo "Passed: tests found"
  else
    cat <<\EOF
Error: No tests found for this commit.

This commit changes one or more Ruby/JavaScript files but
does not change any matching spec files. All code changes
should be accompanied by a matching test.

If you are sure that your commit does not require tests,
you can bypass this message by re-running `git commit` with
the `--no-verify` flag.
EOF
  exit 1
  fi
else
  echo "Passed: commit doesn't need tests"
fi
