unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, FileUtil,
 xmu, XT, Xaw;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Convert(const srcPath, art: string);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Convert(const srcPath, art: string);
const
  destPath='/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/packages/';
var
  slFile, unit_source, inc_dest, slArtList: TStringList;
  i, j: integer;
  s, path: string;
  p: SizeInt;
begin
  slFile := FindAllFiles(srcPath, '*.pas');

  slArtList:=TStringList.Create;

  for i := 0 to slFile.Count - 1 do begin
    unit_source := TStringList.Create;
    inc_dest := TStringList.Create;
    inc_dest.Add('/////////////////////////////////////////////////////////////');
    inc_dest.Add('//                                                         //');
    inc_dest.Add('//   WARNUNG, dies Datei wird automatisch durch            //');
    inc_dest.Add('//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //');
    inc_dest.Add('//                                                         //');
    inc_dest.Add('/////////////////////////////////////////////////////////////');
    inc_dest.Add('');
    unit_source.LoadFromFile(slFile[i]);

    for j := 0 to unit_source.Count - 1 do begin
      s := unit_source[j];
      p := pos('$include', s);
      if p <> 0 then begin
        s := '';
      end;
      unit_source[j] := s;
    end;

    j := 0;

    // $PACKRECORDS C suchen
    repeat
      s := unit_source[j];
      p := pos('{$PACKRECORDS C}', s);
      if p <> 0 then begin
        Inc(j);
      end;
      Inc(j);
      if j >= unit_source.Count then begin
        WriteLn('Überlauf  {$PACKRECORDS C}');
        WriteLn(slFile[i]);
        exit;
//        halt;
      end;
    until p <> 0;

    inc_dest.Add('{$IFDEF read_interface}');

    // implementation C suchen
    repeat
      s := unit_source[j];
      p := pos('implementation', s);
      if p = 1 then begin
        Inc(j);
      end else begin
        inc_dest.Add(unit_source[j]);
      end;
      Inc(j);
      if j >= unit_source.Count then begin
        WriteLn('Überlauf  implementation');
        halt;
      end;
    until p = 1;

    inc_dest.Add('{$ENDIF read_interface}');
    inc_dest.Add('');
    inc_dest.Add('');
    inc_dest.Add('{$IFDEF read_implementation}');
    inc_dest.Add('');

    // end. C suchen
    repeat
      s := unit_source[j];
      p := pos('end.', s);
      if p = 1 then begin
      end else begin
        inc_dest.Add(unit_source[j]);
      end;

      Inc(j);
      if (j >= unit_source.Count) and (p <> 1) then begin
        WriteLn(slFile[i], '    Überlauf  end.');
        //        halt;
      end;
    until p = 1;

    inc_dest.Add('{$ENDIF read_implementation}');

    path := ExtractFileName(slFile[i]);


    path := ChangeFileExt(path, '.inc');
    Insert('_',path,Length(art)+1);

    slArtList.Add( '{$include '+path+'}');
    path := destPath + path;
    Memo1.Lines.Add(path);

//    inc_dest.SaveToFile(path);

    inc_dest.Free;
    unit_source.Free;
  end;

  slFile.Free;
  slArtList.SaveToFile(destPath+art+'_includes.txt' );
  slArtList.Free
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  Convert(    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/packages/Tools/pas_units/Xmu' ,'Xmu' );
  Convert(    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/packages/Tools/pas_units/XT'  ,'XT');
  Convert(    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/packages/Tools/pas_units/Xaw' ,'Xaw' );
  Convert(    '/n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/Motif_Athena/packages/Tools/pas_units/Xm' ,'Xm' );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Height := 1000;
  Width := 1000;
end;

end.
