unit uClienteDao;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.DB,

  // USE THE CONNECTION UNIT
  uDMConnection,

  // USE A ENTITY MODEL CLASS
  uClienteModel;

type
  TClienteDao = class(TDataModule)
    sqlQueryLink: TFDQuery; //DATA COMPONENT UTILIZED
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    conn: TDbConnection; //PERSONAL TRANSACION!!!

  public
    { Public declarations }

    procedure ListAllExemplo1;
    procedure ListAllExemplo2;
    procedure ListAllExemplo3;
    procedure ListAllExemplo4(nome: string);
    procedure ListAllExemplo6;
    function ListAllExemplo5: string;
    function Insert(FCliente: TClienteModel): Boolean;

    function DeleteOneOld(FCliente: TClienteModel): Boolean; //REVIEW.. EXLUDE OU USE IT
    function DeleteOne(codigo: Integer): Boolean;
    procedure DeleteAllData;

    function SelectOneById(codigo: Integer): Boolean;// TEST OK ON UNISYS ENVIROMENT 01/12/2021

    procedure CountRecords; //WORKING CORRECT...
    procedure CountRecordsNew; // IS THE BEST WAY I FOUND AT THIS TIME 5/10/2021

    //### THE DATA BASE CONNECTION CAN USE ONLY HERE IN THIS CLASS UNITY... DON'T USE SOME THING LIKE: property
    //property VConnection: TDbConnection read conn write conn; // DON'T USE THIS WAY HERE!

  end;

var
  ClienteDao: TClienteDao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

{ TTDMClienteDao }

procedure TClienteDao.DataModuleCreate(Sender: TObject);
begin
  conn := TDbConnection.Create(Self);

  //conn.setParametersFireBird; //####--> ACTION STORAGE DBASE PARAMETERS TO MAKE A DBASE CONNECTION..
  conn.setParametersInterBase; //####--> ACTION STORAGE DBASE PARAMETERS TO MAKE A DBASE CONNECTION..
end;


procedure TClienteDao.CountRecords;
begin
  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT COUNT (CODIGO) FROM CLIENTE');
    // sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE WHERE CODIGO > 0');

    sqlQueryLink.Open();
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( CountRecords )');

  end;

end;

function TClienteDao.Insert(FCliente: TClienteModel): Boolean;
begin
    sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!
      if sqlQueryLink.Active then
      sqlQueryLink.Close;
    sqlQueryLink.SQL.Clear;
    try
      conn.Transaction.StartTransaction;
        sqlQueryLink.ExecSQL('INSERT INTO CLIENTE (nome) VALUES (:nome)', [FCliente.nome]);
      conn.Transaction.Commit;

      Result := True;
    except
      on ex: Exception do // EXCEPTION #####
      raise Exception.Create( Self.QualifiedClassName + ' --> ERROR: ( Insert )');
    end;
end;

function TClienteDao.SelectOneById(codigo: Integer): Boolean; // RETURN A BOOLEAN
begin

  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    // USING IN A SIMPLIFIED WAY ######################################################################################
    with sqlQueryLink.SQL do
    begin
      Clear;
      Add('SELECT * FROM CLIENTE WHERE CODIGO =' + IntToStr(codigo));
    end;
    // USING IN A SIMPLIFIED WAY ######################################################################################

    sqlQueryLink.Open();
    Result := True;
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( SelectOneById )');
  end;

end;

function TClienteDao.DeleteOne(codigo: Integer): Boolean;
begin

  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    // START DELETE BY ID ####################################################################################
      if sqlQueryLink.Active then
        sqlQueryLink.Close;

      sqlQueryLink.SQL.Clear;

      conn.Transaction.StartTransaction;
        sqlQueryLink.ExecSQL('DELETE FROM CLIENTE WHERE CODIGO = (:id)', [codigo]);
      conn.Transaction.Commit;

      Result := True;
    // END DELETE BY ID ####################################################################################
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( DeleteOne )');
  end;

end;

procedure TClienteDao.ListAllExemplo1;
begin
    sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!
  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE');
    sqlQueryLink.SQL.Add('WHERE NOME LIKE ''%CARA%''');
    sqlQueryLink.SQL.Add('ORDER BY CODIGO DESC');

    sqlQueryLink.Open();
  except
      on ex: Exception do // EXCEPTION #####
      raise Exception.Create( Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo1 )');
  end;
