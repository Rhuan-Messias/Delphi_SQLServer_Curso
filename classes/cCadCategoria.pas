unit cCadCategoria;

interface

uses System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs;

type
  TCategoria = class //Declara��o do tipo do classe
  private
    //Variaveis Privada somente dentro da classe
  public
    constructor Create; //construtor da classe
    destructor Destroy; override; //Destroi a classe, usar o override para
                                  //sobrescrever
    //Variaveis publicas que podem ser trabalhadas fora da classe
  published
    //Variaveis publicas utilizadas para propriedades da classe
    //para fornecer informa��es em runtime
  end;

implementation

{ TCategoria }

constructor TCategoria.Create;
begin
  ShowMessage('Fui Criado');
end;

destructor TCategoria.Destroy;
begin
  showmessage('fui eliminado');
  inherited;
end;

end.
