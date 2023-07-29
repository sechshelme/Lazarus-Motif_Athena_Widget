/* Example ex1.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Shell.h>
#include <X11/Xaw/Label.h>

#include <X11/bitmaps/escherknot>

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;
	Pixmap p;
	Arg args[4];
	int n;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	n = 0;
	XtSetArg(args[n], XtNlabel, "Hello World");	n++;
	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, args, n);

	XtRealizeWidget(shell);

	p = XCreateBitmapFromData(XtDisplay(shell), XtWindow(shell),
			escherknot_bits, escherknot_width, escherknot_height);
	n = 0;
	XtSetArg(args[n], XtNiconPixmap, p);	n++;
	XtSetValues(shell, args, n);

	XtAppMainLoop(appContext);
}
