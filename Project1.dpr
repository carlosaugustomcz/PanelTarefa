program Project1;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {Form1},
  view.dark in 'view.dark.pas' {FrmDark},
  view.drawer in 'view.drawer.pas' {frmDrawer},
  model.task in 'class\model.task.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
