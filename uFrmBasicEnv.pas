unit uFrmBasicEnv;

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
  Data.DB,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,

  // USE THE CONTROLER UNIT
  uClienteController,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TViewBasicEnv = class(TForm)
    dbGridBase: TDBGrid;
    pnlBottom: TPanel;
    edtNomeSearch: TEdit;
    btnSearchByName: TButton;
    btnSearchCleaner: TButton;
    btnDeleteAllData: TButton;
    lbnNoDataFound: TPanel;
    lbnEmptySearchWarning: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchByNameClick(Sender: TObject);
    procedure btnSearchCleanerClick(Sender: TObject);
    procedure btnDeleteAllDataClick(Sender: TObject);

    procedure msnWhenNoDataFoundOnDbGrid;
    procedure msnWhenDbTableIsEmpty;
    procedure msnWhenSearchEmptyName;
    procedure msnToCleanAllWarnings;
    procedure edtNomeSearchClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeSearchKeyPress(Sender: TObject; var Key: Char);

    procedure actionToSearchByName;

  private
    { Private declarations }
    ControllerClienteClass: TClienteController;
    VNome: string;
  public
    { Public declarations }
    property VClienteController: TClienteController read ControllerClienteClass write ControllerClienteClass;
  end;

var
  ViewBasicEnv: TViewBasicEnv;

implementation

{$R *.dfm}


procedure TViewBasicEnv.btnDeleteAllDataClick(Sender: TObject);
// BUTTON ##############################################################################################################
begin
  try
    VClienteController.DeleteAllData;
    Self.msnWhenDbTableIsEmpty;
  except // EXCEPTION #####
    on ex: Exception do
      raise
  end;
end;

procedure TViewBasicEnv.btnSearchByNameClick(Sender: TObject);
// BUTTON ##############################################################################################################
begin
  Self.actionToSearchByName;
end;

procedure TViewBasicEnv.btnSearchCleanerClick(Sender: TObject);
// BUTTON ##############################################################################################################
begin
  try
      Self.msnToCleanAllWarnings;
        VClienteController.ListAllExemplo6;
      Self.msnWhenDbTableIsEmpty;
  finally
      edtNomeSearch.SetFocus;
  end;
end;

procedure TViewBasicEnv.FormCreate(Sender: TObject);
// BASIC STEP 01 #######################################################################################################
begin
  VClienteController := TClienteController.Create(Self);
  KeyPreview := true;
end;

procedure TViewBasicEnv.FormShow(Sender: TObject);
// BASIC STEP 02 #######################################################################################################
begin
  dbGridBase.DataSource := VClienteController.dataSourceLink;
    VClienteController.ListAllExemplo6; // ACTION... SELECT ALL FROM CLIENT TABLE
  Self.msnToCleanAllWarnings;
  Self.msnWhenDbTableIsEmpty;
end;

procedure TViewBasicEnv.FormDestroy(Sender: TObject);
// BASIC STEP 03 #######################################################################################################
begin
  FreeAndNil(ControllerClienteClass);
end;

procedure TViewBasicEnv.msnWhenNoDataFoundOnDbGrid;
// BEHAVIOR ON THE WINDOW - WARNING CATEGORY ###########################################################################
begin

  VClienteController.CountRecordsOnDataSet;

  if VClienteController.Cliente.CountRegisterNumber = 0 then
    begin
          lbnNoDataFound.Caption := 'NO DATA FOUND for Name: ( ' + VNome + ' ) on TABLE!';
       lbnNoDataFound.Visible := True;
    end
  else
    begin
      Self.msnToCleanAllWarnings; //DO NOTHING JUST KEEP THE LABEL HIDDEN
    end;

end;

procedure TViewBasicEnv.msnWhenDbTableIsEmpty;
// BEHAVIOR ON THE WINDOW - WARNING CATEGORY ###########################################################################
begin

  VClienteController.CountRecordsOnDataSet;

 if VClienteController.Cliente.CountRegisterNumber = 0 then
    begin
          lbnNoDataFound.Caption := 'THE DATA TABLE IS EMPTY!';
       lbnNoDataFound.Visible := True;
    end
  else
    begin
      Self.msnToCleanAllWarnings; //DO NOTHING JUST KEEP THE LABEL HIDDEN
    end;

end;

procedure TViewBasicEnv.edtNomeSearchClick(Sender: TObject);
// BEHAVIOR ON THE WINDOW - WARNING CATEGORY ###########################################################################
begin
    Self.msnToCleanAllWarnings;
    VClienteController.ListAllExemplo6;
end;

procedure TViewBasicEnv.msnWhenSearchEmptyName;
// BEHAVIOR ON THE WINDOW - WARNING CATEGORY ###########################################################################
var
  WarningTxtMsn : string;
begin

  WarningTxtMsn := 'Do you forget type a Name for the Search?';

  ShowMessage(WarningTxtMsn);
    lbnEmptySearchWarning.Caption := WarningTxtMsn;
    lbnEmptySearchWarning.Visible := true;
  edtNomeSearch.SetFocus;

end;

procedure TViewBasicEnv.msnToCleanAllWarnings;
// BEHAVIOR ON THE WINDOW - WARNING CATEGORY ###########################################################################
begin
  if lbnNoDataFound.Visible = true then lbnNoDataFound.Visible := False;
  if lbnEmptySearchWarning.Visible = true then lbnEmptySearchWarning.Visible := False;
end;

procedure TViewBasicEnv.FormKeyPress(Sender: TObject; var Key: Char);
// BEHAVIOR ON THE WINDOW - ACTION CATEGORY ###########################################################################
begin
  if Key = #27 then Close;// CLOSE THE WINDOWS VIEW WHEN PRESS Esc KEYBOARD KEY
end;

procedure TViewBasicEnv.edtNomeSearchKeyPress(Sender: TObject; var Key: Char);
// BEHAVIOR ON THE WINDOW - ACTION CATEGORY ############################################################################
begin
    if Key = #13 then Self.actionToSearchByName; // SEARCH WHEN PRESS THE ENTER KEYBOARD KEY FROM IN SIDE THE EDIT FIELD
end;

procedure TViewBasicEnv.actionToSearchByName;
// SHARED ACTION #######################################################################################################
begin
  VNome := edtNomeSearch.Text;
    if VNome.IsEmpty then
      begin
        Self.msnWhenSearchEmptyName;
      end
    else
      begin
        try
          VClienteController.ListAllExemplo4(VNome.ToUpper); //ERROR!! IS CASE SENSITIBLE YET ON DATA BASE!!??
          Self.msnWhenNoDataFoundOnDbGrid;
        finally
          edtNomeSearch.SetFocus;
        end;
      end;
end;

end.
