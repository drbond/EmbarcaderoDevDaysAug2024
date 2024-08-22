Unit TArrayHelperUnit;
{Based on an article written by Pavel Prilukov -}
{https://habr-com.translate.goog/en/post/243721/?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en}
Interface

Uses
  System.SysUtils,
  Math, System.Generics.Collections;

Type
  TArrayHelper = Record Helper For TArray<Double>
                   Strict Private
                     Type
                       TForEachRef = Reference To Procedure(Var x : Double);
                       TMapRef = TFunc<Double, Double>;
                       TFilterRef = TFunc<Double, Integer, Boolean>;
                       TPredicateRef = TFunc<Double, Boolean>;
                       TReduceRef = TFunc<Double, Double, Boolean>;
                   Public
                     Function ToString : String;
                     Procedure ForEach(Lambda : TForEachRef);
                     Function Map(Lambda : TMapRef) : TArray<Double>;
                     Function Filter(Lambda : TFilterRef) : TArray<Double>;
                     Function Every(Lambda : TPredicateRef) : Boolean;
                     Function Some(Lambda : TPredicateRef) : Boolean;
                     Function Reduce(Lambda : TReduceRef) : Double; Overload;
                     Function Reduce(Init : Double; Lambda : TReduceRef) : Double; Overload;
                 End;
Implementation
Function TArrayHelper.ToString : String;
  Var
    DoubleArrayResult : TArray<String>;
  Begin
    If Length(Self) = 0
      Then Result :='[]'
      Else
        Begin
          ForEach(Procedure(Var x : Double)
                    Begin
                      DoubleArrayResult := DoubleArrayResult + [FloatToStr(x)];
                    End);
          Result := '[' + String.Join(', ', DoubleArrayResult) + ']';
        End;
  End;
Procedure TArrayHelper.ForEach(Lambda : TForEachRef);
  Begin
    For Var i := 0 To High(Self)
      Do Lambda(Self[i]);
  End;
Function TArrayHelper.Map(Lambda : TMapRef) : TArray<Double>; //Returns a new array
  Begin
    For Var x In Self
      Do Result := Result + [Lambda(x)]; //Dynamic array extended by one modified element at a time
  End;
Function TArrayHelper.Filter(Lambda : TFilterRef) : TArray<Double>; //Returns a new array
  Begin
    For Var j := 0 To High(Self)
      Do
        If Lambda(Self[j], j)  // Can filter on the value or the index
          Then Result := Result +[Self[j]]; //New array created one element at a time
  End;
Function TArrayHelper.Every(Lambda : TPredicateRef) : Boolean;
  Begin

  End;
Function TArrayHelper.Some(Lambda : TPredicateRef) : Boolean;
  Begin

  End;
Function TArrayHelper.Reduce(Lambda : TReduceRef) : Double;
  Begin

  End;
Function TArrayHelper.Reduce(Init : Double; Lambda : TReduceRef) : Double;
  Begin

  End;

End.
