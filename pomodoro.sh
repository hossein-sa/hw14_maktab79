#!/bin/bash

read -p "Enter number of deep work sessions: " sessions

if ! [[ "$sessions" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a number."
  exit 1
fi

if (( sessions < 1 )); then
  echo "You must do at least one session."
  exit 1
fi

for ((i = 1; i <= sessions; i++)); do
  echo ""
  echo "🧠 Starting deep work session $i..."
  sleep 10
  echo "✅ Deep work session $i complete."

  if (( i < sessions )); then
    if (( i % 3 == 0 )); then
      echo "🛌 Long break time (30 seconds)..."
      sleep 30
    else
      echo "☕ Short break time (5 seconds)..."
      sleep 5
    fi
  fi
done

echo ""
echo "🎉 All $sessions sessions complete. Great job!"
