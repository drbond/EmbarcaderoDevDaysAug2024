Unit BirdUnit;

Interface
  Uses InterfaceUnit, BirdSongsUnit, Dialogs;
  Type
    TBird = Class(TInterfacedObject, IBird)
              Private
                FName : String;
                FSongFileName : String;
              Public
                Function GetBirdName : String;
                Function GetSongFileName : String;
                Constructor Create(BirdName, SongFileName : String);
            End;

Implementation

  Constructor TBird.Create(BirdName, SongFileName: String);
    Begin
      FName := BirdName;
      FSongFileName := SongFileName;
    End;

  Function TBird.GetBirdName : String;
    Begin
      Result := FName;
    End;

  Function TBird.GetSongFileName : String;
    Begin
      Result := FSongFileName;
    End;

End.
