Unit SlidingPuzzle8T;

Interface

Uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Platform;

Type
  TPuzzleForm = Class(TForm)
                  TextComputableSP8Title : TText;
                  TextECSLtdTitle : TText;
                  TextInstructionsMsg : TText;
                  Procedure FormCreate(Sender : TObject);
                  Procedure OnClick (Sender : TObject);
                End;

  TTileState = (Empty, Occupied);

  TEdge = (CTop, CBottom, CLeft, CRight);

  TNumber = Class(TText)

            End;
  { -------- x
    |
    |
    |
    y
  }
  TTile = Class (TRectangle)
            Constructor CreateTile(x, y : Integer; No : String);
            Procedure Swap(Edge : TEdge; y, x : Integer);
            Procedure ClearTile;
            Function FindWhatRowNo : Integer;
            Function FindWhatColumnNo : Integer;
            Function FindWhatState : TTileState;
            Private
              State : TTileState;
              y : Integer;
              x : Integer;
              Number : TNumber;
              AssignedNo : Integer;
          End;

  TPArrayRow = Array[0..2] Of TTile;

  TPArray = Array [0..2] Of TPArrayRow;

  TSPuzzle8 = Class
                Constructor Create;
                Private
                  PArray : TPArray;
              End;
Var
  PuzzleForm : TPuzzleForm;
  SP : TSPuzzle8;
  Frame : TRectangle;
Implementation

  {$R *.fmx}
  {$R *.SmXhdpiPh.fmx ANDROID}
  {$R *.NmXhdpiPh.fmx ANDROID}
  {$R *.LgXhdpiPh.fmx ANDROID}

  Type
    TBlankTilePosition = Record
                           x : Integer;
                           y : Integer;
                         End;
    TRandomNoArray = Array[0..8] Of Integer;

 Var
    BlankTilePosition : TBlankTilePosition;

  Constructor TTile.CreateTile(x,  y : Integer; No : String);
    Var
      Tile : TTile;
    Begin
      Tile := Inherited Create(PuzzleForm);
      Tile.Width := 100;
      Tile.Height := 100;
      Tile.Position.X := 5 + x* Width;
      Tile.Position.Y := 5 + y*Height;
      Tile.y := y;
      Tile.x := x;
      Tile.State := Occupied;
      Tile.Fill.Color := $FFE0E0E0;
      Tile.Fill.Kind := TBrushKind.Solid;
      Tile.CornerType := TCornerType.Round;
      Tile.XRadius := 5;
      Tile.YRadius := 5;
      Tile.Visible := True;
      Tile.Parent := Frame;
      Tile.Number := TNumber.Create(Tile);
      Tile.Number.Position.x :=  0;
      Tile.Number.Position.y :=  0;
      Tile.Number.Width := 100;
      Tile.Number.Height := 100;
      Tile.Number.TextSettings.FontColor := TAlphaColorRec.Crimson;
      Tile.Number.Font.Size := 20;
      Tile.Number.Text := No;
      Tile.Number.Parent := Tile;
      Tile.Number.Visible := True;
      Tile.Number.OnClick := PuzzleForm.OnClick;
    End;

 Function GetState(State : TTileState) : Integer;
    Begin
      Case State Of
        Empty : Result := 0;
        Occupied : Result := 1;
        Else Result := 0;
      End;
    End;

  Procedure TTile.Swap(Edge : TEdge; y, x : Integer);
    Var
      TileNumber, BlankTile : TTile;
    Begin
      TileNumber := SP.PArray[x, y];
      Case Edge Of
        CTop : Begin
                 BlankTile := SP.PArray[x, y - 1];
                 SP.PArray[x, y] := BlankTile;
                 SP.PArray[x, y - 1] := TileNumber;
                 SP.PArray[x, y - 1].y := y - 1;
                 SP.PArray[x, y].y := y;
                 TileNumber := SP.PArray[x, y - 1];
                 TileNumber.Position.Y := 5 + (y - 1)*Height;
                 BlankTile := SP.PArray[x, y];
                 BlankTile.Position.Y := 5 + y*Height;
               End;
        CBottom : Begin
                    BlankTile := SP.PArray[x, y + 1];
                    SP.PArray[x, y] := BlankTile;
                    SP.PArray[x, y + 1] := TileNumber;
                    SP.PArray[x, y + 1].y := y + 1;
                    SP.PArray[x, y].y := y;
                    TileNumber.Position.Y := 5 + (y + 1)*Height;
                    BlankTile.Position.Y := 5 + y*Height;
                  End;
        CLeft : Begin
                  BlankTile := SP.PArray[x - 1, y];
                  SP.PArray[x, y] := BlankTile;
                  SP.PArray[x - 1, y] := TileNumber;
                  SP.PArray[x - 1, y].x := x - 1;
                  SP.PArray[x, y].x := x;
                  TileNumber := SP.PArray[x - 1, y];
                  TileNumber.Position.X := 5 + (x - 1)*Height;
                  BlankTile :=  SP.PArray[x, y];
                  BlankTile.Position.X := 5 + x*Height;
                End;
        CRight : Begin
                   BlankTile := SP.PArray[x + 1, y];
                   SP.PArray[x, y] := BlankTile;
                   SP.PArray[x + 1, y] := TileNumber;
                   SP.PArray[x + 1, y].x := x + 1;
                   SP.PArray[x, y].x := x;
                   TileNumber := SP.PArray[x + 1, y];
                   TileNumber.Position.X := 5 + (x + 1)*Height;
                   BlankTile := SP.PArray[x, y];
                   BlankTile.Position.X  := 5 + x*Height;
                 End;
      End;
      BlankTilePosition.x := x;
      BlankTilePosition.y := y;
    End;

  Procedure TPuzzleForm.OnClick(Sender : TObject);
    Var
      Number : TNumber;
      RowNo, ColumnNo : Integer;
      Tile : TTile;
    Begin
      If Sender Is TNumber
        Then
          Begin
            Number := Sender As TNumber;
            Tile := (Number.Owner) As TTile;
            If Tile.FindWhatState = Occupied
              Then
                Begin
                  RowNo := Tile.y;
                  ColumnNo := Tile.x;
                  If ((Abs(BlankTilePosition.x - Tile.x)) = 1)  And ((Abs(BlankTilePosition.y - Tile.y)) = 0)
                    Then
                      Begin
                        If BlankTilePosition.x < ColumnNo
                          Then Tile.Swap(CLeft, RowNo, ColumnNo)
                          Else Tile.Swap(CRight, RowNo, ColumnNo);
                      End
                    Else
                      If (Abs(BlankTilePosition.y - Tile.y) = 1) And ((Abs(BlankTilePosition.x - Tile.x)) = 0)
                        Then
                          Begin
                            If BlankTilePosition. y < RowNo
                              Then Tile.Swap(CTop, RowNo, ColumnNo)
                              Else Tile.Swap(CBottom, RowNo, ColumnNo);
                          End;
                End;
          End;
    End;



  Procedure TTile.ClearTile;
    Begin
      Self.Number.Text := '';
      Self.Fill.Color := TAlphaColorRec.White;
      Self.State := Empty;
      BlankTilePosition.x := Self.x;
      BlankTilePosition.y := Self.y;
    End;

  Function TTile.FindWhatRowNo : Integer;
    Begin
      Result := Self.y;
    End;

  Function TTile.FindWhatState : TTileState;
    Begin
      Result := Self.State;
    End;

  Function TTile.FindWhatColumnNo : Integer;
    Begin
      Result := Self.x;
    End;

  Constructor TSPuzzle8.Create;
    Begin
      Inherited;
    End;

  Procedure GenerateRandomNoArray(Var RandomNoArray : TRandomNoArray);
    Begin
      RandomNoArray[0] := 7;
      RandomNoArray[1] := 5;
      RandomNoArray[2] := 1;
      RandomNoArray[3] := 2;
      RandomNoArray[4] := 4;
      RandomNoArray[5] := 6;
      RandomNoArray[6] := 3;
      RandomNoArray[7] := 0;
      RandomNoArray[8] := -1;
    End;

