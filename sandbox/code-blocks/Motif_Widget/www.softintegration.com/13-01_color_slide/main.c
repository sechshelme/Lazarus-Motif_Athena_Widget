
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* color_slide.c -- Use scale widgets to display the different
 * colors of a colormap.
 */
#include <Xm/LabelG.h>
#include <Xm/Scale.h>
#include <Xm/RowColumn.h>
#include <Xm/DrawingA.h>

Widget colorwindow; /* the window the displays a solid color */
XColor color;       /* the color in the colorwindow */

main(argc, argv)
int argc;
char *argv[];
{
    Widget        toplevel, rowcol, scale;
    XtAppContext  app;
    void          new_value();
    XtVarArgsList arglist;

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    if (DefaultDepthOfScreen (XtScreen (toplevel)) < 2) {
        puts ("You must be using a color screen.");
        exit (1);
    }

    color.flags = DoRed | DoGreen | DoBlue;
    /* initialize first color */
    XAllocColor (XtDisplay (toplevel),
        DefaultColormapOfScreen (XtScreen (toplevel)), &color);

    rowcol = XtVaCreateManagedWidget ("rowcol",
        xmRowColumnWidgetClass, toplevel, NULL);

    colorwindow = XtVaCreateManagedWidget ("colorwindow",
        widgetClass,   rowcol,
        XmNheight,     100,
        XmNbackground, color.pixel,
        NULL);

    /* use rowcol again to create another RowColumn under the 1st */
    rowcol = XtVaCreateWidget ("rowcol", xmRowColumnWidgetClass, rowcol,
        XmNorientation, XmHORIZONTAL,
        NULL);

    arglist = XtVaCreateArgsList (NULL,
        XmNshowValue, True,
        XmNmaximum, 255,
        XmNscaleMultiple, 5,
        NULL);

    scale = XtVaCreateManagedWidget ("Red",
        xmScaleWidgetClass, rowcol,
        XtVaNestedList, arglist,
        XtVaTypedArg, XmNtitleString, XmRString, "Red", 4,
        XtVaTypedArg, XmNforeground, XmRString, "Red", 4,
        NULL);
    XtAddCallback (scale, XmNdragCallback, new_value, (XtPointer)DoRed);
    XtAddCallback (scale, XmNvalueChangedCallback, new_value, (XtPointer)DoRed);

    scale = XtVaCreateManagedWidget ("Green",
        xmScaleWidgetClass, rowcol,
        XtVaNestedList, arglist,
        XtVaTypedArg, XmNtitleString, XmRString, "Green", 6,
        XtVaTypedArg, XmNforeground, XmRString, "Green", 6,
        NULL);
    XtAddCallback (scale, XmNdragCallback, new_value, (XtPointer)DoGreen);
    XtAddCallback (scale, XmNvalueChangedCallback, new_value, (XtPointer)DoGreen);

    scale = XtVaCreateManagedWidget ("Blue",
        xmScaleWidgetClass, rowcol,
        XtVaNestedList, arglist,
        XtVaTypedArg, XmNtitleString, XmRString, "Blue", 5,
        XtVaTypedArg, XmNforeground, XmRString, "Blue", 5,
        NULL);
    XtAddCallback (scale, XmNdragCallback, new_value, (XtPointer)DoBlue);
    XtAddCallback (scale, XmNvalueChangedCallback, new_value, (XtPointer)DoBlue);

    XtFree (arglist);

    XtManageChild (rowcol);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

void
new_value(scale_w, client_data, call_data)
Widget scale_w;
XtPointer client_data;
XtPointer call_data;
{
    int rgb = (int) client_data;
    XmScaleCallbackStruct *cbs = (XmScaleCallbackStruct *) call_data;
    Colormap cmap = DefaultColormapOfScreen (XtScreen (scale_w));

    switch (rgb) {
        case DoRed :
            color.red = (cbs->value << 8);
            break;
        case DoGreen :
            color.green = (cbs->value << 8);
            break;
        case DoBlue :
            color.blue = (cbs->value << 8);
            break;
    }

    /* reuse the same color again and again */
    XFreeColors (XtDisplay (scale_w), cmap, &color.pixel, 1, 0);
    if (!XAllocColor (XtDisplay (scale_w), cmap, &color)) {
        puts ("Couldn't XAllocColor!");
	exit(1);
    }
    XtVaSetValues (colorwindow, XmNbackground, color.pixel, NULL);
}
