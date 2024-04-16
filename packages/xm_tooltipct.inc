/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

{*
 *
 * $Id: ToolTipCT.h,v 1.1 2004/11/18 08:54:33 yura Exp $
 *
 * }


var
  XmQTtoolTipConfig : TXrmQuark;cvar;external libXm;

type
  PXmToolTipConfigTraitRec = ^TXmToolTipConfigTraitRec;

  TXmToolTipConfigTraitRec = record
    version: longint;
    _label: TWidget;
    post_delay: longint;
    post_duration: longint;
    timer: TXtIntervalId;
    duration_timer: TXtIntervalId;
    leave_time: TTime;
    slider: TWidget;
    enable: TBoolean;
  end;
  TXmToolTipConfigTrait = PXmToolTipConfigTraitRec;
  PXmToolTipConfigTrait = ^TXmToolTipConfigTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
