unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  XPMan, TeeFunci, ShellAPI, Math, ComCtrls, jpeg;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    StaticText1: TStaticText;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Chart1: TChart;
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
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Bevel3: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    Series4: TLineSeries;
    Bevel4: TBevel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    CheckBox3: TCheckBox;
    Label8: TLabel;
    CheckBox4: TCheckBox;
    Label9: TLabel;
    Series5: TLineSeries;
    BitBtn9: TBitBtn;
    CheckBox5: TCheckBox;
    Label10: TLabel;
    TrackBar1: TTrackBar;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    BitBtn8: TBitBtn;
    StaticText13: TStaticText;
    Edit11: TEdit;
    UpDown10: TUpDown;
    Label2: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Series6: TLineSeries;
    SaveDialog1: TSaveDialog;
    CheckBox6: TCheckBox;
    Series7: TLineSeries;
    Timer1: TTimer;
    Image1: TImage;
    Label5: TLabel;
    Label13: TLabel;
    BitBtn5: TBitBtn;
    ComboBox1: TComboBox;
    Bevel2: TBevel;
    Bevel5: TBevel;
    StaticText10: TStaticText;
    Label14: TLabel;
    Label15: TLabel;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Series8: TLineSeries;
    Image2: TImage;
    BitBtn7: TBitBtn;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  GCode_IN, GCode_OUT, ConfigFile : textfile;
  file_path, Lines : string;
  Filament_count, print_time : single;
  averageTime, timerCount: integer;
  gcodeProcces, gcodeGenerate, canProcess: bool;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}



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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if form1.openDialog1.Execute then begin
    file_path:=form1.OpenDialog1.FileName;
    Form1.Edit1.Text:=file_path;
    Form1.BitBtn4.Enabled:=true;
  end else begin
    Form1.BitBtn4.Enabled:=false;
    file_path:='';
    Form1.Edit1.Text:='None';
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TForm1.BitBtn4Click(Sender: TObject);
var
  klipperEstCom : string;
  tTime, tTimeSecond, timeCount, moveTime, flowEverage, flow, maxFlow, usedFilament, maxCount : double;
  retract : bool;
  m, h, s : integer;
begin
  // check if config.json and gcode File exist
  if FileExists(file_path)=false then begin
    canProcess:= false;
    showmessage('GCODE File not found !');
  end else if FileExists(ExtractFileDir(Application.ExeName)+'\config.json')=false then begin
    canProcess:= false;
    Form2.ShowModal;
  end;
  if canProcess=false then Exit;
  form1.BitBtn4.Enabled:=false;
  IF FileExists (file_path) <> True THEN Exit else begin
    klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+ExtractFileDir(Application.ExeName)+'\klipper_estimator.exe --config_file '+ExtractFileDir(Application.ExeName)+'\config.json dump-moves '+file_path+' > '+ExtractFileDir(Application.ExeName)+'\gcode.txt';
    ExecNewProcess(klipperEstCom,true);
    Assignfile (GCode_IN, ExtractFileDir(Application.ExeName)+'\gcode.txt');
    Reset (GCode_IN);
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
    Series1.Clear;
    Series2.Clear;
    Series3.Clear;
    Series6.Clear;
    Series7.Clear;
    Series8.Clear;
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
              Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
              flow:=StrToFloat(Lines);
            end;
          end;
        end else flow:=0;
      end else if copy(Lines,1,8)='    Time' then begin
        Lines:=copy(Lines, pos('=',Lines)+2, length(Lines));
        Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
        moveTime:=StrToFloat(Lines);
        if tTime>0 then Series8.AddXY(tTime, flow);
        tTime:=tTime+moveTime;
        Series3.AddXY(tTime, flow);
        if flow>maxCount then maxCount:=flow;
        usedFilament:=usedFilament+((moveTime*flow)/(Pi *Sqr(0.875)));
        Series6.AddXY(tTimeSecond, usedFilament);
        // Calculate average Flow
        while ((timeCount>averageTime)or(moveTime>0)) do begin
          if timeCount+moveTime>=averageTime then begin
            flowEverage:=((flowEverage*timeCount)/averageTime) + (flow*(averageTime-timeCount)/averageTime) ;
            moveTime:=moveTime-(averageTime-timeCount) ;
            timeCount:=0;
            if flow>maxFlow then maxFlow:= flow;
            Series7.AddXY(tTimeSecond, usedFilament);
            Series2.AddXY(tTimeSecond, maxFlow);
            Series1.AddXY(tTimeSecond, flowEverage);
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
    Form1.Chart1.BottomAxis.Maximum:=tTime;
    h:=Trunc(tTime/3600);
    m:=Trunc((tTime-(h*3600))/60);
    s:=Trunc(tTime-(h*3600)-(m*60));
    Form1.Label4.Caption:=inttostr(h)+'h'+inttostr(m)+'m'+inttostr(s)+'s';
    Form1.Label12.Caption:=floattostr(round(usedFilament)/1000)+' Meters';
    CloseFile(GCode_IN);
    // Found Filament Type in GCODE
    Assignfile (GCode_IN, file_path);
    Reset (GCode_IN);
    WHILE NOT EOF(GCode_IN) DO BEGIN
      Readln (GCode_IN, Lines);
      if copy(Lines,1,17)='; filament_type =' then begin
        Lines:=copy(Lines,19,length(Lines));
        if Lines='PETG' then form1.ComboBox1.ItemIndex:=0
          else if Lines='ABS' then form1.ComboBox1.ItemIndex:=1
          else if Lines='PLA' then form1.ComboBox1.ItemIndex:=2
          else if Lines='TPU' then form1.ComboBox1.ItemIndex:=3
          else showmessage('Filament Type Not Found !');
        ComboBox1Change(Self);
      end;
    end;
    CloseFile(GCode_IN);
    gcodeProcces:=true;
    Chart1.LeftAxis.Maximum:=round(maxCount)+1;
    BitBtn9Click(Self);  // Call refrech view onClick event
  end;
  form1.BitBtn4.Enabled:=true;
  Form1.BitBtn9.Enabled:=true;
  Form1.BitBtn8.Enabled:=true;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if form1.CheckBox1.Checked then series1.LinePen.Visible:=true else series1.LinePen.Visible:=false;
  Chart1.Repaint;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
