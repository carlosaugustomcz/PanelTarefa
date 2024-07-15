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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrawer: TfrmDrawer;

implementation

{$R *.dfm}

procedure TfrmDrawer.FormCreate(Sender: TObject);
begin
  SimpleDataSet1.CreateDataSet;
  SimpleDataSet1.Append;
  SimpleDataSet1ativo.AsBoolean := False;
  SimpleDataSet1nome.AsString := 'Felipe Alexandre';
  SimpleDataSet1cpf.AsString := '111111';
  SimpleDataSet1status.AsInteger := 1;
  SimpleDataSet1.Post;

  SimpleDataSet1.Append;
  SimpleDataSet1ativo.AsBoolean := False;
  SimpleDataSet1nome.AsString := 'Isadora Alves';
  SimpleDataSet1cpf.AsString := '222222';
  SimpleDataSet1status.AsInteger := 2;
  SimpleDataSet1.Post;

  SimpleDataSet1.Append;
  SimpleDataSet1ativo.AsBoolean := False;
  SimpleDataSet1nome.AsString := 'Dani Gapasriam';
  SimpleDataSet1cpf.AsString := '333333';
  SimpleDataSet1status.AsInteger := 3;
  SimpleDataSet1.Post;

  SimpleDataSet1.Append;
  SimpleDataSet1ativo.AsBoolean := False;
  SimpleDataSet1nome.AsString := 'Caleb';
  SimpleDataSet1cpf.AsString := '444444';
  SimpleDataSet1status.AsInteger := 4;
  SimpleDataSet1.Post;

end;

procedure TfrmDrawer.FormShow(Sender: TObject);
begin
  TFrmDark.GetInstance(Self).Show;

end;

end.
