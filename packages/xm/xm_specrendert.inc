
{$IFDEF read_interface}



  var
    XmQTspecifyRenderTable : TXrmQuark;cvar;external libXm;
{ Trait structures and typedefs, place typedefs first  }
type

  TXmSpecRenderGetTableProc = function (wid:TWidget; _type:TXtEnum):TXmFontList;cdecl;
{ Version 0: initial release.  }

  PXmSpecRenderTraitRec = ^TXmSpecRenderTraitRec;
  TXmSpecRenderTraitRec = record
      version : longint;
      getRenderTable : TXmSpecRenderGetTableProc;
    end;
  TXmSpecRenderTrait = PXmSpecRenderTraitRec;
  PXmSpecRenderTrait = ^TXmSpecRenderTrait;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
