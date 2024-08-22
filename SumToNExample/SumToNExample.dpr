Program SumToNExample;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils,
  ISumUnit in 'ISumUnit.pas',
  TSumUnit in 'TSumUnit.pas';

Var
  n : Integer;
  SumObjectReference : ISum;
Begin
  SumObjectReference := TSum.Create;
  Write('Input n: ');
  Readln(n);
  Writeln(SumObjectReference.SumTo(n));
  Readln;
End.
