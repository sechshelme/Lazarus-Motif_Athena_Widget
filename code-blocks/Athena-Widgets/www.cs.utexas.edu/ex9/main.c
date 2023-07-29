/* Example ex9.c */

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xaw/Label.h>

#include <stdio.h>

typedef struct _Resources {
	int	a_number;
	char	*a_string;
} Resources;

static Resources theResources;

static XtResource resourceSpec[] = {
	{ "aNumber", "ANumber", XtRInt, sizeof(int),
	  XtOffsetOf(Resources, a_number), XtRString, "99" },
	{ "aString", "AString", XtRString, sizeof(char *),
	  XtOffsetOf(Resources, a_string), XtRString, "DEFAULTED" },
};

static XrmOptionDescRec options[] = {
	{ "-aNumber", ".aNumber", XrmoptionSepArg, NULL },
	{ "-aString", "*aString", XrmoptionSepArg, NULL },
};

main(argc, argv)
int argc;
char **argv;
{	XtAppContext appContext;
	Widget shell;
	Widget banner;

	shell = XtAppInitialize(&appContext, "Example",
			options, XtNumber(options),
			&argc, argv, NULL, NULL, 0);

	XtGetApplicationResources(shell, &theResources,
			resourceSpec, XtNumber(resourceSpec), NULL, 0);
	(void) printf("Got <%d> and <%s>\n",
			theResources.a_number, theResources.a_string);

	banner = XtCreateManagedWidget("banner", labelWidgetClass,
			shell, NULL, 0);

	XtRealizeWidget(shell);
	XtAppMainLoop(appContext);
}

