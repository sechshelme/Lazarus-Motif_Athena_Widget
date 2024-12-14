/* Example ex5.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>
#include <X11/Xaw/Box.h>

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget box;
	Widget l1, l2, l3;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	box = XtCreateManagedWidget("box", boxWidgetClass,
			shell, NULL, 0);

	l1 = XtCreateManagedWidget("l1", labelWidgetClass,
			box, NULL, 0);
	l2 = XtCreateManagedWidget("l2", labelWidgetClass,
			box, NULL, 0);
	l3 = XtCreateManagedWidget("l3", labelWidgetClass,
			box, NULL, 0);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

