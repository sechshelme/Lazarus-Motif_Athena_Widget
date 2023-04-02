unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

const
  path = '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/Motif_Athena_Package/Xm';

procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
  i: integer;
  s: string;
begin
  sl := FindAllFiles(path, '*.pas', False);
  Memo1.Lines.Clear;


  for i := 0 to sl.Count - 1 do begin
    s := sl[i];
    s := ExtractFileName(s);
    Delete(s, Length(s)-3,5);
    if i <> sl.Count-1 then s:=s+',';;

    WriteLn(s);

    Memo1.Lines.Add(s);
  end;

  Memo1.Lines.SaveToFile(path + '/motif_allUnits.inc');

  sl.Free;
end;

end.
