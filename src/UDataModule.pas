unit UDataModule;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient, System.DateUtils,
  UTrainer, jpeg,System.Hash;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    procedure Bilets();
    function ExamQuery():integer;
    function ShowResults(user_id:integer):TDataSet;
    function InsertUserResults(user_id:integer;time_test:string;id_bilet:integer;imvalid_vopr:string;true_vopr:string;rejim:string):boolean;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Trainer:TFTrainer;
  end;

var
  DataModule1: TDataModule1;

implementation
uses UMainMenu;

procedure TDataModule1.Bilets();  //выводит билеты в ComboBox
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets';
    Open;
    First;
    WHile not(eof) do
    begin
      FMainMenu.ComboBox1.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
end;

 function TDataModule1.ExamQuery():integer; //экзамен
begin
    with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT COUNT(*) FROM bilets';
    Open;
    if(Fields[0].AsString <> '')then
    begin
      Result:=Fields[0].AsInteger;
    end;
  end;
end;
function TDataModule1.ShowResults(user_id:integer):TDataSet;
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Text:='SELECT time_test, id_bilet, imvalid_vopr, true_vopr, rejim, timer FROM results WHERE id_users=:i';
    Parameters.ParamByName('i').Value:=user_id;
    Open;
    Result:=ADOQuery1;
    except
     ShowMessage('Что-то пошло не так');
    end;
  end;
end;
 function TDataModule1.InsertUserResults(user_id: Integer; time_test: string; id_bilet: Integer; imvalid_vopr: string; true_vopr: string; rejim: string): Boolean; //Внесение результатов в БД
begin
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    try
    SQL.Add('INSERT INTO results (id_users,time_test, id_bilet, imvalid_vopr, true_vopr, rejim, timer)');
    SQL.Add('VALUES (:p1,Date(),:p2,:p3,:p4,:p5,:p6)');
    Parameters.ParamByName('p1').Value := user_id;
    Parameters.ParamByName('p2').Value :=time_test;
    Parameters.ParamByName('p3').Value := id_bilet;
    Parameters.ParamByName('p4').Value :=imvalid_vopr;
    Parameters.ParamByName('p5').Value := true_vopr;
    Parameters.ParamByName('p6').Value := rejim;
    ExecSQL;
    Close;
    Result:=True;
    except
    begin
      ShowMessage('Что-то пошло не так');
      Result:=False;
    end;
    end;
  end;
end;
procedure TDataModule1.DataModuleCreate(Sender: TObject);  //Подключение к БД
begin
  var PASSWORD_TO_DB := EmptyStr;
  try
    ADOConnection1.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;'+
        'User ID=Admin;'+
        'Data Source='+Config.PathDataBase+';'+
        'Mode=Share Deny None;'+
        'Extended Properties="";'+
        'Jet OLEDB:System database="";'+
        'Jet OLEDB:Registry Path="";'+
        'Jet OLEDB:Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Engine Type=5;'+
        'Jet OLEDB:Database Locking Mode=1;'+
        'Jet OLEDB:Global Partial Bulk Ops=2;'+
        'Jet OLEDB:Global Bulk Transactions=1;'+
        'Jet OLEDB:New Database Password="'+PASSWORD_TO_DB+'";'+
        'Jet OLEDB:Create System Database=False;'+
        'Jet OLEDB:Encrypt Database=False;'+
        'Jet OLEDB:Don'+'''t Copy Locale on Compact=False;'+
        'Jet OLEDB:Compact Without Replica Repair=False;'+
        'Jet OLEDB:SFP=False';

    ADOConnection1.Connected := true;
  except on E : Exception do
    begin
      ShowMessage(Format('Ошибка при подключении к БД. %s', [E.Message]));
      Application.Terminate;
    end;
  end;
end;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}




end.
