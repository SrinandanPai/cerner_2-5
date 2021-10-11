How to list down all the tasks upon opening terminal?
---

Add the following piece of code into `.bash_profile` / `.zshrc` file
```
alias task='sh <file_path>/task.sh'
task
```

How to use?
---

## To list down taks:
```bash
sh task.sh
```
or

If you have created `task` alias
```bash
task
```

## To add task:
```bash
sh task add "Wrtie a program for cerner_2tothe5th_2021"
```
or

If you have created `task` alias
```bash
task add "Wrtie a program for cerner_2tothe5th_2021"
```

## To mark a task complete:
```bash
sh task completed <task_number>
```
or

If you have created `task` alias
```bash
task completed <task_number>
```

## To mark all tasks complete:
```bash
sh task completed
```
or

If you have created `task` alias
```bash
task completed
```