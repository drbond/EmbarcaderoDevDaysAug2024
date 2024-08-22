Program TArrayHelperProject;

{$APPTYPE CONSOLE}

{$R *.res}

Uses TArrayHelperUnit in 'TArrayHelperUnit.pas';


Var
  DbleArr1 : TArray<Double> = [1, 2, 3];
  DbleArr2 : TArray<Double> = [5, 4, 3, 2, 1];
  MiddleValuesOfADoublebleArray : TArray<Double>;
Begin
  DbleArr1.ForEach(Procedure(Var ValueInArray : Double) Begin ValueInArray := ValueInArray * 2 End);
  Writeln(DbleArr1.ToString);

  Var NewDbleArray  := DbleArr1.Map(Function(ValueInArray : Double) : Double
                                      Begin Result := ValueInArray * ValueInArray End);
  Writeln(NewDbleArray.ToString);

  MiddleValuesOfADoublebleArray := DbleArr2.Filter(Function(ValueInArray : Double; i : Integer) : Boolean
                                         Begin Result := (ValueInArray > 1) And (ValueInArray < 5) End);
  Writeln(MiddleValuesOfADoublebleArray.ToString);

  DbleArr2.Map(Function(ValueInArray : Double) : Double
                           Begin
                             Result := ValueInArray + 5;
                           End).Filter(Function(ValueInArray : Double; Index : Integer) : Boolean
                                         Begin
                                           Result := (Index Mod 2) = 0;
                                         End).ForEach(Procedure(Var ValueInArray : Double)
                                                        Begin Write(ValueInArray : 2 : 0) End);
  Readln;
End.
