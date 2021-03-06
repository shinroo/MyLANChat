unit MLC_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NetComs, ExtCtrls, Menus;

type
  TKind = record
    kind : integer;
  end;
  TMessage = record
    kind : integer;
    str : string[255];
    name : string[255];
  end;
  TForm1 = class(TForm)
    NetCom1: TNetCom;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    MainMenu1: TMainMenu;
    Chats1: TMenuItem;
    General1: TMenuItem;
    Other1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure NetCom1Receive(Sender: TObject; Host: String; Port: Integer;
      Data: Pointer; Size: Integer);
    procedure FormDestroy(Sender: TObject);
    
  private

  public
    Msg_Pointer : Pointer;
    Msg_Sent : TMessage;
    Msg_Received : TMessage;
    Kind : TKind;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  NetCom1.Initialize;
  Memo1.Lines.Clear;
  Msg_Sent.name := '';
  Label1.Caption := 'IP: ' + NetCom1.GetLocalIP + ' Port: ' + inttostr(NetCom1.LocalPort);
  Msg_Sent.name := InputBox('Enter your name','','');
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 0 then
  Begin
    Msg_Sent.kind := 1;
    if length(Edit1.Text) < 255 then
     Begin
      Msg_Sent.str := Edit1.Text;
      Msg_Pointer := @Msg_Sent;
      NetCom1.Send('255.255.255.255',NetCom1.LocalPort,Msg_Pointer,SizeOf(Msg_Sent),false);
     End
    else
      ShowMessage('Error: string to be sent is too long!');
  end;
end;

procedure TForm1.NetCom1Receive(Sender: TObject; Host: String;
  Port: Integer; Data: Pointer; Size: Integer);
begin
  Kind.kind := TKind(Data^).kind;
  Begin
    Msg_Received.str := TMessage(Data^).str;
    Msg_Received.name := TMessage(Data^).name;
    if Host <> NetCom1.GetLocalIP then
     Begin
        Memo1.Lines.add(Host + '(' + Msg_Received.name + ')' + ': ' + Msg_Received.str);
      end
   else
     Begin
       Memo1.Lines.add(NetCom1.GetLocalIP + '(You)' + ': ' + Msg_Sent.str);
      End;
   End;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  NetCom1.Finalize;
  Memo1.Lines.Clear;
end;

end.