var
  i:integer;
  actTemp, edialTemp, calcValue, tempByflow, tempByTime, maxCount, minCount : double;
begin
  if gcodeProcces=false then Exit;
  maxCount:=0;
  minCount:=0;
  Series4.Clear;
  Series5.Clear;
  // Average/Max flow Estimation
  For i:=0 to (series1.Count*averageTime)-averageTime do begin
    calcValue:=((Series1.YValues[i]*trackbar1.Position)/10)+((Series2.YValues[i]*(10-trackbar1.Position))/10);
    Series5.AddXY(i*averageTime, calcValue );
  end;
  Series5.AddXY(Chart1.BottomAxis.Maximum, calcValue);
  SmoothSeries(Series5, updown10.Position);
  // Temperature Estimation
  For i:=0 to (series5.Count*averageTime)-averageTime do begin
    if Series5.YValues[i]>strtofloat(edit6.text) then begin
      tempByflow:=((strtofloat(edit4.Text)-strtofloat(edit3.Text))/(strtofloat(edit7.Text)-strtofloat(edit6.Text)));
      edialTemp:=strtofloat(edit3.Text)+((Series5.YValues[i]-strtofloat(edit6.Text))*tempByflow);
    end else begin
      tempByflow:=((strtofloat(edit3.Text)-strtofloat(edit2.Text))/(strtofloat(edit6.Text)-strtofloat(edit5.Text)));
      edialTemp:=strtofloat(edit3.Text)-((strtofloat(edit6.Text)-Series5.YValues[i])*tempByflow);
    end;
    if i=0 then begin
      actTemp:=edialTemp;
      minCount:=actTemp;
      maxCount:=actTemp;
    end;
    tempByTime:=strtofloat(edit8.Text)/strtofloat(edit9.Text);
    if edialTemp>actTemp then begin
      if edialTemp>(actTemp+tempByTime) then actTemp:=actTemp+tempByTime else actTemp:=edialTemp;
    end else if edialTemp<actTemp then begin
      if edialTemp<(actTemp-tempByTime) then actTemp:=actTemp-tempByTime else actTemp:=edialTemp;
    end else actTemp:=edialTemp;
    Series4.AddXY(i*averageTime, actTemp );
    if actTemp<minCount then minCount:=actTemp;
    if actTemp>maxCount then maxCount:=actTemp;
  end;
  Series4.AddXY(Chart1.BottomAxis.Maximum, actTemp);
  Chart1.RightAxis.Minimum:=round(minCount)-1;
  Chart1.RightAxis.Maximum:=round(maxCount)+1;
  Chart1.Repaint;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if form1.CheckBox3.Checked then series8.LinePen.Visible:=true else series8.LinePen.Visible:=false;
  Chart1.Repaint;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if form1.CheckBox2.Checked then series2.LinePen.Visible:=true else series2.LinePen.Visible:=false;
  Chart1.Repaint;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if form1.CheckBox5.Checked then series5.LinePen.Visible:=true else series5.LinePen.Visible:=false;
  Chart1.Repaint;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if form1.CheckBox4.Checked then series4.LinePen.Visible:=true else series4.LinePen.Visible:=false;
  Chart1.Repaint;
