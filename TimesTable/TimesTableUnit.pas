Unit TimesTableUnit;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

Type
  TFunctionOfInteger = Reference to Function(x : Integer) : Integer;
  TfrmTimesTable = Class(TForm)
                     mbTimesTable : TMemo;
                     lbNumber : TListBox;
                     procedure FormCreate(Sender: TObject);
                     Procedure lbNumberClick(Sender: TObject);
                     Procedure CentreOnParent;
                   End;

Var
  frmTimesTable : TfrmTimesTable;

Implementation

{$R *.dfm}

Function ReturnAPartialFunction(x : Integer) : TFunctionOfInteger;
  Begin
    Result := Function(y : Integer) : Integer
                Begin
                  Result := x * y; //x is a free variable and y is a bound variable
                                   //x is a non-local variable in the anonymous function
                End;
  End;

Procedure TfrmTimesTable.CentreOnParent;
  Begin
    Self.Left := (Screen.Width - Self.Width) Div 2;
    Self.Top := (Screen.Height - Self.Height) Div 2;
  End;


Procedure TfrmTimesTable.FormCreate(Sender : TObject);
  Begin
    For Var i := 1 To 12
      Do lbNumber.Items.Add(i.ToString);
    Self.Caption := 'Times Table';
    Self.CentreOnParent;
  End;

Procedure TfrmTimesTable.lbNumberClick(Sender: TObject);
  Begin
    mbTimesTable.Text := '';
    Var n : Integer;
    n := StrToInt(lbNumber.Items[lbNumber.ItemIndex]);
    For Var i := 1 To 12
      Do mbTimesTable.Text := mbTimesTable.text  +  i.ToString  + ' times '  + n.ToString
         + ' = '  +  (ReturnAPartialFunction(i)(n)).ToString + #13#10; // I know, i x n gives the same output
  End;
End.
