/*
 * xfusen -- Fusen on X Desktop
 *
 *  xfusen.h    Global Header
 */

#define XFUSEN_VERSION 0
#define XFUSEN_RELEASE 3
#define XFUSEN_PATCHLEVEL 0

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <X11/Intrinsic.h>
#include <X11/Xaw/Label.h>
#include <X11/Xaw/Command.h>
#include <X11/Xaw/AsciiText.h>
#include <X11/Xaw/SimpleMenu.h>
#include <X11/Xaw/SmeBSB.h>
#include <X11/Xaw/SmeLine.h>
#include <X11/Xaw/Dialog.h>
#include <X11/StringDefs.h>
#include <X11/Xlocale.h>

#define Xt_W XtVaCreateManagedWidget
#define Xt_P XtVaCreatePopupShell

#define MAX_WINDOW 16

#define _TEXT_PATH ".xfusen_text"
#define _LOCK_PATH "/tmp/.xfusen"

/*----------------------------------------------------------------
	Data Structure
  ----------------------------------------------------------------*/
typedef struct WinData {
    Widget base,text,j;
    Widget icon,head;
    int color;
    int font;
    int iconify;
    int status;
    struct WinData *prev,*next;
} WinData;

typedef enum {
    Fnone,      /* Non operation */
    Fload,      /* Save mode */
    Fsave,      /* Load mode */
} FDmode;

extern Widget  toplevel;

/*----------------------------------------------------------------
	Functions
  ----------------------------------------------------------------*/
/*
 * callback func.
 */
XtCallbackProc MakeVisWindow (Widget,caddr_t,caddr_t);	/* Make visible window [callback] */
XtCallbackProc DeleteWindow  (Widget,Widget, caddr_t);	/* Delete window [callback] */
XtCallbackProc Iconify       (Widget,caddr_t,caddr_t);	/* Iconify [callback] */
XtCallbackProc DeIconify     (Widget,caddr_t,caddr_t);	/* DeIconify [callback] */
XtCallbackProc About         (Widget,caddr_t,caddr_t);	/* About [callback] */
XtCallbackProc SelectFont    (Widget,int,    caddr_t);	/* Select Font [callback] */
XtCallbackProc SelectColor   (Widget,int,    caddr_t);	/* Select Color [callback] */
XtCallbackProc Duplicate     (Widget,caddr_t,caddr_t);	/* Duplicate [callback] */
XtCallbackProc Quit          (Widget,Widget, caddr_t);	/* Quit [callback] */

XtCallbackProc FileDialog    (Widget,int,    caddr_t);	/* Open file-dialog [callback] */

/*
 * action func.
 */
XtActionProc Enter(Widget,XEvent*,String*,Cardinal*);	/* Enter Window [action] */
XtActionProc Leave(Widget,XEvent*,String*,Cardinal*);	/* Leave Window [action] */
XtActionProc Sense(Widget,XEvent*,String*,Cardinal*);	/* Sense Window [action] */

XtActionProc SubPopup   (Widget,XEvent*,String*,Cardinal*);	/* Sub Popup Open [action] */
XtActionProc SubPopdown (Widget,XEvent*,String*,Cardinal*);	/* Sub Popup Close [action] */


/*
 * initialization
 */
void InitWindow(void);				/* Initialize window [init] */

void InitPopup         (void);			/* Initialize Popup menu [init] */
void InitSubPopupColor (void);			/* Initialize SubPopup(color) [init] */
void InitSubPopupFont  (void);			/* Initialize SubPopup(font) [init] */
