object frmBirdSong: TfrmBirdSong
  Left = 0
  Top = 0
  Caption = 'Bird Song'
  ClientHeight = 319
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblBirdName: TLabel
    Left = 20
    Top = 15
    Width = 3
    Height = 13
  end
  object btnCreateNightingale: TButton
    Left = 20
    Top = 104
    Width = 153
    Height = 25
    Caption = 'Create Nightingale'
    TabOrder = 0
    OnClick = btnCreateNightingaleClick
  end
  object btnCreateLark: TButton
    Left = 20
    Top = 160
    Width = 153
    Height = 25
    Caption = 'Create Lark'
    TabOrder = 1
    OnClick = btnCreateLarkClick
  end
  object btnSing: TButton
    Left = 20
    Top = 48
    Width = 153
    Height = 25
    Caption = 'Sing'
    TabOrder = 2
    OnClick = btnSingClick
  end
  object WindowsMediaPlayer1: TWindowsMediaPlayer
    Left = 179
    Top = 48
    Width = 277
    Height = 233
    TabOrder = 3
    ControlData = {
      0003000008000200000000000500000000000000F03F03000000000005000000
      00000000000008000200000000000300010000000B00FFFF0300000000000B00
      FFFF08000200000000000300640000000B00000008000A000000660075006C00
      6C0000000B0000000B0000000B00FFFF0B00FFFF0B0000000800020000000000
      0800020000000000080002000000000008000200000000000B000000A11C0000
      15180000}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 72
    Top = 224
  end
end
