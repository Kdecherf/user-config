#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

# HistoriqueFortuneo (export espace client)
# 1: Operation date
# 2: Value date (ignore)
# 3: Label
# 4: Debit
# 5: Credit

# Output CSV format
# 1: Date
# 2: Payment
# 3: Info
# 4: Payee
# 5: Memo
# 6: Amount
# 7: Category
# 8: Tags
# Reference: http://homebank.free.fr/help/misc-csvformat.html

BEGIN {
   FS=";"
   RS="\r\n"
}

# HistoriqueFortuneo (export espace client)
# {
#    if (NR != 1) {
#       # Date;0;;Simplified Label;Operation label + Misc information;Amount
#       printf("%s;0;;%s;%s;%s;;\n", $1, $3, $3 , $4 + $5);
#    }
# }

# Boucle export woob
{
   if (NR > 1) {
      if ($2 !~ /^CARTE [0-9]{2}\/[0-9]{2}/) {
         printf("%s;0;;%s;%s;%s;;\n", $1, $2, $2, $3);
      } else {
         buckets[$1] += $3
      }
   }
}

END {
   for (pos in buckets) {
      label = "Cb Diff"
      printf("%s;0;;%s;%s;%.2f;;\n", pos, label, label, buckets[pos])
   }
}
