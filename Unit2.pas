unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, model.drawer;

type
  TForm2 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  view.dark;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin
  TFrmDark.GetInstance(Self).Show;

end;

end.
