unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ShellAPI, Clipbrd, StdCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    Image2: TImage;
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText9: TStaticText;
    StaticText16: TStaticText;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    procedure Label1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure StaticText5Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Label1Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://github.com/sb53systems/G-Code-Flow-Temperature-Controller';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm4.StaticText5Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://github.com/Annex-Engineering/klipper_estimator';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm4.Image2Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://ko-fi.com/sb53system';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

end.
