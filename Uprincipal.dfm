object Form1: TForm1
  Left = 852
  Top = 138
  Caption = 'Form1'
  ClientHeight = 636
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 57
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 432
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Adiciona'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 24
      Top = 20
      Width = 377
      Height = 21
      TabOrder = 1
    end
    object Button2: TButton
      Left = 400
      Top = 19
      Width = 25
      Height = 22
      Caption = '...'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 512
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Gera'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 592
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Limpa'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo texto (*.txt)|*.txt'
    Left = 504
    Top = 64
  end
end
