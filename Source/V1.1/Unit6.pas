unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm6 = class(TForm)
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form6: TForm6;


implementation

{$R *.dfm}

uses Unit1, Unit8;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
Try
  if Form1.FDTableFILAMENT.RecordCount > 0 then begin
    if Form6.Edit1.Text = Form1.FDTableFILAMENT['FILAMENT_NAME'] then begin
      Form1.FDTableFILAMENT.Edit;
      Form1.FDTableFILAMENT.FieldByName('SPEED_QUALITY_OPT').AsInteger := form8.TrackBar1.Position;
      if form1.CheckBox7.Checked then Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := true else Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := false;
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_TEMP').AsInteger := form1.UpDown3.Position;
      Form1.FDTableFILAMENT.FieldByName('MID_TEMP').AsInteger := form1.UpDown2.Position;
      Form1.FDTableFILAMENT.FieldByName('LOW_TEMP').AsInteger := form1.UpDown1.Position;
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_FLOW').AsInteger := form1.UpDown6.Position;
      Form1.FDTableFILAMENT.FieldByName('MID_FLOW').AsInteger := form1.UpDown5.Position;
      Form1.FDTableFILAMENT.FieldByName('LOW_FLOW').AsInteger := form1.UpDown4.Position;
      if floatLocalFormat=',' then begin
        Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(StringReplace(Form1.edit13.Text, '.', ',', [rfReplaceAll]));
        Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(StringReplace(Form1.edit12.Text, '.', ',', [rfReplaceAll]));
        Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(StringReplace(Form1.edit10.Text, '.', ',', [rfReplaceAll]));
      end else begin
        Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(form1.Edit13.Text);
        Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(form1.Edit12.Text);
        Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(form1.Edit10.Text);
      end;
      Form1.FDTableFILAMENT.Post;
    end else begin
      Form1.FDTableFILAMENT.Insert;
      Form1.FDTableFILAMENT.FieldByName('EXTRUDER_NAME').AsString := Form1.FDTableEXTRUDER['EXTRUDER_NAME'];
      Form1.FDTableFILAMENT.FieldByName('FILAMENT_NAME').AsString := Form6.Edit1.Text;
      Form1.FDTableFILAMENT.FieldByName('FILAMENT_TYPE').AsString := Form1.ComboBox1.Text;
      Form1.FDTableFILAMENT.FieldByName('SPEED_QUALITY_OPT').AsInteger := form8.TrackBar1.Position;
      if form1.CheckBox7.Checked then Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := true else Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := false;
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_TEMP').AsInteger := form1.UpDown3.Position;
      Form1.FDTableFILAMENT.FieldByName('MID_TEMP').AsInteger := form1.UpDown2.Position;
      Form1.FDTableFILAMENT.FieldByName('LOW_TEMP').AsInteger := form1.UpDown1.Position;
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_FLOW').AsInteger := form1.UpDown6.Position;
      Form1.FDTableFILAMENT.FieldByName('MID_FLOW').AsInteger := form1.UpDown5.Position;
      Form1.FDTableFILAMENT.FieldByName('LOW_FLOW').AsInteger := form1.UpDown4.Position;
      if floatLocalFormat=',' then begin
        Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(StringReplace(Form1.edit13.Text, '.', ',', [rfReplaceAll]));
        Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(StringReplace(Form1.edit12.Text, '.', ',', [rfReplaceAll]));
        Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(StringReplace(Form1.edit10.Text, '.', ',', [rfReplaceAll]));
      end else begin
        Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(form1.Edit13.Text);
        Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(form1.Edit12.Text);
        Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(form1.Edit10.Text);
      end;
      Form1.FDTableFILAMENT.Post;
      Form1.ComboBox1Change(Nil);  // Change Filament
    end;
  end else begin
    Form1.FDTableFILAMENT.Insert;
    Form1.FDTableFILAMENT.FieldByName('EXTRUDER_NAME').AsString := Form1.FDTableEXTRUDER['EXTRUDER_NAME'];
    Form1.FDTableFILAMENT.FieldByName('FILAMENT_NAME').AsString := Form6.Edit1.Text;
    Form1.FDTableFILAMENT.FieldByName('FILAMENT_TYPE').AsString := Form1.ComboBox1.Text;
    Form1.FDTableFILAMENT.FieldByName('SPEED_QUALITY_OPT').AsInteger := form8.TrackBar1.Position;
    if form1.CheckBox7.Checked then Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := true else Form1.FDTableFILAMENT.FieldByName('ADJUST_PA').AsBoolean := false;
    Form1.FDTableFILAMENT.FieldByName('HEIGHT_TEMP').AsInteger := form1.UpDown3.Position;
    Form1.FDTableFILAMENT.FieldByName('MID_TEMP').AsInteger := form1.UpDown2.Position;
    Form1.FDTableFILAMENT.FieldByName('LOW_TEMP').AsInteger := form1.UpDown1.Position;
    Form1.FDTableFILAMENT.FieldByName('HEIGHT_FLOW').AsInteger := form1.UpDown6.Position;
    Form1.FDTableFILAMENT.FieldByName('MID_FLOW').AsInteger := form1.UpDown5.Position;
    Form1.FDTableFILAMENT.FieldByName('LOW_FLOW').AsInteger := form1.UpDown4.Position;
    if floatLocalFormat=',' then begin
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(StringReplace(Form1.edit13.Text, '.', ',', [rfReplaceAll]));
      Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(StringReplace(Form1.edit12.Text, '.', ',', [rfReplaceAll]));
      Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(StringReplace(Form1.edit10.Text, '.', ',', [rfReplaceAll]));
    end else begin
      Form1.FDTableFILAMENT.FieldByName('HEIGHT_PA').AsFloat := strtofloat(form1.Edit13.Text);
      Form1.FDTableFILAMENT.FieldByName('MID_PA').AsFloat := strtofloat(form1.Edit12.Text);
      Form1.FDTableFILAMENT.FieldByName('LOW_PA').AsFloat := strtofloat(form1.Edit10.Text);
    end;
    Form1.FDTableFILAMENT.Post;
    Form1.ComboBox1Change(Nil);  // Change Filament
  end;
Except
  //Exception
  Showmessage('Something went wrong !');
  Form1.FDTableFILAMENT.Cancel;
End;
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
  Form6.Close;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
  if Form1.FDTableFILAMENT.RecordCount > 0 then Form6.Edit1.Text := form1.FDTableFILAMENT['FILAMENT_NAME'];
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Form6.Edit1.SetFocus;
end;

end.
