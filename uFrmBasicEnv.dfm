object ViewBasicEnv: TViewBasicEnv
  Left = 0
  Top = 0
  Caption = 'SEARCH CLIENT TOOL'
  ClientHeight = 364
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbnEmptySearchWarning: TLabel
    Left = 8
    Top = 69
    Width = 22
    Height = 14
    Caption = 'msn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbGridBase: TDBGrid
    Left = 0
    Top = 88
    Width = 749
    Height = 240
    Align = alBottom
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 328
    Width = 749
    Height = 36
    Align = alBottom
    TabOrder = 3
    object btnDeleteAllData: TButton
      Left = 600
      Top = 6
      Width = 130
      Height = 25
      Caption = 'DELETE ALL DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnDeleteAllDataClick
    end
  end
  object edtNomeSearch: TEdit
    Left = 8
    Top = 39
    Width = 178
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = edtNomeSearchClick
    OnKeyPress = edtNomeSearchKeyPress
  end
  object btnSearchByName: TButton
    Left = 192
    Top = 41
    Width = 89
    Height = 25
    Caption = 'SEARCH NAME'
    TabOrder = 1
    OnClick = btnSearchByNameClick
  end
  object btnSearchCleaner: TButton
    Left = 576
    Top = 41
    Width = 154
    Height = 25
    Caption = 'CLEAR Last SEARCH'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnSearchCleanerClick
  end
  object lbnNoDataFound: TPanel
    Left = 0
    Top = 184
    Width = 758
    Height = 41
    Align = alCustom
    BevelKind = bkSoft
    Caption = 'msn'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
  end
end
