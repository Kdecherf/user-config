#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

# 1: Operation date
# 2: Accounting date (ignore)
# 3: Category (ignore)
# 4: Type
# 5: Operation label
# 6: Simplified label
# 7: Misc information
# 8: Amount
# 9: Cleared (ignore)

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
}

{
   if (NR != 1) {
      # Date;0;;Simplified Label;Operation label + Misc information;Amount
      printf("%s;0;;%s;%s %s;%s;;\n", $1, $6, $5, $7, $8);
   }
}
