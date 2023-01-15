unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

 uses UMainMenu, Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var log, pas: String;
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT password FROM users WHERE name='+#39+Edit1.Text+#39);
  ADOQuery1.Open;
  if ADOQuery1.IsEmpty
    then
      ShowMessage('Пользователь '+Edit1.Text+' не найден!')
    else
      if ADOQuery1.FieldByName('Password').Value <> Edit2.Text
        then
          ShowMessage('Введен не верный пароль!')
        else
          FMainMenu.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.Show;
  Form1.Close;


end;

end.
