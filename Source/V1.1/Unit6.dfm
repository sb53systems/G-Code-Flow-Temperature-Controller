object Form6: TForm6
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Save Filament'
  ClientHeight = 121
  ClientWidth = 480
  Color = clDimgray
  Font.Charset = TURKISH_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 15
  object Label3: TLabel
    Left = 16
    Top = 16
    Width = 139
    Height = 19
    Caption = 'Save Filament as :'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 464
    Height = 23
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Save'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 368
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
