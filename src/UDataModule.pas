unit UDataModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, UConfigClient, System.DateUtils;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure valid_test();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation
uses UMainMenu, UResults, UTrainer;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDataModule1.valid_test();
var
  true_otv:String;
begin
   { if(RadioButton1.Checked)then
      res[index_vopr]:='¹1';
    if(RadioButton2.Checked)then
      res[index_vopr]:='¹2';
    if(RadioButton3.Checked)then
      res[index_vopr]:='¹3';
    if(RadioButton4.Checked)then
      res[index_vopr]:='¹4';  }
  with FMainMenu.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT * FROM bilets WHERE id=:i';
    Parameters.ParamByName('i').Value:=number_bil;
    Open;
    true_otv:=Fields[index_vopr].AsString;
  end;

  {im[index_vopr].Picture.Bitmap := nil;

  if(true_otv = res[index_vopr])then
  begin
    ImageList1.GetBitmap(0, im[index_vopr].Picture.Bitmap);
    res_[index_vopr]:=1;
  end else
  begin
    ImageList1.GetBitmap(1, im[index_vopr].Picture.Bitmap);
    res_[index_vopr]:=0;
  end;}
end;

end.
