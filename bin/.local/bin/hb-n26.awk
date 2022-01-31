#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

BEGIN {
   FPAT="\"([^\"]*)\""
   currency="EUR"
   i=0
}
{
   if (NR != 1) {
      if (clean_line($2) != "M DECHERF KEVIN") { # 2: Payee
         lines[i] = $0
         i++
      }
   }
}
END {
   for (pos in lines) {
      extract(lines[pos], line)
      info = ""
      if (line[8] != currency) { # 8: Currency
         info = sprintf("%s %s", line[8], line[7]) # 7: Amount in foreign currency
      }
      if (line[5] == "-") {
         ref = line[4] # 4: Type
      } else {
         ref = line[5] # 5: Reference
      }
      printf ("%s;0;%s;%s;%s;%s;;\n", line[1], info, line[2], ref, line[6])
         # 1: Date
         # 6: Amount (EUR)
   }
}
