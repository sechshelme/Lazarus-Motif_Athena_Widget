
#include <Xm/DialogS.h>
#include <Xm/MainW.h>
#include <Xm/RowColumn.h>
#include <Xm/Form.h>
#include <Xm/Text.h>
#include <Xm/PushBG.h>
#include <Xm/LabelG.h>
#include <Xm/PanedW.h>

#include "info.xbm"  /* bitmap data used by our dialog */
#include "trash.xbm"  /* bitmap data used by our dialog */


// /usr/share/xemacs21/xemacs-packages/etc/w3

// xemacs21-basesupport: /usr/share/xemacs21/xemacs-packages/etc/w3/info.xbm


main(argc, argv)
int argc;
char *argv[];
{
    XtAppContext app;
    Pixmap pixmap;
    Widget toplevel, rc, label;

    XtSetLanguageProc (NULL, NULL, NULL);

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0, &argc, argv, NULL, NULL);


    rc = XtVaCreateManagedWidget("rc", xmRowColumnWidgetClass, toplevel, NULL);

        pixmap = XCreatePixmapFromBitmapData (XtDisplay (toplevel),
        RootWindowOfScreen (XtScreen (rc)),
        info_bits, info_width, info_height,
        0xFF, 0xFF00, 24);

    label = XtVaCreateManagedWidget ("label", xmLabelGadgetClass, rc,
        XmNlabelType,        XmPIXMAP,
        XmNlabelPixmap,      pixmap,
        NULL);

        pixmap = XCreatePixmapFromBitmapData (XtDisplay (toplevel),
        RootWindowOfScreen (XtScreen (rc)),
        trash_bits, trash_width, trash_height,
        0xFF, 0xFF00, 24);


    label = XtVaCreateManagedWidget ("label", xmLabelGadgetClass, rc,
        XmNlabelType,        XmPIXMAP,
        XmNlabelPixmap,      pixmap,
        NULL);


    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}
