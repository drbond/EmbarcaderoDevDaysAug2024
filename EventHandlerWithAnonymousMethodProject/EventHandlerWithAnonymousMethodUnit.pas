Unit EventHandlerWithAnonymousMethodUnit;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

Type
  TfrmAnonymousProcedureEventHandler = Class(TForm)
                                         btnCallOnClickEventHandler: TButton;
                                         Procedure FormCreate(Sender : TObject);
                                       End;
 TNotifyEventWrapper = Class(TComponent)
                         Private
                           FProc : TProc<TObject>;
                         Public
                           Constructor Create(Owner : TComponent;
                                              AnonymousProcedure : TProc<TObject>);
                         Published
                           Procedure Event(Sender : TObject);
                       End;
Var
  frmAnonymousProcedureEventHandler : TfrmAnonymousProcedureEventHandler;

Implementation

{$R *.dfm}

Constructor TNotifyEventWrapper.Create(Owner : TComponent;
                                       AnonymousProcedure : TProc<TObject>);
  Begin
    Inherited Create(Owner);
    FProc := AnonymousProcedure;  //Anonymous procedure becomes a procedure of object
  End;

Procedure TNotifyEventWrapper.Event(Sender : TObject);
  Begin
    FProc(Sender); //This will call a procedure of object because an
    //an object is created via an implementing class of interface
    //when anonymous method called
  End;

Function AnonProcConvertedToNotifyEvent(Owner : TComponent;
                                        AnonymousProcedure : TProc<TObject>) : TNotifyEvent;
  Begin
  //TNotifyEvent notifies the control that a click event occurred on the control.
  //Setting up the event handler the clicked component should call when clicked
    Result := TNotifyEventWrapper.Create(Owner, AnonymousProcedure).Event;
  End;

Procedure TfrmAnonymousProcedureEventHandler.FormCreate(Sender: TObject);
  Begin
    btnCallOnClickEventHandler.OnClick :=
             AnonProcConvertedToNotifyEvent(btnCallOnClickEventHandler,
                                              Procedure(Sender: TObject)
                                                Begin
                                                  (Sender As TButton).Caption := 'Clicked';
                                                End);
    //Reference to AnonProcConvertedToNotifyEvent stored in OnClick field
    //When button is clicked AnonProcConvertedToNotifyEvent is called which in turn calls
    //Event procedure which then calls FProc(Sender). At this point an object is created
    //based on the reference to an anonymous method which in turn invokes a procedure of object.
  End;

End.
