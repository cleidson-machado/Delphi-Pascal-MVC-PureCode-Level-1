object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 631
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 8
    Top = 65
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
  object lbNome: TLabel
    Left = 8
    Top = 192
    Width = 59
    Height = 23
    Caption = 'NOME:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDelete: TLabel
    Left = 8
    Top = 267
    Width = 118
    Height = 23
    Caption = 'DELETE by ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSelect: TLabel
    Left = 8
    Top = 339
    Width = 116
    Height = 23
    Caption = 'SELECT by ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDeleteAll: TLabel
    Left = 8
    Top = 419
    Width = 190
    Height = 23
    Caption = 'DELETE ALL RECORDS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbGridBase: TDBGrid
    Left = 492
    Top = 0
    Width = 538
    Height = 519
    Align = alRight
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnExample_1: TButton
    Left = 8
    Top = 144
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_1'
    TabOrder = 4
    OnClick = btnExample_1Click
  end
  object mmoBase: TMemo
    Left = 0
    Top = 519
    Width = 1030
    Height = 112
    Align = alBottom
    Lines.Strings = (
      'mmoBase')
    TabOrder = 15
  end
  object edtNomeSearch: TEdit
    Left = 8
    Top = 94
    Width = 178
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnExample_2: TButton
    Left = 119
    Top = 144
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_2'
    TabOrder = 5
    OnClick = btnExample_2Click
  end
  object btnExample_3: TButton
    Left = 230
    Top = 144
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_3'
    TabOrder = 6
    OnClick = btnExample_3Click
  end
  object btnExample_4: TButton
    Left = 198
    Top = 97
    Width = 137
    Height = 25
    Caption = 'SQL_QUERY_4'
    TabOrder = 3
    OnClick = btnExample_4Click
  end
  object btnExample_5: TButton
    Left = 341
    Top = 144
    Width = 105
    Height = 25
    Caption = 'SQL_QUERY_5'
    TabOrder = 7
    OnClick = btnExample_5Click
  end
  object edtNomeInsert: TEdit
    Left = 8
    Top = 221
    Width = 327
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object btnInsert: TButton
    Left = 341
    Top = 224
    Width = 105
    Height = 25
    Caption = 'INSERT NOME'
    TabOrder = 9
    OnClick = btnInsertClick
  end
  object btnExample_6: TButton
    Left = 8
    Top = 24
    Width = 178
    Height = 25
    Caption = 'SQL_QUERY_6_LIST_ALL_DESC'
    TabOrder = 0
    OnClick = btnExample_6Click
  end
  object btnExample_7: TButton
    Left = 73
    Top = 296
    Width = 216
    Height = 25
    Caption = 'SQL_QUERY_7_DELETE_A_simple_way'
    TabOrder = 11
    OnClick = btnExample_7Click
  end
  object edtDeleteById: TEdit
    Left = 8
    Top = 293
    Width = 59
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object edtSelectById: TEdit
    Left = 8
    Top = 368
    Width = 59
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object btnExample_8: TButton
    Left = 73
    Top = 368
    Width = 216
    Height = 25
    Caption = 'SQL_QUERY_8_SELECT_ONE_Simple_way'
    TabOrder = 13
    OnClick = btnExample_8Click
  end
  object btnExample_9: TButton
    Left = 280
    Top = 24
    Width = 166
    Height = 25
    Caption = 'SQL_QUERY_COUNT_RECORDS'
    TabOrder = 1
    OnClick = btnExample_9Click
  end
  object btnExample_10: TButton
    Left = 320
    Top = 296
    Width = 166
    Height = 25
    Caption = 'SQL_COUNT_TEST'
    TabOrder = 16
    OnClick = btnExample_10Click
  end
  object btnExample_11: TButton
    Left = 8
    Top = 448
    Width = 216
    Height = 25
    Caption = 'SQL_QUERY_CLEANER_TABLE'
    TabOrder = 17
    OnClick = btnExample_11Click
  end
end
