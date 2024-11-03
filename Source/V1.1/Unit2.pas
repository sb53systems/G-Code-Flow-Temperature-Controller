unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, Buttons, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    Bevel2: TBevel;
    Label6: TLabel;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function FileSize(const aFilename: String): Int64;
  var
    info: TWin32FileAttributeData;
  begin
    result := -1;

    if NOT GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

    result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
  end;

procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
var
  StartInfo : TStartupInfo;
  ProcInfo : TProcessInformation;
  CreateOK : Boolean;
begin
  FillChar(StartInfo,SizeOf(TStartupInfo),#0);
  FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
  StartInfo.wShowWindow := SW_HIDE;
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.cb := SizeOf(TStartupInfo);
  CreateOK := CreateProcess(nil, PChar(ProgramName), nil, nil, False, CREATE_NEW_PROCESS_GROUP+NORMAL_PRIORITY_CLASS,
  nil, nil, StartInfo, ProcInfo);
  { check to see if successful }
  if CreateOK then begin
    //may or may not be needed. Usually wait for child processes
    if Wait then
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  end else begin
    ShowMessage('Unable to run '+ProgramName);
  end;
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  klipperEstCom: string;
begin
  if form2.CheckBox1.Checked then
    klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+ExtractFileDir(Application.ExeName)+'\klipper_estimator.exe --config_moonraker_url '+edit1.Text+' --config_moonraker_api_key ' +edit2.Text+' dump-config > '+ExtractFileDir(Application.ExeName)+'\config.json'
    else klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+ExtractFileDir(Application.ExeName)+'\klipper_estimator.exe --config_moonraker_url '+edit1.Text+' dump-config > '+ExtractFileDir(Application.ExeName)+'\config.json';
  ExecNewProcess(klipperEstCom,true);
  if FileExists(ExtractFileDir(Application.ExeName)+'\config.json')=true then
    if FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0 then showmessage('Printer File Saved !')
      else showmessage('Error ! File not Saved !')
  else showmessage('Error ! File not Saved !');
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if Form2.CheckBox1.Checked then Form2.Edit2.Enabled:=true
    else Form2.Edit2.Enabled:=False;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  if form2.openDialog1.Execute then begin
    CopyFile(PChar(form2.OpenDialog1.FileName), PChar(ExtractFileDir(Application.ExeName)+'\config.json'), False);
    if FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0 then showmessage('Printer File Saved !')
      else showmessage('Error ! File not Saved !');
  end else showmessage('Error ! File not Saved !');
end;

procedure TForm2.Label5Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://github.com/Annex-Engineering/klipper_estimator';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

end.
