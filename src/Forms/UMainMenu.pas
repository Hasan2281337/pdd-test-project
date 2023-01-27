unit UMainMenu;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient, Data.SqlExpr;
type
  TFMainMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Button6: TButton;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button7: TButton;
    Memo1: TMemo;
    ADOConnection1: TADOConnection;
    SQLConnection1: TSQLConnection;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditLogin: TEdit;
    EditPassword: TEdit;
    Enter: TButton;
    Registration: TButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditRegLogin: TEdit;
    EditRegPassword: TEdit;
    Button8: TButton;
    ADOQuery1: TADOQuery;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EnterClick(Sender: TObject);
    procedure RegistrationClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FMainMenu: TFMainMenu;
  number_bil:integer;
  rejim,kol_bilets:Integer;
   flag_ex:boolean;
implementation
uses UTrainer, UDataModule, Unit1;
{$R *.dfm}
procedure TFMainMenu.Button1Click(Sender: TObject);
begin
  if(application.MessageBox(PChar('Хотите выйти из программы ?'),'Информация .',mb_YesNo or mb_iconquestion)=mrYes)then
    FMainMenu.Close;
end;
procedure TFMainMenu.Button2Click(Sender: TObject);
begin
  ComboBox1.Clear;
  DataModule1.Bilets;
  GroupBox1.Visible:=True;
end;
procedure TFMainMenu.Button3Click(Sender: TObject);
begin
  kol_bilets:=DataModule1.ExamQuery();
  rejim:=Ord(Exam);
  flag_ex:=True;
  FTrainer:= TFTrainer.Create(Application);
  FTrainer.Show();
  FMainMenu.Hide;
end;
procedure TFMainMenu.Button4Click(Sender: TObject);
begin
  Panel1.Visible := True;
end;
procedure TFMainMenu.Button5Click(Sender: TObject);
begin
  Panel1.Visible:=False;
end;
procedure TFMainMenu.Button6Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;
procedure TFMainMenu.Button7Click(Sender: TObject);
begin
  if(ComboBox1.ItemIndex <> -1)then
  begin
    number_bil:=StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
    FMainMenu.Hide;
    FTrainer:=TFTrainer.Create(Self);
    rejim:=Ord(Education);
    flag_ex:=False;
    FTrainer.Show();
  end else
    ShowMessage('Вы не выбрали билет!');
end;
procedure TFMainMenu.Button8Click(Sender: TObject); //регистрация
begin
    if (EditRegLogin.Text<>' ') and (EditRegPassword.Text<>' ') then
    begin
    ADOQuery1.SQL.text:='INSERT INTO users (UserName, UserPass) VALUES('+QuotedStr(EditRegLogin.Text)+', '+QuotedStr(EditRegPassword.Text)+')';
    ADOQuery1.ExecSQL;
    end;
    Groupbox3.Visible:=False;
    Groupbox2.Visible:=True;
end;

procedure TFMainMenu.Button9Click(Sender: TObject);
begin
FMainMenu.Hide;
Application.CreateForm(TDB_Results,DB_Results);
DB_Results.ShowModal;
end;

procedure TFMainMenu.EnterClick(Sender: TObject); //авторизация
begin
  begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT UserPass FROM users WHERE UserName='+#39+EditLogin.Text+#39);
  ADOQuery1.Open;
  if ADOQuery1.IsEmpty
    then
    begin
      ShowMessage('Пользователь '+EditLogin.Text+' не найден!');
      Groupbox2.Visible:= True;
    end
    else
      if ADOQuery1.FieldByName('UserPass').Value <> EditPassword.Text
        then
        begin
          ShowMessage('Введен не верный пароль!');
          Groupbox2.Visible:= True;
        end
        else
          Groupbox2.Visible:=False;
          FMainMenu.Show;
  end;
end;

procedure TFMainMenu.FormCreate(Sender: TObject);
begin
  GroupBox2.Visible:=True;
  GroupBox3.Visible:=False;
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


procedure TFMainMenu.RegistrationClick(Sender: TObject);// переход к регистрации
begin
Groupbox2.Visible:=False;
Groupbox3.Visible:=True;
end;

end.
