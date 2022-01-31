
# in_array: check if el is in array arr
function in_array(arr, el) {
   el = clean_line(el)
   for (cur in arr) {
      if (el == arr[cur]) {
         return 1;
      }
   }
   return 0;
}
# extract: extract and send clean values from el to _line
function extract(el, _line) {
   patsplit(el, _line, FPAT)
   for (x in _line) {
      _line[x] = clean_line(_line[x])
   }
}
# clean_line: remove quotes from string val
function clean_line(val) {
   return gensub(FPAT, "\\1", "g", val)
}
