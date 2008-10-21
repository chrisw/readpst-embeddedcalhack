#!/bin/bash


function dodii()
{
    n="$1"
    fn="$2"
    rm -rf output$n
    mkdir output$n
    $val ../src/pst2dii -f /usr/share/fonts/bitstream-vera/VeraMono.ttf -B "bates-" -o output$n -O mydii$n -d dumper $fn >$fn.dii.err 2>&1
         ../src/readpstlog -f I dumper >$fn.log
    rm -f dumper
}


function dopst()
{
    n="$1"
    fn="$2"
    rm -rf output$n
    mkdir output$n
    $val ../src/readpst -cv -o output$n -d dumper $fn >$fn.pst.err 2>&1
         ../src/readpstlog -f I dumper >$fn.log
    $val ../src/pst2ldif -b 'o=ams-cc.com, c=US' -c 'newPerson' -o $fn >$fn.ldif.err 2>&1
    $val ../src/pst2ldif -b 'o=ams-cc.com, c=US' -c 'inetOrgPerson' $fn >$fn.ldif2.err 2>&1
    rm -f dumper
}



val="valgrind --leak-check=full"
val=''

pushd ..
make || exit
popd

if [ "$1" == "dii" ]; then
    dodii 1 ams.pst
    dodii 2 sample_64.pst
    dodii 3 test.pst
    dodii 4 big_mail.pst
else
    dopst  1 ams.pst
   #dopst  2 sample_64.pst
   #dopst  3 test.pst
   #dopst  4 big_mail.pst
   #dopst  5 mbmg.archive.pst
   #dopst  6 Single2003-read.pst
   #dopst  7 Single2003-unread.pst
   #dopst  8 ol2k3high.pst
   #dopst  9 ol97high.pst
   #dopst 10 returned_message.pst
fi

