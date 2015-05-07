set SOURCE=_book
set TARGET=D:\workspace\book\wangyibin.github.io

robocopy %SOURCE% %TARGET% /MIR /Z /NFL /NDL /XD .git /XF .gitignore

:: copy SMTKL.TTF %FONT_LOCATION%