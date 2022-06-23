for /F "tokens=2 delims==." %%I in ('wmic os get localdatetime /value') do set "_date=%%I"

robot ^
--name "Authentication_and_user" ^
--log log-%_date%.html ^
--report  report-%_date%.html ^
--output output-%_date%.xml ^
--outputdir ./z-output/%_date% ^
--skip skip ^
./Authentication_and_user

start %cd%\z-output\%_date%\report-%_date%.html