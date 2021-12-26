unit uClienteModel;

interface

uses
  System.SysUtils;

type
  TClienteModel = class(TObject)

  private

    FcodigoPk: Integer; //TABLE ATTRIBUTE
    Fnome: string;      //TABLE ATTRIBUTE

    FCountRegister: Integer; //MEMORY ATTRIBUTE

  public

    //constructor Create; // DONT USE HERE.. USE FROM A SYSTEM CLASS!! BECAUSE THIS IS A SIMPLE OBJECT CLASS..
    destructor Destroy; override;

    property Codigo: Integer read FcodigoPk write FcodigoPk; //TABLE ATTRIBUTE
    property Nome: string read Fnome write Fnome;            //TABLE ATTRIBUTE

    property CountRegisterNumber: Integer read FCountRegister write FCountRegister; //MEMORY ATTRIBUTE

  end;

var
  FCliente: TClienteModel;

implementation

{ TClienteModel }

destructor TClienteModel.Destroy;
begin
  FreeAndNil(FCliente);
  inherited;
end;

end.
