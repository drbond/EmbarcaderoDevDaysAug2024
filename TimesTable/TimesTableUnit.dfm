object frmTimesTable: TfrmTimesTable
  Left = 0
  Top = 0
  Caption = 'Times Table'
  ClientHeight = 298
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object mbTimesTable: TMemo
    Left = 104
    Top = 16
    Width = 145
    Height = 265
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lbNumber: TListBox
    Left = 8
    Top = 8
    Width = 81
    Height = 265
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 1
    OnClick = lbNumberClick
  end
end
