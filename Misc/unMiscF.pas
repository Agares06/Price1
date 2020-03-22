unit unMiscF;

interface

uses unGlobals;

function PosInPrice(Pst: TPriceRec; Prc: TPrice): integer;
function ExcShName(name: string): string;
procedure CutWord(wrd: string; var in_str: string);
function QuoteSpacedStr(str: string): string;

implementation

function PosInPrice(Pst: TPriceRec; Prc: TPrice): integer;
  var
    i1: integer;
  begin
    Result := -1;

    for i1 := 0 to Length(Prc)-1 do
      if (Pst.name = Prc[i1].name) and (Pst.prc = Prc[i1].prc) then
      begin
        Result := i1;
        Break
      end;
  end;

procedure ShortWord(wrd: string; signs: integer; var in_str: string);
  var
    pos1: integer;
    hs1, hs2: string;
  begin
    pos1 := Pos(wrd, in_str);
    if pos1 > 0 then
    begin
      hs1 := Copy(in_str, 1, pos1+signs-1)+'.';
      pos1 := Pos(' ', in_str, Pos(wrd, in_str));
      while (in_str[pos1] = ' ') and (pos1 <= Length(in_str)) do
        pos1 := pos1+1;

      hs2 := Copy(in_str, pos1, Length(in_str)-pos1+1);
      in_str := hs1+' '+ hs2;
    end;

  end;

procedure CutWord(wrd: string; var in_str: string);
  var
    pos1: integer;
  begin
    pos1 := Pos(wrd, in_str);
    if pos1 > 0 then
      if pos1-1 = 0 then
      begin
        Delete(in_str, 1, Length(wrd));
        while in_str[1] = ' ' do
          Delete(in_str, 1, 1);
      end
      else
      begin
        Delete(in_str, pos1, Length(wrd));
        pos1 := pos1-1;
        while (in_str[pos1] = ' ') and (pos1 <> 0) do
          pos1 := pos1-1;
        pos1 := pos1+1;
        while (in_str[pos1] = ' ') and (pos1 < Length(in_str)) do
          Delete(in_str, pos1, 1);
      end;
  end;

function ExcShName(name: string): string;
  begin
    ShortWord('подключением', 5, name);
    ShortWord('Облачные', 3, name);

    CutWord('Nobelic', name);
    CutWord('Ivideon', name);

    Result := name;
  end;

function QuoteSpacedStr(str: string): string;
  begin
    Result := str;

    if Pos(' ', str) > 0 then
      Result := #39+str+#39;
  end;

end.
