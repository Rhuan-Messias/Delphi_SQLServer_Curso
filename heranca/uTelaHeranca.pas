unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDTMConexao, uEnum;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblindice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }

    procedure ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
          pgcPrincipal:TPageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    IndiceAtual:string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Apagar:Boolean; virtual;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'OBSEVA��ES}
  //TAG: 1 - Chave Prim�ria - PK
  //TAG: 2 - Campos Obrigat�rios
{$endregion}

{$region 'Function and Procedures'}

//Rotinas de Controle de Tela
  // Nos argumentos, posso usar virgula quando declarar os do mesmo tipo
  // uso ponto e virgula quando mudo o tipo, eu posso por qualquer nome,
  // coloquei o dos botoes por facilidade na leitura
procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
          btnGravar, btnApagar:TBitBtn; Navegador:TDBNavigator;
          pgcPrincipal:TPageControl; Flag:Boolean);
begin
  btnNovo.Enabled     := Flag;
  btnApagar.Enabled   := Flag;
  btnAlterar.Enabled  := Flag;
  Navegador.Enabled   := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
  btnCancelar.Enabled := not(Flag);
  btnGravar.Enabled   := not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl;
                                             Indice : Integer);
begin
  // se o indice do page control est� vis�vel
  if(pgcPrincipal.Pages[Indice].TabVisible) then
    pgcPrincipal.TabIndex := Indice;
end;

function TfrmtelaHeranca.RetornarCampoTraduzido(Campo:String):string;
var i:Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do
  begin
    if lowercase(QryListagem.Fields[i].fieldname) = lowercase(Campo) then
    begin
      Result := QryListagem.Fields[i].DisplayLabel; // retorna isso para a function
      break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption := RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
  var i:integer;
  //Lembre-se de colocar a propriedade Tag = 1 para os TLabeledEdit Obrigatorios
begin
  Result := False;
  for I := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 2) and
         (TLabeledEdit(Components[i]).Text = EmptyStr) then
      begin
        MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
                    ' � um campo obrigat�rio', mtInformation, [mbOK],0);
        TLabeledEdit(Components[i]).SetFocus;
        Result := True;
        Break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i:integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 1) then
      begin
        TLabeledEdit (Components[i]).Enabled := false;
        break; //sai do la�o for
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var i:integer;
begin
  for i := 0 to ComponentCount -1 do
    begin
      if (Components[i] is TLabeledEdit) then
        TLabeledEdit(Components[i]).Text := EmptyStr
      else if (Components[i] is TEdit) then
        TEdit(Components[i]).Text := '';//dois jeitos de limpar a linha EmptyStr ou ''
    end;
end;
{$endregion}

{$region 'M�TODOS VIRTUAIS'}
function TfrmTelaHeranca.Apagar: Boolean;
begin
  ShowMessage('Deletado');
  Result := True;
end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if (EstadoDoCadastro = ecInserir) then
    showmessage('Inserir')
  else if (EstadoDoCadastro = ecAlterar) then
    showmessage('Alterado');
  Result := True;
end;
{$endregion}

//procedures de botoes
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, false);

  EstadoDoCadastro := ecInserir; // n�o preciso declarar pois � s� um Type
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, false);

  EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  Try
    if Apagar then
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                    btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
    end
    else
    begin
      MessageDlg('Erro na Exclus�o', mtError, [mbok], 0);
    end;
  Finally
    EstadoDoCadastro := ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal, true);
  // quando clicar em cancelar, a tab vai para o indice 0 novamente
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro := ecNenhum;
  LimparEdits;

end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  //se a funcao ExisteCampoObrigatorio retorna true, aborta pq tem
  //campo em branco
  if(ExisteCampoObrigatorio)=true then
    abort;

  Try
    if Gravar(EstadoDoCadastro) then  //Metodo Virtual
    begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                    btnNavigator, pgcPrincipal, true);
      ControlarIndiceTab(pgcPrincipal, 0);
      EstadoDoCadastro := ecNenhum;
      LimparEdits;
    end
    else
    begin
      MessageDlg('Erro na Grava��o', mtError, [mbok], 0);
    end;
  Finally
  End;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  // A propriedade Connection do componente TZQuery recebe a componente ConexaoDB
  // do formulario dtmprincipal
  // a propriedade dataset do componente TDataSource recebe o componente TZQuery

  QryListagem.Connection := dtmPrincipal.ConexaoDB;
  dtsListagem.DataSet := QryListagem;
  grdListagem.DataSource := dtsListagem;
  grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                          dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,
                          dgCancelOnExit,dgTitleClick,dgTitleHotTrack];



end;


procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if QryListagem.SQL.Text<>EmptyStr then
  begin
    QryListagem.IndexFieldNames := IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    QryListagem.Open;
  end;
  ControlarIndiceTab(pgcPrincipal,0);
  DesabilitarEditPK;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                    btnNavigator, pgcPrincipal, true);
end;


procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click; //executar esse procedure com o btnCancelar de Sender
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames := IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  // Vai fazer com o que for digitado seja buscado no grid
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey])
end;

end.
