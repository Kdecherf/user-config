#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

# 1: Operation date
# 2: Simplified label
# 3: Operation label
# 4: Reference
# 5: Misc information
# 6: Type
# 7: Category (ignore)
# 8: Sub-category (ignore)
# 9: Debit
# 10: Credit
# 11: Accounting date (ignore)
# 12: Date (ignore)
# 13: Cleared (ignore)

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
      printf("%s;0;;%s;%s %s;%s;;\n", $1, $2, $3, $5, $9 + $10);
   }
}
