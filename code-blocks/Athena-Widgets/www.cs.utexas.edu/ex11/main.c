/* Example ex11.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>

static void ExposeAction();

static XtActionsRec actionTable[] = {
	{ "ExposeAction", ExposeAction },
};

typedef struct _Resources {
	Pixel foreground;
	Pixel background;
	XFontStruct *fontStruct;
} Resources;

static Resources theResources;

static XtResource resourceSpec[] = {
	{ XtNforeground, XtCForeground, XtRPixel, sizeof(Pixel),
	  XtOffsetOf(Resources, foreground),
	  XtRString, "XtDefaultForeground"},
	{ XtNbackground, XtCBackground, XtRPixel, sizeof(Pixel),
	  XtOffsetOf(Resources, background),
	  XtRString, "XtDefaultBackground"},
	{ XtNfont, XtCFont, XtRFontStruct, sizeof(XFontStruct *),
	  XtOffsetOf(Resources, fontStruct),
	  XtRString, "XtDefaultFont"},
};

static Widget shell;
static Widget drawing;
static GC gc;

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	XGCValues gc_values;

	shell = XtAppInitialize(&appContext, "Example", NULL, 0,
			&argc, argv, NULL, NULL, 0);
        XtGetApplicationResources(shell, &theResources,
                        resourceSpec, XtNumber(resourceSpec), NULL, 0);
	XtAppAddActions(appContext, actionTable, XtNumber(actionTable));

	drawing = XtCreateManagedWidget("drawing", widgetClass,
			shell, NULL, 0);

	XtRealizeWidget(shell);

	gc_values.foreground = theResources.foreground;
	gc_values.background = theResources.background;
	gc_values.line_width = 5;
	gc_values.cap_style = CapRound;
	gc_values.join_style = JoinRound;
	gc_values.font = theResources.fontStruct->fid;
	gc = XCreateGC(XtDisplay(drawing), XtWindow(drawing),
			GCForeground | GCBackground | GCLineWidth |
			GCCapStyle | GCJoinStyle | GCFont, &gc_values);

	XtAppMainLoop(appContext);
}

static void ExposeAction(w, event, params, num)
Widget w;
XEvent *event;
String *params;
Cardinal *num;
{	XDrawLine(XtDisplay(drawing), XtWindow(drawing), gc,
			100, 300, 300, 100);
	XDrawRectangle(XtDisplay(drawing), XtWindow(drawing), gc,
			50, 50, 90, 120);
	XFillArc(XtDisplay(drawing), XtWindow(drawing), gc,
			200, 200, 150, 90, 10*64, 170*64);
	XDrawString(XtDisplay(drawing), XtWindow(drawing), gc,
			50, 200, "A string", 8);
	XDrawImageString(XtDisplay(drawing), XtWindow(drawing), gc,
			180, 180, "Another string", 14);
}
