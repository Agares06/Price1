unit unCompVis;

interface

uses
  System.Classes, System.SysUtils;

type
  TCompMas = array of TComponent;

  TCompDisp = class
  private
    FComps: TCompMas;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TCompDisp }

constructor TCompDisp.Create;
  begin
    SetLength(FComps, 0);
  end;

destructor TCompDisp.Destroy;
  var
    i1: integer;
  begin
    for i1 := 0 to Length(FComps)-1 do
      FreeAndNil(FComps[i1]);
    SetLength(FComps, 0);

    inherited;
  end;

end.
