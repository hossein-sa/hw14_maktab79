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
- User inputs number of sessions
- Each session: 10 seconds of "work", 5 seconds of "short break"
- If sessions > 4, a final long break of 30 seconds is added

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

## 🔗 GitHub Repository

[https://github.com/hossein-sa/hw14_maktab79](https://github.com/hossein-sa/hw14_maktab79)

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
