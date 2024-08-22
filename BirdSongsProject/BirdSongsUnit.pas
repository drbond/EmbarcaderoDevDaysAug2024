Unit BirdSongsUnit;
{Lark.mp3 was obtained from bird song website https://xeno-canto.org -
 XC510014 - Beesley's Lark - Chersomanes beesleyi.mp3}
{Copyright Peter Boesman (Tangara-at-skynet.be) and distributed under Creative Commons licence BY-NC-SA 4.0}
{https://creativecommons.org/licenses/by-nc-sa/4.0/}
{Night.mp3 has been adapted from XC654608 -
 XC721438 - Common Nightingale - Luscinia megarhynchos.mp3}
{Copyright Lee Dingain and distributed under Creative Commons licence BY-NC-SA 4.0}
{https://creativecommons.org/licenses/by-nc-sa/4.0/}
{You will need to install component Windows Media Player to access the media player}
Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, WMPLib_TLB;

Type
  TfrmBirdSong = Class(TForm)
                   btnCreateNightingale: TButton;
                   btnCreateLark: TButton;
                   btnSing: TButton;
                   Timer1: TTimer;
                   lblBirdName: TLabel;
                   WindowsMediaPlayer1: TWindowsMediaPlayer;
                   Procedure btnCreateLarkClick(Sender: TObject);
                   Procedure btnCreateNightingaleClick(Sender: TObject);
                   Procedure btnSingClick(Sender: TObject);
                   Procedure Timer1Timer(Sender: TObject);
                 End;

Var
  frmBirdSong: TfrmBirdSong;

Implementation

{$R *.dfm}
  Uses InterfaceUnit, BirdUnit;

  Var
    Bird : IBird;

  Procedure TfrmBirdSong.btnCreateLarkClick(Sender: TObject);
    Begin
      WindowsMediaPlayer1.Close;
      If Assigned(Bird)
        Then
          If (Bird.GetBirdName <> 'Lark')
            Then Bird := TBird.Create('Lark', 'Lark.mp3')
            Else ShowMessage('Lark object already exists')
        Else Bird := TBird.Create('Lark', 'Lark.mp3');
      lblBirdName.Caption := Bird.GetBirdName;
    End;

  Procedure TfrmBirdSong.btnCreateNightingaleClick(Sender: TObject);
    Begin
      WindowsMediaPlayer1.Close;
      If Assigned(Bird)
        Then
          If (Bird.GetBirdName <> 'Nightingale')
            Then Bird := TBird.Create('Nightingale', 'Night.mp3')
            Else ShowMessage('Nightingale object already exists')
        Else Bird := TBird.Create('Nightingale', 'Night.mp3');
      lblBirdName.Caption := Bird.GetBirdName;
    End;

  Procedure TfrmBirdSong.btnSingClick(Sender: TObject);
    Begin
      If Bird <> Nil
        Then
          Begin
            frmBirdSong.Timer1.Enabled := False;
            frmBirdSong.WindowsMediaPlayer1.Enabled := True;
            frmBirdSong.WindowsMediaPlayer1.url :='file://' + GetCurrentDir + '\' + Bird.GetSongFileName;
            frmBirdSong.WindowsMediaPlayer1.Controls.stop;
            frmBirdSong.Timer1.Enabled := True;
            frmBirdSong.WindowsMediaPlayer1.Controls.Play;
          End
        Else lblBirdName.Caption := 'No bird created';
    End;

  Procedure TfrmBirdSong.Timer1Timer(Sender: TObject);
    Begin
      Timer1.Enabled := False;
      WindowsMediaPlayer1.Close;
    End;

End.
