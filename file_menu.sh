#!/bin/bash

# Menu options
select opt in "Create 5 text files" "Append 'Hello world' to all files" "Replace 'world' with 'bash'" "Exit"
do
  case $REPLY in
    1)
        read -p "Enter base filename (e.g. file): " base
        for i in {1..5}; do
            touch "${base}_${i}.txt"
        done
        echo "Created 5 files: ${base}_1.txt to ${base}_5.txt"
        ;;

    2)
      for file in *.txt; do
        if [[ -f $file ]]; then
          echo "Hello world" >> "$file"
        fi
      done
      echo "Appended 'Hello world' to all .txt files."
      ;;

    3)
      for file in *.txt; do
        if [[ -f $file ]]; then
          sed -i 's/world/bash/g' "$file"
        fi
      done
      echo "Replaced 'world' with 'bash' in all .txt files."
      ;;

    4)
      echo "Goodbye!"
      break
      ;;

    *)
      echo "Invalid option. Try again."
      ;;
  esac
done
