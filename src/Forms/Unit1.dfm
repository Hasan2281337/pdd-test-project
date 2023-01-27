object DB_Results: TDB_Results
  Left = 0
  Top = 0
  Caption = 'DB_Results'
  ClientHeight = 339
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 408
    Top = 256
    Width = 75
    Height = 25
    Caption = 'close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 492
    Height = 169
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.ADOQuery1
    Left = 344
    Top = 256
  end
end
