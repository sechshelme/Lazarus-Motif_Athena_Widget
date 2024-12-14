/* ex12.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

#define char unsigned char
#include <X11/bitmaps/escherknot>
#undef char

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

	p = XCreateBitmapFromData(XtDisplay(shell),
			DefaultRootWindow(XtDisplay(shell)),
			(char *) escherknot_bits,
			escherknot_width, escherknot_height);

	n = 0;
	XtSetArg(args[n], XtNbitmap, p);	n++;
	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, args, n);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}
