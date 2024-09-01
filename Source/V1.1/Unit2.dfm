object Form2: TForm2
  Left = 276
  Top = 695
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Set Printer Config File'
  ClientHeight = 155
  ClientWidth = 475
  Color = clDimgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 62
    Height = 13
    Caption = 'Printer IP :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 320
    Top = 88
    Width = 12
    Height = 13
    Caption = 'or'
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
  object BitBtn1: TBitBtn
    Left = 200
    Top = 84
    Width = 97
    Height = 25
    Caption = 'Load from IP'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 72
    Top = 84
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '192.168.1.33'
  end
  object BitBtn2: TBitBtn
    Left = 360
    Top = 84
    Width = 105
    Height = 25
    Caption = 'Load File'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 360
    Top = 120
    Width = 105
    Height = 25
    Caption = 'Close'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JSON File|*.json'
    Title = 'Select a Printer CONFIG File (.json)'
    Left = 8
    Top = 56
  end
end
