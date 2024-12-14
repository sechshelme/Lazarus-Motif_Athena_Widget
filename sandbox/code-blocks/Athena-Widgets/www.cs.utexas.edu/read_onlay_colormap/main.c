/* Test/demo program using read-only cells from the default
 * colormap with images.  gdmr, May 1998
 *
 * This program has been tested on 8-bit PseudoColor Suns and on
 * 16-bit TrueColor Linux/PCs
*/

#define WIDTH 512	/* of image/window */
#define HEIGHT 384	/* "   "   "   "   */
#define LEVELS 32	/* of grey         */

#include <stdio.h>
#include <stdlib.h>

#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <X11/Xfuncs.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>
#include <X11/Shell.h>

static Widget shell;	/* top-level shell		*/
static Widget d;	/* "default" colormap widget	*/

static XtAppContext appContext;

static Colormap d_map;	/* default colormap	*/
static Cardinal depth;
static Visual *v;

static GC gc;

static XImage *d_image;	/* "default" image	*/

static void dExpose(Widget w, XtPointer client_data, XEvent *event, Boolean cont);

int main(int argc, char **argv)
{	Arg args[16];
	int n;
	int status;
	unsigned long pixels[LEVELS];
	XColor rgb;
	int i, j;
	XStandardColormap *scm;
	Widget widgetList[4];

	/* Initialise, create "default" widget */
	n = 0;
	XtSetArg(args[n], XtNtitle, "cmiTest: default colormap"); n++;
	shell = XtAppInitialize(&appContext, "CmiTest", NULL, 0,
			&argc, argv, NULL, args, n);
	n = 0;
	XtSetArg(args[n], XtNwidth, WIDTH);	n++;
	XtSetArg(args[n], XtNheight, HEIGHT);	n++;
	d = XtCreateManagedWidget("d", coreWidgetClass, shell, args, n);
	XtAddEventHandler(d, ExposureMask, False,
				(XtEventHandler) dExpose, (XtPointer) 0);

	/* Make sure the server-side resources are created */
	XtRealizeWidget(shell);

	/* Needed (?!) by XPutImage() */
	gc = XCreateGC(XtDisplay(shell), XtWindow(shell), 0, NULL);

	/* Get default colormap and visual */
	n = 0;
	XtSetArg(args[n], XtNvisual, &v);	n++;
	XtSetArg(args[n], XtNcolormap, &d_map);	n++;
	XtSetArg(args[n], XtNdepth, &depth);	n++;
	XtGetValues(shell, args, n);
	(void) printf("Grey levels: %d, screen depth %d\n",
			LEVELS, depth);

	/* Get read-only shared pixel values corresponding to the
	 * grey ramp we want to display */
	for (i = 0; i < LEVELS - 1; i++) {
		/* Remember rgb values are in [0,65535] */
		rgb.red = (65536 / LEVELS) * i;
		rgb.green = (65536 / LEVELS) * i;
		rgb.blue = (65536 / LEVELS) * i;
		rgb.flags = DoRed | DoGreen | DoBlue;
		if (!XAllocColor(XtDisplay(d), d_map, &rgb)) {
			(void) fprintf(stderr,
					"Couldn't allocate colormap cell #%d\n",
					i);
			exit(1);
		}
		pixels[i] = rgb.pixel;
	}
	rgb.red = 65535;
	rgb.green = 65535;
	rgb.blue = 65535;
	rgb.flags = DoRed | DoGreen | DoBlue;
	if (!XAllocColor(XtDisplay(d), d_map, &rgb)) {
		(void) fprintf(stderr,
				"Couldn't allocate colormap cell #%d\n",
				LEVELS - 1);
		exit(1);
	}
	pixels[LEVELS - 1] = rgb.pixel;

	/* Create an XImage and fill it in with a grey ramp */
	d_image = XCreateImage(XtDisplay(d), v, depth, ZPixmap,
			0, malloc(WIDTH * HEIGHT * (depth / 8)),
			WIDTH, HEIGHT, 8, 0);
        for (i = 0; i < WIDTH; i++) {
                for (j = 0; j < HEIGHT; j++) {
                        XPutPixel(d_image, i, j, pixels[i * LEVELS / WIDTH]);
                }
        }
	/* Now put a diagonal stripe across it */
	for (i = 0; i < WIDTH; i++) {
		XPutPixel(d_image, i, i * HEIGHT / WIDTH, pixels[LEVELS - 1]);
	}

	/* All done.  Wait for the Expose events to come in */
	XtAppMainLoop(appContext);

	/*NOTREACHED*/
	return 0;
}

/*
 * Expose event handler.  We could be clever here and
 * only (re-)draw the damaged parts, but we won't bother this time as the
 * images are fairly small.  Instead we just wait for the last Expose
 * event in the sequence and re-draw the entire image in response.
 */

static void dExpose(Widget w, XtPointer client_data,
		XEvent *event, Boolean cont)
{	XExposeEvent *e = (XExposeEvent *) event;

	if (e->count == 0) {
		XPutImage(XtDisplay(w), XtWindow(w), gc, d_image,
			0, 0, 0, 0, WIDTH, HEIGHT);
	}
}
