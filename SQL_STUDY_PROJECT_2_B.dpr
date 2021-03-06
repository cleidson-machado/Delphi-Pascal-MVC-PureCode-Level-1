program SQL_STUDY_PROJECT_2_B;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {Form2},
  uDMConnection in 'br.com.project.dao.conn\uDMConnection.pas' {DbConnection: TDataModule},
  uClienteDao in 'br.com.project.dao\uClienteDao.pas' {ClienteDao: TDataModule},
  uClienteController in 'br.com.project.controller\uClienteController.pas' {ClienteController: TDataModule},
  uClienteModel in 'br.com.project.model\uClienteModel.pas',
  uAppSystemCenter in 'br.com.project.util\uAppSystemCenter.pas' {appSystemCenter: TDataModule},
  uFrmIndex in 'uFrmIndex.pas' {Form1},
  uFrmBasicEnv in 'uFrmBasicEnv.pas' {ViewBasicEnv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TappSystemCenter, appSystemCenter);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
