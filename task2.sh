#!/bin/bash
cd dataset1
for file in *; do

  if grep -q "sample" "$file" && [[ $(grep -o "sample" "$file" | wc -l) -eq 1 ]] && [[ $(grep -o "CSC510" "$file" | wc -l) -ge 3 ]]; then
   
    echo "$(stat -f%z "$file") $(grep -o "CSC510" "$file" | wc -l) $file"
  fi
done | sort -k2,2nr -k1,1n | sed 's/file_/filtered_/g'