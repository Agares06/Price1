object fmMain: TfmMain
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1055#1088#1072#1081#1089' '#1054#1054#1054' '#1070#1085#1080#1095#1086#1081#1089
  ClientHeight = 304
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbCateg: TLabel
    Left = 191
    Top = 8
    Width = 88
    Height = 19
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbUnits: TLabel
    Left = 191
    Top = 123
    Width = 71
    Height = 19
    Caption = #1055#1086#1079#1080#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object clbPosits: TCheckListBox
    Left = 191
    Top = 148
    Width = 495
    Height = 150
    OnClickCheck = clbPositsClickCheck
    BiDiMode = bdLeftToRight
    Color = clScrollBar
    ItemHeight = 13
    Items.Strings = (
      #1055#1091#1089#1090#1086)
    ParentBiDiMode = False
    TabOrder = 0
  end
  object pnManag: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 304
    Align = alLeft
    BevelInner = bvLowered
    BevelKind = bkSoft
    TabOrder = 1
    ExplicitHeight = 412
    object btRefr: TButton
      Left = 2
      Top = 20
      Width = 178
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1080#1089#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btRefrClick
    end
    object btCrtExc: TButton
      Left = 2
      Top = 55
      Width = 178
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' Excel'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btCrtExcClick
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 2
      Width = 177
      Height = 10
      Align = alTop
      BarColor = clOlive
      TabOrder = 2
      Visible = False
    end
    object btSett: TButton
      Left = 2
      Top = 156
      Width = 178
      Height = 25
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btSettClick
    end
    object cbSett: TCheckBox
      Left = 8
      Top = 187
      Width = 97
      Height = 17
      TabOrder = 4
      OnClick = cbSettClick
    end
  end
  object clbCateg: TCheckListBox
    Left = 191
    Top = 32
    Width = 354
    Height = 85
    OnClickCheck = clbCategClickCheck
    Color = cl3DLight
    ItemHeight = 13
    Items.Strings = (
      #1055#1091#1089#1090#1086)
    TabOrder = 2
    OnClick = clbCategClickCheck
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 656
    Top = 8
  end
end
