# Test RingQt6 (Light) - Core + GUI + Widgets
# Run using : QT_QPA_PLATFORM=offscreen ring testqt6light.ring

load "lightguilib.ring"

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

? "RingQt6 (Light) is working"
