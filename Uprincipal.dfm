object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 395
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object UxieButton1: TUxieButton
    Left = 8
    Top = 8
    Width = 164
    Height = 64
    Cursor = crHandPoint
    Enabled = True
    TabOrder = 0
    OnClick = UxieButton1Click
    Caption = 'Empty State'
    Kind = kdPrimary
  end
  object UxieButton2: TUxieButton
    Left = 8
    Top = 78
    Width = 164
    Height = 64
    Cursor = crHandPoint
    Enabled = True
    TabOrder = 1
    OnClick = UxieButton2Click
    Caption = 'Lista Tarefas'
    Kind = kdPrimary
  end
end