end;

procedure TClienteDao.ListAllExemplo2;
begin
      sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!
  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE');
    sqlQueryLink.SQL.Add('WHERE NOME LIKE' + QuotedStr('%CARA%'));
    sqlQueryLink.SQL.Add('ORDER BY CODIGO ASC');

    sqlQueryLink.Open();
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo2 )');
  end;
end;

procedure TClienteDao.ListAllExemplo3;
begin
  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE');
    sqlQueryLink.SQL.Add('WHERE NOME LIKE :cNome');
    sqlQueryLink.SQL.Add('ORDER BY CODIGO DESC');

    sqlQueryLink.ParamByName('cNome').AsString := '%CARA%';

    sqlQueryLink.Open();
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo3 )');

  end;

end;

procedure TClienteDao.ListAllExemplo4(nome: string);
begin
  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    with sqlQueryLink.SQL do
    begin
      Clear;
      Add('SELECT * FROM CLIENTE');
      Add('WHERE NOME LIKE :cNome');
      Add('ORDER BY CODIGO DESC');
    end;

    // #### ERROR!! IS CASE SENSITIBLE YET!!??
    // sqlQueryLink.ParamByName('cNome').AsString := '%CARA%';

    // #### ERROR!! IS CASE SENSITIBLE YET!!??
    sqlQueryLink.ParamByName('cNome').AsString := '%' + Trim(nome) + '%';

    sqlQueryLink.Open();
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo4 )');

  end;

end;

function TClienteDao.ListAllExemplo5: string;
begin

  sqlQueryLink.Connection := conn.setDataBaseLink;
  // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE');
    sqlQueryLink.SQL.Add('WHERE NOME LIKE :cNome');
    sqlQueryLink.SQL.Add('ORDER BY CODIGO ASC');

    sqlQueryLink.ParamByName('cNome').AsString := '%CARA%';

    sqlQueryLink.Open();

    Result := sqlQueryLink.Text;

  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo5 )');
  end;

end;

procedure TClienteDao.ListAllExemplo6;
begin

  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

  try
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE');
    sqlQueryLink.SQL.Add('ORDER BY CODIGO DESC');

    sqlQueryLink.Open();
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create(Self.QualifiedClassName + ' --> ERROR: ( ListAllExemplo6 )');
  end;
end;

procedure TClienteDao.CountRecordsNew; // COUNT RECORDS
begin
  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!
  try
    try
      if sqlQueryLink.Active then
        sqlQueryLink.Close;
      sqlQueryLink.SQL.Clear;
    finally
      sqlQueryLink.SQL.Add('SELECT * FROM CLIENTE WHERE CODIGO > 0');
      sqlQueryLink.Open();
    end;
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create( Self.QualifiedClassName + ' --> ERROR: ( CountRecordsNew )');
  end;
end;

procedure TClienteDao.DeleteAllData; //ERROR ON FIREBIRD DBASE!!!
begin
     sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!
  try
    try
      if sqlQueryLink.Active then
        sqlQueryLink.Close;
      sqlQueryLink.SQL.Clear;
    finally
      conn.Transaction.StartTransaction;
      sqlQueryLink.ExecSQL('DELETE FROM CLIENTE WHERE CODIGO > 0');
      conn.Transaction.Commit;
    end;
  except
    on ex: Exception do // EXCEPTION #####
      raise Exception.Create( Self.QualifiedClassName + ' --> ERROR: ( DeleteAllData )');
  end;

end;

function TClienteDao.DeleteOneOld(FCliente: TClienteModel): Boolean; //#### TEST DELETE USING A CLASS ATTRIBUTE
begin
  sqlQueryLink.Connection := conn.setDataBaseLink; // STEP ## 2 ## -- LINK TO USE DB CONNECTION HERE!

    //TESTE ####################################################################################
    if sqlQueryLink.Active then
      sqlQueryLink.Close;

    sqlQueryLink.SQL.Clear;

    conn.Transaction.StartTransaction;
      sqlQueryLink.ExecSQL('DELETE FROM CLIENTE WHERE CODIGO = 1');
    conn.Transaction.Commit;

    Result := True;
    //TESTE ####################################################################################
end;

end.