end;

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

procedure TForm1.BitBtn8Click(Sender: TObject);
Var
  totFilCount, gcodeFreq, curFreq, recFreq, tempByPA, curPA, recPA, recFlow, tempByflow, moveFlowRate, sectionArea, layerHeight, lineWidth : double;
  curTemp, getTemp, moveFilCount : string;
  tempOutFile :textfile;
  retract : bool;
  gcodeMovesCount: integer;
begin
  if gcodeProcces=false then Exit;
  Form1.BitBtn8.Enabled:=false;
  Form1.Label1.Font.Color:=clRed ;
  Form1.Label1.Caption:='Estimating';
  Assignfile (GCode_IN, file_path);
  totFilCount:=0;
  gcodeFreq:=0;
  curFreq:=0;
  curPA:=0;
  gcodeMovesCount:=0;
  retract:=false;
  AssignFile(tempOutFile,ExtractFileDir(Application.ExeName)+'\tempOut.gcode');
  Rewrite(tempOutFile);
  Reset (GCode_IN);
  WHILE NOT EOF(GCode_IN) DO BEGIN
    Readln (GCode_IN, Lines);
    if copy(Lines,1,12)='PRINT_START ' then begin
      curTemp:=floattostr((round(Series4.YValues[0]*10))/10);
      curTemp:=StringReplace(curTemp, ',', '.', [rfReplaceAll]);
      WriteLn (tempOutFile , (copy(Lines,1,pos('extruder=',Lines)+8))+curTemp+copy(Lines,pos('extruder=',Lines)+12,Length(Lines)) );
    end else if copy(Lines,1,4)='G1 F' then begin
      WriteLn (tempOutFile , Lines);
      Lines:=copy(Lines,5,length(Lines));
      Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
      gcodeFreq:=strtofloat(Lines);
    end else if copy(Lines,1,7)=';WIDTH:' then begin
      WriteLn (tempOutFile , Lines);
      Lines:=copy(Lines,8,length(Lines));
      Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
      lineWidth:=strtofloat(Lines);
    end else if copy(Lines,1,8)=';HEIGHT:' then begin
      WriteLn (tempOutFile , Lines);
      Lines:=copy(Lines,9,length(Lines));
      Lines:=StringReplace(Lines, '.', ',', [rfReplaceAll]);
      layerHeight:=strtofloat(Lines);
    end else if copy(Lines,1,3)='G1 ' then begin
      if (copy(Lines,1,4)<>'G1 F') then gcodeMovesCount:=gcodeMovesCount+1;

      // Temperature change
      if totFilCount>0 then
        Try
          getTemp:=floattostr(round(Series4.YValues[FindClosestIndex(totFilCount,series7)]*10)/10);
          getTemp:=StringReplace(getTemp, ',', '.', [rfReplaceAll]);
          if getTemp<>curTemp then begin
            curTemp:=getTemp;
            WriteLn (tempOutFile , 'M104 S'+curTemp);
          end;
        Except
          //Esception
        end;

      // Calculate requested Flow and PA / Temperature
      curTemp:=StringReplace(curTemp, '.', ',', [rfReplaceAll]);
      if strtofloat(curTemp)>strtofloat(edit3.text) then begin
        tempByflow:=((strtofloat(edit4.Text)-strtofloat(edit3.Text))/(strtofloat(edit7.Text)-strtofloat(edit6.Text)));
        recFlow:=strtofloat(edit6.Text)+((strtofloat(curTemp)-strtofloat(edit3.Text))/tempByflow);
        tempByPA:=((strtofloat(edit4.Text)-strtofloat(edit3.Text))/(strtofloat(StringReplace(edit13.Text, '.', ',', [rfReplaceAll]))-strtofloat(StringReplace(edit12.Text, '.', ',', [rfReplaceAll]))));
        recPA:=strtofloat(StringReplace(edit12.Text, '.', ',', [rfReplaceAll]))+((strtofloat(curTemp)-strtofloat(edit3.Text))/tempByPA);
      end else begin
        tempByflow:=((strtofloat(edit3.Text)-strtofloat(edit2.Text))/(strtofloat(edit6.Text)-strtofloat(edit5.Text)));
        recFlow:=strtofloat(edit6.Text)-((strtofloat(edit3.Text)-strtofloat(curTemp))/tempByflow);
        tempByPA:=((strtofloat(edit3.Text)-strtofloat(edit2.Text))/(strtofloat(StringReplace(edit12.Text, '.', ',', [rfReplaceAll]))-strtofloat(StringReplace(edit10.Text, '.', ',', [rfReplaceAll]))));
        recPA:=strtofloat(StringReplace(edit12.Text, '.', ',', [rfReplaceAll]))-((strtofloat(edit3.Text)-strtofloat(curTemp))/tempByPA);
      end;
      recPA:=round(recPA*1000)/1000;
      curTemp:=StringReplace(curTemp, ',', '.', [rfReplaceAll]);

      // Set new PA Value
      if curPA<>recPA then begin
        curPA:=recPA;
        WriteLn (tempOutFile , 'SET_PRESSURE_ADVANCE ADVANCE='+StringReplace(floattostr(curPA), ',', '.', [rfReplaceAll]));
      end;

      // Frequance change
      if (pos('E', Lines)<>0) and form1.CheckBox6.Checked then begin
        moveFilCount:=copy(Lines, pos('E',Lines)+1, length(Lines));
        if pos(' ', moveFilCount)<>0 then moveFilCount:=copy(moveFilCount,1,pos(' ', moveFilCount)-1);
        moveFilCount:=StringReplace(moveFilCount, '.', ',', [rfReplaceAll]);
        if moveFilCount[1]='-' then retract:=true else
          if retract=true then retract:=false else begin
            try
              if moveFilCount[1]=',' then  moveFilCount:='0'+moveFilCount;
              moveFlowRate:=Series3.YValues[gcodeMovesCount-1];
              if (recFlow>0) then begin
                sectionArea := layerHeight * lineWidth;
                recFreq := round( 60 *(recFlow / sectionArea));
                if recFreq>gcodeFreq then recFreq:=gcodeFreq;
                WriteLn (tempOutFile , 'G1 F'+StringReplace(floattostr(recFreq), ',', '.', [rfReplaceAll]));
                //if curFreq<>recFreq then begin
                //   curFreq:=recFreq;
                //   WriteLn (tempOutFile , 'G1 F'+StringReplace(floattostr(curFreq), ',', '.', [rfReplaceAll]));
                //end;
              end else WriteLn (tempOutFile , 'G1 F'+StringReplace(floattostr(gcodeFreq), ',', '.', [rfReplaceAll]));
            Except
            end;
            totFilCount:=totFilCount+strtofloat(moveFilCount);
          end;
      end;
      WriteLn (tempOutFile , Lines);
    end else WriteLn (tempOutFile , Lines);
  END;
  CloseFile(GCode_IN);
  CloseFile(tempOutFile);
  Timer1.Enabled:=true;
  gcodeGenerate:=true;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if gcodeGenerate=false then Exit;
  if ParamStr(1)<>'' then begin
    CopyFile(PChar(ExtractFileDir(Application.ExeName)+'\tempOut.gcode'), PChar(ParamStr(1)), False);
    Application.Terminate;
  end else if saveDialog1.Execute then begin
    try
      CopyFile(PChar(ExtractFileDir(Application.ExeName)+'\tempOut.gcode'), PChar(saveDialog1.FileName), False);
      ShowMessage('File Save : '+saveDialog1.FileName);
      Application.Terminate;
    Except
      ShowMessage('unable to save gcode file !');
    end;
  end else ShowMessage('Save file was cancelled');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  gcodeProcces:=false;
  gcodeGenerate:=false;
  file_path:='';
  timerCount:=0;
  // Read basic Configs in config.txt file
  IF FileExists (ExtractFileDir(Application.ExeName)+'\config.txt') <> True THEN begin
    showmessage('Config File Not Found in main directory ! This Application will be Closed !');
    Application.Terminate;
  end else begin
    Assignfile (ConfigFile, ExtractFileDir(Application.ExeName)+'\config.txt');
    Reset (ConfigFile);
    WHILE NOT EOF(ConfigFile) DO BEGIN
      Readln (ConfigFile, Lines);
      if copy(Lines,1,12)='Temp_Change:' then Form1.Edit8.Text:=copy(Lines,13,length(Lines));
      if copy(Lines,1,10)='Temp_Time:' then Form1.Edit9.Text:=copy(Lines,11,length(Lines));
      if copy(Lines,1,19)='Average_Max_Smooth:' then Form1.Edit11.Text:=copy(Lines,20,length(Lines));
      if copy(Lines,1,20)='Speed_Quality_Optem:' then Form1.TrackBar1.Position:=strtoint(copy(Lines,21,length(Lines)));
    end;
    CloseFile(ConfigFile);
  end;
  if ParamStr(1)<>'' then begin
    file_path:=ParamStr(1);
    Form1.Edit1.Text:=file_path;
    Form1.BitBtn1.Enabled:=false;
    BitBtn4Click(Self);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
