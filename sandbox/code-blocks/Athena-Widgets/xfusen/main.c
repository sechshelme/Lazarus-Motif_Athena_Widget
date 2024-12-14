/*
 * xfusen -- Fusen on X Desktop
 *
 *  main.c    Main Routine
 */
#include "xfusen.h"
#include "resource.h"

#include <signal.h>


// https://github.com/hirose31/xfusen/blob/master/popup.c

Widget toplevel,core;

/*
 * Action Setting
 */
static XtActionsRec actions[] = {
	{"Enter"      ,(XtActionProc)Enter},
	{"Leave"      ,(XtActionProc)Leave},
	{"Sense"      ,(XtActionProc)Sense},
	{"SubPopup"   ,(XtActionProc)SubPopup},
	{"SubPopdown" ,(XtActionProc)SubPopdown},
};

void InitCore();
void QuitFusen();
int AbortFusen(Display *dpy);

/*----------------------------------------------------------------
	Main Routine
  ----------------------------------------------------------------*/
void main(int argc,char **argv)
{
  XtAppContext	app_context;
  Widget w;

  if (InitLock() != TRUE) {
    fprintf(stderr,"%s: already open (or lock-file exists).\n",argv[0]);
    exit(1);
  }

  XtSetLanguageProc(NULL,NULL,NULL);
  toplevel = XtVaAppInitialize(&app_context,"Xfusen"
			       ,NULL,0
			       ,(Cardinal *)&argc,argv,fallback_resources,NULL);
  XtAppAddActions(app_context,actions,XtNumber(actions));

  InitCore();
  InitPopup();
  InitSubPopupFont();
  InitSubPopupColor();
  InitDialog();
  InitWindow();

  signal(SIGINT, QuitFusen);
  signal(SIGTERM,QuitFusen);

  XSetIOErrorHandler(AbortFusen);	/* Abort for Kill Signal */

/*XtRealizeWidget(toplevel);*/
  XtAppMainLoop(app_context);
}

void InitCore()
{
  Xt_W("core",labelWidgetClass,toplevel,NULL);
}

void QuitFusen(int sig)
{
  if (sig) {
    signal(sig,SIG_IGN);
  }
  SaveFusen();
  RemoveLock();
  exit(0);
}

int AbortFusen(Display *dpy)
{
  fprintf(stderr,"xfusen: X connection broken (explicit kill or server shutdown).\n");
  SaveFusen();
  RemoveLock();
}
