#!/bin/bash

# This script is based on https://unix.stackexchange.com/revisions/480191/9 .
# The following changes proved to be necessary to make it work on CentOS 7:
#  * removed disk info (model, size) - not very useful, might not work in many cases.
#  * using "bw" instead of "bw_bytes" to support fio version 3.1 (those availible through yum @base)
#  * escaping exclamation mark in sed command
#  * the ".fiomark.txt" is not auto-removed 

LOOPS=1 #How many times to run each test
SIZE=1024 #Size of each test, multiples of 32 recommended for Q32 tests to give the most accurate results.
WRITEZERO=0 #Set whether to write zeroes or randoms to testfile (random is the default for both fio and crystaldiskmark); dd benchmarks typically only write zeroes which is why there can be a speed difference.

QSIZE=$(($SIZE / 32)) #Size of Q32Seq tests
SIZE+=m
QSIZE+=m

if [ -z $1 ]; then
    TARGET=$HOME
    echo "Defaulting to $TARGET for testing"
else
    TARGET="$1"
    echo "Testing in $TARGET"
fi

#echo "LOOPS=$LOOPS"
#echo "SIZE=$SIZE"
#echo "QSIZE=$QSIZE"
#echo "WRITEZERO=$WRITEZERO"

echo "Configuration: Size:$SIZE Loops:$LOOPS Write Only Zeroes:$WRITEZERO
Running Benchmark,  please wait...
"

fio --loops=$LOOPS --size=$SIZE --filename="$TARGET/.fiomark.tmp" --stonewall --ioengine=libaio --direct=1 --zero_buffers=$WRITEZERO --output-format=json \
  --name=Bufread --loops=1 --bs=$SIZE --iodepth=1 --numjobs=1 --rw=readwrite \
  --name=Seqread --bs=$SIZE --iodepth=1 --numjobs=1 --rw=read \
  --name=Seqwrite --bs=$SIZE --iodepth=1 --numjobs=1 --rw=write \
  --name=512kread --bs=512k --iodepth=1 --numjobs=1 --rw=read \
  --name=512kwrite --bs=512k --iodepth=1 --numjobs=1 --rw=write \
  --name=SeqQ32T1read --bs=$QSIZE --iodepth=32 --numjobs=1 --rw=read \
  --name=SeqQ32T1write --bs=$QSIZE --iodepth=32 --numjobs=1 --rw=write \
  --name=4kread --bs=4k --iodepth=1 --numjobs=1 --rw=randread \
  --name=4kwrite --bs=4k --iodepth=1 --numjobs=1 --rw=randwrite \
  --name=4kQ32T1read --bs=4k --iodepth=32 --numjobs=1 --rw=randread \
  --name=4kQ32T1write --bs=4k --iodepth=32 --numjobs=1 --rw=randwrite \
  --name=4kQ8T8read --bs=4k --iodepth=8 --numjobs=8 --rw=randread \
  --name=4kQ8T8write --bs=4k --iodepth=8 --numjobs=8 --rw=randwrite > "$TARGET/.fiomark.txt"

SEQR="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "Seqread"' | grep 'bw\"'  | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "Seqread"' | grep -m1 iops | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
SEQW="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "Seqwrite"' | grep 'bw\"'  | grep -v '_' | sed 2\!d | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "Seqwrite"' | grep iops | sed '7!d' | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
F12KR="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "512kread"' | grep 'bw\"'  | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "512kread"' | grep -m1 iops | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
F12KW="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "512kwrite"' | grep 'bw\"'  | grep -v '_' | sed 2\!d | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "512kwrite"' | grep iops | sed '7!d' | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
SEQ32R="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "SeqQ32T1read"' | grep 'bw\"'  | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "SeqQ32T1read"' | grep -m1 iops | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
SEQ32W="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "SeqQ32T1write"' | grep 'bw\"'  | grep -v '_' | sed 2\!d | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "SeqQ32T1write"' | grep iops | sed '7!d' | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
FKR="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kread"' | grep 'bw\"'  | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kread"' | grep -m1 iops | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
FKW="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kwrite"' | grep 'bw\"'  | grep -v '_' | sed 2\!d | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kwrite"' | grep iops | sed '7!d' | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
FK32R="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kQ32T1read"' | grep 'bw\"'  | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kQ32T1read"' | grep -m1 iops | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
FK32W="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kQ32T1write"' | grep 'bw\"'  | grep -v '_' | sed 2\!d | cut -d: -f2 | sed s:,::g)/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kQ32T1write"' | grep iops | sed '7!d' | cut -d: -f2 | cut -d. -f1 | sed 's: ::g')"
FK8R="$(($(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kQ8T8read"' | grep 'bw\"'  | sed 's/        "bw" : //g' | sed 's:,::g' | awk '{ SUM += $1} END { print SUM }')/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A15 '"name" : "4kQ8T8read"' | grep iops | sed 's/        "iops" : //g' | sed 's:,::g' | awk '{ SUM += $1} END { print SUM }' | cut -d. -f1)"
FK8W="$(($(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kQ8T8write"' | grep 'bw\"'  | sed 's/        "bw" : //g' | sed 's:,::g' | awk '{ SUM += $1} END { print SUM }')/1024))MB/s IOPS=$(cat "$TARGET/.fiomark.txt" | grep -A80 '"name" : "4kQ8T8write"' | grep '"iops" '| sed 's/        "iops" : //g' | sed 's:,::g' | awk '{ SUM += $1} END { print SUM }' | cut -d. -f1)"

echo -e "
Results:  
\033[0;33m
Sequential Read: $SEQR
Sequential Write: $SEQW
\033[0;32m
512KB Read: $F12KR
512KB Write: $F12KW
\033[1;36m
Sequential Q32T1 Read: $SEQ32R
Sequential Q32T1 Write: $SEQ32W
\033[0;36m
4KB Read: $FKR
4KB Write: $FKW
\033[1;33m
4KB Q32T1 Read: $FK32R
4KB Q32T1 Write: $FK32W
\033[1;35m
4KB Q8T8 Read: $FK8R
4KB Q8T8 Write: $FK8W
"

# rm "$TARGET/.fiomark.txt"
rm "$TARGET/.fiomark.tmp"
