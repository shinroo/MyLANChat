object Form1: TForm1
  Left = 190
  Top = 105
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 197
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 224
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 23
    Caption = 'Rob'#39's LAN chat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 40
    Width = 75
    Height = 33
    Caption = 'Send'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 96
    Width = 241
    Height = 89
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 64
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'String'
      'Text File')
  end
  object NetCom1: TNetCom
    BufferSize = 4316
    LocalPort = 8876
    ResendFreq = 2000
    ResendCount = 16
    LinkTimeout = 600
    OnReceive = NetCom1Receive
    Left = 264
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 8
    object Chats1: TMenuItem
      Caption = 'Chats'
      object General1: TMenuItem
        Caption = 'General'
      end
      object Other1: TMenuItem
        Caption = 'Other'
      end
    end
  end
end
