program Project1;

uses
  Vcl.Forms,
  Uprincipal in 'Uprincipal.pas' {Form1},
  view.dark in 'view.dark.pas' {FrmDark},
  view.drawer in 'view.drawer.pas' {frmDrawer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmDark, FrmDark);
  Application.CreateForm(TFrmDrawer, FrmDrawer);
  Application.CreateForm(TfrmDrawer, frmDrawer);
  Application.CreateForm(TfrmDrawer, frmDrawer);
  Application.Run;
end.
