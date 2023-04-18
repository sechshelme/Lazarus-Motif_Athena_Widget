/*
 * Xfusen -- Fusen on X Desktop
 *
 *  file.c    File SubRoutines
 */
#include "xfusen.h"

WinData *root_win,*current_win;

static Widget dbase,
		dlForm,
		  dlLabel,
		  dlText,
		  dlCom1,
                  dlCom2;

Boolean SaveFile(Widget,String);
Boolean LoadFile(Widget,String);

static FDmode dlog_mode;

/*----------------------------------------------------------------
	Call Back SubRoutine
  ----------------------------------------------------------------*/
/*
 * Open file-dialog [callback]
 */
XtCallbackProc FileDialog(Widget w,int mode,caddr_t caller)
{
  Position x,y;

  XtVaGetValues(current_win->base,XtNx,&x,XtNy,&y,NULL);
  XtVaSetValues(dbase,XtNx,x+20,XtNy,y+20,NULL);

  XtPopup(dbase,XtGrabExclusive);

  dlog_mode = mode;
}

/*
 * Cloase & Query file-dialog [callback]
 */
XtCallbackProc FileDialogQuery(Widget w,int ans,caddr_t caller)
{
  String fname;
  Boolean stat;

  XtPopdown(dbase);

  if (ans == FALSE)
    return;

  XtVaGetValues(dlText,XtNstring,&fname,NULL);

  stat = FALSE;
  switch(dlog_mode) {
  case Fsave:
    stat = SaveFile(current_win->text,fname);
    break;
  case Fload:
    stat = LoadFile(current_win->text,fname);
    break;
  }

  if (stat == FALSE) {
    XtWarning("Can't Open textfile.");
  }
}

/*----------------------------------------------------------------
	Sub Routine
  ----------------------------------------------------------------*/
/*
 * Save textfile [sub]
 */
Boolean SaveFile(Widget w,String fname)
{
  return XawAsciiSaveAsFile(XawTextGetSource(w),fname);
}

/*
 * Load textfile [sub]
 */
Boolean LoadFile(Widget w,String fname)
{
  WidgetClass class;
  Widget w_old,w_new;
  char buf[BUFSIZ];
  String str;
  FILE *fp;
  int len;

  /*
   * get text file
   */
  if ((fp = fopen(fname,"r")) == NULL)
    return FALSE;

  str = XtNewString("");
  while(!feof(fp)) {
    fgets(buf,BUFSIZ,fp);
    str = XtRealloc(str,strlen(str)+strlen(buf)+1);
    strcat(str,buf);
  }
  fclose(fp);

  /*
   * make new text-source
   */
  w_old = XawTextGetSource(w);
    
  if (XtIsSubclass(w_old, multiSrcObjectClass))
    class = multiSrcObjectClass;
  else
    class = asciiSrcObjectClass;

  w_new = XtVaCreateWidget("txtsrc",class,w,
			   XtNstring, str,
			   XtNlength, BUFSIZ,
			   XtNtype, XawAsciiString,
			   NULL);

  XawTextSetSource(w, w_new, (XawTextPosition) 0);
  XtDestroyWidget(w_old);
  XtFree(str);

/*
 * XtVaSetValues(w,XtNstring,str,NULL);
 */
  return TRUE;
}


/*----------------------------------------------------------------
	Initialization
  ----------------------------------------------------------------*/
/*
 * Initialize Dialog
 */
void InitDialog()
{
  String trans = 
    "<Key>Return: no-op()";

  dbase   = Xt_P("xfusen-dlog",transientShellWidgetClass,toplevel,NULL);
  dlForm  = Xt_W("dlForm" ,formWidgetClass,dbase,
		 NULL);
  dlLabel = Xt_W("dlLabel",labelWidgetClass,dlForm,
		 NULL);
  dlText  = Xt_W("dlText",asciiTextWidgetClass,dlForm,
		 XtNeditType,XawtextEdit,
		 XtNscrollHorizontal,XawtextScrollWhenNeeded,
		 XtNfromVert,dlLabel,
		 NULL);
  dlCom1  = Xt_W("dlCom1",commandWidgetClass,dlForm,
		 XtNfromVert,dlText,
		 NULL);
  dlCom2  = Xt_W("dlCom2",commandWidgetClass,dlForm,
		 XtNfromVert,dlText,
		 XtNfromHoriz,dlCom1,
		 NULL);

  XtOverrideTranslations(dlText,XtParseTranslationTable(trans));

  XtAddCallback(dlCom1,XtNcallback,(XtCallbackProc)FileDialogQuery,(XtPointer)TRUE);
  XtAddCallback(dlCom2,XtNcallback,(XtCallbackProc)FileDialogQuery,(XtPointer)FALSE);
}
