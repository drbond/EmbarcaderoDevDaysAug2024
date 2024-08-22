Program BirdSongsProject;

Uses
  Vcl.Forms,
  BirdSongsUnit in 'BirdSongsUnit.pas' {frmBirdSong},
  InterfaceUnit in 'InterfaceUnit.pas',
  BirdUnit in 'BirdUnit.pas';

{$R *.res}

Begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBirdSong, frmBirdSong);
  Application.Run;
End.
