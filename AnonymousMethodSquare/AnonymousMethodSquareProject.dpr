Program AnonymousMethodSquareProject;

{$APPTYPE CONSOLE}

{$R *.res}

Uses
  System.SysUtils;

Type
  TFunctionOfInteger = Reference To Function(x : Integer) : Integer;

Begin
  Var Square : TFunctionOfInteger := Function(x : Integer) : Integer
                                       Begin
                                         Result := x * x;
                                       End;
  Writeln(Square(6));
  Readln;
End.
