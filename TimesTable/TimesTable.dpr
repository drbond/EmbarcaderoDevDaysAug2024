program TimesTable;

uses
  Vcl.Forms,
  TimesTableUnit in '..\..\Delphi10Progs\TimesTableUnit.pas' {frmTimesTable};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTimesTable, frmTimesTable);
  Application.Run;
end.
