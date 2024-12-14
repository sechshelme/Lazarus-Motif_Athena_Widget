/* ex8.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

#include <stdio.h>

static void eventHandler();

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
	XtAddEventHandler(banner,
			KeyPressMask | ButtonPressMask | ButtonReleaseMask |
			ExposureMask | PointerMotionMask,
			FALSE, eventHandler, NULL);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

static void eventHandler(w, client_data, event, CTP)
Widget w;
XtPointer client_data;
XEvent *event;
Boolean CTP;
{	XMotionEvent *motionE;
	XButtonEvent *buttonE;
	XKeyEvent *keyE;
	XExposeEvent *exposeE;

	switch (event->type) {

	case MotionNotify:
		motionE = (XMotionEvent *) event;
		(void) printf("Motion: %d %d\n",
				motionE->x, motionE->y);
		break;

	case ButtonPress:
	case ButtonRelease:
		buttonE = (XButtonEvent *) event;
		(void) printf("Button %s: %d at %d %d\n",
				(buttonE->type == ButtonPress ?
					"press" : "release"),
				buttonE->button,
				buttonE->x, buttonE->y);
		break;

	case KeyPress:
		keyE = (XKeyEvent *) event;
		(void) printf("Key event %d\n", keyE->keycode);
		break;

	case Expose:
		exposeE = (XExposeEvent *) event;
		(void) printf("Expose: %d\n", exposeE->count);
		break;
	}
}
