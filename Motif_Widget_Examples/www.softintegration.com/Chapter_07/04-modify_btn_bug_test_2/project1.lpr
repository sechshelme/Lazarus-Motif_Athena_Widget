program project1;

  procedure GetTest(p: Pointer);
  begin
    PPtrInt(p)^ := 0;
  end;

  procedure read_name(i: PtrUInt);
  var
    p: Pointer;
    n: integer;
  begin
    p := Pointer(i);
    WriteLn('p: ',PtrInt(p));
    WriteLn('addr n: ',PtrInt(@n));
    WriteLn('addr p: ',PtrInt(@p));
    GetTest(@n);
    WriteLn('p: ',PtrInt(p));
    WriteLn('User data: ', n);
  end;

begin
  read_name(1000000000000000000);
end.
