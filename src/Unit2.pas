unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses UMainMenu, Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);

begin
if (edit.Text<>'') and (edit1.Text<>'') and (edit2.Text<>'') then
begin
ADOQuery1.Parameters.ParamByName('name').Value:=edit.Text;
ADOQuery1.Parameters.ParamByName('password').Value:=edit2.Text;
ADOQuery1.Parameters.ParamByName('date').Value:=edit2.Text;
ADOQuery1.ExecSQL;
end;
end;

end.
