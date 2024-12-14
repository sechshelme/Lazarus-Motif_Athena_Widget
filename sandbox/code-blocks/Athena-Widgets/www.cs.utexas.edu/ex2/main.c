/* Example ex2.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, NULL, 0);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}
