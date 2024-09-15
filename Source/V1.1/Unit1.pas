unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  XPMan, TeeFunci, ShellAPI, Math, ComCtrls, jpeg, VclTee.TeeGDIPlus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage,
  Data.Bind.Components, Data.Bind.DBScope, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.FMTBcd, Data.SqlExpr;

  procedure refreshList;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    XPManifest1: TXPManifest;
    BitBtn4: TBitBtn;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    StaticText5: TStaticText;
    Edit5: TEdit;
    StaticText6: TStaticText;
    Edit6: TEdit;
    StaticText7: TStaticText;
    Edit7: TEdit;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    StaticText8: TStaticText;
    Edit8: TEdit;
    UpDown7: TUpDown;
    Bevel1: TBevel;
    StaticText9: TStaticText;
    Edit9: TEdit;
    UpDown8: TUpDown;
    BitBtn6: TBitBtn;
    TrackBar1: TTrackBar;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    Edit11: TEdit;
    UpDown10: TUpDown;
    SaveDialog1: TSaveDialog;
    ComboBox1: TComboBox;
    StaticText10: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    CheckBox7: TCheckBox;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    Edit14: TEdit;
    Edit15: TEdit;
    UpDown9: TUpDown;
    UpDown11: TUpDown;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    Image1: TImage;
    Image2: TImage;
    Bevel5: TBevel;
    Image6: TImage;
    Image7: TImage;
    Image4: TImage;
    Image5: TImage;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    FDTableFILAMENT: TFDTable;
    DataSource2: TDataSource;
    FDTableEXTRUDER: TFDTable;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Image9: TImage;
    FDTableEXTRUDEREXTRUDER_NAME: TStringField;
    FDTableEXTRUDERTEMP_RISE: TIntegerField;
    FDTableEXTRUDERTEMP_RISE_TIME: TIntegerField;
    FDTableEXTRUDERTEMP_FALL: TIntegerField;
    FDTableEXTRUDERTEMP_FALL_TIME: TIntegerField;
    FDTableEXTRUDERA_M_SMOOTH: TIntegerField;
    FDTableFILAMENTEXTRUDER_NAME: TStringField;
    FDTableFILAMENTFILAMENT_NAME: TStringField;
    FDTableFILAMENTFILAMENT_TYPE: TStringField;
    FDTableFILAMENTHEIGHT_TEMP: TIntegerField;
    FDTableFILAMENTMID_TEMP: TIntegerField;
    FDTableFILAMENTLOW_TEMP: TIntegerField;
    FDTableFILAMENTHEIGHT_FLOW: TIntegerField;
    FDTableFILAMENTMID_FLOW: TIntegerField;
    FDTableFILAMENTLOW_FLOW: TIntegerField;
    FDTableFILAMENTHEIGHT_PA: TFloatField;
    FDTableFILAMENTMID_PA: TFloatField;
    FDTableFILAMENTLOW_PA: TFloatField;
    FDTableFILAMENTADJUST_PA: TBooleanField;
    FDTableFILAMENTSPEED_QUALITY_OPT: TIntegerField;
    ComboBox2: TComboBox;
    Edit16: TEdit;
    StaticText1: TStaticText;
    Edit17: TEdit;
    StaticText21: TStaticText;
    Timer1: TTimer;
    FDTableEXTRUDERSTART_MACRO: TStringField;
    FDTableEXTRUDERMACRO_EXTRUDER: TStringField;
    FDTableEXTRUDERPRINTER_CONFIG: TStringField;
    Image3: TImage;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Chart1: TChart;
    Label2: TLabel;
    Label4: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label8: TLabel;
    Image8: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    BitBtn5: TBitBtn;
    Series8: TLineSeries;
    Series3: TLineSeries;
    Series2: TLineSeries;
    Series1: TLineSeries;
    Series5: TLineSeries;
    Series4: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Chart2: TChart;
    Label7: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn7: TBitBtn;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  GCode_IN, GCode_Output, tempOutputFile, finalFile, ConfigFile : textfile;
  file_path, appPath, Lines, initialTemp, floatLocalFormat : string;
  Filament_count, print_time : single;
  averageTime, imerCount: integer;
  canProcess, extruderFound, filNameFound, filTypeFound : bool;
  formatSettings : TFormatSettings;
  Bookmark: TBookmark;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7;

{$R *.dfm}


