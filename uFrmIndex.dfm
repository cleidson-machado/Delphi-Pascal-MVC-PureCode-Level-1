object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FormIndex'
  ClientHeight = 201
  ClientWidth = 447
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnStartCrud: TButton
    Left = 152
    Top = 32
    Width = 129
    Height = 25
    Caption = 'OPEN APP - Basic Crud'
    TabOrder = 0
    OnClick = btnStartCrudClick
  end
  object btnStartViewSearch: TButton
    Left = 152
    Top = 80
    Width = 193
    Height = 25
    Caption = 'OPEN APP - A CLIENT VIEW SEARCH'
    TabOrder = 1
    OnClick = btnStartViewSearchClick
  end
end
