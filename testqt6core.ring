# Test RingQt6 (Core) 

load "qtcore.ring"

oDir = new QDir()
cPath = oDir.currentPath()
? "Current path : " + cPath
if cPath = NULL
	? "Error: QDir.currentPath() returned an empty string"
	shutdown(1)
ok

oString = new QString2()
oString.append("RingQt6")
? "QString2 count : " + oString.count()
if oString.count() != 7
	? "Error: QString2 test failed"
	shutdown(1)
ok

? "RingQt6 (Core) is working"
