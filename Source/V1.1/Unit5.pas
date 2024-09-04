unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TForm5 = class(TForm)
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses Unit1, Unit2;

function FileSize(const aFilename: String): Int64;
  var
    info: TWin32FileAttributeData;
  begin
    result := -1;

    if NOT GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

    result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
  end;

procedure TForm5.BitBtn1Click(Sender: TObject);
Var
  MyStringList: TStringList;
begin
Try
  if Form1.FDTableEXTRUDER.RecordCount > 0 then begin
    if Form5.Edit1.Text = Form1.FDTableEXTRUDER['EXTRUDER_NAME'] then begin
      Form1.FDTableEXTRUDER.Edit;
      MyStringList := TStringList.Create;
      try
        MyStringList.LoadFromFile(ExtractFileDir(Application.ExeName)+'\config.json');
        if FileExists(ExtractFileDir(Application.ExeName)+'\config.json')=true then
          if FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0 then
            Form1.FDTableEXTRUDER.FieldByName('PRINTER_CONFIG').AsString := MyStringList.Text
          else showmessage('Be aware that the printer configuration file is still missing !');
      finally
        MyStringList.Free;
      end;
      Form1.FDTableEXTRUDER.FieldByName('START_MACRO').AsString := Form1.Edit17.Text;
      Form1.FDTableEXTRUDER.FieldByName('MACRO_EXTRUDER').AsString := Form1.Edit16.Text;
      Form1.FDTableEXTRUDER.FieldByName('A_M_SMOOTH').AsInteger := strtoint(Form1.Edit11.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE').AsInteger := strtoint(Form1.Edit8.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE_TIME').AsInteger := strtoint(Form1.Edit9.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL').AsInteger := strtoint(Form1.Edit14.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL_TIME').AsInteger := strtoint(Form1.Edit15.Text);
      Form1.FDTableFILAMENT.Filter := 'EXTRUDER_NAME = ' + QuotedStr(Form1.FDTableEXTRUDER['EXTRUDER_NAME'])+' AND FILAMENT_TYPE = '+QuotedStr(Form1.ComboBox1.Text);
      Form1.FDTableEXTRUDER.Post;
    end else begin
      Form2.ShowModal;
      Form1.FDTableEXTRUDER.Insert;
      Form1.FDTableEXTRUDER.FieldByName('EXTRUDER_NAME').AsString := Form5.Edit1.Text;
      MyStringList := TStringList.Create;
      try
        MyStringList.LoadFromFile(ExtractFileDir(Application.ExeName)+'\config.json');
        if FileExists(ExtractFileDir(Application.ExeName)+'\config.json')=true then
          if FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0 then
            Form1.FDTableEXTRUDER.FieldByName('PRINTER_CONFIG').AsString := MyStringList.Text
          else showmessage('Be aware that the printer configuration file is still missing !');
      finally
        MyStringList.Free;
      end;
      Form1.FDTableEXTRUDER.FieldByName('START_MACRO').AsString := Form1.Edit17.Text;
      Form1.FDTableEXTRUDER.FieldByName('MACRO_EXTRUDER').AsString := Form1.Edit16.Text;
      Form1.FDTableEXTRUDER.FieldByName('A_M_SMOOTH').AsInteger := strtoint(Form1.Edit11.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE').AsInteger := strtoint(Form1.Edit8.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE_TIME').AsInteger := strtoint(Form1.Edit9.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL').AsInteger := strtoint(Form1.Edit14.Text);
      Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL_TIME').AsInteger := strtoint(Form1.Edit15.Text);
      Form1.FDTableEXTRUDER.Post;
      Form1.DBLookupComboBox1.KeyValue := Form1.FDTableEXTRUDER['EXTRUDER_NAME'];
      Form1.FDTableFILAMENT.Filter := 'EXTRUDER_NAME = ' + QuotedStr(Form1.FDTableEXTRUDER['EXTRUDER_NAME'])+' AND FILAMENT_TYPE = '+QuotedStr(Form1.ComboBox1.Text);
      Form1.FDTableFILAMENT.Refresh;
      Form1.ComboBox1Change(Nil);
    end;
  end else begin
    Form2.ShowModal;
    Form1.FDTableEXTRUDER.Insert;
    Form1.FDTableEXTRUDER.FieldByName('EXTRUDER_NAME').AsString := Form5.Edit1.Text;
    MyStringList := TStringList.Create;
    try
      MyStringList.LoadFromFile(ExtractFileDir(Application.ExeName)+'\config.json');
      if FileExists(ExtractFileDir(Application.ExeName)+'\config.json')=true then
        if FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0 then
          Form1.FDTableEXTRUDER.FieldByName('PRINTER_CONFIG').AsString := MyStringList.Text
        else showmessage('Be aware that the printer configuration file is still missing !');
    finally
      MyStringList.Free;
    end;
    Form1.FDTableEXTRUDER.FieldByName('START_MACRO').AsString := Form1.Edit17.Text;
    Form1.FDTableEXTRUDER.FieldByName('MACRO_EXTRUDER').AsString := Form1.Edit16.Text;
    Form1.FDTableEXTRUDER.FieldByName('A_M_SMOOTH').AsInteger := strtoint(Form1.Edit11.Text);
    Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE').AsInteger := strtoint(Form1.Edit8.Text);
    Form1.FDTableEXTRUDER.FieldByName('TEMP_RISE_TIME').AsInteger := strtoint(Form1.Edit9.Text);
    Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL').AsInteger := strtoint(Form1.Edit14.Text);
    Form1.FDTableEXTRUDER.FieldByName('TEMP_FALL_TIME').AsInteger := strtoint(Form1.Edit15.Text);
    Form1.FDTableEXTRUDER.Post;
    Form1.DBLookupComboBox1.KeyValue := Form1.FDTableEXTRUDER['EXTRUDER_NAME'];
    Form1.FDTableFILAMENT.Filter := 'EXTRUDER_NAME = ' + QuotedStr(Form1.FDTableEXTRUDER['EXTRUDER_NAME'])+' AND FILAMENT_TYPE = '+QuotedStr(Form1.ComboBox1.Text);
    Form1.FDTableFILAMENT.Filtered:=true;
    Form1.FDTableFILAMENT.Active:=true;
    Form1.FDTableFILAMENT.Refresh;
    Form1.ComboBox1Change(Nil);
  end;
Except
  //Exception
End;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
  Form5.Close;
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
  if Form1.FDTableEXTRUDER.RecordCount > 0 then Form5.Edit1.Text := form1.FDTableEXTRUDER['EXTRUDER_NAME'];
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Form5.Edit1.SetFocus;
end;

end.
