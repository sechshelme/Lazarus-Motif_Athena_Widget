/*
 * Xfusen -- Fusen on X Desktop
 *
 *  window.c    Window SubRoutines
 */
#include "xfusen.h"

#define ICON_MINWIDTH  16
#define ICON_MINHEIGHT 16

WinData *root_win,*current_win;

static Position  off_x,off_y;

static char *fontstr[] = {
    "-alias-fixed-medium-r-normal--8-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--12-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--14-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--16-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--18-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--20-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--24-*-*-*-*-*-jisx0208.1990-*",
    "-alias-fixed-medium-r-normal--48-*-*-*-*-*-jisx0208.1990-*",
};

static char colstr[16][8] = {
  "#ffff80","#ffffc0",
  "#ff8080","#ffc0c0",
  "#80ff80","#c0ffc0",
  "#80ffff","#c0ffff",
  "#8080ff","#c0c0ff",
  "#ff80ff","#ffc0ff",
  "#e0e0e0","#ffffff",
  "#a0a0a0","#c0c0c0"
};

WinData* MakeWindow   (Widget);			/* Make window [sub] */
void     ChangeBG     (Widget,String);		/* Change Background Color [sub] */
void     ChangeFont   (Widget,String);		/* Change Background Font [sub] */
void     ViewWindow   (WinData*);		/* View & Set Window to Initial State [sub] */
String   MakeFilename (void);			/* Make filename [sub] */
Boolean  LoadFusen    (void);			/* Load Structure [sub] */
Boolean  SaveFusen    (void);			/* Save Structure [sub] */
void     GeometryCheck(void);			/* Geometry Check [sub] */

WinData *geo_win;

/*----------------------------------------------------------------
	Call Back SubRoutine
  ----------------------------------------------------------------*/
/*
 *  Make Visible Window [callback]
 */
XtCallbackProc MakeVisWindow(Widget w,caddr_t client,caddr_t caller)
{
  WinData *win;

  win = MakeWindow(w);
  ViewWindow(win);
}

WinData* MakeWindow(Widget w)
{
  static int win_num = 0;
  WinData *win,*p;
  Position x=0,y=0;

  String trans =
    "<Btn1Up>:                 Enter() display-caret(on) extend-end(PRIMARY,CUT_BUFFER0)  \n\
     <FocusIn>:                Sense() Enter() display-caret(on) extend-end(PRIMARY,CUT_BUFFER0) \n\
     <FocusOut>:               Leave() display-caret(off) \n\
     Shift<Key>BackSpace:      delete-selection()         \n\
     Meta<Key>I:               no-op(RingBell)            \n\
     <Btn3Down>:               XawPositionSimpleMenu(popup) MenuPopup(popup)";

  String trans2 =
    "<FocusIn>:                Sense()   \n\
     <Btn3Down>:               XawPositionSimpleMenu(popup) MenuPopup(popup)";

  /*
   * Allocate and Concatenate a buffer
   */
  win = (WinData*)XtMalloc(sizeof(WinData));
  if (root_win == NULL) {
    root_win = win;
    win->prev = NULL;
  }
  else {
    p = root_win;
    while(p->next) {
      p = p->next;
    }
    p->next   = win;
    win->prev = p;
  }
  win->next  = NULL;
  win->font  = 1;
  win->color = 0;
  win->iconify = FALSE;
  win->status  = FALSE;

  if (current_win != NULL)
    XtVaGetValues(current_win->base,XtNx,&x,XtNy,&y,NULL);

#define ORG_X 20
#define ORG_Y 20
#define ORG_W 200
#define ORG_H 100

  win->base = Xt_P("xfusen",transientShellWidgetClass,toplevel,
		   XtNx,x+ORG_X,
		   XtNy,y+ORG_Y,
		   XtNwidth, ORG_W,
		   XtNheight,ORG_H,
		   NULL);
  win->text = Xt_W("text",asciiTextWidgetClass,win->base,
		   XtNeditType,XawtextEdit,	/* editable text */
		   XtNwrap,XawtextWrapLine,	/* has wrap (line) */
		   NULL);

  XtOverrideTranslations(win->text,XtParseTranslationTable(trans));

  win->icon = Xt_P("xfusen",transientShellWidgetClass,toplevel,
		   NULL);
  win->head = Xt_W("icon",commandWidgetClass,win->icon,
		   XtNjustify,XtJustifyLeft,
		   NULL);
  XtOverrideTranslations(win->head,XtParseTranslationTable(trans2));
  XtAddCallback(win->head,XtNcallback,(XtCallbackProc)DeIconify,(XtPointer)NULL);

  return win;
}

