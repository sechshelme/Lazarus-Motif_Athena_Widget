/* Example ex6.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Box.h>
#include <X11/Xaw/Command.h>

static Widget shell;
static Widget box;
static Widget doInsensitive;
static Widget doUnmap;
static Widget doUnmanage;
static Widget doReset;
static Widget doQuit;

static void unmapMe();
static void unmanageMe();
static void desensitizeMe();
static void resetAll();
static void Quit();

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);

	box = XtCreateManagedWidget("box", boxWidgetClass,
			shell, NULL, 0);

	doInsensitive = XtCreateManagedWidget("insensitive",
				commandWidgetClass,
				box, NULL, 0);
	XtAddCallback(doInsensitive, XtNcallback, desensitizeMe, NULL);

	doUnmap = XtCreateManagedWidget("unmap", commandWidgetClass,
				box, NULL, 0);
	XtAddCallback(doUnmap, XtNcallback, unmapMe, NULL);

	doUnmanage = XtCreateManagedWidget("unmanage",
				commandWidgetClass,
				box, NULL, 0);
	XtAddCallback(doUnmanage, XtNcallback, unmanageMe, NULL);

	doReset = XtCreateManagedWidget("reset", commandWidgetClass,
				box, NULL, 0);
	XtAddCallback(doReset, XtNcallback, resetAll, NULL);

	doQuit = XtCreateManagedWidget("quit", commandWidgetClass,
				box, NULL, 0);
	XtAddCallback(doQuit, XtNcallback, Quit, NULL);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

static void desensitizeMe(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	XtSetSensitive(w, False);
}

static void unmapMe(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	Arg arg;
	XtSetArg(arg, XtNmappedWhenManaged, False);
	XtSetValues(w, &arg, 1);
	XtUnmapWidget(w);
}

static void unmanageMe(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	XtUnmanageChild(w);
}

static void resetAll(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{       Arg arg;
	XtSetSensitive(doInsensitive, True);
	XtSetArg(arg, XtNmappedWhenManaged, True);
	XtSetValues(doUnmap, &arg, 1);
	XtMapWidget(doUnmap);
	XtManageChild(doUnmanage);
}

static void Quit(w, client_data, call_data)
Widget w;
XtPointer client_data, call_data;
{	XtDestroyWidget(shell);
	exit(0);
}
