/*
 * xfusen -- Fusen on X Desktop
 *
 *  popup.c   Popup-Menu SubRoutines
 */
#include "xfusen.h"
#include "coloritem.xbm"

#define POPUP_FONT_NITEM    8
#define POPUP_COLOR_NITEM   8

static Widget popup,
		pmAbout,
		pmNew,
		pmLoad,
		pmSave,
		pmClose,
		pmFont,
		  pfTop,pf[POPUP_FONT_NITEM],
		pmColor,
		  pcTop,pc[POPUP_COLOR_NITEM],
		pmIcon,
		pmDup,
		pmQuit;

/*----------------------------------------------------------------
	Initialization
  ----------------------------------------------------------------*/
/*
 * Sub Popup Open [action]
 */
XtActionProc SubPopup(Widget w,XEvent *e,String *par,Cardinal *n)
{
  int ex,ey;
  Position x,y;
  Dimension xw,yh;
  Widget cur_item,item,menu;

  Window tmp1;
  int tmp2;

  cur_item = XawSimpleMenuGetActiveEntry(w);
  if (cur_item == pmColor) {
    item = pmColor;
    menu = pcTop;
  }
  else if (cur_item == pmFont) {
    item = pmFont;
    menu = pfTop;
  }
  else
    return;

  ex = e->xmotion.x;
  ey = e->xmotion.y;

  XtVaGetValues(item,
		XtNx,&x,
		XtNy,&y,
		XtNwidth,&xw,
		XtNheight,&yh,
		NULL);

  if ((ex < x + xw*3/4)
    ||(ey < y)
    ||(ey > y + yh))
	return;


  x = e->xmotion.x_root;
  y = e->xmotion.y_root;

  XtVaGetValues(menu,XtNwidth,&xw,NULL);
  x -= xw/2;
  y -= 8;
  XtVaSetValues(menu,XtNx,x,XtNy,y,NULL);

  XtPopup(menu,XtGrabExclusive);
}

/*
 * Sub Popup Close [action]
 */
XtActionProc SubPopdown(Widget w,XEvent *e,String *par,Cardinal *n)
{
  Widget menu;

  if (*n > 0) {
         if (!strcmp(par[0],"pctop"))
      menu = pcTop;
    else if (!strcmp(par[0],"pftop"))
      menu = pfTop;
    else
      return;
    XtPopdown(menu);
  }
}

/*----------------------------------------------------------------
	Initialization
  ----------------------------------------------------------------*/
/*
 * Initialize Popup menu
 */
