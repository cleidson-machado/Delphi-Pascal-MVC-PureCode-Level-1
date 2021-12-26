unit uAppSystemCenter;

interface

uses
  Forms,
  System.SysUtils,
  System.Classes;

type
  TappSystemCenter = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }

    procedure ShowForm_Modal(T: TFormClass; F: TForm);
    procedure ShowForm_View(T: TFormClass; F: TForm);

  end;

var
  appSystemCenter: TappSystemCenter;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TappSystemCenter }

procedure TappSystemCenter.ShowForm_Modal(T: TFormClass; F: TForm); // GENERIC METHOD
begin
  try
    Application.CreateForm(T, F);
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TappSystemCenter.ShowForm_View(T: TFormClass; F: TForm); // GENERIC METHOD
begin
  Application.CreateForm(T, F);
  F.Show;
end;

end.
