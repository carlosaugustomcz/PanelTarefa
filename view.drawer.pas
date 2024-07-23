unit view.drawer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, model.drawer,View.Dark,
  View.UxieAccordion, model.accordion, Vcl.StdCtrls, model.uxielabeluxie,
  View.UxieButton, model.button, View.UxieIconShape, model.iconshape,
  Vcl.Imaging.pngimage, Vcl.Grids, AdvObj, BaseGrid, model.uxieGrid, model.table,
  Vcl.Imaging.jpeg, View.UxieDropdown, model.dropdown, View.UxieInputSearch,
  model.inputsearch, Data.DB, Datasnap.DBClient, SimpleDS, Data.FMTBcd,
  Data.SqlExpr, Vcl.ImgList, AdvUtil, CmImageList, View.UxieIcon, model.icon;

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
    pnltabela: TPanel;
    dsTarefas: TDataSource;
    dataTarefas: TSimpleDataSet;
    dataTarefasstatus1: TStringField;
    dataTarefasstatus2: TStringField;
    CmImageList1: TCmImageList;
    tableListagem: TUxieTable;
    ListaTarefaDropDown: TUxieDropDown;
    UxieInputSearch1: TUxieInputSearch;
    UxieIcon1: TUxieIcon;
    procedure AddTask(const TaskName, TaskStatus: string);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UxieTable1GetDisplText(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure tableListagemClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure ListaTarefaDropDownChange(Sender: TObject);
    function ShowSelectedItem(index:integer): string;
    procedure ApplyFilters;
    procedure UxieInputSearch1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrawer: TfrmDrawer;


implementation

{$R *.dfm}

uses model.task, Unit2;

const
  STATUS_ERRO_PROCESSAMENTO = 'Erro processamento';
  STATUS_CONCLUIDO = 'Concluído';
  STATUS_EM_ANDAMENTO = 'Em andamento';
  STATUS_NAO_INICIADA = 'Não Iniciada';
  TASK_NAME = 'Importações de notas';

procedure TfrmDrawer.FormCreate(Sender: TObject);
begin
  dataTarefas.CreateDataset;
  AddTask(TASK_NAME, STATUS_ERRO_PROCESSAMENTO);
  AddTask(TASK_NAME, STATUS_ERRO_PROCESSAMENTO);
  AddTask(TASK_NAME, STATUS_ERRO_PROCESSAMENTO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_CONCLUIDO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_CONCLUIDO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_EM_ANDAMENTO);
  AddTask(TASK_NAME, STATUS_CONCLUIDO);
  AddTask(TASK_NAME, STATUS_NAO_INICIADA);
  AddTask(TASK_NAME, STATUS_NAO_INICIADA);
  dataTarefas.First;

  end;

procedure TfrmDrawer.FormShow(Sender: TObject);
begin
  TFrmDark.GetInstance(Self).Show;

end;

procedure TfrmDrawer.ListaTarefaDropDownChange(Sender: TObject);
begin
  UxieInputSearch1.edtInput.Text:= '';
  ApplyFilters;
end;

function TfrmDrawer.ShowSelectedItem(index: integer): string;
begin
  case index of
    0: Result := STATUS_EM_ANDAMENTO;
    1: Result := STATUS_NAO_INICIADA;
    2: Result := STATUS_ERRO_PROCESSAMENTO;
    3: Result := STATUS_CONCLUIDO;
  else
    Result:= '';
  end;
end;

procedure TfrmDrawer.tableListagemClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ACol = 2 then
  begin
    with TForm2.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TfrmDrawer.UxieInputSearch1Click(Sender: TObject);
begin
  ApplyFilters;
end;

procedure TfrmDrawer.UxieTable1GetDisplText(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
  if (ACol = 2) and (ARow > 0)then
    Value := '<P align="center"><IMG src="idx:' + IntToStr(0) + '"></P>';

  tableListagem.Columns[ACol].TextStatus := Value;

  if Value = STATUS_ERRO_PROCESSAMENTO then
    tableListagem.Columns[ACol].Status := negativa
  else if Value = STATUS_CONCLUIDO then
    tableListagem.Columns[ACol].Status := positiva
  else if Value = STATUS_EM_ANDAMENTO then
    tableListagem.Columns[ACol].Status := neutra;

  if tableListagem.Columns[ACol].Kind = status then
    Value := '';


end;

procedure TfrmDrawer.AddTask(const TaskName, TaskStatus: string);
begin
  dataTarefas.Append;
  dataTarefasstatus1.AsString := TaskName;
  dataTarefasstatus2.AsString := TaskStatus;
  dataTarefas.Post;
end;

procedure TfrmDrawer.ApplyFilters;
var
  filterText, statusFilter: string;
begin
  dataTarefas.Filtered := False;

  filterText := UxieInputSearch1.edtInput.Text;
  statusFilter := ShowSelectedItem(ListaTarefaDropDown.ItemIndex);

  if filterText <> '' then
    statusFilter:= '';

  if (statusFilter <> '') and (ListaTarefaDropDown.ItemIndex <> -1) then
    dataTarefas.Filter := Format('status2 = %s ', [QuotedStr(statusFilter)])
  else if filterText <> '' then
    dataTarefas.Filter := Format('status2 LIKE %s', [QuotedStr('%' + filterText + '%')]);

  dataTarefas.Filtered := True;

  dataTarefas.First;
  while not dataTarefas.Eof do
  begin
    tableListagem.Cells[0, tableListagem.RowCount - 1] := dataTarefas.FieldByName('status1').AsString;
    tableListagem.Cells[1, tableListagem.RowCount - 1] := dataTarefas.FieldByName('status2').AsString;
    dataTarefas.Next;
  end;
end;


end.

