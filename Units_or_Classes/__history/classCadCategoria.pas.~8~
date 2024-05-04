unit classCadCategoria;

interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs; //lista units

type
  TCategoria = class //Declaração do tipo da Classe
  private
    F_categoriaId:Integer; //f de field, categoriaId é a coluna do database
    F_descricao:String;
    function GetCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);  //Varchar
  public
    constructor Create;
    destructor Destroy; override;

  published
    property codigo:Integer   read getCodigo    write setCodigo;
    property descricao:string read getDescricao write setDescricao;
  end;

implementation

{ TCategoria }

constructor TCategoria.Create;
begin

end;

destructor TCategoria.Destroy;
begin

  inherited;
end;

function TCategoria.GetCodigo: Integer;
begin
  Result := Self.F_categoriaId; //não retorno a property, mas sim a variavel que
                                //representa elas
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;

procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value; //esse value é o getCodigo e setCodigo
  // o get pega o valor, e o set escreve esse valor
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;

end.
