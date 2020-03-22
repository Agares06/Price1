unit unSetts;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  unGlobals, unJData;

type
  TfmSetts = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure save_setts;
  public
    { Public declarations }
  end;

var
  fmSetts: TfmSetts;

implementation

{$R *.dfm}

procedure TfmSetts.Button1Click(Sender: TObject);
  begin
    if MessageDlg('Сохранить изменения?', mtInformation, [mbYes, mbNo], 0, mbYes) = mrYes then
      save_setts;
  end;

procedure TfmSetts.FormCreate(Sender: TObject);
  begin
    if SetG.requz <> '' then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Append(SetG.requz);
    end
    else
      memo1.Lines.Append(DflRequz);
  end;

procedure TfmSetts.save_setts;
  var
    jstr: string;
    i1: integer;
  begin
    jstr := '';
    for i1 := 0 to Memo1.Lines.Count-1 do
    begin
      jstr := jstr+Memo1.Lines.Strings[i1];
      if i1 < Memo1.Lines.Count-1 then
        jstr := jstr+#13#10;
    end;
    SetG.requz := jstr;
    jstr := JDR('requz', jstr);
    WriteJDFile(jstr, SetsFN1G, True);
  end;

end.
