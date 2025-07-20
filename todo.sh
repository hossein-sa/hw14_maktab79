#!/bin/bash

PENDING_FILE="pending.txt"
DONE_FILE="done.txt"
DELETED_FILE="deleted.txt"

mkdir -p data
cd data
touch "$PENDING_FILE" "$DONE_FILE" "$DELETED_FILE"

function show_menu() {
  echo ""
  echo "====== ToDo App ======"
  echo "1. Add new task"
  echo "2. Show pending tasks"
  echo "3. Mark task as done"
  echo "4. Show completed tasks"
  echo "5. Delete task"
  echo "6. Show deleted tasks"
  echo "7. Search tasks by status"
  echo "8. Exit"
  echo "======================"
}



function print_tasks() {
  local file=$1
  if [[ ! -s "$file" ]]; then
    echo "No tasks."
  else
    printf "%-4s | %-19s | %-8s | %-8s | %s\n" "No." "Date" "Priority" "Status" "Description"
    echo "-------------------------------------------------------------------------------------"
    awk -F'\\| ' '{ printf "%-4d | %-19s | %-8s | %-8s | %s\n", NR, $1, $2, $3, $4 }' "$file"
  fi
}




while true; do
  show_menu
  read -p "Enter your choice: " choice

  case $choice in
    1)
        read -p "Enter task description: " desc
        read -p "Enter priority (1=High, 2=Medium, 3=Low): " priority
        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$timestamp | $priority | pending | $desc" >> "$PENDING_FILE"
        echo "Task added successfully."
        ;;

    2)
        echo ""
        echo "------ Pending Tasks ------"
        if [[ ! -s "$PENDING_FILE" ]]; then
            echo "No pending tasks."
        else
            print_tasks "$PENDING_FILE" 
        fi
        echo "---------------------------"
        ;;

    3)
        echo ""
        echo "------ Pending Tasks ------"
        if [[ ! -s "$PENDING_FILE" ]]; then
            echo "No pending tasks to mark as done."
        else
            nl "$PENDING_FILE"
            read -p "Enter the task number to mark as done: " num
            task=$(sed -n "${num}p" "$PENDING_FILE")

            if [[ -z "$task" ]]; then
            echo "Invalid task number."
            else
            echo "$task" >> "$DONE_FILE"
            sed -i "${num}d" "$PENDING_FILE"
            echo "Task marked as done."
            fi
        fi
        echo "---------------------------"
        ;;

    4)
        echo ""
        echo "------ Completed Tasks ------"
        if [[ ! -s "$DONE_FILE" ]]; then
            echo "No completed tasks."
        else
            print_tasks "$DONE_FILE"
        fi
        echo "-----------------------------"
        ;;

    5)
        echo ""
        echo "------ Pending Tasks ------"
        if [[ ! -s "$PENDING_FILE" ]]; then
            echo "No pending tasks to delete."
        else
            nl "$PENDING_FILE"
            read -p "Enter the task number to delete: " num
            task=$(sed -n "${num}p" "$PENDING_FILE")

            if [[ -z "$task" ]]; then
            echo "Invalid task number."
            else
            echo "$task" >> "$DELETED_FILE"
            sed -i "${num}d" "$PENDING_FILE"
            echo "Task deleted."
            fi
        fi
        echo "---------------------------"
        ;;

    6)
        echo ""
        echo "------ Deleted Tasks ------"
        if [[ ! -s "$DELETED_FILE" ]]; then
            echo "No deleted tasks."
        else
            print_tasks "$DELETED_FILE"
        fi
        echo "---------------------------"
        ;;

    7)
        echo ""
        echo "Search by status:"
        echo "1. Pending"
        echo "2. Completed"
        echo "3. Deleted"
        read -p "Enter option (1-3): " search_choice

        case $search_choice in
            1)
            echo "------ Pending Tasks ------"
            if [[ ! -s "$PENDING_FILE" ]]; then
                echo "No pending tasks."
            else
                print_tasks "$PENDING_FILE" 
            fi
            ;;
            2)
            echo "------ Completed Tasks ------"
            if [[ ! -s "$DONE_FILE" ]]; then
                echo "No completed tasks."
            else
                print_tasks "$DONE_FILE"
            fi
            ;;
            3)
            echo "------ Deleted Tasks ------"
            if [[ ! -s "$DELETED_FILE" ]]; then
                echo "No deleted tasks."
            else
                print_tasks "$DELETED_FILE"
            fi
            ;;
            *)
            echo "Invalid search option."
            ;;
        esac
        ;;

    8) echo "Exiting. Goodbye!" ; exit 0 ;;
    *) echo "Invalid option. Try again." ;;
  esac
done
