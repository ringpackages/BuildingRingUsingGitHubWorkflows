# Test RingQt6 (Full)
# Run using : QT_QPA_PLATFORM=offscreen ring testqt6.ring

load "guilib.ring"

new qApp {
	win = new qWidget() {
		resize(300,200)
		setWindowTitle("RingQt6")
	}
	button = new qPushButton(win) {
		setText("Hello RingQt6")
	}
	win.show()
	? "Button text : " + button.text()
	if button.text() != "Hello RingQt6"
		? "Error: QPushButton test failed"
		shutdown(1)
	ok
	win.close()
}

# Classes from the other Qt modules
aClasses = [:QChartView, :QSvgWidget, :QSqlDatabase, :QNetworkRequest, :QQuickWidget, :QMediaPlayer]
for cClass in aClasses
	if not isClass(cClass)
		? "Error: Class not found: " + cClass
		shutdown(1)
	ok
next

? "RingQt6 (Full) is working"