/*
 * Delete Window [callback]
 */
XtCallbackProc DeleteWindow(Widget w,Widget win,caddr_t caller)
{
  if (current_win == NULL)
    return;

  XtPopdown(current_win->base);
  XtPopdown(current_win->icon);
  XtDestroyWidget(current_win->base);
  XtDestroyWidget(current_win->icon);

  if ((current_win->prev == NULL)&&(current_win->next == NULL)) {
    SaveFusen();
    RemoveLock();
    XtFree((char*)current_win);
    exit(0);
  }
    
  if (current_win->next != NULL)
    (current_win->next)->prev = current_win->prev;
  if (current_win->prev != NULL)
    (current_win->prev)->next = current_win->next;
  else
    root_win = current_win->next;

  XtFree((char*)current_win);
  current_win = NULL;
}

/*
 * Iconify [callback]
 */
XtCallbackProc Iconify(Widget w,caddr_t client,caddr_t caller)
{
  Position x,y;
  Dimension xw,yh;
  String s;

  if (current_win->iconify == FALSE) {

    GeometryCheck();
    XtVaGetValues(current_win->base,
		  XtNx,&x,
		  XtNy,&y,
		  XtNwidth,&xw,
		  XtNheight,&yh,
		  NULL);
    XtVaGetValues(current_win->text,
		  XtNstring,&s,
		  NULL);
    XtVaSetValues(current_win->icon,
		  XtNx,x-off_x,
		  XtNy,y-off_y,
		  XtNwidth,xw,
		  XtNheight   ,ICON_MINHEIGHT,
		  XtNmaxHeight,ICON_MINHEIGHT,
		  XtNminHeight,ICON_MINHEIGHT,
		  XtNminWidth ,ICON_MINWIDTH,
		  NULL);
    XtVaSetValues(current_win->head,
		  XtNlabel,strtok(s,"\n"),
		  NULL);

    XtPopdown(current_win->base);
    current_win->iconify = TRUE;

    ViewWindow(current_win);
  }
  else {
    DeIconify(w,client,caller);
  }
}

/*
 * DeIconify [callback]
 */
XtCallbackProc DeIconify(Widget w,caddr_t client,caddr_t caller)
{
  Position x,y;
  Dimension xw,yh;
  String s;

  if (current_win->iconify == FALSE)
    return;

  GeometryCheck();
  XtVaGetValues(current_win->icon,
		XtNx,&x,
		XtNy,&y,
		NULL);
  XtVaSetValues(current_win->base,
		XtNx,x-off_x,
		XtNy,y-off_y,
		NULL);

  XtPopdown(current_win->icon);
  current_win->iconify = FALSE;

  ViewWindow(current_win);
}

/*
 * About [callback]
 */
XtCallbackProc About(Widget w,caddr_t client,caddr_t caller)
{
  WinData *win;
  char str[256];

  sprintf(str,"\n XFusen v%d.%d+%d\n\n  by Kunihiko Hayashi\n",
          XFUSEN_VERSION,
          XFUSEN_RELEASE,
          XFUSEN_PATCHLEVEL);

  win = MakeWindow(NULL);
  XtVaSetValues(win->text,
		XtNstring,str,
		NULL);
  win->color = 7;
  win->font  = 1;
  ViewWindow(win);
}

/*
 * Select Font [callback]
 */
XtCallbackProc SelectFont(Widget w,int i,caddr_t caller)
{
  current_win->font = i;
  ViewWindow(current_win);
}

/*
 * Select Color [callback]
 */
XtCallbackProc SelectColor(Widget w,int i,caddr_t caller)
{
  current_win->color = i;
  ViewWindow(current_win);
}

/*
 * Duplicate [callback]
 */
