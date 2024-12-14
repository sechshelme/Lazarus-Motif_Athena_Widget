/* Test/demo program using p/d/s colormaps and images
 * gdmr, May 1995
 *
 * This program works on colour Suns.  It might work on other 8-bit
 * pseudocolor visuals.  It'll probably need hacking to make it work
 * on any other kind of visual.
 */

#define WIDTH 256	/* of image/window */
#define HEIGHT 256	/* "   "   "   "   */
#define LEVELS 64	/* of grey         */
#define DEPTH 8		/* of image (must match the visual!) */

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
static Widget p;	/* "private" colormap widget	*/
static Widget pp;	/* popup for ...		*/
static Widget s;	/* "standard" colormap widget	*/
static Widget ps;	/* popup for ...		*/

static XtAppContext appContext;

static Colormap p_map;	/* private colormap	*/
static Colormap s_map;	/* standard colormap	*/
static Colormap d_map;	/* default colormap	*/

static GC gc;

static Visual *v;

static XImage *p_image;	/* "private" image	*/
static XImage *s_image;	/* "standard" image	*/
static XImage *d_image;	/* "default" image	*/

void pExpose(Widget w, XtPointer client_data, XEvent *event, Boolean cont);
void sExpose(Widget w, XtPointer client_data, XEvent *event, Boolean cont);
void dExpose(Widget w, XtPointer client_data, XEvent *event, Boolean cont);

static String fallback_resources[] = {	/* to keep XCreateColormap() happy */
	"*visual: PseudoColor",
	NULL,
};

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
			&argc, argv, fallback_resources, args, n);
	n = 0;
	XtSetArg(args[n], XtNwidth, WIDTH);	n++;
	XtSetArg(args[n], XtNheight, HEIGHT);	n++;
	d = XtCreateManagedWidget("d", coreWidgetClass, shell, args, n);
	XtAddEventHandler(d, ExposureMask, False, dExpose, NULL);

	/* Create "private" widget and its popup */
	n = 0;
	XtSetArg(args[n], XtNtitle, "cmiTest: private colormap"); n++;
	pp = XtCreatePopupShell("pp", topLevelShellWidgetClass,
			shell, args, n);
	n = 0;
	XtSetArg(args[n], XtNwidth, WIDTH);     n++;
	XtSetArg(args[n], XtNheight, HEIGHT);   n++;
	p = XtCreateManagedWidget("p", coreWidgetClass, pp, args, n);
	XtAddEventHandler(p, ExposureMask, False, pExpose, NULL);

	/* Create "standard" widget and its popup */
	n = 0;
	XtSetArg(args[n], XtNtitle, "cmiTest: RGB_GRAY_MAP colormap"); n++;
	ps = XtCreatePopupShell("ps", topLevelShellWidgetClass,
			shell, args, n);
	n = 0;
	XtSetArg(args[n], XtNwidth, WIDTH);     n++;
	XtSetArg(args[n], XtNheight, HEIGHT);   n++;
	s = XtCreateManagedWidget("s", coreWidgetClass, ps, args, n);
	XtAddEventHandler(s, ExposureMask, False, sExpose, NULL);

	/* Make sure the server-side resources are created */
	XtRealizeWidget(shell);
	XtRealizeWidget(pp);
	XtRealizeWidget(ps);

	/* Needed (?!) by XPutImage() */
	gc = XCreateGC(XtDisplay(shell), XtWindow(shell), 0, NULL);

	/* Get default colormap and visual */
	n = 0;
	XtSetArg(args[n], XtNvisual, &v);	n++;
	XtSetArg(args[n], XtNcolormap, &d_map);	n++;
	XtGetValues(shell, args, n);

	/* Allocate cells from the default colormap, initialise them
	 * with a grey scale, and create the "default" image */
	status = XAllocColorCells(XtDisplay(d), d_map, False, NULL, 0,
			pixels, LEVELS);
	if (!status) {
		(void) printf("Couldn't allocate %d cells from default map\n",
				LEVELS);
		exit(1);
	}
	for (i = 0; i < LEVELS - 1; i++) {
		/* Remember rgb values are in [0,65535] */
		rgb.pixel = pixels[i];
		rgb.red = (65536 / LEVELS) * i;
		rgb.green = (65536 / LEVELS) * i;
		rgb.blue = (65536 / LEVELS) * i;
		rgb.flags = DoRed | DoGreen | DoBlue;
		XStoreColor(XtDisplay(d), d_map, &rgb);
	}
	rgb.pixel = pixels[LEVELS - 1];
	rgb.red = 65535;
	rgb.green = 65535;
	rgb.blue = 65535;
	rgb.flags = DoRed | DoGreen | DoBlue;
	XStoreColor(XtDisplay(d), d_map, &rgb);
	d_image = XCreateImage(XtDisplay(d), v, DEPTH, ZPixmap,
			0, malloc(WIDTH * HEIGHT), WIDTH, HEIGHT, 8, 0);
        for (i = 0; i < WIDTH; i++) {
                for (j = 0; j < HEIGHT; j++) {
                        XPutPixel(d_image, i, j, pixels[i * LEVELS / WIDTH]);
                }
        }

	/* Create a private colormap, set up a grey scale in part of it
	 * and put random values in the rest just to show what happens
	 * with non-focus windows.  Then create the "private" image */
	p_map = XCreateColormap(XtDisplay(p), XtWindow(p), v, AllocAll);
        for (i = 0; i < LEVELS - 1; i++) {
                rgb.pixel = i;
                rgb.red = (65536 / LEVELS) * i;
                rgb.green = (65536 / LEVELS) * i;
                rgb.blue = (65536 / LEVELS) * i;
                rgb.flags = DoRed | DoGreen | DoBlue;
                XStoreColor(XtDisplay(d), p_map, &rgb);
        }
        rgb.pixel = LEVELS - 1;
        rgb.red = 65535;
        rgb.green = 65535;
        rgb.blue = 65535;
        rgb.flags = DoRed | DoGreen | DoBlue;
        XStoreColor(XtDisplay(d), p_map, &rgb);
	for (i = LEVELS; i < 256; i++) {
		rgb.pixel = i;
		rgb.red = (lrand48() << 8) | lrand48();
		rgb.green = (lrand48() << 8) | lrand48();
		rgb.blue = (lrand48() << 8) | lrand48();
		rgb.flags = DoRed | DoGreen | DoBlue;
		XStoreColor(XtDisplay(p), p_map, &rgb);
	}
	n = 0;
	XtSetArg(args[n], XtNcolormap, p_map);	n++;
	XtSetValues(pp, args, n);
	p_image = XCreateImage(XtDisplay(d), v, DEPTH, ZPixmap,
			0, malloc(WIDTH * HEIGHT), WIDTH, HEIGHT, 8, 0);
        for (i = 0; i < WIDTH; i++) {
                for (j = 0; j < HEIGHT; j++) {
                        XPutPixel(p_image, i, j, i * LEVELS / WIDTH);
                }
        }

	/* Find the RGB_GRAY standard colormap and create the
	 * "standard" image */
	status = XGetRGBColormaps(XtDisplay(shell),
			RootWindowOfScreen(XtScreen(shell)),
			&scm, &n, XA_RGB_GRAY_MAP);
	if (!status) {
		(void) printf("No XA_RGB_GRAY_MAP, do 'xstdcmap -gray'\n");
		exit(1);
	}
	/*
	 * Should really check that n == 1, but we'll just assume instead
	 * that the ICCCM is being correctly followed!  Should also check
	 * that it really is a 256-level grey scale with black at pixel 0
	 * and white at pixel 255, but as this is just a test/demo program
	 * we'll assume that it's OK...
	 */
	n = 0;
	XtSetArg(args[n], XtNcolormap, scm->colormap);	n++;
	XtSetValues(ps, args, n);
	s_image = XCreateImage(XtDisplay(d), v, DEPTH, ZPixmap,
			0, malloc(WIDTH * HEIGHT), WIDTH, HEIGHT, 8, 0);
	for (i = 0; i < WIDTH; i++) {
		for (j = 0; j < HEIGHT; j++) {
			XPutPixel(s_image, i, j, i);
		}
	}

	/*
	 * Since we're dealing only with top-level shells and their
	 * children, and we don't have anything that's override-redirect,
	 * we don't have to bother (in this particular case) setting the
	 * WM_COLORMAP_WINDOWS hints -- just setting XtNcolormap on the
	 * shells does the right thing.  The code below is the kind of
	 * thing that we would have had to do.  If multiple colormaps are
	 * required then the ICCCM should certainly be consulted.
	 */
