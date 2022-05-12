#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

BEGIN {
   FS="\t"
}

{
   if (NR != 1) {
      printf("%s;0;;%s;%s;%s;;\n", $1, $5, $4, $6);
   }
}
