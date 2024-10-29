unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    StaticText2: TStaticText;
    Label3: TLabel;
    StaticText3: TStaticText;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  Form3.Close;
end;

end.
