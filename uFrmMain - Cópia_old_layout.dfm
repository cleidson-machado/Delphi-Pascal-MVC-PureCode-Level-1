object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 357
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 16
    Top = 57
    Width = 178
    Height = 23
    Caption = 'SEARCH by NAME:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbGridBase: TDBGrid
    Left = 0
    Top = 231
    Width = 689
    Height = 126
    Align = alBottom
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnExample_1: TButton
    Left = 10
    Top = 16
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_1'
    TabOrder = 1
    OnClick = btnExample_1Click
  end
  object mmoBase: TMemo
    Left = 0
    Top = 135
    Width = 689
    Height = 96
    Align = alBottom
    Lines.Strings = (
      'mmoBase')
    TabOrder = 2
  end
  object edtNome: TEdit
    Left = 16
    Top = 86
    Width = 178
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object btnExample_2: TButton
    Left = 121
    Top = 16
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_2'
    TabOrder = 4
    OnClick = btnExample_2Click
  end
  object btnExample_3: TButton
    Left = 232
    Top = 16
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_3'
    TabOrder = 5
    OnClick = btnExample_3Click
  end
  object btnExample_4: TButton
    Left = 200
    Top = 86
    Width = 137
    Height = 25
    Caption = 'SQL_QUERY_4'
    TabOrder = 6
    OnClick = btnExample_4Click
  end
  object btnExample_5: TButton
    Left = 576
    Top = 86
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_5'
    TabOrder = 7
    OnClick = btnExample_5Click
  end
end
