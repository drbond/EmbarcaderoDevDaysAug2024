Unit AnonAjax_Thread;
{Adaption of Marco Cantu's program from ObjectPascalHandbook-master Chapter 15
https://github.com/MarcoDelphiBooks/ObjectPascalHandbook. Marco's program
doesn't work for three reasons. It is set up for http://blog.marcocantu.com but
Marco's blog is now https.
It uses Indy IdHTTP which doesn't work as written for https (requires OpeSSL dll
or equivalent). It uses Image1.Picture.Graphic.LoadFromStream(aResponseContent)
to load the first graphic from Marco's blog site when for this png graphic,
Image1.Picture.LoadFromStream(aResponseContent)is required.
Also need Vcl.Imaging.pngimage in main unit.
The demo source code copy is copyrighted by Marco, but can be used freely.}

Interface

Uses
  Classes, SysUtils, StrUtils, IdHttp, System.Net.HttpClient,
  System.Net.HttpClientComponent, Winapi.Windows;

Type
  TAjaxCallback = Reference To Procedure(aResponseContent : TStringStream);
  TLinkCallback = Reference To Procedure(Const strLink : String);

  TAjaxThread = Class (TThread)
                  Private
                    fNetHttpClient : TNetHTTPClient;
                    fURL : String;
                    fAjaxCallback : TAjaxCallback;
                  Protected
                    Procedure Execute; Override;
                  Public
                    Constructor Create(Const strUrl : String;
                                       ajaxCallback : TAjaxCallback);
                    Destructor Destroy; Override;
                  End;

Procedure AjaxCall(Const strUrl : String; ajaxCallback : TAjaxCallback);
Procedure ExtractLinks(strData: String; procLink : TLinkCallback);
Procedure ExtractImages(strData: String; procLink : TLinkCallback);


Implementation
Var TextPipe : TextFile;
Procedure AjaxCall(Const strUrl : String; ajaxCallback : TAjaxCallback);
  Begin
    TAjaxThread.Create(strUrl, ajaxCallback);
  End;

{ TAjaxThread }

Constructor TAjaxThread.Create(Const strUrl : String; ajaxCallback : TAjaxCallback);
  Begin
    fNetHttpClient := TNetHTTPClient.Create(Nil);
    fURL := strUrl;
    fAjaxCallback := ajaxCallBack;
    Inherited Create(False);
    FreeOnTerminate := True;
  End;

Destructor TAjaxThread.Destroy;
  Begin
    fNetHttpClient.Free;
    Inherited;
  End;

Procedure TAjaxThread.Execute;
  Var
    aResponseContent : TStringStream;
  Begin
    aResponseContent := TStringStream.Create;
    Try
      fNetHttpClient.Get(fURL, aResponseContent);
      aResponseContent.Position := 0;
      fAjaxCallback(aResponseContent);
    Finally
      aResponseContent.Free;
    End;
  End;

Procedure ExtractLinks(strData : String; procLink : TLinkCallback);
  Var
    strAddr : String;
    nBegin, nEnd : Integer;
  Begin
    strData := LowerCase(strData);
    nBegin := 1;
    Repeat
      nBegin := PosEx('href="http', strData, nBegin);
      If nBegin <> 0
        Then
          Begin
            // find the end of the reference
            nBegin := nBegin + 6;
            nEnd := PosEx('"', strData, nBegin);
            strAddr := Copy(strData, nBegin, nEnd - nBegin);
            // move on
            nBegin := nEnd + 1;
            // execute anonymous method
            procLink(strAddr)
          End;
    Until nBegin = 0;
  End;

Procedure ExtractImages(strData : String; procLink : TLinkCallback);
  Var
    strAddr : string;
    nBegin, nEnd : Integer;
  Begin
    strData := LowerCase(strData);
    nBegin := 1;
    Repeat
      nBegin := PosEx ('<img src="', strData, nBegin);
      If nBegin <> 0
        Then
          Begin
            // find the end of the reference
            nBegin := nBegin + 10;
            nEnd := PosEx ('"', strData, nBegin);
            strAddr := Copy(strData, nBegin, nEnd - nBegin);
            // move on
            nBegin := nEnd + 1;
            // execute anon method
            procLink (strAddr)
          End;
    Until nBegin = 0;
  End;
End.
