program project1;

uses
  XawCommand,
  XTStringdefs,
  XawLabel,
  XawBox,
  XTCore,
  XTIntrinsic,
  plot, xlib, x;

const
  lib_stdio='c';
var
  stdin :TFILE;cvar;external lib_stdio;
  stdout :TFILE;cvar;external lib_stdio;
  stderr :TFILE;cvar;external lib_stdio;


var     display: PDisplay;
    window: TWindow;
    plotter: PplPlotter;

  procedure re_draw2(para1: TWidget; para2: TXtPointer; para3: PXEvent;
    para4: PBoolean); cdecl;
  begin
    WriteLn('plot');
      pl_pencolorname_r(plotter,'green');
      pl_fmove_r(plotter,600,300);

      pl_fcontrel_r(plotter,100,100);

      pl_endpath_r(plotter);

  end;

  procedure main;
  const
bg_colorname :PChar= 'white';

  var
    toplevel, box: TWidget;
    app: TXtAppContext;
    plotter_params: PplPlotterParams;
  begin
    toplevel := XtVaAppInitialize(@app, 'plot', nil, 0, @argc, argv, nil, XtNwidth, 320, XtNheight, 200, nil);

    box := XtCreateManagedWidget('box', coreWidgetClass, toplevel, nil, 0);
    XtVaSetValues(box, XtNorientation, XtEhorizontal, nil);

    XtAddEventHandler(box, ExposureMask, False, @re_draw2, nil);


    XtRealizeWidget(toplevel);

    plotter_params:=pl_newplparams;
    display:=XtDisplay(box);
    window:=XtWindow(box);

    pl_setplparam (plotter_params, 'XDRAWABLE_DISPLAY', display);
    pl_setplparam (plotter_params, 'XDRAWABLE_DRAWABLE1', @window);
    pl_setplparam (plotter_params, 'BG_COLOR', bg_colorname);
    plotter:=pl_newpl_r('Xdrawable',nil,nil,stderr,plotter_params);
    pl_openpl_r(plotter);
    pl_fspace_r(plotter,0,0,1000,1000);
    pl_flinewidth_r(plotter,0.25);

    XtAppMainLoop(app);
  end;

begin
  main;
end.
