unit unParsing;

interface

uses
  System.SysUtils, System.Classes,
  unGlobals;

function CutStr(StartCode, EndCode: string; var Dest: string): string;
procedure StrBtwTags(resp, strt: string; var outs: string);
procedure ParsGrpList(presp, sc1, ec1, sc2, ec2 : string; var gp_list: TGroup);
procedure ParsPrice1(resp: string; var prc: TPrice);
function ParsImg(resp: string): string;

implementation

function CutStr(StartCode, EndCode: string; var Dest: string): string;
  var
    pos1: integer;
  begin
    Result := '';

    pos1 := Pos(StartCode, Dest);
    if pos1 > 0 then
    begin
      Delete(Dest, 1, pos1+Length(StartCode)-1);
      pos1 := Pos(EndCode, Dest);
      if pos1 > 0 then
      begin
        Result := Copy(Dest, 1, pos1-1);
        Delete(Dest, 1, pos1-1);
      end
      else
      begin
        Result := Dest;
        Dest := '';
      end;
    end;
  end;

procedure StrBtwTags(resp, strt: string; var outs: string);
  var
    bc, ec, pos1, pos2: integer;
  begin
    outs := '';

    pos1 := Pos(strt, resp);
    if pos1 > 0 then
    begin
      Delete(resp, 1, pos1-1);
      outs := '';
      bc := 0;
      ec := 0;

      repeat
        pos1 := Pos('<', resp);
        pos2 := Pos('>', resp);
        if pos1 < pos2 then
        begin
          bc := bc+1;
          outs := outs+Copy(resp, 1, pos1);
          Delete(resp, 1, pos1);
        end
        else
        begin
          ec := ec+1;
          outs := outs+Copy(resp, 1, pos2);
          Delete(resp, 1, pos2);
        end;
      until bc = ec;
    end;
  end;

procedure CleanStr(var Dest: string);
  var
    pos1: integer;
  begin
    pos1 := Pos('<' , Dest);

    if pos1 > 0 then
      Delete(Dest, pos1, Length(Dest)-pos1+1);

    Dest := Trim(Dest);
  end;

procedure ParsGrpList(presp, sc1, ec1, sc2, ec2 : string; var gp_list: TGroup);
  var
    pos1: integer;
    gl1: TGroupLink;
  begin
    SetLength(gp_list, 0);

    repeat
      pos1 := Pos(sc1, presp);
      if pos1 > 0 then
      begin
        gl1.name := CutStr(sc1, ec1, presp);
        CleanStr(gl1.name);
        gl1.link := CutStr(sc2, ec2, presp);
        CleanStr(gl1.link);

        if (gl1.name <> '') and (gl1.link <> '') then
          Insert(gl1, gp_list, Length(gp_list));
      end;
    until pos1 <= 0;
  end;

procedure CleanPriceDupl(var prc: TPrice);
  var
    i1, curp, cnt: integer;
    pr1: TPriceRec;
  begin
    curp := Length(prc)-1;

    while curp > 0 do
    begin
      pr1.name := prc[curp].name;
      pr1.prc := prc[curp].prc;

      cnt := 0;
      for i1 := curp-1 to 0 do
        if (pr1.name = prc[i1].name) and (pr1.prc = prc[i1].prc) then
        begin
          Delete(prc, i1, 1);
          cnt := cnt+1;
        end;
      curp := curp-1-cnt;
    end;
  end;

procedure ParsPrice1(resp: string; var prc: TPrice);
  var
    pos1: integer;
    pr1: TPriceRec;
    st1: string;
  begin
    SetLength(prc, 0);

    repeat
      pos1 := Pos('itemprop="name">', resp);
      if pos1 > 0 then
      begin

        pr1.name := CutStr('<span itemprop="name">', '</span>', resp);
        pr1.link := CutStr('<link itemprop="url" href="', '" />', resp);
        st1 := CutStr('"price" content="', '">', resp);
        try
          pr1.prc := StrToFloat(st1);
        except
          pr1.prc := 0;
        end;

        Insert(pr1, prc, Length(prc));
      end;
    until pos1 <= 0;

    CleanPriceDupl(prc);
  end;

function ParsImg(resp: string): string;
  begin
    Result := '';

    if resp <> '' then
      Result := CutStr('image" content="', '" />', resp);
  end;


end.
