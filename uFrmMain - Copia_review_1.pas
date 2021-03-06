unit uFrmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.DB,

  // USE THE CONTROLER UNIT
  uClienteController;

type
  TForm2 = class(TForm)
    dbGridBase: TDBGrid;
    mmoBase: TMemo;
    lbName: TLabel;
    edtNomeSearch: TEdit;
    btnExample_1: TButton;
    btnExample_2: TButton;
    btnExample_3: TButton;
    btnExample_4: TButton;
    btnExample_5: TButton;
    btnExample_6: TButton;
    edtNomeInsert: TEdit;
    lbNome: TLabel;
    btnInsert: TButton;
    btnExample_7: TButton;
    edtDeleteById: TEdit;
    lbDelete: TLabel;
    lblSelect: TLabel;
    edtSelectById: TEdit;
    btnExample_8: TButton;
    btnExample_9: TButton;
    btnExample_10: TButton;
    lblDeleteAll: TLabel;
    btnExample_11: TButton;

    procedure FormCreate(Sender: TObject);  // EVENT FOR THIS VIEW...
    procedure FormShow(Sender: TObject); // EVENT FOR THIS VIEW...
    procedure FormKeyPress(Sender: TObject; var Key: Char); // EVENT FOR THIS VIEW...

    procedure btnExample_1Click(Sender: TObject);
    procedure btnExample_2Click(Sender: TObject);
    procedure btnExample_3Click(Sender: TObject);
    procedure btnExample_4Click(Sender: TObject);
    procedure btnExample_5Click(Sender: TObject);
    procedure btnExample_6Click(Sender: TObject);
    procedure btnExample_7Click(Sender: TObject);
    procedure btnExample_8Click(Sender: TObject);
    procedure btnExample_9Click(Sender: TObject);
    procedure btnExample_10Click(Sender: TObject);

    procedure btnInsertClick(Sender: TObject);
    procedure btnExample_11Click(Sender: TObject);

  private
    { Private declarations }

    ControllerClienteClass: TClienteController;
    VNome: string;
    VCodigo: Integer;

  public
    { Public declarations }

    destructor Destroy; override;

    //property app: TappSystemCenter read appCenter write appCenter;

    property VClienteController : TClienteController read ControllerClienteClass write ControllerClienteClass;

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  VClienteController := TClienteController.Create(Self); // MVC TRIGGER ((STEP 1)) OF A CHAIN EVENTS
  KeyPreview := true;
end;

destructor TForm2.Destroy;
begin
  FreeAndNil(ControllerClienteClass); //ALWAYS REMEMBER CLOSE THE YOUR CLASS ((LIKE: VClienteController )) USED ON CREATION..
  inherited;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  dbGridBase.DataSource := VClienteController.dataSourceLink; // STEP ## 4 ## -- LINK BETWEEN THE VIEW GRID AND A DATA OBJECT
end;

procedure TForm2.btnExample_1Click(Sender: TObject);
begin
  try
    VClienteController.ListAllExemplo1; // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_01');
  end;
end;

procedure TForm2.btnExample_2Click(Sender: TObject);
begin
  try
    VClienteController.ListAllExemplo2; // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_02');
  end;
end;

procedure TForm2.btnExample_3Click(Sender: TObject);
begin
  try
    VClienteController.ListAllExemplo3; // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_03');
  end;
end;

procedure TForm2.btnExample_4Click(Sender: TObject);
var
  VNome: string;
begin
  VNome := edtNomeSearch.Text;
  try
    VClienteController.ListAllExemplo4(VNome); // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    edtNomeSearch.Clear; // PUT ALL EDITS CLEAR ACTION IN SOME A ONLY METHODE..!
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_04');
  end;
end;

procedure TForm2.btnExample_5Click(Sender: TObject);
begin
  try
    VClienteController.ListAllExemplo5; // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_05');
    mmoBase.Lines.Add(VClienteController.ListAllExemplo5);
    // HERE THIS ONE RETURN THE TXT IFORMATION AND EXCUTE THE ACTION.. THIS IS NOT CORRECT!??
  end;
end;

procedure TForm2.btnExample_6Click(Sender: TObject);
begin
  mmoBase.Clear;
  mmoBase.Lines.Add('Example_06');
  VClienteController.ListAllExemplo6;
end;

procedure TForm2.btnExample_7Click(Sender: TObject);
// TODO ### DELETE BY ID TEST ###
begin
  VCodigo := StrToInt(edtDeleteById.Text);
  try
    VClienteController.DeleteOne(VCodigo);
  finally
    // edtNomeInsert.Clear; // PUT ALL CLEAR ACTION IN SOME A ONLY METHODE..!
    VClienteController.ListAllExemplo6;
  end;
end;

procedure TForm2.btnExample_8Click(Sender: TObject);
begin
  // todo
  VCodigo := StrToInt(edtSelectById.Text);
  try

    VClienteController.SelectOneById(VCodigo);

  finally

    mmoBase.Clear;
    mmoBase.Lines.Add('Example_08');
    mmoBase.Lines.Add('xxxxxxxxxx');
    // I CAN'T USE TO VIEW A SQL TXT RETURN HERE!!

  end;
end;

procedure TForm2.btnExample_9Click(Sender: TObject);
begin
  // TODO
  VClienteController.CountRecords;
end;

procedure TForm2.btnExample_10Click(Sender: TObject);
var
  VCountNumberStart: Integer;
begin
  VCountNumberStart := 0;
  try
    VClienteController.CountRecordsNew(VCountNumberStart); // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    ShowMessage('A QUANTIDADE DE REGISTROS ?:' + ' >> ' +
      IntToStr(VClienteController.Cliente.CountRegisterNumber)); // USING A ENTITY ATTRIBUTE BY A CONTROLLER
  end;

end;

procedure TForm2.btnExample_11Click(Sender: TObject);
begin
  try
    try
      VClienteController.DeleteAllData;
    finally
      VClienteController.ListAllExemplo6;
    end;
  except // EXCEPTION #####
    on ex: Exception do // HERE I GET THE EXCEPTION MSN FROM DAO CLASS...
      raise
  end;
end;

procedure TForm2.btnInsertClick(Sender: TObject);
begin
  VNome := edtNomeInsert.Text;
  try
      VClienteController.Insert(VNome);
    edtNomeInsert.Clear; // PUT ALL CLEAR ACTION IN SOME A ONLY METHODE..!
      VClienteController.ListAllExemplo6;
    ShowMessage('O NOME INSERIDO ?:' + ' >> ' + VClienteController.Cliente.Nome);
  except
     on ex: Exception do // HERE I GET THE EXCEPTION MSN FROM DAO CLASS...
      raise
  end;
end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char); //### START VIEW BEHAVIOR ###############################
begin
  if Key = #27 then Close;
end;

initialization

ReportMemoryLeaksOnShutdown := True; // HERE TO REPORT MEMORY LOST ISSUES

end.
