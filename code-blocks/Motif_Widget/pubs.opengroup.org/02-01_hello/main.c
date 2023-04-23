/*
 *  The following is an example of an internationalised Motif hello
 *  world program that has been modified to support Bidirectional text.
 *  The layout values are passed via a modifier string thus allowing
 *  the internationalised program to be localised at run time.
 */

#include <stdio.h>

#include <Xm/Xm.h>
#include <Xm/Form.h>
#include <Xm/PushB.h>
#include <locale.h>
//#include <sys/layout.h>

static void helloworld_button_activate();

Display            *display;
XtAppContext       app_context;
//LayoutObject       plh;
char               *inp;

/*
 *  Define layoutModifier resource to allow localisation
 *  of the text being passed to hello world.
 */
#define  XtNlayoutModifier   "layoutModifier"
#define  XtCLayoutModifier   "LayoutModifier"
char               *lo_modifier;
static XtResource lo_resources[] = {
  { XtNlayoutModifier, XtCLayoutModifier, XmRString, sizeof(String),
       0, XmRString, (String) NULL}
};

/*
 *  Main program
 */
int main(argc, argv)
unsigned int argc;
char **argv;
{
    /*
     *   Declare the variables to contain the two widget ids.
     */
    Widget toplevel, bulletin, pushb;
    Arg  arglist[3] ;
    int  n;

    if (argc > 1)
    inp = argv[1];
    else {
    fprintf(stderr,"Incorrect number of arguments");
    exit(0);
    }

    XtSetLanguageProc(NULL,NULL,NULL);

    XtToolkitInitialize();

    app_context    = XtCreateApplicationContext();

    display = XtOpenDisplay(app_context, NULL, argv[0],
                            "helloworldclass",
                             NULL, 0, &argc, argv);
    if (display    == NULL) {
    fprintf(stderr,     "%s:  Can't open display", argv[0]);
    exit(1);
    }

    n =  0;
    XtSetArg(arglist[n], XmNallowShellResize, True);  n++;
    toplevel = XtAppCreateShell(argv[0], NULL,
                                applicationShellWidgetClass,
                                display, arglist,  n);

    /* Set up the lo_modifier */
    XtGetApplicationResources(toplevel,     &lo_modifier, lo_resources,
                   XtNumber(lo_resources), NULL, 0);

    XtSetArg (arglist[0], XmNwidth, 200);
    XtSetArg (arglist[1], XmNheight, 100);
    bulletin = XmCreateBulletinBoard(toplevel, "bulletin", arglist, 2);
    XtManageChild(bulletin);

    XtSetArg (arglist[0], XmNlabelString,
              XmStringCreateLtoR("Press Button...",
         XmSTRING_DEFAULT_CHARSET));
    pushb = XmCreatePushButtonGadget(bulletin, "push", arglist, 1);
    XtAddCallback (pushb, XmNactivateCallback,
                   helloworld_button_activate,NULL);
    XtManageChild(pushb);

    /*
     *  Realise the top-level widget. This will
     *  cause the entire "managed"
     *  widget hierarchy to be displayed.
     */

    XtRealizeWidget(toplevel);

    /*
     *  Loop and process events.
     */

    XtAppMainLoop(app_context);

    /* UNREACHABLE */
    return (0);
}

BooleanValue reorder_or_shaping( plh )
//LayoutObject plh;
{
    size_t index = 0;
    LayoutValueRec lo_values[3];
    int rc = 0;
    BooleanValue directional;
    BooleanValue shaping;

    lo_values[0].name = ActiveShapeEditing ;
    lo_values[0].value = (LayoutValue) &shaping ;
    lo_values[1].name = ActiveDirectional ;
    lo_values[1].value = (LayoutValue) &directional ;
    lo_values[2].name = 0;

    rc = m_getvalues_layout(plh, lo_values, &index);
    if (rc)
    {
      perror("m_getvalues_layout");
      exit(1);
    }

    return ( shaping || directional );
}

static void helloworld_button_activate(     widget,   tag,
                                        callback_data )
    Widget    widget;
    char *tag;
    XmAnyCallbackStruct *callback_data;
{
    Arg  arglist[2];

    static int call_count = 0;
    char *label;
    size_t inpsize, label_size;
    size_t index = 0;
    int rc = 0;
    int mask = 0;

    call_count += 1 ;
    switch ( call_count )
    {
    case 1:
        plh   = m_create_layout(NULL,  lo_modifier);

        if ( ! reorder_or_shaping(plh) )
             {
             XtSetArg( arglist[0], XmNlabelString,
              XmStringCreateLocalized(inp));
             }
        else
        {
            inpsize = strlen(inp);
             label = (char *)malloc(inpsize+1);
             memset(label, 0, inpsize+1);
             rc = m_transform_layout(plh, inp, inpsize,
              label, &label_size, NULL, NULL,    NULL, &index);
             if (rc)
             {
              perror("m_transform_layout");
              exit(1);
             }

             XtSetArg( arglist[0], XmNlabelString,
              XmStringCreateLocalized(label));
             free(label);
        }
        m_destroy_layout(plh);
        XtSetArg( arglist[1], XmNx,    11 );
        XtSetValues( widget, arglist, 2 );
        break ;
    case 2:
        exit(0);
        break ;
    }
}