XtCallbackProc Duplicate(Widget w,caddr_t client,caddr_t caller)
{
  WinData *win;
  String ds;
  Dimension dw,dh;

  win = MakeWindow(w);

  XtVaGetValues(current_win->base,XtNwidth,&dw,XtNheight,&dh,NULL);
  XtVaSetValues(        win->base,XtNwidth, dw,XtNheight, dh,NULL);

  XtVaGetValues(current_win->text,XtNstring,&ds,NULL);
  XtVaSetValues(        win->text,XtNstring, ds,NULL);

  win->color   = current_win->color;
  win->font    = current_win->font;
  win->iconify = FALSE;
  win->status  = FALSE;

  ViewWindow(win);
}

/*
 *  Quit [callback]
 */
XtCallbackProc Quit(Widget w,Widget win,caddr_t caller)
{
  QuitFusen(0);
  /* don't come back forever */
}

/*----------------------------------------------------------------
	Action SubRoutine
  ----------------------------------------------------------------*/
/*
 *  Enter Window [action]
 */
XtActionProc Enter(Widget w,XEvent *e,String *par,Cardinal *n)
{
  if ((current_win != NULL)&&(current_win->text == w)) {
    ChangeBG(w,colstr[current_win->color*2+0]);
    XtVaSetValues(w,
		  XtNeditType,XawtextEdit,
		  NULL);
    current_win->status = TRUE;
  }
}

/*
 *  Leave Window [action]
 */
XtActionProc Leave(Widget w,XEvent *e,String *par,Cardinal *n)
{
  if ((current_win != NULL)&&(current_win->text == w)&&(current_win->status == TRUE)) {
    ChangeBG(w,colstr[current_win->color*2+1]);
    SaveFusen();  /* When the cursor leave from the window, xfusen has to SAVE the text. */
    XtVaSetValues(w,
		  XtNeditType,XawtextRead,
		  NULL);
    current_win->status = FALSE;
  }
}

/*
 *  Sense Window [action]
 */
XtActionProc Sense(Widget w,XEvent *e,String *par,Cardinal *n)
{
  WinData *p = root_win;

  while(p) {
    if ((p->text == w)||(p->head == w)) {
      current_win = p;
      break;
    }
    p = p->next;
  }
}

/*----------------------------------------------------------------
	SubRoutines
  ----------------------------------------------------------------*/
/*
 * Change Background Color [sub]
 */
void ChangeBG(Widget w,String val)
{
  XrmValue str,pix;

  str.addr = val;
  str.size = strlen(val) + 1;
  XtConvert(w,XtRString,&str,XtRPixel,&pix);
  XtVaSetValues(w,XtNbackground,*(Pixel*)pix.addr,NULL);
}

/*
 * Change Background Font [sub]
 */
void ChangeFont(Widget w,String val)
{
  XrmValue str,fontset;

  str.addr = val;
  str.size = strlen(val) + 1;
  XtConvert(w,XtRString,&str,XtRFontSet,&fontset);
  XtVaSetValues(w,XtNfontSet,*(Font*)fontset.addr,NULL);
}

/*
 *  View & Set Window to Initial State [sub]
 */
void ViewWindow(WinData *win)
{
  XtVaSetValues(win->text,
		XtNeditType,XawtextRead,
		XtNdisplayCaret,FALSE,
		NULL);
  if (win->iconify == FALSE) {		/*XXX*/
    XtPopup(win->base,XtGrabNone);
    ChangeBG(win->text,colstr[win->color*2+1]);
    ChangeFont(win->text,fontstr[win->font]);
  }
  else {
    XtPopup(win->icon,XtGrabNone);
    ChangeBG(win->head,colstr[win->color*2+1]);
  }
}

/*
 * Make filename [sub]
 */
String MakeFilename()
{
  static char fname[1024];
  String home;

  home = (String)getenv("HOME");
  if (home != NULL)
    strcpy(fname,home);
  else
    strcpy(fname,".");
  strcat(fname,"/");
  strcat(fname,_TEXT_PATH);

  return fname;
}

/*
 * Save Structure [sub]
 */
