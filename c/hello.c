/* hello.c */
#include <Xm/PushB.h>
#include <stdio.h>

void button_pushed (Widget widget, XtPointer client_data, XtPointer call_data) {
	printf ("Hello Yourself!\n");
}

int main(int argc, char *argv[]) {
	Widget	        toplevel, button;
	XtAppContext	app;
	XmString        label;

	XtSetLanguageProc (NULL, NULL, NULL);

	toplevel = XtVaAppInitialize (&app, "Hello", NULL, 0, &argc, argv, NULL, NULL);

	label = XmStringCreateLocalized ("Push here to say hello");
	button = XtVaCreateManagedWidget ("pushme", xmPushButtonWidgetClass, toplevel, XmNlabelString, label, NULL);

	XmStringFree (label);
	XtAddCallback (button, XmNactivateCallback, button_pushed, NULL);
	XtRealizeWidget (toplevel);

	XtAppMainLoop (app);
}
