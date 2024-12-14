
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* multiple.c -- specify a multiple selection callback for a simple List.
 */
#include <Xm/List.h>

char *months[] = {
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
};

main(argc, argv)
int argc;
char *argv[];
{
    Widget           toplevel, list_w;
    XtAppContext     app;
    int              i, n = XtNumber (months);
    XmStringTable    str_list;
    void             sel_callback();

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, NULL);

    str_list = (XmStringTable) XtMalloc (n * sizeof (XmString *));

    for (i = 0; i < n; i++)
        str_list[i] = XmStringCreateLocalized (months[i]);

    list_w = XmCreateScrolledList (toplevel, "months", NULL, 0);
    XtVaSetValues (list_w,
        XmNvisibleItemCount,   n,
        XmNitemCount,          n,
        XmNitems,              str_list,
        XmNselectionPolicy,    XmMULTIPLE_SELECT,
        NULL);
    XtManageChild (list_w);

    XtAddCallback (list_w, XmNdefaultActionCallback, sel_callback, NULL);
    XtAddCallback (list_w, XmNmultipleSelectionCallback, sel_callback, NULL);

    for (i = 0; i < n; i++)
        XmStringFree (str_list[i]);
    XtFree (str_list);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

void
sel_callback(list_w, client_data, call_data)
Widget list_w;
XtPointer client_data;
XtPointer call_data;
{
    XmListCallbackStruct *cbs = (XmListCallbackStruct *) call_data;
    char *choice;
    int   i;

    if (cbs->reason == XmCR_MULTIPLE_SELECT) {
        printf ("Multiple selection -- %d items selected:\n",
            cbs->selected_item_count);
        for (i = 0; i < cbs->selected_item_count; i++) {
            XmStringGetLtoR (cbs->selected_items[i], XmFONTLIST_DEFAULT_TAG,
                &choice);
            printf ("%s (%d)\n", choice, cbs->selected_item_positions[i]);
            XtFree (choice);
        }
    }
    else {
        XmStringGetLtoR (cbs->item, XmFONTLIST_DEFAULT_TAG, &choice);
        printf ("Default action -- selected item %s (%d)\n",
            choice, cbs->item_position);
        XtFree (choice);
    }
}
