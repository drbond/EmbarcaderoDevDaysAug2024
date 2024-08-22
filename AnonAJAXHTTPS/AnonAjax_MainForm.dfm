object FormAnonAjax: TFormAnonAjax
  Left = 0
  Top = 0
  Caption = 'AnonAjax'
  ClientHeight = 629
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 209
    Top = 250
    Width = 351
    Height = 351
    AutoSize = True
  end
  object lblFirstImage: TLabel
    Left = 13
    Top = 250
    Width = 6
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnReadHTML: TButton
    Left = 8
    Top = 24
    Width = 153
    Height = 25
    Caption = 'Read HTML from'
    TabOrder = 0
    OnClick = btnReadHTMLClick
  end
  object mmToShowHTML: TMemo
    Left = 183
    Top = 53
    Width = 417
    Height = 190
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object edtUrl: TEdit
    Left = 183
    Top = 26
    Width = 417
    Height = 21
    TabOrder = 2
    Text = 'https://blog.marcocantu.com/'
  end
  object btnLinks: TButton
    Left = 8
    Top = 55
    Width = 153
    Height = 25
    Caption = 'Get Links in the HTML'
    TabOrder = 3
    OnClick = btnLinksClick
  end
  object btnImages: TButton
    Left = 8
    Top = 88
    Width = 153
    Height = 25
    Caption = 'Get Images in the HTML'
    TabOrder = 4
    OnClick = btnImagesClick
  end
end
