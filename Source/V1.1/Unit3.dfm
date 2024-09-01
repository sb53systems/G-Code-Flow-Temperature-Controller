object Form3: TForm3
  Left = 203
  Top = 767
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SB53 G-Code Flow/Temperature Controller'
  ClientHeight = 106
  ClientWidth = 646
  Color = clDimgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object StaticText1: TStaticText
    Left = 40
    Top = 24
    Width = 561
    Height = 23
    Caption = 
      'Would you like to use the SB53 G-Code Flow/Temperature Controlle' +
      'r ?'
    Font.Charset = BALTIC_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Yes'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 368
    Top = 64
    Width = 75
    Height = 25
    Caption = 'No'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
