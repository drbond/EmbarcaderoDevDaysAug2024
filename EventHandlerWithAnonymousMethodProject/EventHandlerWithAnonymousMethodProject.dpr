Program EventHandlerWithAnonymousMethodProject;

Uses
  Vcl.Forms,
  EventHandlerWithAnonymousMethodUnit in 'EventHandlerWithAnonymousMethodUnit.pas' {frmAnonymousProcedureEventHandler};

{$R *.res}

Begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAnonymousProcedureEventHandler, frmAnonymousProcedureEventHandler);
  Application.Run;
End.
