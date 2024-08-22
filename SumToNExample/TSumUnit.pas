Unit TSumUnit;
Interface
  Uses ISumUnit;
  Type
    TSum = Class(TInterfacedObject, ISum)
             Public
               Function SumTo(n  : Integer) : Integer;
           End;
Implementation
  Function TSum.SumTo(n : Integer) : Integer;
    Begin
      Result := ((n + 1) * n) Div 2;
    End;
End.
