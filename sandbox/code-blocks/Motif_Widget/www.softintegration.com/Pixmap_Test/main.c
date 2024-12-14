#include <Xm/MainW.h>
#include <Xm/Label.h>

#define cur_bitmap "xlogo32"  // Woher ist diese Datei ?

main(int argc, char ** argv) {
    Widget toplevel, main_w, label;
    XtAppContext app;

    toplevel = XtVaAppInitialize (&app, "Demos", NULL, 0, &argc, argv, NULL, NULL);

    main_w = XtVaCreateManagedWidget ("main_window", xmMainWindowWidgetClass,toplevel, NULL);

    Pixmap pixmap = XmGetPixmap(XtScreen (toplevel), cur_bitmap, 0, WhitePixelOfScreen (XtScreen (toplevel)));

    label = XtVaCreateManagedWidget ("label", xmLabelWidgetClass, main_w,
        XmNlabelType, XmPIXMAP, XmNlabelPixmap, pixmap, NULL);

    XtRealizeWidget (toplevel);
    XtAppMainLoop (app);
}

