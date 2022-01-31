#!/usr/bin/awk -f

BEGIN {
   FS="\n"
   RS="^"
}

$1 ~ /^!/ { print $1 }

$2 !~ /^$/ && $4 !~ /^PCB / { print $2; print $3; print $4; print $5; print RS }

$2 !~ /^$/ && $4 ~ /^PCB / {
   buckets[substr($2, 2)] += substr($3, 2)
}

END {
   for (pos in buckets) {
      printf("D%s\nT%.2f\nP\nMCB \n^\n", pos, buckets[pos])
   }
}

