#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# ungarble.rb fot github test
#
# Function
#    Correct name of a garbled file in Macintosh.
#    Names of downloaded files are garbled as follows:
#    - A multi-byte character in RTF-8 --> "%"+hex2digits + "%"+...
#    - A single-byte character --> no change
#    - Example: ご利_2015.csv --> %e3%81%94%e5%88%a9_2015.csv
#
# Input/Output
#    $stdin: garbled_filename
#    $stdout: ungarbled_filename
#
while fname = gets do
  if fname == nil then
    break
  else
    fname = fname.chomp
    String ugfname = fname.gsub(/%([0-9a-fA-F][0-9a-fA-F])/){$1.hex.chr}
    if fname != ugfname then
      com = "mv #{fname} #{ugfname}"
      result = system(com)
      puts result
    end
  end
end
