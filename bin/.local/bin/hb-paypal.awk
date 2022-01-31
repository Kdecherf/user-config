#!/usr/bin/awk -f

@include "/home/kdecherf/.local/bin/hb-functions.awk"

# get_summary: replace object with email if empty
function get_summary(el) {
   if (el[14] != "") { # 14: Object title
      return el[14]
   } else if (el[17] != "") { # 17: Invoice number
      return sprintf("Invoice %s", el[17])
   } else {
      if (el[10] < 0) { # 10: Amount
         return sprintf("To %s", el[12]) # 12: Recipient address
      } else {
         return sprintf("From %s", el[11]) # 11: Sender address
      }
   }
}
BEGIN {
   FPAT="\"([^\"]*)\""
   currency="EUR"
   excludeNameStr="Compte bancaire,Carte bancaire"
   excludeTypeStr="Autorisation,Autorisation standard,Suspension temporaire,Virement bancaire sur le compte PayPal (obsolète),Suspension de compte pour autorisation en cours,Annulation de suspension de compte standard,Virement bancaire sur le compte PayPal,Virement bancaire sur le compte PayPal ,Suspension de compte pour virement de la Chambre de compensation automatisée"
   split(excludeNameStr,excludeName,",")
   split(excludeTypeStr,excludeType,",")
   i=0
}
{
   if (NR != 1) {
      if (!in_array(excludeName, $4) &&
            !in_array(excludeType, $5)) {
         ref[clean_line($13)] = $0 # 13: Transaction number
         lines[i] = $0
         i++
      }
   }
}
END {
   for (pos in lines) {
      extract(lines[pos], line)
      if (line[7] == currency) { # 7: Currency
         if (line[16] in ref) { # 16: Parent transaction
            extract(ref[line[16]], newl)
            info = ""
            if (newl[7] != currency) {
               info = sprintf("%s %s", newl[7], newl[10]) # 10: Amount
            }
            summary = get_summary(newl)
            # Date;0;{info};Name;{summary};Amount
            printf ("%s;0;%s;%s;%s;%s;;\n", newl[1], info, newl[4], summary, line[10])
            rep[line[16]] = line[13]
         } else {
            if (rep[line[13]] == "") {
               summary = get_summary(line)
               # Date;0;;Name;{summary};Amount
               printf ("%s;0;;%s;%s;%s;;\n", line[1], line[4], summary, line[10])
            }
         }
      }
   }
}
