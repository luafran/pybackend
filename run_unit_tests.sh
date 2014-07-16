#!/bin/bash
scriptname=`basename $0`

echo "--------> $scriptname"

src_dir=./src
test_dir=./src/test
result_dir=unit_test-results
report_dir=$PWD/coverage-report
rm -rf $result_dir
rm -rf $report_dir

#coverage run --source $src_dir ./runtest.py discover
#coverage html --directory $report_dir --omit=*/test*,test*,*__init__*

# TODO: show test time in stdout
nosetests -v --nocapture --with-timer --with-coverage --cover-html --cover-html-dir=$report_dir --cover-inclusive --cover-erase --cover-package=$src_dir --with-xunit --where $test_dir
