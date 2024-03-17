unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, uCadCategorias, Enter;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    CLIENTE1: TMenuItem;
    CLIENTE2: TMenuItem;
    CATEGORIA1: TMenuItem;
    CATEGORIA2: TMenuItem;
    N1: TMenuItem;
    mnuFechar: TMenuItem;
    VENDA1: TMenuItem;
    RELATRIO1: TMenuItem;
    RELATRIO2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  //Aqui vou importar o formulário de categoria, na unit uCadCategorias
  frmCadCategoria := TfrmCadCategoria.Create(self); // vou criar na memória
  frmCadCategoria.ShowModal; //vou mostrar na tela
  frmCadCategoria.Release; // depois de fechar o release tira da memória
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil (TeclaEnter);
  FreeAndNil (dtmPrincipal);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  // criacao e configuracao do formulario para conexao ao banco de dados

  {dtmPrincipal := TdtmPrincipal.Create(Self);
  dtmPrincipal.ConexaoDB.SQLHourGlass := true;
  dtmPrincipal.ConexaoDB.Protocol := 'mssql';
  dtmPrincipal.ConexaoDB.LibraryLocation := 'D:\Rhuan\Delphi_curso_25horas\Meu Código\Delphi_SQLServer_Curso\ntwdblib.dll';
  dtmPrincipal.ConexaoDB.HostName := '.\SERVERCURSO';
  dtmPrincipal.ConexaoDB.Port := 1433; //3306 seria a porta TCP/IP
  dtmPrincipal.ConexaoDB.User := 'sa';
  dtmPrincipal.ConexaoDB.Password := 'mudar@123';
  dtmPrincipal.ConexaoDB.Database := 'vendas';
  dtmPrincipal.ConexaoDB.Connected := true;}

  dtmPrincipal := TdtmPrincipal.Create(Self);
  with dtmPrincipal.ConexaoDB do
  begin
    SQLHourGlass := true;
    Protocol := 'mssql';
    LibraryLocation := 'D:\Rhuan\Delphi_curso_25horas\Meu Código\Delphi_SQLServer_Curso\ntwdblib.dll';
    HostName := '.\SERVERCURSO';
    Port := 1433; //3306 seria a porta TCP/IP
    User := 'sa';
    Password := 'mudar@123';
    Database := 'vendas';
    Connected := true;
  end;

  TeclaEnter := TMREnter.Create(self);
  TeclaEnter.FocusEnabled := true;
  TeclaEnter.FocusColor := clInfoBk;

end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  //Close;
  Application.Terminate;
end;

end.
