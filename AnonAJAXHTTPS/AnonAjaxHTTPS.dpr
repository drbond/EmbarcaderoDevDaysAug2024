Program AnonAjaxHTTPS;
Uses
  Forms,
  AnonAjax_MainForm in 'AnonAjax_MainForm.pas' {FormAnonAjax},
  AnonAjax_Thread in 'AnonAjax_Thread.pas';

{$R *.res}
Begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAnonAjax, FormAnonAjax);
  Application.Run;
End.
