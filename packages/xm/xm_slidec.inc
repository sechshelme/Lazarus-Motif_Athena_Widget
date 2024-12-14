
{$IFDEF read_interface}



function XmIsSlideContext(w : TWidget) : TBoolean;

const
  XmNslideFinishCallback = 'slideFinishCallback';  
  XmCSlideFinishCallback = 'SlideFinishCallback';
  XmNslideMotionCallback = 'slideMotionCallback';
  XmCSlideMotionCallback = 'SlideMotionCallback';
  XmNslideWidget = 'slideWidget';
  XmCSlideWidget = 'SlideWidget';
  XmNslideInterval = 'slideInterval';
  XmCSlideInterval = 'SlideInterval';
  XmNslideDestWidth = 'slideDestWidth';
  XmCSlideDestWidth = 'SlideDestWidth';
  XmNslideDestHeight = 'slideDestHeight';
  XmCSlideDestHeight = 'SlideDestHeight';
  XmNslideDestX = 'slideDestX';
  XmCSlideDestX = 'SlideDestX';
  XmNslideDestY = 'slideDestY';
  XmCSlideDestY = 'SlideDestY';

  var
    xmSlideContextWidgetClass : TWidgetClass;cvar;external libXm;

type
  //PXmSlideContextWidget = ^TXmSlideContextWidget;
  //TXmSlideContextWidget = PXmSlideContextRec;
  //
  //PXmSlideContextWidgetClass = ^TXmSlideContextWidgetClass;
  //TXmSlideContextWidgetClass = PXmSlideContextClassRec;

  PXmSlideStruct = ^TXmSlideStruct;
  TXmSlideStruct = record
      w : TWidget;
      dest : TXtWidgetGeometry;
      interval : culong;
      id : TXtIntervalId;
    end;
  TXmSlidePtr = PXmSlideStruct;
  PXmSlidePtr = ^TXmSlidePtr;

procedure XmSlide(slide_info:TXmSlidePtr);cdecl;external libXm;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function XmIsSlideContext(w: TWidget): TBoolean;
begin
//  XmIsSlideContext:=XtIsSubclass(w,xmSlideContextClass);
  XmIsSlideContext:=XtIsSubclass(w,xmSlideContextWidgetClass);
end;


{$ENDIF read_implementation}
