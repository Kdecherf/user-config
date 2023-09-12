#!/usr/bin/awk -f

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

{
   if (NR > 1) {
      tag=""
      if ($5 != "") {
         # There is deferred date for credit card
         amount=$5
         date=$1
         rdate=$2
         label=$3
         raw=$4

         year=substr(date, 3, 2)
         month=substr(date, 6, 2)
         month-=1
         if (month == 0) {
            year-=1
            month=12
         }
         tag=sprintf("CB:%02d%02d", year, month)
      } else {
         amount=$4
         rdate=$1
         label=$2
         raw=$3
      }
      printf("%s;0;;%s;%s;%s;;%s\n", rdate, raw, label, amount, tag);
   }
}