Procedure TPuzzleForm.FormCreate(Sender : TObject);
    Var
      RowNo, ColumnNo : Integer;
      RandomNoArray : TRandomNoArray;
    Begin
      SP := TSPuzzle8.Create;
      GenerateRandomNoArray(RandomNoArray);
      PuzzleForm.ClientWidth := 400;
      Frame := TRectangle.Create(PuzzleForm);
      Frame.Width := 310;
      Frame.Height := 310;
      Frame.Position.X := 45;
      Frame.Position.Y := 95;
      Frame.Fill.Color := TAlphaColorRec.Aliceblue;
      Frame.CornerType := TCornerType.Round;
      Frame.XRadius := 5;
      Frame.YRadius := 5;
      Frame.Parent := PuzzleForm;
      For ColumnNo := 0 To 2
        Do
          For RowNo := 0 To 2
            Do
              Begin
                SP.PArray[ColumnNo, RowNo] := TTile.CreateTile(ColumnNo, RowNo, IntToStr(1 + RandomNoArray[ColumnNo*3 + RowNo]));
                SP.PArray[ColumnNo, RowNo].AssignedNo := 1 + RandomNoArray[ColumnNo*3 + RowNo];
              End;
      SP.PArray[2,2].ClearTile;
      For ColumnNo := 0 To 2
        Do
          For RowNo := 0 To 2
            Do SP.PArray[ColumnNo, RowNo].Anchors := [TAnchorKind.akRight, TAnchorKind.akBottom];
    End;
End.
