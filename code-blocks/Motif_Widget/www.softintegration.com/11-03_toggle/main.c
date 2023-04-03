/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* toggle.c -- demonstrate a simple toggle button.  */
#include <Xm/ToggleB.h>
#include <Xm/RowColumn.h>

void
toggled(widget, client_data, call_data)
Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    XmToggleButtonCallbackStruct *state =
        (XmToggleButtonCallbackStruct *) call_data;

    printf ("%s: %s\n", XtName (widget), state->set? "on" : "off");
}

main(argc, argv)
int argc;
char *argv[];
{
    Widget toplevel, rowcol, toggle;
    XtAppContext app;
    Pixmap on, off;
    Pixel fg, bg;

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    rowcol = XtVaCreateWidget ("_rowcol",
        xmRowColumnWidgetClass, toplevel,
        XmNorientation, XmHORIZONTAL,
        NULL);

    XtVaGetValues (rowcol,
        XmNforeground, &fg,
        XmNbackground, &bg,
        NULL);
    on = XmGetPixmap (XtScreen (rowcol), "switch_on.xpm", fg, bg);
    off = XmGetPixmap (XtScreen (rowcol), "switch_off.xpm", fg, bg);
    if (on == XmUNSPECIFIED_PIXMAP || off == XmUNSPECIFIED_PIXMAP) {
        puts ("Couldn't load pixmaps");
        exit (1);
    }

    toggle = XtVaCreateManagedWidget ("toggle",
        xmToggleButtonWidgetClass, rowcol,
        XmNlabelType,    XmPIXMAP,
        XmNlabelPixmap,  off,
        XmNselectPixmap, on,
        NULL);
    XtAddCallback (toggle, XmNvalueChangedCallback, toggled, NULL);

    toggle = XtVaCreateManagedWidget ("toggle",
        xmToggleButtonWidgetClass, rowcol,
        XmNlabelType,    XmPIXMAP,
        XmNlabelPixmap,  off,
        XmNselectPixmap, on,
        NULL);
    XtAddCallback (toggle, XmNvalueChangedCallback, toggled, NULL);

    XtManageChild (rowcol);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}
