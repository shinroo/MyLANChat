program MLC_Project;

uses
  Forms,
  MLC_Unit in 'MLC_Unit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
