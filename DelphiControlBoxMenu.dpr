program DelphiControlBoxMenu;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
