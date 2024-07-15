unit Uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, View.UxieButton,
  model.button;

type
  TForm1 = class(TForm)
    UxieButton1: TUxieButton;
    UxieButton2: TUxieButton;
    procedure UxieButton1Click(Sender: TObject);
    procedure UxieButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses view.drawer;


procedure TForm1.UxieButton1Click(Sender: TObject);
var
  FDrawer: TfrmDrawer;
begin
  FDrawer := TfrmDrawer.Create(nil);
  try
    FDrawer.pnlListaTarefas.Visible:= false;
    FDrawer.pnlListaTarefas.SendToBack;
    FDrawer.pnlEmptyState.BringToFront;
    FDrawer.pnlEmptyState.Visible := true;
    FDrawer.ShowModal;
  finally
    FDrawer.Free;
  end;
end;

procedure TForm1.UxieButton2Click(Sender: TObject);
var
  FDrawer: TfrmDrawer;
begin
  FDrawer := TfrmDrawer.Create(nil);
  try
    FDrawer.pnlEmptyState.SendToBack;
    FDrawer.pnlEmptyState.Visible := false;
    FDrawer.pnlListaTarefas.BringToFront;
    FDrawer.pnlListaTarefas.Visible := true;
    FDrawer.ShowModal;
  finally
    FDrawer.Free;
  end;

end;

end.
