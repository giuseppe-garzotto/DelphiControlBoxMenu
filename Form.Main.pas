unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    const
      iConfigurationID = 210;
      iAboutBoxID = 220;
    procedure Configuration;
    procedure AboutBox;
  protected
    { Protected declarations }
    procedure AddMenuToControlBox;
    procedure WMSysCommand(var Message : TWMSysCommand); message WM_SYSCOMMAND;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AboutBox;
const
  Msg = 'Delphi ControBox menu sample' + #13#10 + #13#10 +
    'A Delphi application that shows how to add items on form control box menu.';
begin
  MessageDlg(Msg, mtInformation, [mbOk], 0);
end;

procedure TfrmMain.Configuration;
const
  Msg = 'Delphi ControBox menu sample' + #13#10 + #13#10 +
    'This will show a configuration form...';
begin
  MessageDlg(Msg, mtInformation, [mbOk], 0);
end;

procedure TfrmMain.AddMenuToControlBox;
var
  SysMenu: HMENU;
begin
  SysMenu := GetSystemMenu(Self.Handle, False);
  AppendMenu(SysMenu, MF_SEPARATOR, 0, '');
  AppendMenu(SysMenu, MF_STRING, iConfigurationID, '&Configuration...');
  AppendMenu(SysMenu, MF_STRING, iAboutBoxID, '&About...');
end;

procedure TfrmMain.WMSysCommand(var Message : TWMSysCommand);
begin
  inherited;

  case Message.CmdType of
    iConfigurationID: Configuration;
    iAboutBoxID: AboutBox;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  AddMenuToControlBox;
end;

end.
