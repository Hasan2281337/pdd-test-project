unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TDB_Results = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DB_Results: TDB_Results;

implementation
 uses UMainMenu,UDataModule;
{$R *.dfm}

procedure TDB_Results.Button1Click(Sender: TObject);
begin
   DB_Results.Close();
end;
procedure TDB_Results.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMainMenu.Show();
end;
procedure TDB_Results.FormCreate(Sender: TObject);
begin
   DataSource1.DataSet:=DataModule1.ShowResults(user_id);
if(DataSource1.DataSet.IsEmpty<>True)then
  begin
    DBGrid1.Columns[0].Width:=64;
    DBGrid1.Columns[1].Width:=64;
    DBGrid1.Columns[2].Width:=135;
    DBGrid1.Columns[3].Width:=125;
    DBGrid1.Columns[4].Width:=89;
    DBGrid1.Columns[5].Width:=64;
  end
  else
  begin
    DBGrid1.Visible:=False;
  end;
end;

end.
