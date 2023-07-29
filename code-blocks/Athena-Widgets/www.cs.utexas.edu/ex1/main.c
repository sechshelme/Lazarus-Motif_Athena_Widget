/* Example ex1.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;
	Arg args[4];
	int n;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	n = 0;
	XtSetArg(args[n], XtNlabel, "Hello World");	n++;
	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, args, n);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}
