unit view.drawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, model.drawer,View.Dark,
  View.UxieAccordion, model.accordion, Vcl.StdCtrls, model.uxielabeluxie,
  View.UxieButton, model.button, View.UxieIconShape, model.iconshape,
  Vcl.Imaging.pngimage, Vcl.Grids, AdvObj, BaseGrid, model.uxieGrid, model.table,
  Vcl.Imaging.jpeg, View.UxieDropdown, model.dropdown, View.UxieInputSearch,
  model.inputsearch;

type
  TfrmDrawer = class(TForm)
    UxieDrawer1: TUxieDrawer;
    pnlEmptyState: TPanel;
    LNada: TLabel;
    LTarefa: TLabel;
    LQuando: TLabel;
    ImgCloud: TImage;
    pnlListaTarefas: TPanel;
    pnlTituloSegundoPlano: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    pnltabela: TPanel;
    tableListagem: TUxieTable;
    UxieDropDown1: TUxieDropDown;
    UxieInputSearch1: TUxieInputSearch;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrawer: TfrmDrawer;

implementation

{$R *.dfm}

procedure TfrmDrawer.FormShow(Sender: TObject);
begin
  TFrmDark.GetInstance(Self).Show;

end;

end.
