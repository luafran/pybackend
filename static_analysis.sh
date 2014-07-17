#!/bin/bash
scriptname=`basename $0`

echo "--------> $scriptname"

#echo "WARNING: Disabled pylint"
#exit 0

src_dir=./pyuss

cd $src_dir
echo "Analyzing $(pwd) dir..."
rm -rf ../pylint-report
mkdir ../pylint-report
pylint --rcfile=../pylint.conf * > ../pylint-report/index.html
LINT_RESULT=$?
echo "pylint result = $LINT_RESULT"
#PASS_PLINT=$((LINT_RESULT & (~32) & (~16) & (~8) & (~4) ))
# Pass if no error of any kind
PASS_PLINT=$LINT_RESULT
echo "pass = $PASS_PLINT"

if [ "$PASS_PLINT" -ne "0" ]; then
         echo "--- FOUND STATIC ANALYSIS ERRORS ---"
         exit 1
fi
exit 0
