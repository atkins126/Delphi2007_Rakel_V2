object Form3: TForm3
  Left = 217
  Top = 319
  Caption = '-==-'
  ClientHeight = 816
  ClientWidth = 960
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 960
    Height = 816
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 692
    ExplicitHeight = 382
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 700
      Height = 361
      Hint = #1053#1072#1078#1084#1080' '#1087#1088#1072#1074#1091#1102' '#1082#1085#1086#1087#1082#1091' '#1084#1099#1096#1082#1080'!'
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      OnDblClick = Image1DblClick
    end
    object Image2: TImage
      Left = 13
      Top = 16
      Width = 353
      Height = 89
      Hint = #1053#1072#1078#1084#1080' '#1087#1088#1072#1074#1091#1102' '#1082#1085#1086#1087#1082#1091' '#1084#1099#1096#1082#1080'!'
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      Visible = False
      OnDblClick = Image1DblClick
    end
    object Button1: TButton
      Left = 13
      Top = 328
      Width = 3
      Height = 3
      Caption = ' '
      Enabled = False
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 240
    Top = 168
    Width = 297
    Height = 41
    Caption = #1053#1072#1078#1084#1080#1090#1077' Esc '#1076#1083#1103' '#1087#1088#1077#1088#1099#1074#1072#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
    TabOrder = 1
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 80
    object N1: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' .bmp'
      OnClick = N2Click
    end
    object jpg1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' .jpg'
      OnClick = jpg1Click
    end
    object N3: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
      Visible = False
      OnClick = N4Click
    end
  end
  object RzSaveDialog1: TSaveDialog
    Left = 376
    Top = 272
  end
end
