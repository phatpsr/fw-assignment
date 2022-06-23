# READ ME

## Installation
To execute the project. you must install the follwing
1. Install [robotframework 5.0.1](https://robotframework.org/)
```
pip install robotframework
```
2. Install [robotframework-browser 13.1.0](https://robotframework-browser.org/#installation)
```
pip install robotframework-browser
rfbrowser init
```

## Execution
Run file `run-robot.cmd`

## Folder structure
```
|- Test suite 1
    |-- \__init__.robot
    |-- C001_testcase.robot 
    |-- C002_testcase.robot
    ...
|- Test suite 2
|- Resource 
    |-- keyword.resource
    |-- variable.resource 
|- z-output
    |-- report
| - run-robot.cmd
```