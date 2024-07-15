unit view.dark;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFrmDark = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
    class var FInstance: TFrmdark;
  public
    procedure AjustarTela(aHeight,aWidth: Integer);
    class function GetInstance(const APai: TForm) : TFrmdark;
    { Public declarations }

  end;

var
  FrmDark: TFrmDark;

implementation

{$R *.dfm}

{ TFrmDark }

procedure TFrmDark.AjustarTela(aHeight,aWidth: Integer);
begin
  Self.Height := aHeight;
  Self.Width := aWidth;
end;

procedure TFrmDark.FormClick(Sender: TObject);
begin
  TForm(Owner).SetFocus;
end;

procedure TFrmDark.FormShow(Sender: TObject);
begin
  Self.AjustarTela(Screen.Height,Screen.Width);
  BorderStyle := bsNone;
end;

class function TFrmDark.GetInstance(const APai: TForm): TFrmdark;
begin
  FInstance := TFrmDark.Create(APai);
  Result := FInstance;
end;

end.
