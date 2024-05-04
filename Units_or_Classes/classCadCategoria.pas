unit classCadCategoria;

interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs,
      ZAbstractConnection, ZConnection; //lista units

type
  TCategoria = class //Declaração do tipo da Classe
  private
    ConexaoDB:TZConnection;
    F_categoriaId:Integer; //f de field, categoriaId é a coluna do database
    F_descricao:String;

    function GetCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);  //Varchar
  public
    constructor Create(aConexao:TZConnection);// aviso que na creation aConexao recebe TZConnection
    destructor Destroy; override;
    function Gravar:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo:Integer   read getCodigo    write setCodigo;
    property descricao:string read getDescricao write setDescricao;
  end;

implementation

{ TCategoria }

{$region 'Constructor and Destructor'}
constructor TCategoria.Create(aConexao:TZConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$endRegion}

{$region 'Gets'}
function TCategoria.GetCodigo: Integer;
begin
  Result := Self.F_categoriaId; //não retorno a property, mas sim a variavel que
                                //representa elas
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;
{$endRegion}

{$region 'Sets'}
procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value; //esse value é o getCodigo e setCodigo
  // o get pega o valor, e o set escreve esse valor
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;
{$endregion}

{$region 'CRUD'}
function TCategoria.Apagar: Boolean;
begin
  ShowMessage('Apagado');
  result:=true;
end;

function TCategoria.Atualizar: Boolean;
begin
  ShowMessage('Atualizado');
  result:=true;
end;

function TCategoria.Gravar: Boolean;
begin
  result:=false;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
begin
  result:=true;
end;
{$endregion}




end.
