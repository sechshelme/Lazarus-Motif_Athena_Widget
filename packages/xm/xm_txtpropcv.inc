
{$IFDEF read_interface}


{*******    Public Function Declarations    ******* }

function XmCvtXmStringTableToTextProperty(display:PDisplay; string_table:TXmStringTable; count:longint; style:TXmICCEncodingStyle; text_prop_return:PXTextProperty):longint;cdecl;external libXm;
function XmCvtTextPropertyToXmStringTable(display:PDisplay; text_prop:PXTextProperty; string_table_return:PXmStringTable; count_return:Plongint):longint;cdecl;external libXm;
{*******    End Public Function Declarations    ******* }

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
