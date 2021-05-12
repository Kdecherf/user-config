#!/bin/bash

notmuch search --output=files -- tag:new and tag:github | while read _path ; do
   _id=$(grep -iE -m1 "^message-id: <(.*)@github.com>" ${_path} | sed -e 's/.* <\(.*\)>$/\1/i')
   if [ ! -z "${_id}" ]; then
      grep -qE "requested your review on:" ${_path} && (notmuch tag +todo +flagged -- thread:\"{id:${_id} and tag:github}\" || exit 2)
      grep -qE "Merged #[0-9]+ into" ${_path} && (notmuch tag +merged -todo -flagged -- thread:\"{id:${_id} and tag:github}\" || exit 2)
      grep -qE "Closed #[0-9]+" ${_path} && (notmuch tag +closed -todo -flagged -- thread:\"{id:${_id} and tag:github}\" || exit 2)
   fi
done

exit 0
