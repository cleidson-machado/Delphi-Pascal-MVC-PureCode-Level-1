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
  TForm1 = class(TForm)
    dbGridBase: TDBGrid;
    btnExample_1: TButton;
    mmoBase: TMemo;
    lblName: TLabel;
    edtNome: TEdit;
    btnExample_2: TButton;
    btnExample_3: TButton;
    btnExample_4: TButton;
    btnExample_5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnExample_1Click(Sender: TObject);
    procedure btnExample_2Click(Sender: TObject);
    procedure btnExample_3Click(Sender: TObject);
    procedure btnExample_4Click(Sender: TObject);
    procedure btnExample_5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //TODO
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  dbGridBase.DataSource := ClienteController.dataSourceLink; // STEP ## 4 ## -- LINK BETWEEN THE VIEW GRID AND A DATA OBJECT
end;

procedure TForm1.btnExample_1Click(Sender: TObject);
begin
  try
    ClienteController.ListAllExemplo1;  // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_01');
  end;
end;

procedure TForm1.btnExample_2Click(Sender: TObject);
begin
    try
    ClienteController.ListAllExemplo2;  // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_02');
  end;
end;

procedure TForm1.btnExample_3Click(Sender: TObject);
begin
  try
    ClienteController.ListAllExemplo3;  // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_03');
  end;
end;

procedure TForm1.btnExample_4Click(Sender: TObject);
var
  VNome: string;
begin
  VNome := edtNome.Text;
  try
    ClienteController.ListAllExemplo4(VNome); // ####--> ACTION TO PERFORM THE QUERY -- A "TRIGGER"
  finally
    edtNome.Clear; // PUT ALL EDITS CLEAR ACTION IN SOME A ONLY METHODE..!
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_04');
  end;
end;

procedure TForm1.btnExample_5Click(Sender: TObject);
begin
  try
    ClienteController.ListAllExemplo5;
  finally
    mmoBase.Clear;
    mmoBase.Lines.Add('Example_05');
    mmoBase.Lines.Add(ClienteController.ListAllExemplo5); // HERE THIS ONE RETURN THE TXT IFORMATION AND EXCUTE THE ACTION.. THIS IS NOT CORRECT!
  end;
end;

end.
