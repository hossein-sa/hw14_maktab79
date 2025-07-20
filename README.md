# HW14 - Bash and Git Scripts

This project contains solutions for HW14, including Bash scripts and Git integration.

## 📝 Scripts Overview

### `todo.sh`
A command-line ToDo task manager with the following features:
- Add new task with timestamp and priority
- Show pending tasks
- Mark task as done
- Delete a task
- Show completed and deleted tasks
- Search tasks by status (pending, done, deleted)

### `pomodoro.sh`
A Pomodoro-style deep work timer:
- User inputs number of deep work sessions
- Each session is 10 seconds long
- After each session (except the last one):
  - A **5-second short break** is given by default
  - **Every 3rd session**, a **30-second long break** replaces the short one  
    (e.g., after 3rd, 6th, 9th session, etc.)
- All timing is simulated with `sleep` and works in terminal

### `file_menu.sh`
A menu-based Bash script with 3 options:
1. Create 5 numbered `.txt` files based on a base name
2. Append `Hello world` to all `.txt` files
3. Replace the word `world` with `bash` in all `.txt` files

## 📂 Project Structure

```
hw14_todo_project/
├── data/
│   ├── pending.txt
│   ├── done.txt
│   └── deleted.txt
├── todo.sh
├── pomodoro.sh
├── file_menu.sh
└── README.md
```

## ▶️ How to Run

Make scripts executable:

```bash
chmod +x *.sh
```

Then run, for example:

```bash
./todo.sh
```

## 📌 Notes

- Designed to run on Ubuntu-based Linux systems
- All data is saved in plain `.txt` files
- No external dependencies required
