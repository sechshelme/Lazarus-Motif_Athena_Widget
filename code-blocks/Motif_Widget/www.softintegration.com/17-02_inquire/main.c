
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* inquire.c -- inquire about the data format of the data on the
 * clipboard.
 */
#include <Xm/Xm.h>
#include <Xm/CutPaste.h>
#include <Xm/RowColumn.h>
#include <Xm/PushB.h>

static void check_fmts(), add_fmt();

main(argc, argv)
int argc;
char *argv[];
{
    Widget toplevel, rowcol, button;
    XtAppContext app;

    XtSetLanguageProc (NULL, NULL, NULL);

    /* Initialize toolkit, application context and toplevel shell */
    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    /* manage two buttons in a RowColumn widget */
    rowcol = XtVaCreateWidget ("rowcol",
        xmRowColumnWidgetClass, toplevel,
        NULL);

    /* button1 copies to the clipboard */
    button = XtVaCreateManagedWidget ("button1",
        xmPushButtonWidgetClass, rowcol,
        XtVaTypedArg, XmNlabelString, XmRString,
            "Add Format", sizeof (char *),
        NULL);
    XtAddCallback (button, XmNactivateCallback, add_fmt, NULL);

    /* button2 checks the formats known */
    button = XtVaCreateManagedWidget ("button2",
        xmPushButtonWidgetClass, rowcol,
        XtVaTypedArg, XmNlabelString, XmRString,
            "Check Known Formats", sizeof (char *),
        NULL);
    XtAddCallback (button, XmNactivateCallback, check_fmts, NULL);

    /* manage RowColumn, realize toplevel shell and start main loop */
    XtManageChild (rowcol);
    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

static void
add_fmt(widget, client_data, call_data)
Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    unsigned long item_id, data_id;
    Display *dpy = XtDisplay (widget);
    Window window = XtWindow (widget);
    XmString label = XmStringCreateLocalized ("integer");
    int status, ten = 10;

    /* register "INTEGER" with clipboard. */
    if (XmClipboardRegisterFormat (dpy, "INTEGER", 32) == ClipboardFail) {
        XtWarning ("Can't register INTEGER");
        return;
    }

    do
	status = XmClipboardStartCopy (dpy, window, label, CurrentTime,
	    NULL, NULL, &item_id);
    while (status == ClipboardLocked);

    XmStringFree (label);

    do
        status = XmClipboardCopy (dpy, window, item_id, "INTEGER",
	    (char *) &ten, sizeof (int), NULL, &data_id);
    while (status == ClipboardLocked);

    do
        status = XmClipboardEndCopy (dpy, window, item_id);
    while (status == ClipboardLocked);
}

static void
check_fmts(widget, client_data, call_data)
Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    Display *dpy = XtDisplay (widget);
    Window window = XtWindow (widget);
    char *fmt_str;
    int status, len = 1, i, count, maxlen;

    do
        status = XmClipboardInquireCount (dpy, window, &count, &maxlen);
    while (status == ClipboardLocked);

    printf ("#-formats: %d, strlen of longest format name: %d\n",
	count, maxlen);

    if (count == 0 || status != ClipboardSuccess ||
	!(fmt_str = XtMalloc (maxlen+1))) {
	XtWarning ("Can't get clipboard formats");
	return;
    }

    for (i = 1; i <= count; i++) {
	do status = XmClipboardInquireFormat (dpy, window, i,
	    fmt_str, maxlen, &len);
	while (status == ClipboardLocked);
//	fmt_str[len] = 0;
	printf ("Format %d: %s\n", i, fmt_str);
    }
    XtFree (fmt_str);
}

