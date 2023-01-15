program PDD_Trainer;
uses
  Forms,
  UConfigBase in 'UConfigBase.pas',
  UConfigClient in 'UConfigClient.pas',
  UMainMenu in 'Forms\UMainMenu.pas' {FMainMenu},
  UResults in 'Forms\UResults.pas' {FResults},
  UTrainer in 'Forms\UTrainer.pas' {FTrainer},
  Vcl.Themes,
  Vcl.Styles,
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'ПДД Тренажёр';
  Config := TAccessToFiles.Create();
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFTrainer, FTrainer);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFResults, FResults);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
