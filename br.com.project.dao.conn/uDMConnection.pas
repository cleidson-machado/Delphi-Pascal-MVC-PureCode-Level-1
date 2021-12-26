unit uDMConnection;

interface

uses
   System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.IB,
  FireDAC.Phys.IBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  Data.DB;

type
  TDbConnection = class(TDataModule)
    setDataBaseLink: TFDConnection; // DATA COMPONENT UTILIZED

  private
    { Private declarations }

  public
    { Public declarations }

    procedure setParametersInterBase;
    procedure setParametersFireBird;

    property Transaction: TFDConnection read setDataBaseLink write setDataBaseLink;

  end;

var
  DbConnection: TDbConnection;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }
{$R *.dfm}
{ TTDMConnection }

procedure TDbConnection.setParametersInterBase;
begin
  with setDataBaseLink do // STEP ## 1 ## -- SET / USE DB CONNECTION COMPONENT
  begin
    Close;
    // BASE DB CONNECTION
    with Params do
    begin
      Clear;
      Database :=
        'C:\Z_CLEIDSON\DEVELOPMENT\EMBARCADERO\DATABASES\CRUD_BASIC.IB';
      UserName := 'SYSDBA';
      Password := 'masterkey';
      DriverID := 'IB';
      LoginPrompt := False;
      Connected := True;
    end;
    Open;
  end;
end;

procedure TDbConnection.setParametersFireBird;
begin
  with setDataBaseLink do // STEP ## 1 ## -- SET / USE DB CONNECTION COMPONENT
  begin
    Close;
    // BASE DB CONNECTION
    with Params do
    begin
      Clear;
      Database := 'C:\VM_Dev\Databases\DB_MVC.FDB';
      UserName := 'SYSDBA';
      Password := '4b6f4194';
      DriverID := 'FB';
      LoginPrompt := False;
      Connected := True;
    end;
    Open;
  end;
end;

end.
