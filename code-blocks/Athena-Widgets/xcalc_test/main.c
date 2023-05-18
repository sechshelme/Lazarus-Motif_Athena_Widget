#include  <X11/StringDefs.h>
#include  <X11/Intrinsic.h>
#include  <X11/Xaw/Box.h>
#include  <X11/Xaw/Command.h>

int main(int argc, char **argv) {

    Widget toplevel, box, command;

//    toplevel = XtInitialize("Mein Fenster", "XClipboard", NULL, 0, &argc, argv);
    toplevel = XtInitialize("Mein Fenster", "XCalc", NULL, 0, &argc, argv);

    box = XtCreateManagedWidget("Button Gruppe", boxWidgetClass, toplevel, NULL, 0);

    XtCreateManagedWidget("Hello World !", commandWidgetClass, box, NULL, 0);
    XtCreateManagedWidget("Programm beenden", commandWidgetClass, box, NULL, 0);

    XtRealizeWidget(toplevel);
    XtMainLoop();
}


