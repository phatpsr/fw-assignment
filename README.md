# Assignment 
## A. Test cases
1. Authorization & User - Please find in test scripts file
2. Search - Please find in file `FW-Assignment.xlsx`
   
## B. Automated test scripts
A executable automation-test-scripts project.
___I create test scripts only for "Authentication & Users" because automated needs specific expected results.___
### Installation
To execute the project. you must install the follwing
1. Install [robotframework 5.0.1](https://robotframework.org/)
```
pip install robotframework
```
2. Install [robotframework-browser 13.1.0](https://robotframework-browser.org/#installation)
```
pip install robotframework-browser
```
```
rfbrowser init
```

### Execution
Run file `run-robot.cmd`

## C. Folder structure
Description of the project structure
```
|- Test suite 1                 # Refer to business requirement
    |- \__init__.robot          # Specify test suite related setting
    |- C001_testcase.robot      # Test case
    |- C002_testcase.robot
    ...
|- Test suite 2
|- Resource 
    |- keyword.resource         # Common keywords
    |- variable.resource        # Common variables
|- z-output                     # Report
    |- report                   # Named by datetime
        |- log.html             # Test log
        |- report.html          # Test report
        |- output.xml
        |- playwright-log.txt
| - run-robot.cmd               # Execute file (for Windows)
```

## D. Share obstacles, problems & solutions 
I've designed to create test scripts at first, but I've stuck with some point.
   1. I got business requirements with petty of detials. So, I decided to test based on positive cases what users can do for get the jobs done! It would be better If I have more details of how application works. ie. validation, logic, data
   2. Automated test needs specific expected results. So, I have to manual some functions. For example ...
      1. Signup Gmail before signup Fastwork because Google needs multi-factor verification.
      2. Search function. I have no idea how application works. This function gets varity of data. I decided just to list the simple cases which user may do.

In conclusion, I’m not so confidence if I must do black-box testing. I would appreciate more specific requirements which I can identify expected results. (No guess)

Looking forward to discuss more details.
Thank you