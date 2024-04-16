/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


  var
    XmQTtraversalControl : TXrmQuark;cvar;external libXm;
type

  TXmTraversalRedirectionProc = function (old_focus:TWidget; new_focus:TWidget; focus_policy:dword; direction:TXmTraversalDirection; pass:dword):TWidget;cdecl;
{ Version 0: initial release.  }

  PXmTraversalControlTraitRec = ^TXmTraversalControlTraitRec;
  TXmTraversalControlTraitRec = record
      version : longint;
      redirect : TXmTraversalRedirectionProc;
    end;
  TXmTraversalControlTrait = PXmTraversalControlTraitRec;
  PXmTraversalControlTrait = ^TXmTraversalControlTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