#ifdef notdef
	/* Tell the WM that some of our windows have
	 * non-default colormaps */
	n = 0;
	widgetList[n] = shell;	n++;
	widgetList[n] = pp;	n++;
	widgetList[n] = ps;	n++;
	XtSetWMColormapWindows(shell, widgetList, n);
#endif

	/* Pop up the two non-default-colormap windows,
	 * then wait for the expose events to come */
	XtPopup(pp, XtGrabNone);
	XtPopup(ps, XtGrabNone);
	XtAppMainLoop(appContext);

	/*NOTREACHED*/
	return 0;
}

/*
 * Expose event handlers, one per widget.  We could be clever here and
 * only (re-)draw the damaged parts, but we won't bother this time as the
 * images are fairly small.  Instead we just wait for the last Expose
 * event in the sequence and re-draw the entire image in response.
 */
 void pExpose(Widget w, XtPointer client_data,
		XEvent *event, Boolean cont)
{	XExposeEvent *e = (XExposeEvent *) event;

	if (e->count == 0) {
		XPutImage(XtDisplay(w), XtWindow(w), gc, p_image,
			0, 0, 0, 0, WIDTH, HEIGHT);
	}
}

 void sExpose(Widget w, XtPointer client_data,
		XEvent *event, Boolean cont)
{	XExposeEvent *e = (XExposeEvent *) event;

	if (e->count == 0) {
		XPutImage(XtDisplay(w), XtWindow(w), gc, s_image,
			0, 0, 0, 0, WIDTH, HEIGHT);
	}
}

 void dExpose(Widget w, XtPointer client_data,
		XEvent *event, Boolean cont)
{	XExposeEvent *e = (XExposeEvent *) event;

	if (e->count == 0) {
		XPutImage(XtDisplay(w), XtWindow(w), gc, d_image,
			0, 0, 0, 0, WIDTH, HEIGHT);
	}
}
