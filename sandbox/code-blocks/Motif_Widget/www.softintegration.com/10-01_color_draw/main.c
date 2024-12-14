
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* color_draw.c -- simple drawing program using predefined colors.  */
#include <Xm/MainW.h>
#include <Xm/DrawingA.h>
#include <Xm/PushBG.h>
#include <Xm/PushB.h>
#include <Xm/RowColumn.h>
#include <Xm/ScrolledW.h>
#include <Xm/Form.h>

GC gc;
Pixmap pixmap;
/* dimensions of drawing area (pixmap) */
Dimension width, height;

String colors[] = {
    "Black", "Red", "Green", "Blue", "White", "Navy", "Orange", "Yellow",
    "Pink", "Magenta", "Cyan", "Brown", "Grey", "LimeGreen", "Turquoise",
    "Violet", "Wheat", "Purple"
};

void
Exit(drawing_a, client_data, call_data)
Widget    drawing_a;
XtPointer client_data;
XtPointer call_data;
{
  exit(0);
}

main(argc, argv)
int argc;
char *argv[];
{
    Widget toplevel, main_w, sw, rc, form, drawing_a, pb;
    XtAppContext app;
    XGCValues gcv;
    void draw(), redraw(), set_color(), exit(), clear_it();
    int i;
    XtActionsRec actions;
    String translations = /* for the DrawingArea widget */
        ":   draw(down)\n\
         :     draw(up)  \n\
         : draw(motion)";

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    /* Create a MainWindow to contain the drawing area */
    main_w = XtVaCreateManagedWidget ("main_w",
        xmFormWidgetClass, toplevel, NULL);

    /* Create a GC for drawing (callback).  Used a lot -- make global */
    gcv.foreground = WhitePixelOfScreen (XtScreen (main_w));
    gc = XCreateGC (XtDisplay (main_w),
        RootWindowOfScreen (XtScreen (main_w)), GCForeground, &gcv);

    /* Create a 3-column array of color tiles */
    rc = XtVaCreateWidget ("rc", xmRowColumnWidgetClass, main_w,
        XmNnumColumns,      3,
        XmNpacking,         XmPACK_COLUMN,
        XmNleftAttachment,  XmATTACH_FORM,
        XmNtopAttachment,   XmATTACH_FORM,
        NULL);
    for (i = 0; i < XtNumber(colors); i++) {
        /* Create a single tile (pixmap) for each color */
        pixmap = XCreatePixmap (XtDisplay (rc),
            RootWindowOfScreen (XtScreen (rc)),
            16, 16, DefaultDepthOfScreen (XtScreen (rc)));
        set_color (rc, colors[i], NULL); /* set the gc's color according to name */
        //set_color (rc, colors[i]); /* set the gc's color according to name */
        XFillRectangle (XtDisplay (main_w), pixmap, gc, 0, 0, 16, 16);
        pb = XtVaCreateManagedWidget (colors[i], xmPushButtonWidgetClass, rc,
            XmNlabelType, XmPIXMAP,
            XmNlabelPixmap, pixmap,
            NULL);
        /* callback for this pushbutton sets the current color */
        XtAddCallback (pb, XmNactivateCallback, set_color, colors[i]);
    }
    XtManageChild (rc);

    pb = XtVaCreateManagedWidget ("Quit",
        xmPushButtonGadgetClass, main_w,
        XmNleftAttachment,    XmATTACH_FORM,
        XmNtopAttachment,     XmATTACH_WIDGET,
        XmNtopWidget,         rc,
        NULL);
    /* XtAddCallback (pb, XmNactivateCallback, exit, NULL); */
    XtAddCallback (pb, XmNactivateCallback, Exit, NULL);

    /* Clear button -- wait till DrawingArea is created so we can use
     * it to pass as client data.
     */
    pb = XtVaCreateManagedWidget ("Clear",
        xmPushButtonGadgetClass, main_w,
        XmNleftAttachment,    XmATTACH_WIDGET,
        XmNleftWidget,        pb,
        XmNtopAttachment,     XmATTACH_WIDGET,
        XmNtopWidget,         rc,
        NULL);

    sw = XtVaCreateManagedWidget ("scrolled_win",
        xmScrolledWindowWidgetClass, main_w,
        XmNwidth,                  300,
        XmNscrollingPolicy,        XmAUTOMATIC,
        XmNscrollBarDisplayPolicy, XmAS_NEEDED,
        XmNtopAttachment,          XmATTACH_FORM,
        XmNbottomAttachment,       XmATTACH_FORM,
        XmNleftAttachment,         XmATTACH_WIDGET,
        XmNleftWidget,             rc,
        XmNrightAttachment,        XmATTACH_FORM,
        NULL);

    /* Add the "draw" action/function used by the translation table
     * parsed by the translations resource below.
     */
    actions.string = "draw";
    actions.proc = draw;
    XtAppAddActions (app, &actions, 1);

    /* Create a DrawingArea widget.  Make it 5 inches wide by 6 inches tall.
     * Don't let it resize so the Clear Button doesn't force a resize.
     */
    drawing_a = XtVaCreateManagedWidget ("drawing_a",
        xmDrawingAreaWidgetClass, sw,
        XmNtranslations, XtParseTranslationTable (translations),
        XmNunitType,     Xm1000TH_INCHES,
        XmNwidth,        5000, /* 5 inches */
        XmNheight,       6000, /* 6 inches */
        XmNresizePolicy, XmNONE,  /* remain this a fixed size */
        NULL);
    /* When scrolled, the drawing area will get expose events */
    XtAddCallback (drawing_a, XmNexposeCallback, redraw, NULL);
    /* Pushing the clear button clears the drawing area widget */
    XtAddCallback (pb, XmNactivateCallback, clear_it, drawing_a);

    /* convert drawing area back to pixels to get its width and height */
    XtVaSetValues (drawing_a, XmNunitType, XmPIXELS, NULL);
    XtVaGetValues (drawing_a, XmNwidth, &width, XmNheight, &height, NULL);
    /* create a pixmap the same size as the drawing area. */
    pixmap = XCreatePixmap (XtDisplay (drawing_a),
        RootWindowOfScreen (XtScreen (drawing_a)), width, height,
        DefaultDepthOfScreen (XtScreen (drawing_a)));
    /* clear pixmap with white */
    set_color (drawing_a, "White", NULL);
    //set_color (drawing_a, "White");
    XFillRectangle (XtDisplay (drawing_a), pixmap, gc, 0, 0, width, height);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

/* Action procedure to respond to any of the events from the
 * translation table declared in main().  This function is called
 * in response to Button1 Down, Up and Motion events.  Basically,
 * we're just doing a freehand draw -- not lines or anything.
 */
void
draw(widget, event, args, num_args)
Widget widget;
XEvent *event;
String *args;
int *num_args;
{
    static Position x, y;
    XButtonEvent *bevent = (XButtonEvent *) event;

    if (*num_args != 1)
        XtError ("Wrong number of args!");

    if (strcmp (args[0], "down")) {
        /* if it's not "down", it must either be "up" or "motion"
         * draw full line from anchor point to new point.
         */
        XDrawLine (bevent->display, bevent->window, gc, x, y,
            bevent->x, bevent->y);
        XDrawLine (bevent->display, pixmap, gc, x, y, bevent->x, bevent->y);
    }

    /* freehand is really a bunch of line segements; save this point */
    x = bevent->x;
    y = bevent->y;
}

/* Clear the window by clearing the pixmap and calling XCopyArea() */
void
clear_it(pb, client_data, call_data)
Widget pb;
XtPointer client_data;
XtPointer call_data;
{
    Widget drawing_a = (Widget) client_data;
    XmPushButtonCallbackStruct *cbs =
        (XmPushButtonCallbackStruct *) call_data;

    /* clear pixmap with white */
    XSetForeground (XtDisplay (drawing_a), gc,
        WhitePixelOfScreen (XtScreen (drawing_a)));
    /* this clears the pixmap */
    XFillRectangle (XtDisplay (drawing_a), pixmap, gc, 0, 0, width, height);
    /* drawing is now done using black; change the gc */
    XSetForeground (XtDisplay (drawing_a), gc,
        BlackPixelOfScreen (XtScreen (drawing_a)));
    /* render the newly cleared pixmap onto the window */
    XCopyArea (cbs->event->xbutton.display, pixmap, XtWindow (drawing_a), gc,
        0, 0, width, height, 0, 0);
}

/* redraw is called whenever all or portions of the drawing area is
 * exposed.  This includes newly exposed portions of the widget resulting
 * from the user's interaction with the scrollbars.
 */
void
redraw(drawing_a, client_data, call_data)
Widget    drawing_a;
XtPointer client_data;
XtPointer call_data;
{
    XmDrawingAreaCallbackStruct *cbs =
        (XmDrawingAreaCallbackStruct *) call_data;

    XCopyArea (cbs->event->xexpose.display, pixmap, cbs->window, gc,
        0, 0, width, height, 0, 0);
}

/* callback routine for when any of the color tiles are pressed.
 * This general function may also be used to set the global gc's
 * color directly.  Just provide a widget and a color name.
 */
void
set_color(widget, client_data, call_data)
 Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    String color = (String) client_data;
    Display *dpy = XtDisplay (widget);
    Colormap cmap = DefaultColormapOfScreen (XtScreen (widget));
    XColor col, unused;

    if (!XAllocNamedColor (dpy, cmap, color, &col, &unused)) {
        char buf[32];
        sprintf (buf, "Can't alloc %s", color);
        XtWarning (buf);
        return;
    }
    XSetForeground (dpy, gc, col.pixel);
}
