inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientWidth = 813
  ExplicitWidth = 825
  TextHeight = 15
  inherited pgcPrincipal: TPageControl
    Width = 813
    inherited tabListagem: TTabSheet
      ExplicitWidth = 805
      inherited pnlListagemTopo: TPanel
        Width = 805
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
    end
  end
  inherited pnlRodape: TPanel
    Width = 813
    inherited btnFechar: TBitBtn
      Left = 696
      ExplicitLeft = 896
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
