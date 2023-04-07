// https://ergodic.ugr.es/cphys_pedro/unix/athena2.html

#include  <X11/StringDefs.h>
#include  <X11/Intrinsic.h>
#include  <X11/Xaw/Command.h>

void quit(Widget w, XtPointer *client, XtPointer call) {
    exit(0);
}

int main(int argc, char **argv) {
    Widget toplevel, command;
    Arg  wargs[10];

    toplevel = XtInitialize(argv[0], "simple", NULL, 0, &argc, argv);

    command = XtCreateManagedWidget("Hello World !", commandWidgetClass, toplevel, NULL, 0);
    XtAddCallback(command, XtNcallback, quit, NULL);

    XtSetArg(wargs[0], XtNwidth, 320);
    XtSetArg(wargs[1], XtNheight, 200);
    XtSetArg(wargs[2], XtNlabel, "Click = Quit");
    XtSetArg(wargs[3], XtNbackground, 0xFF);
    XtSetArg(wargs[4], XtNforeground, 0xFFFFFF);

    XtSetValues(command, wargs, 5);

    XtRealizeWidget(toplevel);

    XtMainLoop();
}