Var
  klipperEstCom: string;
  hnd: integer;
begin
  if timerCount=0 then begin
    klipperEstCom:=GetEnvironmentVariable('WINDIR')+'\System32\cmd.exe /C '+ExtractFileDir(Application.ExeName)+'\klipper_estimator.exe --config_file '+ExtractFileDir(Application.ExeName)+'\config.json estimate '+ExtractFileDir(Application.ExeName)+'\tempOut.gcode'+' > '+ExtractFileDir(Application.ExeName)+'\gcode.txt';
    ExecNewProcess(klipperEstCom,false);
    timerCount:=1;
  end else if timerCount=1 then begin
    timerCount:=2;
  end else if timerCount=2 then begin
    // Close 'c:\windows\system32\cmd.exe' estimate process of klipper estimator After 2 Second
    hnd:=FindWindow(nil, PChar(GetEnvironmentVariable('WINDIR')+'\system32\cmd.exe'));
    //if hnd = 0 then Application.messageBox('Warning! Sender application not found.', 'Sender not found', idok);
    try
    if not postmessage(hnd, WM_CLOSE, 0, 0) then
      Application.messageBox('Warning! Sender application did not close.', 'Sender did not close', idok);
    except
    end;
    timerCount:=3;
  end else if timerCount=3 then begin
    // Open TempOut.txt and read the estimated time
    Assignfile (GCode_IN, ExtractFileDir(Application.ExeName)+'\gcode.txt');
    Reset (GCode_IN);
    WHILE NOT EOF(GCode_IN) DO BEGIN
      Readln (GCode_IN, Lines);
      if copy(Lines,1,9)='  Minimal' then begin
        Lines:=copy(Lines,32,length(Lines));
        Form1.Label1.Caption:=copy(Lines,1,Pos('(',Lines)-2);
        Form1.Label1.Font.Color:=clBlue ;
      end;
    END;
    CloseFile(GCode_IN);
    timerCount:=0;
    Timer1.Enabled:=false;
    Form1.BitBtn2.Enabled:=true;
    Form1.BitBtn8.Enabled:=true;
  end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  canProcess:=true;
  if ParamStr(1)<>'' then Form3.ShowModal;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  typeFound : bool;
  FilType : string;
