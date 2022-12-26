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
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := 'ПДД Тренажёр';
  Config := TAccessToFiles.Create();
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFResults, FResults);
  Application.CreateForm(TFTrainer, FTrainer);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
