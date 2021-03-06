unit uClienteController;

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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.DB,

  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  uClienteDao, // USE THE DAO UNIT

  uClienteModel; // USE A ENTITY MODEL CLASS

type
  TClienteController = class(TDataModule)

    dataSourceLink: TDataSource; // DATA COMPONENT UTILIZED

    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }

    VClienteDao: TClienteDao;

    ClienteEntityClass: TClienteModel;

  public
    { Public declarations }

    procedure ListAllExemplo1;
    procedure ListAllExemplo2;
    procedure ListAllExemplo3;
    procedure ListAllExemplo4(nome: string);
    function ListAllExemplo5: string;
    procedure ListAllExemplo6;

    procedure Insert(nome: string);

    function DeleteOne(codigo: Integer): Boolean;
    procedure DeleteAllData;

    procedure SelectOneById(codigo: Integer);

    procedure CountRecords;
    procedure CountRecordsNew(counterNum: Integer); //BEST EFFORT AT THIS TIME

    procedure CountRecordsOnDataSet;

    property Cliente: TClienteModel read ClienteEntityClass write ClienteEntityClass; //MODEL CLASS GET AND SET

    destructor Destroy; override;

  end;

var
  ClienteController: TClienteController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TClienteController.DataModuleCreate(Sender: TObject);
begin
  VClienteDao := TClienteDao.Create(Self); // IS A DATAMODULE...  USING A CREATOR FOR DELPHY SYSTEM OBJECTS...
  Cliente := TClienteModel.Create; // MODEL ENTITY... IS A UNIT CODE CLASS..  USING A ANOTHER CREATOR JUST FOR SIMPLE OR PURE OBJECTS ONLY...
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(ClienteEntityClass); //FREE CLIENT CLASS HERE... NEVER FREE A ENTITY CLASS USE BY THE VIEW ON A DAO SERVICE CLASS (VClienteDao)...
  inherited;
end;

procedure TClienteController.DeleteAllData;
begin
  if MessageDlg('ALL DATA WILL BE DELETE ON THE TABLE!', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes then
  begin
      VClienteDao.DeleteAllData;   // ####--> ACTION
      VClienteDao.ListAllExemplo6; // ####--> ACTION
      MessageDlg('DATA TABLE IS CLEAN!', mtInformation, [mbOk], 0, mbOk);
  end;
end;

function TClienteController.DeleteOne(codigo: Integer): Boolean;
// CHANGE TO A PROCEDURE...???
begin
  VClienteDao.DeleteOne(codigo);
  Result := True;
end;

procedure TClienteController.SelectOneById(codigo: Integer);
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.SelectOneById(codigo);
end;

procedure TClienteController.Insert(nome: string);
begin
  try
    Cliente.nome := nome;
  finally
    VClienteDao.Insert(Cliente) // ####--> ACTION
  end;
end;

procedure TClienteController.CountRecordsNew(counterNum: Integer);
begin
  try
   dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
    VClienteDao.CountRecordsNew; // ####--> SQL QUERY ACTION... LIMITED TO 50
    //VClienteDao.CountRecords; // ####--> SQL QUERY ACTION....JUST A TEST
   counterNum := dataSourceLink.DataSet.RecordCount; //DATA SET RESOURCE USED TO COUNT RECORDS FOUND BY A SIMPLE SQL QUERY
  finally
   Cliente.CountRegisterNumber := counterNum; // SEND TO A ENTITY ATTIBUTE A COUNT INFORMATION FOUND BY A DATA SET RESOURCE
  end;
end;

procedure TClienteController.CountRecordsOnDataSet;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink;
  Cliente.CountRegisterNumber := dataSourceLink.DataSet.RecordCount; // SEND TO A ENTITY ATTIBUTE A COUNT INFORMATION FOUND BY A DATA SET RESOURCE
end;

procedure TClienteController.CountRecords;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.CountRecords;
end;

procedure TClienteController.ListAllExemplo1;
begin

  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo1; // ####--> ACTION

end;

procedure TClienteController.ListAllExemplo2;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo2; // ####--> ACTION
end;

procedure TClienteController.ListAllExemplo3;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo3; // ####--> ACTION
end;

procedure TClienteController.ListAllExemplo4(nome: string);
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo4(nome); // ####--> ACTION
end;

function TClienteController.ListAllExemplo5: string;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo5; // ####--> ACTION
  Result := VClienteDao.ListAllExemplo5; // RETURN...
end;

procedure TClienteController.ListAllExemplo6;
begin
  dataSourceLink.DataSet := VClienteDao.sqlQueryLink; // STEP ## 3 ## -- LINK THE DATA SOURCE TO THE SQL QUERY
  VClienteDao.ListAllExemplo6; // ####--> ACTION
end;

end.
