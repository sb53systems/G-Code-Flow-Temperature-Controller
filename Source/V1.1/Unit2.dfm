object Form2: TForm2
  Left = 276
  Top = 695
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Set Printer Config File'
  ClientHeight = 218
  ClientWidth = 473
  Color = clDimgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object Bevel1: TBevel
    Left = 3
    Top = 72
    Width = 462
    Height = 65
  end
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 182
    Height = 13
    Caption = 'Load file from Printer IP / URL :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 453
    Height = 13
    Caption = 
      'This File (config.json) is required by Klipper Estimator script ' +
      'to get printer config'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 48
    Width = 133
    Height = 13
    Caption = 'Klipper Estimator doc : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 136
    Top = 48
    Width = 325
    Height = 13
    Cursor = crHandPoint
    Caption = ' https://github.com/Annex-Engineering/klipper_estimator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Label5Click
  end
  object Bevel2: TBevel
    Left = 3
    Top = 143
    Width = 462
    Height = 37
  end
  object Label6: TLabel
    Left = 8
    Top = 155
    Width = 115
    Height = 13
    Caption = 'Select a Local File :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 349
    Top = 109
    Width = 112
    Height = 25
    Caption = 'Load from URL'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn3: TBitBtn
    Left = 360
    Top = 186
    Width = 105
    Height = 25
    Caption = 'Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn3Click
  end
  object Edit1: TEdit
    Left = 196
    Top = 85
    Width = 265
    Height = 21
    TabOrder = 2
    Text = 'http://192.168.1.33'
  end
  object Edit2: TEdit
    Left = 178
    Top = 112
    Width = 137
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 150
    Top = 150
    Width = 97
    Height = 25
    Caption = 'Load File'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 114
    Width = 169
    Height = 17
    Caption = 'Use an Authentication key '
    Font.Charset = BALTIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JSON File|*.json'
    Title = 'Select a Printer CONFIG File (.json)'
    Left = 408
  end
end
