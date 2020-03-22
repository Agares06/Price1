object fmSetts: TfmSetts
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 426
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 283
    Top = 8
    Width = 77
    Height = 19
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 1
    Top = 33
    Width = 641
    Height = 128
    Lines.Strings = (
      #1054#1073#1097#1077#1089#1090#1074#1086' '#1089' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1086#1081' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100#1102' '#171#1070#1085#1080#1095#1086#1081#1089#187
      '223021 '#1075'. '#1052#1080#1085#1089#1082', '#1052#1077#1085#1100#1082#1086#1074#1089#1082#1080#1081' '#1090#1088#1072#1082#1090', 14'#1072', '#1087#1086#1084'. 1-16'
      
        #1088'/'#1089'  BY73BLNB30120000041245000933 BYN  '#1074' '#1054#1040#1054' "'#1041#1053#1041'-'#1041#1072#1085#1082'", '#1082#1086#1076' BLN' +
        'BBY2X, '#1075'. '
      #1052#1080#1085#1089#1082', '#1087#1088'. '#1053#1077#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080', 87'#1040
      #1059#1053#1055' 691583669'
      #1058#1077#1083'. +375 29 132-30-30'
      '')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 384
    Width = 89
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 1
    Top = 192
    Width = 145
    Height = 27
    TabOrder = 2
    Text = 'cbSourse'
  end
end
