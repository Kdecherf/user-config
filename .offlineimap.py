#!/usr/bin/env python

import subprocess

def get_password(key):
   p = subprocess.Popen(["pass", key], stdout=subprocess.PIPE)
   out, err = p.communicate()
   return out.rstrip("\n")

def labelize_folder(m):
   new_folder = m.group(0)
   if m.group(0) != "INBOX":
      new_folder = "[Label]." + m.group(0)
   return new_folder
