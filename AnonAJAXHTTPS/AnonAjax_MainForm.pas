Unit AnonAjax_MainForm;
{Adaption of Marco Cantu's program from ObjectPascalHandbook-master Chapter 15
https://github.com/MarcoDelphiBooks/ObjectPascalHandbook. Marco's demonstration program
doesn't work for three reasons. It is set up for http://blog.marcocantu.com but Marco's blog is now https.
It uses Indy IdHTTP which doesn't work as written for https (requires OpeSSL dll
or equivalent. It uses Image1.Picture.Graphic.LoadFromStream(aResponseContent) to load the first graphic
from Marco's blog site when for this png graphic, Image1.Picture.LoadFromStream(aResponseContent) is required.
Also need Vcl.Imaging.pngimage in main unit.
The demo source code copy is copyrighted by Marco, but can be used freely.}
Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, GIFImg, Vcl.Imaging.pngimage, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

Type
  TFormAnonAjax = Class(TForm)
                    btnReadHTML: TButton;
                    mmToShowHTML: TMemo;
                    edtUrl: TEdit;
                    Image1 : TImage;
                    btnLinks : TButton;
                    btnImages : TButton;
                    lblFirstImage: TLabel;
                    Procedure btnReadHTMLClick(Sender : TObject);
                    Procedure btnLinksClick(Sender : TObject);
                    Procedure btnImagesClick(Sender : TObject);
                  End;

Var
  FormAnonAjax: TFormAnonAjax;

Implementation

{$R *.dfm}

Uses AnonAjax_Thread;

Procedure TFormAnonAjax.btnReadHTMLClick(Sender : TObject);
  Begin
    AjaxCall(edtUrl.Text,                                //Ctrl + Space
      Procedure (aResponseContent : TStringStream)
        Begin
          mmToShowHTML.Lines.Text := aResponseContent.DataString;
          mmToShowHTML.Lines.Insert(0, 'From URL: ' + edtUrl.Text);
        End);
  End;

Procedure TFormAnonAjax.btnLinksClick(Sender: TObject);
  Begin
    AjaxCall(edtUrl.Text,
      Procedure(aResponseContent : TStringStream)
        Begin
          ExtractLinks(aResponseContent.DataString,   //Ctrl + Space
            Procedure(Const aUrl : String)
              Begin
                mmToShowHTML.Lines.Add(aUrl + ' in ' + edtUrl.Text);
              End);
        End);
  End;

Procedure TFormAnonAjax.btnImagesClick(Sender : TObject);
  Var
    nHit : Integer;
  Begin
    nHit := 0;
    AjaxCall(edtUrl.Text,
      Procedure(aResponseContent : TStringStream)
        Begin
          ExtractImages(aResponseContent.DataString,   //Ctrl + Space
            Procedure(Const aUrl : String)
              Begin
                Inc (nHit);
                mmToShowHTML.Lines.Add (IntToStr (nHit) + '.' +
                  aUrl + ' in ' + edtUrl.Text);
                If nHit = 1
                   Then // load the first
                    Begin
                      lblFirstImage.Caption := 'Image 1';
                      Var URLToAdd : String := edtUrl.Text;
                      Delete(URLToAdd, Length(URLToAdd), 1);
                      AjaxCall(URLToAdd + aUrl,
                        Procedure(aResponseContent : TStringStream)
                          Begin
                            // load image of the current type only
                            Image1.Picture.LoadFromStream(aResponseContent);
                          End);
                    End;
              End);
        End);

  End;
End.
