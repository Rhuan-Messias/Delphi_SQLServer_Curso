inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientWidth = 813
  ExplicitWidth = 825
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 813
    ActivePage = tabManutencao
    ExplicitWidth = 809
    inherited tabListagem: TTabSheet
      ExplicitWidth = 805
      inherited pnlListagemTopo: TPanel
        Width = 805
        ExplicitWidth = 805
      end
      inherited grdListagem: TDBGrid
        Width = 805
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 479
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 805
      object edtCategoriaid: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 40
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = ''
      end
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 0
        Top = 96
        Width = 433
        Height = 23
        EditLabel.Width = 51
        EditLabel.Height = 15
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 30
        TabOrder = 1
        Text = ''
      end
    end
  end
  inherited pnlRodape: TPanel
    Width = 813
    ExplicitWidth = 809
    inherited btnFechar: TBitBtn
      Left = 684
      ExplicitLeft = 680
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaId, descricao FROM categorias'
      '')
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
