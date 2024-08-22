
Unit ReflectiveProgrammingUnit;

Interface
Type
  TTestClass = Class
                 Procedure DisplayHelloMsg;
                 Constructor Create;
               End;

Implementation

Procedure TTestClass.DisplayHelloMsg;
  Begin
    Writeln('The type TTestClass is found at runtime' + #10#13
             + 'by interrogating the Runtime type information.');
    Writeln;
    Writeln('A reference to its method create is then obtained' + #10#13
             + 'and invoked to create an object of this type.');
    Writeln;
    Writeln('A reference to its method DisplayHelloMsg is obtained next' + #10#13
             + 'and then this method is invoked to display this message.');
    Writeln;
    Writeln('Press return to close this console window');
  End;

Constructor TTestClass.Create;
  Begin
    Inherited;
  End;
End.