begin
  IF FileExists (ExtractFileDir(Application.ExeName)+'\config.txt') <> True THEN begin
    showmessage('Config File Not Found in main directory ! This Application will be Closed !');
    Application.Terminate;
  end else begin
    typeFound:=false;
    Reset (ConfigFile);
    WHILE NOT EOF(ConfigFile) DO BEGIN
      Readln (ConfigFile, Lines);
      case (form1.ComboBox1.ItemIndex) of
        0 : FilType := 'PETG';
        1 : FilType := 'ABS';
        2 : FilType := 'PLA';
        3 : FilType := 'TPU';
      end;
      if Lines=('Filament_Type:'+FilType) then typeFound:=true;
      if ((copy(Lines,1,9)='Low_Temp:')and(typeFound=true)) then
        Form1.Edit2.Text:=copy(Lines,10,length(Lines));
      if ((copy(Lines,1,9)='Mid_Temp:')and(typeFound=true)) then
        Form1.Edit3.Text:=copy(Lines,10,length(Lines));
      if ((copy(Lines,1,11)='Hight_Temp:')and(typeFound=true)) then
        Form1.Edit4.Text:=copy(Lines,12,length(Lines));
      if ((copy(Lines,1,9)='Low_Flow:')and(typeFound=true)) then
        Form1.Edit5.Text:=copy(Lines,10,length(Lines));
      if ((copy(Lines,1,9)='Mid_Flow:')and(typeFound=true)) then
        Form1.Edit6.Text:=copy(Lines,10,length(Lines));
      if ((copy(Lines,1,11)='Hight_Flow:')and(typeFound=true)) then
        Form1.Edit7.Text:=copy(Lines,12,length(Lines));
      if ((copy(Lines,1,7)='Low_PA:')and(typeFound=true)) then
        Form1.Edit10.Text:=copy(Lines,8,length(Lines));
      if ((copy(Lines,1,7)='Mid_PA:')and(typeFound=true)) then
        Form1.Edit12.Text:=copy(Lines,8,length(Lines));
      if ((copy(Lines,1,9)='Hight_PA:')and(typeFound=true)) then begin
        Form1.Edit13.Text:=copy(Lines,10,length(Lines));
        typeFound:=false;
      end;
    end;
    CloseFile(ConfigFile);
  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
  typeFound : bool;
  FilType : string;
  sl: TStringList;
  i: Integer;
