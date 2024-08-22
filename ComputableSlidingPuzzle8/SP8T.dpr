program SP8T;

uses
  System.StartUpCopy,
  FMX.Forms,
  SlidingPuzzle8T in 'SlidingPuzzle8T.pas' {PuzzleForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPuzzleForm, PuzzleForm);
  Application.CreateForm(TPuzzleForm, PuzzleForm);
  Application.Run;
end.
