
/* Written by Dan Heller and Paula Ferguson.
 * Copyright 1994, O'Reilly & Associates, Inc.
 * Permission to use, copy, and modify this program without
 * restriction is hereby granted, as long as this copyright
 * notice appears in each copy of the program source code.
 * This program is freely distributable without licensing fees and
 * is provided without guarantee or warrantee expressed or implied.
 * This program is -not- in the public domain.
 */

/* corners.c -- demonstrate widget layout management for a
 * BulletinBoard widget.  There are four widgets each labeled
 * top-left, top-right, bottom-left and bottom-right.  Their
 * positions in the bulletin board correspond to their names.
 * Only when the widget is resized does the geometry management
 * kick in and position the children in their correct locations.
 */
#include <Xm/BulletinB.h>
#include <Xm/PushB.h>
#include <stdio.h>

char *corners[] = {
    "Top Left", "Top Right", "Bottom Left", "Bottom Right",
};

static void resize();
static void enter();
static void test();

main(argc, argv)
int argc;
char *argv[];
{
    Widget toplevel, bboard;
    XtAppContext app;
    XtActionsRec rec[3];
    int i;

    XtSetLanguageProc (NULL, NULL, NULL);

    /* Initialize toolkit and create toplevel shell */
    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0,
        &argc, argv, NULL, XmNwidth, 320, XmNheight, 320,  NULL);

    /* Create your standard BulletinBoard widget */
    bboard = XtVaCreateManagedWidget ("bboard",
        xmBulletinBoardWidgetClass, toplevel, NULL);

    /* Set up a translation table that captures "Resize" events
     * (also called ConfigureNotify or Configure events).  If the
     * event is generated, call the function resize().
     */

    rec[0].string = "resize";
    rec[0].proc = resize;
    rec[1].string = "enter";
    rec[1].proc = enter;
    rec[2].string = "test";
    rec[2].proc = test;
    XtAppAddActions (app, &rec, 3);
    XtOverrideTranslations (bboard,
        XtParseTranslationTable ("<ConfigureNotify>: resize() \n <EnterNotify>: enter() \n <Motion>: test()"));
//        XtParseTranslationTable ("<EnterWindow>: enter()"));
//
    /* Create children of the dialog -- a PushButton in each corner. */
    for (i = 0; i < XtNumber (corners); i++)
        XtVaCreateManagedWidget (corners[i],
            xmPushButtonWidgetClass, bboard, NULL);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

static void
enter(w, event, args, num_args)
Widget w;
XEvent *event;
String args[];
int *num_args;
{
  printf("Fenster rein\n");
  XtVaSetValues(w, XmNbackground, 255, NULL);
}

static void
test(w, event, args, num_args)
Widget w;
XEvent *event;
String args[];
int *num_args;
{
  printf("Fesnter raus\n");
  XtVaSetValues(w, XmNbackground, 255 * 256, NULL);
}

/* resize(), the routine that is automatically called by Xt upon the
 * delivery of a Configure event.  This happens whenever the widget
 * gets resized.
 */
static void
resize(w, event, args, num_args)
Widget w;   /* The widget (BulletinBoard) that got resized */
XEvent *event;  /* The event struct associated with the event */
String args[]; /* unused */
int *num_args; /* unused */
{
    WidgetList children;
    Dimension w_width, w_height;
    short margin_w, margin_h;
    XConfigureEvent *cevent = (XConfigureEvent *) event;
    int width = cevent->width;
    int height = cevent->height;

//XtVaSetValues(w, XmNbackground, 255, NULL);


    /* get handle to BulletinBoard's children and marginal spacing */
    XtVaGetValues (w,
        XmNchildren, &children,
        XmNmarginWidth, &margin_w,
        XmNmarginHeight, &margin_h,
        NULL);

        printf("%i\n", margin_w);
        printf("%i\n", margin_h);

        return;

    /* place the top left widget */
    XtVaSetValues (children[0],
        XmNbackground, 0xFF,
        XmNx, margin_w,
        XmNy, margin_h,
        NULL);
    /* top right */
    XtVaGetValues (children[1], XmNwidth, &w_width, NULL);
    XtVaSetValues (children[1],
        XmNx, width - margin_w - w_width,
        XmNy, margin_h,
        NULL);
    /* bottom left */
    XtVaGetValues (children[2], XmNheight, &w_height, NULL);
    XtVaSetValues (children[2],
        XmNx, margin_w,
        XmNy, height - margin_h - w_height,
        NULL);
    /* bottom right */
    XtVaGetValues (children[3],
        XmNheight, &w_height,
        XmNwidth, &w_width,
        NULL);
    XtVaSetValues (children[3],
        XmNx, width - margin_w - w_width,
        XmNy, height - margin_h - w_height,
        NULL);
}
