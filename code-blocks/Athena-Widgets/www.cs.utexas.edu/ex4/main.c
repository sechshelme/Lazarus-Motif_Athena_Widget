/* Example ex4.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Command.h>

#include <stdio.h>

static void CallbackRoutine();

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	banner = XtCreateManagedWidget("banner", commandWidgetClass,
			shell, NULL, 0);
	XtAddCallback(banner, XtNcallback, CallbackRoutine, NULL);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

static void CallbackRoutine(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	Dimension width;
	Dimension height;
	Arg args[2];
	char buffer[64];

	XtSetArg(args[0], XtNwidth, &width);
	XtSetArg(args[1], XtNheight, &height);
	XtGetValues(w, args, 2);

	(void) sprintf(buffer, "I am %d x %d",
			width, height);
	XtSetArg(args[0], XtNlabel, buffer);
	XtSetValues(w, args, 1);
}

