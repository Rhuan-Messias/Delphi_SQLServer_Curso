object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'INFORME AQUI O TITULO'
  ClientHeight = 651
  ClientWidth = 1115
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1115
    Height = 603
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 560
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 1107
        Height = 65
        Align = alTop
        TabOrder = 0
        object mskPesquisar: TMaskEdit
          Left = 16
          Top = 18
          Width = 537
          Height = 23
          TabOrder = 0
          Text = 'Digite sua pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 576
          Top = 17
          Width = 105
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
      object grdListagem: TDBGrid
        Left = 0
        Top = 65
        Width = 1107
        Height = 508
        Align = alClient
        DataSource = dtsListagem
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 603
    Width = 1115
    Height = 48
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 602
    object btnNovo: TBitBtn
      Left = 20
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 108
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object btnCancelar: TBitBtn
      Left = 196
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
    end
    object btnGravar: TBitBtn
      Left = 284
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 3
    end
    object btnApagar: TBitBtn
      Left = 372
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Apaga&r'
      TabOrder = 4
    end
    object btnFechar: TBitBtn
      Left = 1020
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 5
    end
    object btnNavigator: TDBNavigator
      Left = 464
      Top = 12
      Width = 136
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 6
    end
  end
  object QryListagem: TZQuery
    Connection = dtmPrincipal.ConexaoDB
    Params = <>
    Left = 828
    Top = 50
  end
  object dtsListagem: TDataSource
    DataSet = QryListagem
    Left = 932
    Top = 58
  end
end
