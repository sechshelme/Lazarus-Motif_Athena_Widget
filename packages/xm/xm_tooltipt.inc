
{$IFDEF read_interface}

{*
 *
 * $Id: ToolTipT.h,v 1.1 2004/11/18 08:54:33 yura Exp $
 *
 * }

  var
    XmQTtoolTip : TXrmQuark;cvar;external libXm;
{ Trait structures and typedefs, place typedefs first  }
type
  PXmToolTipTraitRec = ^TXmToolTipTraitRec;
  TXmToolTipTraitRec = record
      version : longint;
      tool_tip_string : TXmString;
    end;
  TXmToolTipTrait = PXmToolTipTraitRec;
  PXmToolTipTrait = ^TXmToolTipTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
