object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 388
  Width = 566
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\mohi1\Desk' +
      'top\'#1091#1088#1086#1082#1080'\pdd-test-project-master\data\pdd_db.mdb;Persist Securi' +
      'ty Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 168
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'ADOQuery1')
    Left = 48
    Top = 16
  end
end
