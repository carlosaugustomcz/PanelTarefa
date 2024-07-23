unit model.task;

interface

uses
  System.SysUtils, System.Generics.Collections, System.DateUtils;

type
  TTask = class
  private
    FUser: String;
    FExecutionType: String;
    FClientId: Integer;
    FCompetence: TDateTime;
    FApplication: Integer;
    FProcessType: Integer;
    FNickName: String;
    FStatus: String;
    FTimeoutMin: Integer;
    FHost: String;
    FErrorCount: Integer;
    FErrorMessage: String;
    FDataCriacao: TDateTime;
    FDataAlteracao: TDateTime;
  public
    property User: String read FUser write FUser;
    property ExecutionType: String read FExecutionType write FExecutionType;
    property ClientId: Integer read FClientId write FClientId;
    property Competence: TDateTime read FCompetence write FCompetence;
    property Application: Integer read FApplication write FApplication;
    property ProcessType: Integer read FProcessType write FProcessType;
    property NickName: String read FNickName write FNickName;
    property Status: String read FStatus write FStatus;
    property TimeoutMin: Integer read FTimeoutMin write FTimeoutMin;
    property Host: String read FHost write FHost;
    property ErrorCount: Integer read FErrorCount write FErrorCount;
    property ErrorMessage: String read FErrorMessage write FErrorMessage;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
    property DataAlteracao: TDateTime read FDataAlteracao write FDataAlteracao;

    destructor Destroy; override;
  end;

const
  STATUS_WAITING = 'waiting';
  STATUS_RUNNING = 'running';
  STATUS_COMPLETED = 'completed';
  STATUS_TIMEOUT_REACHED = 'timeout_reached';
  STATUS_ERROR = 'error';

implementation

destructor TTask.Destroy;
begin
  inherited;
end;

end.
