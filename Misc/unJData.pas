unit unJData;

interface

uses
     System.Classes, System.SysUtils;

const
  Delim : string = ':-:-:';

type
  TJDataRec = record
    name, val: string;
  end;
  TJData = array of TJDataRec;

function JDR(jname, jval: string): string;
function JValByName(jname: string; j_data:TJData): string;
procedure WriteJDFile(dest, fname: string; re_write: boolean = False);
procedure ReadJDFile(fname: string; var j_data: TJData);

implementation

function JDR(jname, jval: string): string;
  begin
    Result := '{'+jname+Delim+jval+'}';
  end;

procedure DecodeJD(dest: string; var j_data: TJData);
  var
    pos1, pos2: integer;
    str1: string;
    jdr: TJDataRec;
  begin
    SetLength(j_data, 0);

    repeat
      pos1 := Pos('{', dest);
      if pos1 > 0 then
      begin
        Delete(dest, 1, pos1);
        pos2 := Pos('}', dest);
        if pos2 > 0 then
        begin
          str1 := Copy(dest, 1, pos2-1);
          Delete(dest, 1, pos2);
          pos2 := Pos(Delim, str1);
          if pos2 > 0 then
          begin
            jdr.name := Copy(str1, 1, pos2-1);
            jdr.val := Copy(str1, pos2+5, Length(str1)-pos2-4);
          end
          else
          begin
            jdr.name := 'error0';
            jdr.val := 'corrupted data';
          end;
        end
        else
        begin
          jdr.name := 'error1';
          jdr.val := 'corrupted file';
          pos1 := 0;
        end;

        Insert(jdr, j_data, Length(j_data));
      end;
    until pos1 = 0;
  end;

function JValByName(jname: string; j_data:TJData): string;
  var
    i1: integer;
  begin
    Result := '';
    for i1 := 0 to Length(j_data)-1 do
      if j_data[i1].name = jname then
      begin
        Result := j_data[i1].val;
        Break
      end;
  end;

procedure WriteJDFile(dest, fname: string; re_write: boolean = False);
  var
    fs1: TFileStream;
    i1, L1: integer;
    buf1: char;
  begin
    if re_write or (not FileExists(fname)) then
      fs1 := TFileStream.Create(fname, fmCreate)
    else
      fs1 := TFileStream.Create(fname, fmOpenWrite);

    fs1.Seek(0, soEnd);
    L1 := Length(dest);
    fs1.Write(L1, SizeOf(integer));
    for i1 := 1 to L1 do
    begin
      fs1.Seek(0, soEnd);
      buf1 := dest[i1];
      fs1.Write(buf1, SizeOf(char));
    end;

    fs1.Free;
  end;

procedure ReadJDFile(fname: string; var j_data: TJData);
  var
    fs1: TFileStream;
    str1: string;
    cnt1, i1, L1: integer;
    buf1: char;
  begin
    fs1 := TFileStream.Create(fname, fmOpenRead);

    cnt1 := 0;
    str1 := '';
    repeat
      fs1.Seek(cnt1, soBeginning);
      fs1.Read(L1, SizeOf(integer));
      cnt1 := cnt1+SizeOf(integer);
      for i1 := 1 to L1 do
      begin
        fs1.Seek(cnt1, soBeginning);
        fs1.Read(buf1, SizeOf(char));
        str1 := str1+buf1;
        cnt1 := cnt1+SizeOf(char);
      end;
    until cnt1 >= fs1.Size;

    DecodeJD(str1, j_data);

    fs1.Free;
  end;

end.
