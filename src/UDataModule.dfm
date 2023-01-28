object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 388
  Width = 566
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\mohi1\Desktop\'#1091#1088#1086#1082#1080'\pdd-test-project-master\data\pdd_db.mdb;' +
      'Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:Syste' +
      'm database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pass' +
      'word="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=' +
      '1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tran' +
      'sactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create S' +
      'ystem Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:' +
      'Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without Rep' +
      'lica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 128
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'ADOQuery1')
    Left = 48
    Top = 16
  end
  object ADOTable1: TADOTable
    Left = 224
    Top = 24
  end
end
