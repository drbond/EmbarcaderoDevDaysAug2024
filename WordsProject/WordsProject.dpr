Program WordsProject;

{$APPTYPE CONSOLE}

{$R *.res}

Uses
  System.SysUtils,
  System.Classes;

Type
  TFunctionOfString = Reference to Function(AString : String) : Boolean;

Function Filter(GivenWordList : TStringList; f : TFunctionOfString) : TStringList;
  Begin
    Var FilteredNewWordList := TStringList.Create;
    For Var Word In GivenWordList
      Do
        If f(Word)
          Then FilteredNewWordList.Add(Word);
    Result := FilteredNewWordList;
  End;
Var
  WordLength : Integer;
Begin
  Var WordList := TStringList.Create;
  WordList.LoadFromFile('../../Sowpods.txt');
  Write('Input word length to filter on: ');
  Readln(WordLength);
  Var NewWordList := Filter(WordList, {with} Function (Word : String) : Boolean
                                           Begin
                                             If Word.Length = WordLength
                                               Then Result := True
                                               Else Result := False;
                                           End);
  If NewWordList.Count <> 0
    Then
      Begin
        For Var Word In NewWordList
          Do Writeln(Word);
        Writeln('Number of words of length ', WordLength, ' is ', NewWordList.Count);
      End
    Else Writeln('No words of length ', WordLength, ' is zero');
  Readln;
End.