Boolean SaveFusen()
{
  FILE *fp;
  WinData *p;
  Position x,y;
  Dimension w,h;
  String s,fn;
  char fn_bak[1024];

  GeometryCheck();

  /* File Backup */
  fn = MakeFilename();
  strcpy(fn_bak,fn);
  strcat(fn_bak,"~");     /* ~/.xfusen_text -> ~/.xfusen_text~ */
  rename(fn,fn_bak);

  /* Save Text */
  if ((fp = fopen(fn,"w")) == NULL) {
    XtWarning("Can't Open File.");
    return FALSE;
  }
  p = root_win;
  while(p) {

    if (p->iconify == FALSE) {
      XtVaGetValues(p->base,
		    XtNx,&x,
		    XtNy,&y,
		    NULL);
    } else {
      XtVaGetValues(p->icon,
		    XtNx,&x,
		    XtNy,&y,
		    NULL);
    }
    XtVaGetValues(p->text,
		  XtNwidth,&w,
		  XtNheight,&h,
		  NULL);

    x -= off_x;
    y -= off_y;
    fprintf(fp,"%c %d %d %d %d %d %d %d\n",0x01,x,y,w,h,p->font,p->color,p->iconify);

    XtVaGetValues(p->text,
		  XtNstring,&s,
		  NULL);
    fprintf(fp,"%s",s);

    if (s[strlen(s)-1] != '\n') {
      fprintf(fp,"\n");
    }
    fprintf(fp,"%c\n",0x02);

    p = p->next;
  }

  fclose(fp);

  return TRUE;
}

/*
 * Load Structure [sub]
 */
Boolean LoadFusen()
{
  FILE *fp;
  WinData *win;
  char str[1024],*m;
  String fn;
  int str_f;
  int x,y,w,h,f,c,i;  /* temporary var: position(x,y),size(w,h),font,color,iconify */

  fn = MakeFilename();
  if ((fp = fopen(fn,"r")) == NULL) {
    XtWarning("Can't Open File.");
    return FALSE;
  }

  /* Read and Analyze Textfile */
  str_f = FALSE;
  while(1) {
    fgets(str,1024,fp);
    if (feof(fp))
      break;

    switch(str[0]) {
    case 0x01:					/* Data line */
      sscanf(str,"\x01 %d %d %d %d %d %d %d",&x,&y,&w,&h,&f,&c,&i);
      m = XtNewString("");
      str_f = TRUE;
      break;

    case 0x02:					/* End of String line */
      win = MakeWindow(NULL);
      XtVaSetValues(win->base,
		    XtNx,x,
		    XtNy,y,
		    XtNwidth,w,
		    XtNheight,h,
		    NULL);
      XtVaSetValues(win->text,
		    XtNstring,m,
		    NULL);
      win->font    = f;
      win->color   = c;

      if (i == FALSE) {
        ViewWindow(win);
      }
      else {
	win->iconify = FALSE;
        current_win = win;
        Iconify(NULL,NULL,NULL);
        current_win = NULL;
      }
      win->iconify = i;

      XtFree((char*)m);
      str_f = FALSE;
      break;

    default:
      if (str_f == TRUE) { 
	m = XtRealloc(m,strlen(m)+strlen(str)+1);
	strcat(m,str);
      }
      break;
    }
  }

  fclose(fp);

  return TRUE;
}


/*
 * Geometry Check [sub]
 */

#define BASE_X (Position)-500
#define BASE_Y (Position)-500
#define BASE_W (Dimension)10
#define BASE_H (Dimension)10

void GeometryCheck()
{
  Position  x,y;

  XtVaGetValues(geo_win->base,
		XtNx,&x,
		XtNy,&y,
		NULL);

  off_x = x - BASE_X;
  off_y = y - BASE_Y;
}

/*
 * Make a Window for geometry check [sub]
 */
WinData* GeometryWindow()
{
  static WinData geo;
  Position  x,y;
  Dimension w,h;

  geo.base = Xt_P("xfusen",transientShellWidgetClass,toplevel,
		   XtNx,BASE_X,
		   XtNy,BASE_Y,
		   XtNwidth, BASE_W,
		   XtNheight,BASE_H,
		   NULL);
  return &geo;
}

/*----------------------------------------------------------------
	Initialization
  ----------------------------------------------------------------*/
void InitWindow()
{
  geo_win = GeometryWindow();
  if (LoadFusen() == FALSE) {
    current_win = MakeWindow(NULL);
    ViewWindow(current_win);
  }
}
