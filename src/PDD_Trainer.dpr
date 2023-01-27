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
  Unit1 in 'Forms\Unit1.pas' {DB_Results};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'ПДД Тренажёр';
  Config := TAccessToFiles.Create();
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFTrainer, FTrainer);
  Application.CreateForm(TFResults, FResults);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDB_Results, DB_Results);
  Application.Run;
end.
