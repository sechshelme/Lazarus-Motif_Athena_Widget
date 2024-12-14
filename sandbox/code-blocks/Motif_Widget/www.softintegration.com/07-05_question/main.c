
/* Written by Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* question.c -- create a QuestionDialog with four action buttons
 */
#include <Xm/MessageB.h>
#include <Xm/PushB.h>

main(argc, argv)
int argc;
char *argv[];
{
    XtAppContext app;
    Widget toplevel, pb;
    extern void pushed();

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);
    pb = XtVaCreateManagedWidget ("Button",
        xmPushButtonWidgetClass, toplevel, NULL);
    XtAddCallback (pb, XmNactivateCallback, pushed, NULL);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

void
pushed(w, client_data, call_data)
Widget w;
XtPointer client_data;
XtPointer call_data;
{
    Widget dialog, no_button;
    extern void dlg_callback();
    Arg args[5];
    int n = 0;
    XmString m = XmStringCreateLocalized
        ("Do you want to update your changes?");
    XmString yes = XmStringCreateLocalized ("Yes");
    XmString no = XmStringCreateLocalized ("No");

    XtSetArg (args[n], XmNautoUnmanage, False); n++;
    XtSetArg (args[n], XmNmessageString, m); n++;
    XtSetArg (args[n], XmNokLabelString, yes); n++;
    dialog = XmCreateQuestionDialog (w, "notice", args, n);
    XtAddCallback (dialog, XmNokCallback, dlg_callback, NULL);
    XtAddCallback (dialog, XmNcancelCallback, dlg_callback, NULL);
    XtAddCallback (dialog, XmNhelpCallback, dlg_callback, NULL);
    XmStringFree (m);
    XmStringFree (yes);

    no_button = XtVaCreateManagedWidget ("no",
        xmPushButtonWidgetClass, dialog,
        XmNlabelString, no,
        NULL);
    XtAddCallback (no_button, XmNactivateCallback, dlg_callback, NULL);

    XtManageChild (dialog);
    XtPopup (XtParent (dialog), XtGrabNone);
}

void
dlg_callback(w, client_data, call_data)
Widget w;
XtPointer client_data;
XtPointer call_data;
{
    XmAnyCallbackStruct *cbs = (XmAnyCallbackStruct *) call_data;

    switch (cbs->reason) {
        case XmCR_OK :
        case XmCR_CANCEL :
            XtPopdown (XtParent (w));
            break;
        case XmCR_ACTIVATE :
            XtPopdown (XtParent (XtParent (w)));
            break;
        case XmCR_HELP :
            puts ("Help selected");
            break;
    }
}
