#!/bin/bash
scriptname=`basename $0`

echo "--------> $scriptname"

src_dir=./src
result_dir=unit_test-results
report_dir=coverage-report
rm -rf $result_dir
rm -rf $report_dir

coverage run --source $src_dir ./runtest.py discover
coverage html --directory $report_dir --omit=*/test*,test*,*__init__*