void InitPopup()
{
  int i;
  String trans =
    "<Btn3Motion>: highlight() SubPopup()\n\
    ";

  /* Initialize Popup menu */
  popup    = Xt_P("popup",simpleMenuWidgetClass,toplevel,NULL);
             Xt_W("pmLine"  ,smeLineObjectClass,popup,XtNlineWidth,2,NULL);
  pmAbout  = Xt_W("pmAbout" , smeBSBObjectClass,popup,NULL);
             Xt_W("pmLine"  ,smeLineObjectClass,popup,NULL);
  pmNew    = Xt_W("pmNew"   , smeBSBObjectClass,popup,NULL);
  pmLoad   = Xt_W("pmLoad"  , smeBSBObjectClass,popup,NULL);
  pmSave   = Xt_W("pmSave"  , smeBSBObjectClass,popup,NULL);
  pmClose  = Xt_W("pmClose" , smeBSBObjectClass,popup,NULL);
             Xt_W("pmLine"  ,smeLineObjectClass,popup,NULL);
  pmFont   = Xt_W("pmFont"  , smeBSBObjectClass,popup,NULL);
  pmColor  = Xt_W("pmColor" , smeBSBObjectClass,popup,NULL);
  pmIcon   = Xt_W("pmIcon"  , smeBSBObjectClass,popup,NULL);
  pmDup    = Xt_W("pmDup"   , smeBSBObjectClass,popup,NULL);
             Xt_W("pmLine"  ,smeLineObjectClass,popup,NULL);
  pmQuit   = Xt_W("pmQuit"  , smeBSBObjectClass,popup,NULL);

  XtAddCallback(pmAbout ,XtNcallback,(XtCallbackProc)About        ,(XtPointer)NULL);
  XtAddCallback(pmNew   ,XtNcallback,(XtCallbackProc)MakeVisWindow,(XtPointer)NULL);
  XtAddCallback(pmLoad  ,XtNcallback,(XtCallbackProc)FileDialog   ,(XtPointer)Fload);
  XtAddCallback(pmSave  ,XtNcallback,(XtCallbackProc)FileDialog   ,(XtPointer)Fsave);
  XtAddCallback(pmClose ,XtNcallback,(XtCallbackProc)DeleteWindow ,(XtPointer)NULL);
  XtAddCallback(pmFont  ,XtNcallback,(XtCallbackProc)SelectFont   ,(XtPointer)NULL);
  XtAddCallback(pmColor ,XtNcallback,(XtCallbackProc)SelectColor  ,(XtPointer)NULL);
  XtAddCallback(pmIcon  ,XtNcallback,(XtCallbackProc)Iconify      ,(XtPointer)NULL);
  XtAddCallback(pmDup   ,XtNcallback,(XtCallbackProc)Duplicate    ,(XtPointer)NULL);
  XtAddCallback(pmQuit  ,XtNcallback,(XtCallbackProc)Quit         ,(XtPointer)NULL);

  XtOverrideTranslations(popup,XtParseTranslationTable(trans));
}

/*
 * Initialize SubPopup(color)
 */
void InitSubPopupColor()
{
  int i;
  char buf[4];
  Pixmap checkmarkBitmap;
  String trans2 =
    "<Leave>:  SubPopdown(pctop)";

  checkmarkBitmap = XCreateBitmapFromData(XtDisplay(toplevel),
					  XDefaultRootWindow(XtDisplay(toplevel)),
					  coloritem_bits,
					  coloritem_width,coloritem_height);

  pcTop = Xt_P("pctop" ,simpleMenuWidgetClass,toplevel,NULL);
          Xt_W("pcline",smeLineObjectClass   ,pcTop   ,XtNlineWidth,2,NULL);

  for(i=0;i<POPUP_COLOR_NITEM;i++) {
    sprintf(buf,"pc%1d",i);
    pc[i] = Xt_W(buf,smeBSBObjectClass,pcTop,NULL);

    XtVaSetValues(pc[i],
		  XtNleftBitmap,checkmarkBitmap,
		  XtNleftMargin,72,
		  XtNlabel,"",
		  NULL);
    XtAddCallback(pc[i],XtNcallback,(XtCallbackProc)SelectColor,(XtPointer)i);
  }

  XtOverrideTranslations(pcTop,XtParseTranslationTable(trans2));
}

/*
 * Initialize SubPopup(font)
 */
void InitSubPopupFont()
{
  int i;
  char buf[4];
  String trans2 =
    "<Leave>:  SubPopdown(pftop)";

  pfTop = Xt_P("pftop" ,simpleMenuWidgetClass,toplevel,NULL);
          Xt_W("pfline",smeLineObjectClass   ,pfTop   ,XtNlineWidth,2,NULL);

  for(i=0;i<POPUP_FONT_NITEM;i++) {
    sprintf(buf,"pf%1d",i);
    pf[i] = Xt_W(buf,smeBSBObjectClass,pfTop,
		 XtNleftMargin,16,
		 XtNrightMargin,16,
		 NULL);

    XtAddCallback(pf[i],XtNcallback,(XtCallbackProc)SelectFont,(XtPointer)i);
  }

  XtOverrideTranslations(pfTop,XtParseTranslationTable(trans2));
}