begin
  IF FileExists (ExtractFileDir(Application.ExeName)+'\config.txt') <> True THEN begin
    showmessage('Config File Not Found in main directory !');
  end else begin
    typeFound:=false;
    case (form1.ComboBox1.ItemIndex) of
      0 : FilType := 'PETG';
      1 : FilType := 'ABS';
      2 : FilType := 'PLA';
      3 : FilType := 'TPU';
    else
      FilType := 'None';
    end;
    sl := TStringList.Create;
    try
      sl.LoadFromFile(ExtractFileDir(Application.ExeName)+'\config.txt');
      for i := 0 to sl.Count-1 do begin
        if Pos('Temp_Change:', sl[i])<>0 then
          sl[i]:='Temp_Change:'+Form1.Edit8.Text;
        if Pos('Temp_Time:', sl[i])<>0 then
          sl[i]:='Temp_Time:'+Form1.Edit9.Text;
        if Pos('Average_Max_Smooth:', sl[i])<>0 then
          sl[i]:='Average_Max_Smooth:'+Form1.Edit11.Text;
        if Pos('Speed_Quality_Optem:', sl[i])<>0 then
          sl[i]:='Speed_Quality_Optem:'+inttostr(Form1.TrackBar1.Position);
        if Pos('Filament_Type:'+FilType, sl[i])<>0 then
          typeFound:=true;
        if ((Pos('Low_Temp:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Low_Temp:'+Form1.Edit2.Text;
        if ((Pos('Mid_Temp:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Mid_Temp:'+Form1.Edit3.Text;
        if ((Pos('Hight_Temp:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Hight_Temp:'+Form1.Edit4.Text;
        if ((Pos('Low_Flow:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Low_Flow:'+Form1.Edit5.Text;
        if ((Pos('Mid_Flow:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Mid_Flow:'+Form1.Edit6.Text;
        if ((Pos('Hight_Flow:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Hight_Flow:'+Form1.Edit7.Text;
        if ((Pos('Low_PA:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Low_PA:'+Form1.Edit10.Text;
        if ((Pos('Mid_PA:', sl[i])<>0)and(typeFound=true)) then
          sl[i]:='Mid_PA:'+Form1.Edit12.Text;
        if ((Pos('Hight_PA:', sl[i])<>0)and(typeFound=true)) then begin
          sl[i]:='Hight_PA:'+Form1.Edit13.Text;
          typeFound:=false;
        end;
        sl.SaveToFile(ExtractFileDir(Application.ExeName)+'\config.txt');
      end;
    finally
      sl.Free;
      showmessage('Config File Saved.');
    end;
  end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  showmessage('Use this Email sb53systems@gmail.com to Manualy Tip me in PayPal. Thank You !');
end;

end.
