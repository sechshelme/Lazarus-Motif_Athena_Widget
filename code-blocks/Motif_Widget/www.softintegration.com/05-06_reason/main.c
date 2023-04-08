
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* reason.c -- examine the reason field of the callback structure
 * passed as the call_data of the callback function.  This field
 * indicates which action area button in the dialog was pressed.
 */
#include <Xm/RowColumn.h>
#include <Xm/MessageB.h>
#include <Xm/PushB.h>

/* main() --create a pushbutton whose callback pops up a dialog box */
int main(argc, argv)
int argc;
char *argv[];
{
    XtAppContext app;
    Widget toplevel, rc, pb;
    extern void pushed();

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    rc = XtVaCreateWidget ("rowcol", xmRowColumnWidgetClass, toplevel, NULL);

    pb = XtVaCreateManagedWidget ("Hello",
        xmPushButtonWidgetClass, rc, NULL);
    XtAddCallback (pb, XmNactivateCallback, pushed, "Hello World");

    pb = XtVaCreateManagedWidget ("Goodbye",
        xmPushButtonWidgetClass, rc, NULL);
    XtAddCallback (pb, XmNactivateCallback, pushed, "Goodbye World");

    XtManageChild (rc);
    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

/* pushed() --the callback routine for the main app's pushbuttons.
 * Create and popup a dialog box that has callback functions for
 * the OK, Cancel and Help buttons.
 */
void
pushed(widget, client_data, call_data)
Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    static Widget dialog;
    char *message = (char *) client_data;
    XmString t = XmStringCreateLocalized (message);

    /* See if we've already created this dialog -- if so,
     * we don't need to create it again.  Just set the message
     * and manage it (repop it up).
     */
    if (!dialog) {
        extern void callback();
        Arg args[5];
        int n = 0;

        XtSetArg (args[n], XmNautoUnmanage, False); n++;
        dialog = XmCreateMessageDialog (widget, "notice", args, n);
        XtAddCallback (dialog, XmNokCallback, callback, "Hi");
        XtAddCallback (dialog, XmNcancelCallback, callback, "Foo");
        XtAddCallback (dialog, XmNhelpCallback, callback, "Bar");
    }
    XtVaSetValues (dialog, XmNmessageString, t, NULL);
    XmStringFree (t);
    XtManageChild (dialog);

    XtPopup (XtParent (dialog), XtGrabNone);
}

/* callback() --One of the dialog buttons was selected.
 * Determine which one by examining the "reason" parameter.
 */
void
callback(widget, client_data, call_data)
Widget widget;
XtPointer client_data;
XtPointer call_data;
{
    char *button;
    char *message = (char *) client_data;
    XmAnyCallbackStruct *cbs = (XmAnyCallbackStruct *) call_data;

    switch (cbs->reason) {
        case XmCR_OK : button = "OK"; break;
        case XmCR_CANCEL : button = "Cancel"; break;
        case XmCR_HELP : button = "Help"; break;
    }
    printf ("%s was selected: %s\n", button, message);
    if (cbs->reason != XmCR_HELP) {
        /* the ok and cancel buttons "close" the widget */
        XtPopdown (XtParent (widget));
    }
}
