/* Example ex7.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

static void ActionA();
static void ActionB();

static XtActionsRec actionTable[] = {
	{ "ActionA", ActionA },
	{ "ActionB", ActionB },
};

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	XtAppAddActions(appContext, actionTable, XtNumber(actionTable));

	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, NULL, 0);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

static void ActionA(w, event, params, num)
Widget w;
XEvent *event;
String *params;
Cardinal *num;
{	Arg arg;
	char buffer[32];
	static int times;

	(void) sprintf(buffer, "ActionA called %d", times++);
	XtSetArg(arg, XtNlabel, buffer);
	XtSetValues(w, &arg, 1);
}

static void ActionB(w, event, params, num)
Widget w;
XEvent *event;
String *params;
Cardinal *num;
{	Arg arg;
	char buffer[64];

	(void) sprintf(buffer, "ActionB called: %d %s",
			*num, *params);
        XtSetArg(arg, XtNlabel, buffer);
        XtSetValues(w, &arg, 1);
}
