#!/bin/bash

val="valgrind --leak-check=full"

for i in {1..8}; do
    rm -rf output$i
    mkdir output$i
done


#$val  ../src/pst2ldif -b 'o=ams-cc.com, c=US' -c 'newPerson' ams.pst >ams.err  2>&1
#$val  ../src/readpst -cv    -o output1 ams.pst                       >out1.err 2>&1
#$val  ../src/readpst -cl -r -o output2 ams.pst                       >out2.err 2>&1
#$val  ../src/readpst -S     -o output3 ams.pst                       >out3.err 2>&1
#$val  ../src/readpst -M     -o output4 ams.pst                       >out4.err 2>&1
#$val  ../src/readpst        -o output5 mbmg.archive.pst              >out5.err 2>&1

#$val  ../src/readpst        -o output6 -d dumper test.pst            >out6.err 2>&1
#      ../src/readpstlog -f I dumper >dumpertest.log

#$val  ../src/readpst -cv    -o output7 -d dumper sample_64.pst       >out7.err 2>&1
#      ../src/readpstlog -f I dumper >sample_64.log
#      hexdump -C dumper >dumper.hex

$val  ../src/readpst -cv    -o output8 -d dumper big_mail.pst        >out8.err 2>&1
      ../src/readpstlog -f I dumper >big_mail.log

#$val  ../src/lspst ams.pst >out8.err 2>&1
#      ../src/readpstlog -f I lspst.debug >lspst.log

#rm -f dumper lspst.debug

