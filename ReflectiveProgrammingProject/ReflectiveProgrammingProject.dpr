Program ReflectiveProgrammingProject;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  RTTI,
  ReflectiveProgrammingUnit in 'ReflectiveProgrammingUnit.pas';

Procedure DemonstrateReflection;
  Var
    RttiContext : TRttiContext;
    RttiType : TRttiInstanceType;
    RttiCreateMethod : TRttiMethod;
    RttiDisplayHelloMsgMethod : TRttiMethod;
    TestObject : TObject;
  Begin
    RttiContext := TRttiContext.Create;

    Try
      RttiType := RttiContext.GetType(TTestClass) As TRttiInstanceType;
      RttiCreateMethod := RttiType.GetMethod('Create');

      TestObject := RttiCreateMethod.Invoke(RttiType.MetaClassType, []).AsObject;
      RttiDisplayHelloMsgMethod :=  RttiType.GetMethod('DisplayHelloMsg');

      Try
        RttiDisplayHelloMsgMethod.Invoke(TestObject, []);
      Finally
        TestObject.Free;
      End;

    Except
      On E : Exception
        Do Writeln(E.ClassName, ' : ', E.Message);
    End;

  End;
Begin
  Try
    DemonstrateReflection;
    Readln;
  Except
    On E : Exception
      Do Writeln(E.ClassName, ' : ', E.Message);
  End;
End.
