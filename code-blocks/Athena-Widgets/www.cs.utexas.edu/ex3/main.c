/* Example ex3.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Command.h>

#include <stdio.h>

static int times;
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
	XtAddCallback(banner, XtNcallback, CallbackRoutine, &times);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

static void CallbackRoutine(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	int *times;
	times = (int *) client_data;
	(void) printf("Callback called %d\n", (*times)++);
}
