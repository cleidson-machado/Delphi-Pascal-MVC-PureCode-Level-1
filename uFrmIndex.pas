unit uFrmIndex;

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

  // APP CENTER CLASS
  uAppSystemCenter,

  // SIMPLE VIEW
  uFrmMain;

type
  TForm1 = class(TForm)
    btnStartCrud: TButton;
    btnStartViewSearch: TButton;

    procedure btnStartCrudClick(Sender: TObject);

    procedure FormCreate(Sender: TObject); // EVENT FOR THIS VIEW...
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnStartViewSearchClick(Sender: TObject); // EVENT FOR THIS VIEW...

  private
    { Private declarations }

    appCenter: TappSystemCenter;

  public
    { Public declarations }

    property app: TappSystemCenter read appCenter write appCenter; // UTIL CLASS.. IS MANDATORY AUTO CREATE WITH APP START!

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uFrmBasicEnv;

procedure TForm1.btnStartCrudClick(Sender: TObject);
begin
  app.ShowForm_View(TForm2, Form2); // HERE A LAUNCHER USING A GENERIC METHOD
end;

procedure TForm1.btnStartViewSearchClick(Sender: TObject);
begin
  app.ShowForm_View(TViewBasicEnv, ViewBasicEnv);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  KeyPreview := true; //### START VIEW BEHAVIOR ###############################
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char); //### START VIEW BEHAVIOR ###############################
begin
  if Key = #27 then Close;
end;

initialization

ReportMemoryLeaksOnShutdown := true; // HERE TO REPORT MEMORY LOST ISSUES

end.