// Check File Size                                                      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function FileSize(const aFilename: String): Int64;
  var
    info: TWin32FileAttributeData;
  begin
    result := -1;

    if NOT GetFileAttributesEx(PChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

    result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
  end;


// Smooth Max/Average Flow                                              ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure SmoothSeries(Series: TLineSeries; WindowSize: Integer);
var
  i, j: Integer;
  Sum: Double;
  SmoothValues: array of Double;
begin
  SetLength(SmoothValues, Series.Count);
  for i := 0 to Series.Count - 1 do
  begin
    Sum := 0;
    for j := Max(0, i - WindowSize div 2) to Min(Series.Count - 1, i + WindowSize div 2) do
    begin
      Sum := Sum + Series.YValue[j];
    end;
    SmoothValues[i] := Sum / (Min(Series.Count - 1, i + WindowSize div 2) - Max(0, i - WindowSize div 2) + 1);
  end;

  for i := 0 to Series.Count - 1 do
  begin
    Series.YValue[i] := SmoothValues[i];
  end;
end;


// Execute Klipper_Estimator in CMD.exe                                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure ExecNewProcess(ProgramName : String; Wait: Boolean);
var
  StartInfo : TStartupInfo;
  ProcInfo : TProcessInformation;
  CreateOK : Boolean;
begin
  FillChar(StartInfo,SizeOf(TStartupInfo),#0);
  FillChar(ProcInfo,SizeOf(TProcessInformation),#0);
  StartInfo.wShowWindow := SW_HIDE;  // SW_HIDE / SW_NORMAL
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


// Find Closest Move Index To the Used Filament Count                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function FindClosestIndex(const Value: Double; A: TChartSeries): Integer;
var
  ahigh, j, alow: integer;
begin
  // extra cases
  if A.Count = 0 then
    Exit;
  if Value <= A.YValue[0] then
    Exit;
  if Value >= A.YValue[A.Count-1] then
    Exit;
   // binary search
  alow := 0;
  ahigh := A.Count - 1;
  while ahigh - alow > 1 do begin
    j := (ahigh + alow) div 2;
    if Value <= A.YValue[j] then
      ahigh := j
    else
      alow := j;
  end;
   // choose the closest from ahigh, alow
  Result := ahigh - Ord(A.YValues[ahigh] - Value >= Value - A.YValues[alow])
end;


// Read The Generated Temporary File Moves and creat a Final File with The New Estimated Time            //////////////////////////////////////////////////////////////////////////////////////////////
procedure generateOutput;
var
  klipperEstCom, Lines2 : string;
  tTime, moveTime, flow, maxCount : double;
  retract, edited, endFound, useStartMacro : bool;
  d, m, h, s, moveCount, indexSeries11 : integer;
begin
  klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+appPath+'\klipper_estimator.exe --config_file '+appPath+'\config.json dump-moves '+appPath+'\tempOut > '+appPath+'\gcode.txt';
  ExecNewProcess(klipperEstCom,true);
  Assignfile (GCode_IN, appPath+'\gcode.txt');
  Reset (GCode_IN);
  tTime:=0;
  flow:=0;
  maxCount:=0;
  moveCount:=0;
  moveTime:=0;
  indexSeries11:=1;
  retract:=false;
  edited:=false;
  endFound:=false;
  if form1.Edit17.text<>'' then useStartMacro:=true else useStartMacro:=false;
  WHILE NOT EOF(GCode_IN) DO BEGIN
    Readln (GCode_IN, Lines);
    if copy(Lines,1,8)='    Flow' then begin
      if pos('(', Lines)<>0 then begin
        Lines:=copy(Lines, pos('(',Lines)+1, length(Lines));
        Lines:=copy(Lines, 1, length(Lines)-1);
        if pos('-',Lines)<>0 then begin
          flow:=0;
          retract:=true;
        end else begin
          if retract=true then begin
            retract:=false;
            flow:=0;
          end else begin
            if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
            flow:=StrToFloat(Lines);
          end;
        end;
      end else flow:=0;
    end else if copy(Lines,1,8)='    Time' then begin
      moveCount:=moveCount+1;
      Lines:=copy(Lines, pos('=',Lines)+2, length(Lines));
      if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
      moveTime:=StrToFloat(Lines);
      if tTime>0 then Form1.Series9.AddXY(tTime, flow);
      tTime:=tTime+moveTime;
      if moveCount=Form1.Series11.XValue[indexSeries11] then begin
        Form1.Series10.AddXY(tTime,Form1.Series11.YValue[indexSeries11]);
        indexSeries11:=indexSeries11+1;
      end;
      if flow>maxCount then maxCount:=flow;
    end;
  END;
  CloseFile(GCode_IN);
  try
    DeleteFile(appPath+'\gcode.txt');
  Except
    // Do Nothing
  end;
  d:=Trunc(tTime/86400);
  h:=Trunc((tTime-(d*86400))/3600);
  m:=Trunc((tTime-(h*3600))/60);
  s:=Trunc(tTime-(h*3600)-(m*60));
  Form1.Label1.Caption:='';
  if d>0 then Form1.Label1.Caption:=inttostr(d)+'d ';
  if h>0 then Form1.Label1.Caption:=Form1.Label1.Caption+inttostr(h)+'h ';
  if m>0 then Form1.Label1.Caption:=Form1.Label1.Caption+inttostr(m)+'m ';
  if s>0 then Form1.Label1.Caption:=Form1.Label1.Caption+inttostr(s)+'s';
  // Change Estimated Time in GCODE
  AssignFile(GCode_IN,file_path);
  Reset (GCode_IN);
  AssignFile(GCode_Output,appPath+'\tempOut');
  Reset (GCode_Output);
  AssignFile(finalFile,appPath+'\Output.gcode');
  Rewrite(finalFile);
  WHILE NOT EOF(GCode_IN) DO BEGIN
    Readln (GCode_IN, Lines);
    // Change the Initial Temperature in Print Start Macro
    if useStartMacro and (copy(Lines,1,length(form1.Edit17.text))=form1.Edit17.text) then begin
      WriteLn (finalFile , (copy(Lines,1,pos(form1.Edit16.text,Lines)+length(form1.Edit16.text)))+initialTemp+copy(Lines,pos(form1.Edit16.text,Lines)+length(form1.Edit16.text)+4,Length(Lines)) +'    ; Reset Initial Temperature');
    // Change the Initial Temperature in M109 S
    end else if copy(Lines,1,6)='M109 S' then begin
      WriteLn (finalFile ,'M109 S'+initialTemp+' '+copy(Lines,11,length(Lines))+'    ; Reset Initial Temperature');
    // Change Print Time
    end else if copy(Lines,1,41)='; estimated printing time (normal mode) =' then begin
      Lines:='; estimated printing time (normal mode) = '+Form1.Label1.Caption;
      WriteLn (finalFile , Lines);
    // Add Script Version
    end else if copy(Lines,1,20)='; HEADER_BLOCK_START' then begin
       WriteLn (finalFile , Lines);
       WriteLn (finalFile , '; Edited by '+Form1.Caption);
    // Detect Print End
    end else if copy(Lines,1,22)='; EXECUTABLE_BLOCK_END' then begin
      endFound:=true;
      WriteLn (finalFile , Lines);
    // Detect Print Start
    end else if (Not edited)and((copy(Lines,1,8)=';HEIGHT:')or(copy(Lines,1,11)='; Z_HEIGHT:')) then begin
      edited:=true;
      WHILE NOT EOF(GCode_Output) DO BEGIN
        Readln (GCode_Output, Lines2);
        WriteLn (finalFile , Lines2);
      END;
    end else if ((Not endFound)and(Not edited)) then begin
      WriteLn (finalFile , Lines);
    end else if (endFound and edited) then begin
      WriteLn (finalFile , Lines);
    end;
  end;
  CloseFile(GCode_IN);
  CloseFile(GCode_Output);
  CloseFile(finalFile);
  Form1.Chart2.Title.Text.Clear;
  Form1.Chart2.Title.Font.Color:=clNavy;
  Form1.Chart2.Title.Text.Add('- Generated G-Code -');
  Form1.Chart2.BottomAxis.Maximum:=tTime;
  Form1.Series11.AddXY(tTime, Form1.Series11.YValues[Form1.Series11.Count]);                                              ///////////////////
  Try
    Form1.Chart2.LeftAxis.Maximum:=round(maxCount)+1;
  Except
    // Do Nothing
  End;
  Form1.Label13.Caption:=floattostr(round(maxCount*10)/10);
  Form1.BitBtn2.Enabled:=true;
  canProcess:=false;
end;


// Generate Temporary File                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure generateTempOutput;
Var
  totFilCount, gcodeFreq, curFreq, recFreq, tempByPA, curPA, recPA, recFlow, tempByflow, moveFlowRate, maxTempCount, minTempCount, sectionArea, layerHeight, lineWidth, gcodeMovesCount : double;
  curTemp, getTemp, moveFilCount, lineType : string;
  retract, freqChanger : bool;
begin
  // Set Innitial Parameters
  Form1.BitBtn7.Enabled:=False;
  if not canProcess then Exit;
  Form1.Label1.Repaint;
  Form1.Chart2.Title.Text.Clear;
  Form1.Chart2.Title.Font.Color:=clRed;
  Form1.Chart2.Title.Text.Add('Generating...');
  Form1.Label16.Caption:=form1.ComboBox1.Text;
  Form1.Label17.Caption:=form1.ComboBox2.Text;
  Form1.Chart2.Repaint;
  lineType:='';
  totFilCount:=0;
  gcodeFreq:=0;
  curFreq:=0;
  curPA:=0;
  gcodeMovesCount:=0;
  maxTempCount:=0;
  minTempCount:=1000;
  retract:=false;
  freqChanger:=false;
  getTemp:=floattostr((round(Form1.Series4.YValues[1]*10))/10);
  curTemp:=floattostr((round(Form1.Series4.YValues[1]*10))/10);
  Form1.Series10.AddXY(0,strtofloat(curTemp));
  minTempCount:=strtofloat(curTemp);
  maxTempCount:=strtofloat(curTemp);
  curTemp:=StringReplace(curTemp, ',', '.', [rfReplaceAll]);
  initialTemp:=curTemp;
  Assignfile (GCode_IN, appPath+'\tempOutput');
  Reset (GCode_IN);
  AssignFile(tempOutputFile,appPath+'\tempOut');
  Rewrite(tempOutputFile);
  // Read The Original File and Create a Temporary File
  Try
    WHILE NOT (EOF(GCode_IN)and(canProcess)) DO BEGIN
      if not canProcess then Exit;
      Readln (GCode_IN, Lines);
      // Get the Slicer Speed
      if copy(Lines,1,4)='G1 F' then begin
        WriteLn (tempOutputFile , Lines+'    ; Slicer Speed');
        Lines:=copy(Lines,5,length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        gcodeFreq:=round(strtofloat(Lines));
        freqChanger:=true;
      // Get the Line Type
      end else if copy(Lines,1,6)=';TYPE:' then begin
        WriteLn (tempOutputFile , Lines);
        lineType:=copy(Lines,7,length(Lines));
      end else if copy(Lines,1,10)='; FEATURE:' then begin
        WriteLn (tempOutputFile , Lines);
        lineType:=copy(Lines,12,length(Lines));
      // Get the Line Width
      end else if copy(Lines,1,7)=';WIDTH:' then begin
        WriteLn (tempOutputFile , Lines);
        Lines:=copy(Lines,8,length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        lineWidth:=strtofloat(Lines);
      end else if copy(Lines,1,13)='; LINE_WIDTH:' then begin
        WriteLn (tempOutputFile , Lines);
        Lines:=copy(Lines,15,length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        lineWidth:=strtofloat(Lines);
      // Get the Line Height
      end else if copy(Lines,1,8)=';HEIGHT:' then begin
        WriteLn (tempOutputFile , Lines);
        Lines:=copy(Lines,9,length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        layerHeight:=strtofloat(Lines);
      end else if copy(Lines,1,15)='; LAYER_HEIGHT:' then begin
        WriteLn (tempOutputFile , Lines);
        Lines:=copy(Lines,17,length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        layerHeight:=strtofloat(Lines);
      end else if copy(Lines,1,3)='G1 ' then begin
        gcodeMovesCount:=gcodeMovesCount+1;
        if pos('F', Lines)<>0 then begin
          freqChanger:=true;
          if pos(' ',copy(Lines, pos('F',Lines)+1, length(Lines)))<>0 then gcodeFreq:=round(strtofloat(copy(Lines, pos('F',Lines)+1, pos(' ',copy(Lines, pos('F',Lines)+1, length(Lines)))-1)))
            else gcodeFreq:=round(strtofloat(copy(Lines, pos('F',Lines)+1, length(Lines))));
        end;

        // Temperature change
        Try
          getTemp:=floattostr(round(Form1.Series4.YValues[FindClosestIndex(totFilCount,Form1.Series7)]*10)/10);
          if floatLocalFormat=',' then getTemp:=StringReplace(getTemp, ',', '.', [rfReplaceAll]);
          if getTemp<>curTemp then begin
            curTemp:=getTemp;
            getTemp:=floattostr(round(Form1.Series4.YValues[FindClosestIndex(totFilCount,Form1.Series7)+1]*10)/10);
            Form1.Series11.AddXY(gcodeMovesCount, strtofloat(getTemp) );
            if minTempCount>strtofloat(getTemp) then minTempCount:=strtofloat(getTemp);
            if maxTempCount<strtofloat(getTemp) then maxTempCount:=strtofloat(getTemp);
            if floatLocalFormat=',' then getTemp:=StringReplace(getTemp, ',', '.', [rfReplaceAll]);
            WriteLn (tempOutputFile , 'M104 S'+getTemp);
          end;
        Except On E: Exception do
          //ShowMessage('There was an error: ' + E.Message);
        end;

        // Calculate requested Flow and PA / Temperature
        if floatLocalFormat=',' then curTemp:=StringReplace(curTemp, '.', ',', [rfReplaceAll]);
        if strtofloat(curTemp)>form1.UpDown2.Position then begin
          tempByflow:=((form1.UpDown3.Position-form1.UpDown2.Position)/(form1.UpDown6.Position-form1.UpDown5.Position));
          recFlow:=form1.UpDown5.Position+((strtofloat(curTemp)-form1.UpDown2.Position)/tempByflow);
          if floatLocalFormat=',' then begin
            Form1.Edit13.Text:=StringReplace(Form1.edit13.Text, '.', ',', [rfReplaceAll]);
            Form1.Edit12.Text:=StringReplace(Form1.edit12.Text, '.', ',', [rfReplaceAll]);
          end;
          tempByPA:=((form1.UpDown3.Position-form1.UpDown2.Position)/(strtofloat(Form1.edit13.Text)-strtofloat(Form1.edit12.Text)));
          recPA:=strtofloat(Form1.edit12.Text)+((strtofloat(curTemp)-form1.UpDown2.Position)/tempByPA);
        end else begin
          tempByflow:=((form1.UpDown2.Position-form1.UpDown1.Position)/(form1.UpDown5.Position-form1.UpDown4.Position));
          recFlow:=form1.UpDown5.Position-((form1.UpDown2.Position-strtofloat(curTemp))/tempByflow);
          if floatLocalFormat=',' then begin
            Form1.Edit10.Text:=StringReplace(Form1.edit10.Text, '.', ',', [rfReplaceAll]);
            Form1.Edit12.Text:=StringReplace(Form1.edit12.Text, '.', ',', [rfReplaceAll]);
          end;
          tempByPA:=((form1.UpDown2.Position-form1.UpDown1.Position)/(strtofloat(Form1.edit12.Text)-strtofloat(Form1.edit10.Text)));
          recPA:=strtofloat(Form1.edit12.Text)-((form1.UpDown2.Position-strtofloat(curTemp))/tempByPA);
        end;
        recPA:=round(recPA*1000)/1000;
        if floatLocalFormat=',' then curTemp:=StringReplace(curTemp, ',', '.', [rfReplaceAll]);

        // PA Change
        if ((curPA<>recPA)and(Form1.CheckBox7.Checked)and((lineType='Sparse infill')or(lineType='Internal solid infill')or(lineType='Internal Bridge')or(lineType='Support'))) then begin
          curPA:=recPA;
          WriteLn (tempOutputFile , 'SET_PRESSURE_ADVANCE ADVANCE='+StringReplace(floattostr(curPA), ',', '.', [rfReplaceAll]));
        end;

        // Frequance change
        if pos('E', Lines)<>0 then begin
          moveFilCount:=copy(Lines, pos('E',Lines)+1, length(Lines));
          if pos(' ', moveFilCount)<>0 then moveFilCount:=copy(moveFilCount,1,pos(' ', moveFilCount)-1);
          if floatLocalFormat=',' then moveFilCount:=StringReplace(moveFilCount, '.', ',', [rfReplaceAll]);
          if moveFilCount[1]='-' then begin
            if gcodeFreq>0 then WriteLn (tempOutputFile , 'G1 F'+StringReplace(floattostr(gcodeFreq), ',', '.', [rfReplaceAll])+'    ; Reset Speed Before Retraction');
            retract:=true;
          end else if retract=true then retract:=false
          else begin
            try
              if ((moveFilCount[1]=',')or(moveFilCount[1]='.')) then  moveFilCount:='0'+moveFilCount;
              if (recFlow>0) then begin
                sectionArea := layerHeight * lineWidth;
                recFreq := round( 60 *(recFlow / sectionArea));
                if ((curFreq<>recFreq)or freqChanger) then begin
                  freqChanger:=false;
                  curFreq:=recFreq;
                  if curFreq>gcodeFreq then WriteLn (tempOutputFile , 'G1 F'+StringReplace(floattostr(gcodeFreq), ',', '.', [rfReplaceAll])+'    ; Keep Slicer Speed')
                    else WriteLn (tempOutputFile , 'G1 F'+StringReplace(floattostr(curFreq), ',', '.', [rfReplaceAll])+'    ; Recommended Speed');
                end;
              end;
            Except
            end;
            totFilCount:=totFilCount+strtofloat(moveFilCount);
          end;
        end;
        WriteLn (tempOutputFile , Lines);
      end else WriteLn (tempOutputFile , Lines);
    END;
    CloseFile(GCode_IN);
    CloseFile(tempOutputFile);
  Except On E: Exception do
    begin
      canProcess:=False;
      ShowMessage('There was an error: ' + E.Message);
    end;
  End;

  // Generate Final File and Show Max and Min Temperature in the Interface
  if canProcess then begin
    generateOutput;
    Form1.Label21.Caption:=floattostr(minTempCount);
    Form1.Label20.Caption:=floattostr(maxTempCount);
  end;

end;


// Calculate Averages and estimate Temperature                          ////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure calculateAverages;
var
  i:integer;
  actTemp, edialTemp, calcValue, tempByflow, tempByTime, maxTempCount, minTempCount, maxFlowCount, minFlowCount : double;
begin
  if not canProcess then Exit;
  maxTempCount:=0;
  minTempCount:=0;
  maxFlowCount:=0;
  minFlowCount:=300;
  Form1.BitBtn2.Enabled:=false;
  Form1.BitBtn5.Enabled:=false;
  Form1.BitBtn7.Enabled:=false;
  Form1.Series4.Clear;
  Form1.Series5.Clear;
  Form1.Series9.Clear;
  Form1.Series10.Clear;
  Form1.Series11.Clear;
  Form1.Chart1.Title.Text.Clear;
  Form1.Chart1.Title.Font.Color:=clRed;
  Form1.Chart1.Title.Text.Add('Calculating...');
  Form1.Label25.Caption:=form1.ComboBox1.Text;
  Form1.Label24.Caption:=form1.ComboBox2.Text;
  Form1.Chart1.Repaint;
  Form1.Chart2.Repaint;
  // Average/Max flow Estimation
  For i:=0 to (Form1.series1.Count*averageTime)-averageTime do begin
    calcValue:=((Form1.Series1.YValues[i]*Form1.trackbar1.Position)/10)+((Form1.Series2.YValues[i]*(10-Form1.trackbar1.Position))/10);
    Form1.Series5.AddXY(i*averageTime, calcValue );
  end;
  Form1.Series5.AddXY(Form1.Chart1.BottomAxis.Maximum, calcValue);
  SmoothSeries(Form1.Series5, Form1.updown10.Position);
   For i:=0 to (Form1.series5.Count)-1 do begin
    calcValue:=Form1.Series5.YValues[i];
    if calcValue>maxFlowCount then maxFlowCount:=calcValue;
    if calcValue<minFlowCount then minFlowCount:=calcValue;
  end;
  // Temperature Estimation
  For i:=0 to (Form1.series5.Count*averageTime)-averageTime do begin
    if Form1.Series5.YValues[i]>form1.UpDown5.Position then begin
      tempByflow:=((form1.UpDown3.Position-form1.UpDown2.Position)/(form1.UpDown6.Position-form1.UpDown5.Position));
      edialTemp:=form1.UpDown2.Position+((Form1.Series5.YValues[i]-form1.UpDown5.Position)*tempByflow);
    end else begin
      tempByflow:=((form1.UpDown2.Position-form1.UpDown1.Position)/(form1.UpDown5.Position-form1.UpDown4.Position));
      edialTemp:=form1.UpDown2.Position-((form1.UpDown5.Position-Form1.Series5.YValues[i])*tempByflow);
    end;
    if i=0 then begin
      actTemp:=edialTemp;
      minTempCount:=actTemp;
      maxTempCount:=actTemp;
    end;
    if edialTemp>actTemp then begin
      tempByTime:=form1.UpDown7.Position/form1.UpDown8.Position;
      if edialTemp>(actTemp+tempByTime) then actTemp:=actTemp+tempByTime else actTemp:=edialTemp;
    end else if edialTemp<actTemp then begin
      tempByTime:=form1.UpDown9.Position/form1.UpDown11.Position;
      if edialTemp<(actTemp-tempByTime) then actTemp:=actTemp-tempByTime else actTemp:=edialTemp;
    end else actTemp:=edialTemp;
    Form1.Series4.AddXY(i*averageTime, actTemp );
    if actTemp<minTempCount then minTempCount:=actTemp;
    if actTemp>maxTempCount then maxTempCount:=actTemp;
  end;
  Form1.Series4.AddXY(Form1.Chart1.BottomAxis.Maximum, actTemp);
  Try
    Form1.Chart1.RightAxis.Minimum:=round(minTempCount)-1;
    Form1.Chart1.RightAxis.Maximum:=round(maxTempCount)+1;
    Form1.Chart2.RightAxis.Minimum:=round(minTempCount)-1;
    Form1.Chart2.RightAxis.Maximum:=round(maxTempCount)+1;
  Except
    // Do Nothing
  End;
  Form1.Label9.Caption:=floattostr((round(minTempCount*10))/10);
  Form1.Label10.Caption:=floattostr((round(maxTempCount*10))/10);
  Form1.Label22.Caption:=floattostr((round(maxFlowCount*10))/10);
  Form1.Label23.Caption:=floattostr((round(minFlowCount*10))/10);
  Form1.Chart1.Title.Text.Clear;
  Form1.Chart1.Title.Font.Color:=clNavy;
  Form1.Chart1.Title.Text.Add('- Slicer G-Code -');
  Form1.Chart1.Repaint;
  Form1.Chart2.Repaint;
  Form1.BitBtn5.Enabled:=true;
  Form1.BitBtn7.Enabled:=true;
  //Form1.Chart1.ShowHint:=true;
end;


// Read Original G-Code                                                 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure readOriginalGcode;
var
  klipperEstCom : string;
  tTime, tTimeSecond, timeCount, moveTime, flowEverage, flow, maxFlow, usedFilament, maxCount : double;
  retract, firstMove, lastMove : bool;
  i, d, m, h, s, findIndex : integer;
  printerName, filamentType, filamentName : string;
begin
  form1.BitBtn4.Enabled:=false;
  // Check for the necessary files
  if not FileExists(file_path) then begin
    canProcess:= false;
    showmessage('GCODE File not found !');
  end else if ((not FileExists(appPath+'\config.json'))or(Not FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0)) then begin
    canProcess:= false;
    Form2.ShowModal;
    if (FileExists(appPath+'\config.json'))and(FileSize(ExtractFileDir(Application.ExeName)+'\config.json')>0) then
      canProcess:= true else showmessage('Printer Configuration file is still missing !');
  end else if not FileExists(appPath+'\klipper_estimator.exe') then begin
    canProcess:= false;
    showmessage('klipper_estimator.exe File not found in main directory!');
  end;
  if not canProcess then Exit;

  firstMove:=false;
  lastMove:=false;
  // Get Informations in the G-Code

  Try
    Assignfile (GCode_IN, file_path);
    AssignFile(tempOutputFile,appPath+'\tempOutput');
    Reset (GCode_IN);
    Rewrite(tempOutputFile);
  Except
    canProcess:=false;
    Showmessage('Cannot be processed ! Make sure that the path of the Script does not contain ''Space !''');
  End;

  WHILE NOT (EOF(GCode_IN)) and canProcess Do begin
    Readln (GCode_IN, Lines);
    // Check if G2/G3 is used
    if firstMove and ((copy(Lines,1,3)='G2 ')or(copy(Lines,1,3)='G3 ')) then begin
      showmessage('Cannot be processed ! This G-code File contains G2 or G3 commands !');
      canProcess:=false;
    // Check if the G-Code is already Edited
    end else if copy(Lines,1,16)='; Edited by SB53' then begin
      showmessage('Cannot be processed ! This G-Code file is already edited by this script');
      canProcess:=false;
    // Get the Filament Type
    end else if copy(Lines,1,17)='; filament_type =' then begin
      filamentType:=copy(Lines,19,length(Lines));
    // Get the Printer/Extruder Name
    end else if copy(Lines,1,23)='; printer_settings_id =' then begin
      printerName:=copy(Lines,25,length(Lines));
    // Get the Filament Name
    end else if copy(Lines,1,24)='; filament_settings_id =' then begin
      filamentName:=copy(Lines,26,length(Lines));
    // Detect First Move
    end else if ((copy(Lines,1,8)=';HEIGHT:')or(copy(Lines,1,11)='; Z_HEIGHT:')) then begin
      firstMove:=true;
    // Detect Last Move
    end else if copy(Lines,1,22)='; EXECUTABLE_BLOCK_END' then begin
      lastMove:=true;
    end;
    // Write the Line in TempOutput File
    if (firstMove=true and lastMove=false) then begin
      WriteLn (tempOutputFile , Lines);
    end;
  end;
  CloseFile(GCode_IN);
  CloseFile(tempOutputFile);
  if (Not firstMove) or (Not lastMove) then begin
    canProcess:=false;
    Showmessage('Cannot be processed ! Printing Start/End not found!');
  end;

  if canProcess then begin
    // Reset initial parameters
    Form1.Series1.Clear;
    Form1.Series2.Clear;
    Form1.Series3.Clear;
    Form1.Series4.Clear;
    Form1.Series5.Clear;
    Form1.Series6.Clear;
    Form1.Series7.Clear;
    Form1.Series8.Clear;
    Form1.Series9.Clear;
    Form1.Series10.Clear;
    Form1.Series11.Clear;
    Form1.Chart1.Title.Text.Clear;
    Form1.Chart1.Title.Font.Color:=clRed;
    Form1.Chart1.Title.Text.Add('Calculating...');
    Form1.Chart1.Repaint;
    Form1.Chart2.Repaint;
    tTime:=0;
    flow:=0;
    timeCount:=0;
    tTimeSecond:=0;
    maxCount:=0;
    averageTime:=1;   // Set Average time (1 is default)
    moveTime:=0;
    flowEverage:=0;
    maxFlow:=0;
    usedFilament:=0;
    retract:=false;
    filTypeFound:=false;
    extruderFound:=false;
    filNameFound:=false;

    // Use Klipper Estimator Script / Read data / Calculate Averages
    klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+appPath+'\klipper_estimator.exe --config_file '+appPath+'\config.json dump-moves '+appPath+'\tempOutput'+' > '+appPath+'\gcode.txt';
    ExecNewProcess(klipperEstCom,true);
    Assignfile (GCode_IN, appPath+'\gcode.txt');
    Reset (GCode_IN);
    WHILE NOT EOF(GCode_IN) DO BEGIN
      Readln (GCode_IN, Lines);
      if copy(Lines,1,8)='    Flow' then begin
        if pos('(', Lines)<>0 then begin
          Lines:=copy(Lines, pos('(',Lines)+1, length(Lines));
          Lines:=copy(Lines, 1, length(Lines)-1);
          if pos('-',Lines)<>0 then begin
            flow:=0;
            retract:=true;
          end else begin
            if retract=true then begin
              retract:=false;
              flow:=0;
            end else begin
              if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
              flow:=StrToFloat(Lines);
            end;
          end;
        end else flow:=0;
      end else if copy(Lines,1,8)='    Time' then begin
        Lines:=copy(Lines, pos('=',Lines)+2, length(Lines));
        if floatLocalFormat=',' then Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        moveTime:=StrToFloat(Lines);
        if tTime>0 then Form1.Series8.AddXY(tTime, flow);
        tTime:=tTime+moveTime;
        Form1.Series3.AddXY(tTime, flow);
        if flow>maxCount then maxCount:=flow;
        usedFilament:=usedFilament+((moveTime*flow)/(Pi *Sqr(0.875)));
        Form1.Series6.AddXY(tTimeSecond, usedFilament);
        // Calculate average Flow
        while ((timeCount>averageTime)or(moveTime>0)) do begin
          if timeCount+moveTime>=averageTime then begin
            flowEverage:=((flowEverage*timeCount)/averageTime) + (flow*(averageTime-timeCount)/averageTime) ;
            moveTime:=moveTime-(averageTime-timeCount) ;
            timeCount:=0;
            if flow>maxFlow then maxFlow:= flow;
            Form1.Series7.AddXY(tTimeSecond, usedFilament);
            Form1.Series2.AddXY(tTimeSecond, maxFlow);
            Form1.Series1.AddXY(tTimeSecond, flowEverage);
            tTimeSecond:=tTimeSecond+averageTime;
            maxFlow:=0;
          end else begin
            flowEverage:=((flowEverage*timeCount)/(timeCount+moveTime)) + ((flow*moveTime)/(timeCount+moveTime)) ;
            if flow>maxFlow then maxFlow:=flow;
            timeCount:=timeCount+moveTime;
            moveTime:=0 ;
          end;
        end;
      end;
    END;
    CloseFile(GCode_IN);

    // If Extruder Name Found in G-Code
    if Form1.FDTableEXTRUDER.RecordCount>0 then begin
      Form1.FDTableEXTRUDER.First;
      while not Form1.FDTableEXTRUDER.EOF do begin
        if printerName=Form1.FDTableEXTRUDER['EXTRUDER_NAME'] then begin
          Bookmark := Form1.FDTableEXTRUDER.GetBookmark;
          extruderFound:=true;
        end;
        Form1.FDTableEXTRUDER.Next;
      end;
      if extruderFound then  Form1.FDTableEXTRUDER.Bookmark := Bookmark else Form1.FDTableEXTRUDER.First;
      Form1.DBLookupComboBox1Click(Nil);
    end;

    // If Filament Type Found in G-Code
    findIndex:=0;
    i:=-1;
    WHILE i<form1.ComboBox1.GetCount-1  Do begin
      i:=i+1;
      form1.ComboBox1.ItemIndex:=i;
      if filamentType=form1.ComboBox1.Text then begin
        findIndex:=i;
        filTypeFound:=true;
      end;
    end;
    if filTypeFound then form1.ComboBox1.ItemIndex:=findIndex else form1.ComboBox1.ItemIndex:=0;
    Form1.ComboBox1Change(Nil);
    Form1.ComboBox1.Repaint;
    Form1.ComboBox2.Repaint;

    // If Filament Name Found in G-Code
    if Form1.FDTableFILAMENT.RecordCount>0 then begin
      findIndex:=0;
      i:=0;
      Form1.FDTableFILAMENT.DisableControls;
      Form1.FDTableFILAMENT.First;
      while not Form1.FDTableFILAMENT.EOF do begin
        i:=i+1;
        if filamentName=Form1.FDTableFILAMENT['FILAMENT_NAME'] then begin
          findIndex:=i;
          filNameFound:=true;
        end;
        Form1.FDTableFILAMENT.Next;
      end;
      Form1.FDTableFILAMENT.EnableControls;
      if filNameFound then Form1.ComboBox2.ItemIndex:=findIndex-1 else Form1.ComboBox2.ItemIndex:=0;
      Form1.ComboBox2Change(Nil);
    end;

    // Show Informations In the Interface
    Try
      Form1.Chart1.BottomAxis.Maximum:=tTime;
      Form1.Chart1.LeftAxis.Maximum:=round(maxCount)+1;
    Except
      // Do Nothing
    End;
    d:=Trunc(tTime/86400);
    h:=Trunc((tTime-(d*86400))/3600);
    m:=Trunc((tTime-(h*3600))/60);
    s:=Trunc(tTime-(h*3600)-(m*60));
    Form1.Label4.Caption:='';
    if d>0 then Form1.Label4.Caption:=inttostr(d)+'d ';
    if h>0 then Form1.Label4.Caption:=Form1.Label4.Caption+inttostr(h)+'h ';
    if m>0 then Form1.Label4.Caption:=Form1.Label4.Caption+inttostr(m)+'m ';
    if s>0 then Form1.Label4.Caption:=Form1.Label4.Caption+inttostr(s)+'s';
    Form1.Label19.Caption:=floattostr(round(maxCount*10)/10);
    Form1.BitBtn5.Enabled:=true;
    //Form1.BitBtn4.Enabled:=true;
  end else begin
    Form1.Series1.Clear;
    Form1.Series2.Clear;
    Form1.Series3.Clear;
    Form1.Series4.Clear;
    Form1.Series5.Clear;
    Form1.Series6.Clear;
    Form1.Series7.Clear;
    Form1.Series8.Clear;
    Form1.Series9.Clear;
    Form1.Series10.Clear;
    Form1.Series11.Clear;
  end;
  Form1.Chart1.Title.Text.Clear;
  Form1.Chart1.Title.Font.Color:=clNavy;
  Form1.Chart1.Title.Text.Add('- Slicer G-Code -');
end;


// Generate Button Click                                                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  readOriginalGcode;
  if not canProcess then Exit;
  if (filTypeFound and extruderFound and filNameFound) then begin                                                                                 /////////////////////////////////////////////////
    calculateAverages;
    generateTempOutput;
  end else showmessage('Used Filament and Extruder in the G-Code file are not found ! choose your settings and click on the Refresh and generate button');
end;


// Refresh Button Click                                                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  if file_path<>'' then begin
    Form1.BitBtn2.Enabled:=false;
    canProcess:=true;
    calculateAverages;
  end;
end;


// Re-Generate Button Click                                             //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  if canProcess then begin
    generateTempOutput;
  end;
end;


// Refresh Filament list                                                //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure refreshList();
begin
  Bookmark := Form1.FDTableFILAMENT.GetBookmark;
  Form1.ComboBox2.Items.Clear;
  try
    Form1.FDTableFILAMENT.DisableControls;
    try
      Form1.FDTableFILAMENT.First;
      while not Form1.FDTableFILAMENT.EOF do
      begin
        Form1.ComboBox2.Items.Add(Form1.FDTableFILAMENT['FILAMENT_NAME']);
        Form1.FDTableFILAMENT.Next;
      end;
    finally
      Form1.FDTableFILAMENT.EnableControls;
    end
  finally
    Form1.FDTableFILAMENT.Bookmark := Bookmark;
  end;
  Form1.ComboBox2.ItemIndex:=Form1.FDTableFILAMENT.RecNo-1;
end;

// Change Filament                                                      //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.ComboBox2Change(Sender: TObject);
Var
  i : integer;
begin
  Form1.FDTableFILAMENT.First;
  for i:=1 to Form1.ComboBox2.ItemIndex do Form1.FDTableFILAMENT.Next;
  Form1.UpDown3.Position:=Form1.FDTableFILAMENT['HEIGHT_TEMP'];
  Form1.UpDown2.Position:=Form1.FDTableFILAMENT['MID_TEMP'];
  Form1.UpDown1.Position:=Form1.FDTableFILAMENT['LOW_TEMP'];
  Form1.UpDown6.Position:=Form1.FDTableFILAMENT['HEIGHT_FLOW'];
  Form1.UpDown5.Position:=Form1.FDTableFILAMENT['MID_FLOW'];
  Form1.UpDown4.Position:=Form1.FDTableFILAMENT['LOW_FLOW'];
  if Form1.FDTableFILAMENT['ADJUST_PA'] then form1.CheckBox7.Checked:=true else form1.CheckBox7.Checked:=false;
  Form1.Edit13.Text:=Form1.FDTableFILAMENT['HEIGHT_PA'];
  Form1.Edit12.Text:=Form1.FDTableFILAMENT['MID_PA'];
  Form1.Edit10.Text:=Form1.FDTableFILAMENT['LOW_PA'];
  Form1.TrackBar1.Position:=Form1.FDTableFILAMENT['SPEED_QUALITY_OPT'];
end;


// Change Filament Type                                                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if Form1.FDTableEXTRUDER.RecordCount>0 then begin
    Form1.FDTableFILAMENT.Filter := 'EXTRUDER_NAME=' + QuotedStr(Form1.FDTableEXTRUDER['EXTRUDER_NAME'])+' AND FILAMENT_TYPE='+QuotedStr(Form1.ComboBox1.Text);
    Form1.FDTableFILAMENT.Refresh;
    refreshList;
    if Form1.FDTableFILAMENT.RecordCount>0 then begin
      ComboBox2Change(Nil);  // Change Filament
    end else Form1.ComboBox2.Items.Clear;
  end;
end;


// Save Filament Click                                                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image5Click(Sender: TObject);
begin
  Form6.ShowModal;
end;


// Delete Filament Preset                                               ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image4Click(Sender: TObject);
begin
  if ((Form1.FDTableFILAMENT.RecordCount>0) and (MessageDlg('Are you sure you want to delete this Filament preset?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk)) then begin
    Form1.FDTableFILAMENT.Delete;
    Form1.FDTableFILAMENT.Refresh;
    refreshList;
    if Form1.FDTableFILAMENT.RecordCount>0 then begin
      ComboBox1Change(Nil); // Change Filament
    end else Form1.ComboBox2.Items.Clear;
  end;
end;


// Change Printer/Extruder                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.DBLookupComboBox1Click(Sender: TObject);
Var
  printerConfig :textfile;
begin
  if Form1.FDTableEXTRUDER.RecordCount>0 then begin
    Form1.FDTableFILAMENT.Filtered:=false;
    DBLookupComboBox1.KeyValue := Form1.FDTableEXTRUDER['EXTRUDER_NAME'];
    Form1.UpDown7.Position:=Form1.FDTableEXTRUDER['TEMP_RISE'];
    Form1.UpDown8.Position:=Form1.FDTableEXTRUDER['TEMP_RISE_TIME'];
    Form1.UpDown9.Position:=Form1.FDTableEXTRUDER['TEMP_FALL'];
    Form1.UpDown11.Position:=Form1.FDTableEXTRUDER['TEMP_FALL_TIME'];
    Form1.UpDown10.Position:=Form1.FDTableEXTRUDER['A_M_SMOOTH'];
    Form1.Edit17.Text:=Form1.FDTableEXTRUDER['START_MACRO'];
    Form1.Edit16.Text:=Form1.FDTableEXTRUDER['MACRO_EXTRUDER'];
    Form1.FDTableFILAMENT.Filter := 'EXTRUDER_NAME = ' + QuotedStr(Form1.FDTableEXTRUDER['EXTRUDER_NAME'])+' AND FILAMENT_TYPE = '+QuotedStr(Form1.ComboBox1.Text);
    // Rewrite Config.json File
    try
      AssignFile(printerConfig,appPath+'\config.json');
      Rewrite(printerConfig);
      Write (printerConfig , Form1.FDTableEXTRUDER['PRINTER_CONFIG']);
      CloseFile(printerConfig);
    Except
      showmessage('Error, The config.json file could not be edited !');
    end;
    Form1.FDTableFILAMENT.Filtered:=true;
    Form1.FDTableFILAMENT.Active:=true;
    Form1.FDTableFILAMENT.Refresh;
    refreshList;
    if Form1.FDTableFILAMENT.RecordCount>0 then begin
      ComboBox2Change(Self);  // Change Filament
    end else Form1.ComboBox2.Items.Clear;
  end;
end;


// Save Printer/Extruder Click                                          /////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image6Click(Sender: TObject);
begin
  Form5.ShowModal;
end;

// Delete Printer/Extruder Preset With all Filament attached            /////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image7Click(Sender: TObject);
begin
    if ((Form1.FDTableEXTRUDER.RecordCount>0) and (MessageDlg('Are you sure you want to delete this preset and all of its filament presets?', mtConfirmation, [mbOK, mbCancel], 0) = mrOk)) then begin
       if Form1.FDTableFILAMENT.RecordCount>0 then begin
         Form1.FDTableFILAMENT.First;
         while not Form1.FDTableFILAMENT.EOF do Form1.FDTableFILAMENT.Delete;
       end;
      Form1.FDTableEXTRUDER.Delete;
      Form1.FDTableEXTRUDER.Refresh;
      DBLookupComboBox1Click(Self);  // Change Printer/Extruder
    end;
end;


// Save/Print Button Click                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if ParamStr(1)<>'' then begin
    CopyFile(PChar(appPath+'\Output.gcode'), PChar(ParamStr(1)), False);
    Application.Terminate;
  end else if saveDialog1.Execute then begin
    try
      CopyFile(PChar(appPath+'\Output.gcode'), PChar(saveDialog1.FileName), False);
      ShowMessage('Saved File : '+saveDialog1.FileName);
    Except
      ShowMessage('Unable to save gcode file !');
    end;
  end else ShowMessage('Saving the gcode file was cancelled');
end;


// Application Activate                                                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.FormActivate(Sender: TObject);
begin
  // Set initial Parameters
  canProcess:=true;
  Form1.Series3.Visible:=false;
  Form1.Series6.Visible:=false;
  Form1.Series7.Visible:=false;
  Form1.Series11.Visible:=false;
  appPath:=ExtractFileDir(Application.ExeName);
  file_path:='';
  // Furnish the locale format settings record
  formatSettings:=TFormatSettings.Create(LOCALE_USER_DEFAULT);
  floatLocalFormat:=CurrToStrF(1.1, ffCurrency, 1, formatSettings);
  if pos(',', floatLocalFormat)<>0 then floatLocalFormat:=','
  else floatLocalFormat:='.';
  // Read basic Configs in config\config.sdb file
  if FileExists(appPath+'\Config\Config.sdb') then begin
    Form1.FDConnection1.Params.Database:=appPath+'\Config\Config.sdb';
    Form1.FDConnection1.Connected:=true;
  end else begin
    showmessage('Config.sdb File not found in \Config Folder ! This Application will Close !');
    Application.Terminate;
  end;
  Form1.FDTableEXTRUDER.Active:=true;
  Form1.FDTableEXTRUDER.Refresh;
  DBLookupComboBox1Click(Self);  // Change Printer/Extruder

  Form1.Timer1.Enabled:=true;
end;


// TODO When interface resize
procedure TForm1.FormResize(Sender: TObject);
begin
  Form1.Chart2.Height:=form1.Height-form1.Chart2.top-95;
  if Form1.Width>1345 then begin
    Form1.Chart1.Width:=form1.Width-32;
    Form1.Chart2.Width:=form1.Width-32;
    Form1.Image1.Left:=form1.Width-193;
    Form1.Image2.Left:=form1.Width-190;
    Form1.Image3.Left:=form1.Width-60;
    Form1.Label6.Left:=form1.Width-159;
    Form1.Bevel1.Width:=form1.Width-221;
    Form1.Bevel5.Width:=form1.Width-663;
  end else begin
    Form1.Chart1.Width:=1313;
    Form1.Chart2.Width:=1313;
    Form1.Image1.Left:=1152;
    Form1.Image2.Left:=1155;
    Form1.Image3.Left:=1285;
    Form1.Label6.Left:=1186;
    Form1.Bevel1.Width:=1124;
    Form1.Bevel5.Width:=682;
  end;
end;

// Close Application                                                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  // Delete original G-Code File to Cancel Print
  if ParamStr(1)<>'' then
    try
      DeleteFile(file_path);
    Except
    end;
  Application.Terminate;
end;


// Application Show Event                                               ///////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.FormShow(Sender: TObject);
begin
  if ParamStr(1)<>'' then Form3.ShowModal;
end;


// Load G-Code File                                                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if form1.openDialog1.Execute then begin
    file_path:=form1.OpenDialog1.FileName;
    Form1.Edit1.Text:=file_path;
    Form1.BitBtn4.Enabled:=true;
    canProcess:=true;
  end else begin
    Form1.BitBtn4.Enabled:=false;
    file_path:='';
    Form1.Edit1.Text:='None';
    canProcess:=false;
  end;
  Form1.BitBtn5.Enabled:=false;
  Form1.BitBtn7.Enabled:=false;
end;


// Shoose Printer Config File                                           ///////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Form2.ShowModal;
end;


// About Click                                                          //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Image2Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
  Form4.ShowModal;
end;


// Co Fi me Click                                                       ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Label6Click(Sender: TObject);
var
  URL: string;
begin
  URL := 'https://ko-fi.com/sb53system';
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;


// How To Zoom Click                                                    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Label8Click(Sender: TObject);
begin
  Form7.ShowModal;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Form1.Timer1.Enabled:=false;
  if (ParamStr(1)<>'') and canProcess  then begin
    file_path:=ParamStr(1);
    Form1.Edit1.Text:=file_path;
    Form1.BitBtn1.Enabled:=false;
    BitBtn4Click(Self);
  end;
end;

// Get Chart On Mouse Move Coordinate                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////
{
procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  SeriesIndex: Integer;
begin
  SeriesIndex := FindClosestIndex(X,series3);
  if Chart1.ShowHint then begin
    //showmessage('Clicked X='+inttostr(X)+' Index in Series3='+inttostr(SeriesIndex)+' Series3 Count='+inttostr(Series3.Count));
    //Chart1.Hint := 'Temperature='+floattostr(round(Series4.YValues[FindClosestIndex(SeriesIndex,series7)+1]*10)/10)+'S'+' Average Flow='+floattostr(SeriesIndex);
  end;
end;                                                                       }


// Handel User Erors                                                    ////////////////////////////////////////////////////////////////////////////////////////////////////////
procedure TForm1.Edit10Change(Sender: TObject);
begin
  if form1.Edit10.Text='' then form1.Edit10.Text:='0';
end;

procedure TForm1.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',',','.',#8])) then key := #0;
end;

procedure TForm1.Edit11Change(Sender: TObject);
begin
  if form1.Edit11.Text='' then begin
    form1.Edit11.Text:='0';
    form1.UpDown10.Position:=0;
  end;
end;

procedure TForm1.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['}'])) then key := #0;
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['}'])) then key := #0;
end;

procedure TForm1.Edit12Change(Sender: TObject);
begin
  if form1.Edit12.Text='' then form1.Edit12.Text:='0';
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',',','.',#8])) then key := #0;
end;

procedure TForm1.Edit13Change(Sender: TObject);
begin
  if form1.Edit13.Text='' then form1.Edit13.Text:='0';
end;

procedure TForm1.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',',','.',#8])) then key := #0;
end;

procedure TForm1.Edit14Change(Sender: TObject);
begin
  if form1.Edit14.Text='' then begin
    form1.Edit14.Text:='1';
    form1.UpDown9.Position:=1;
  end;
end;

procedure TForm1.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit15Change(Sender: TObject);
begin
  if form1.Edit15.Text='' then begin
    form1.Edit15.Text:='1';
    form1.UpDown11.Position:=1;
  end;
end;

procedure TForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if form1.Edit2.Text='' then begin
    form1.Edit2.Text:='170';
    form1.UpDown1.Position:=170;
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  if form1.Edit3.Text='' then begin
    form1.Edit3.Text:='170';
    form1.UpDown2.Position:=170;
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  if form1.Edit4.Text='' then begin
    form1.Edit4.Text:='170';
    form1.UpDown3.Position:=170;
  end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if form1.Edit5.Text='' then begin
    form1.Edit5.Text:='1';
    form1.UpDown4.Position:=1;
  end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  if form1.Edit6.Text='' then begin
    form1.Edit6.Text:='2';
    form1.UpDown5.Position:=2;
  end;
end;

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
  if form1.Edit7.Text='' then begin
    form1.Edit7.Text:='3';
    form1.UpDown6.Position:=3;
  end;
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;


procedure TForm1.Edit8Change(Sender: TObject);
begin
  if form1.Edit8.Text='' then begin
    form1.Edit8.Text:='1';
    form1.UpDown7.Position:=1;
  end;
end;

procedure TForm1.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;

procedure TForm1.Edit9Change(Sender: TObject);
begin
  if form1.Edit9.Text='' then begin
    form1.Edit9.Text:='1';
    form1.UpDown8.Position:=1;
  end;
end;

procedure TForm1.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then key := #0;
end;


end.
