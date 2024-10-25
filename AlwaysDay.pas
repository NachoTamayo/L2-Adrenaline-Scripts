uses
  SysUtils;
 
type
  TNetworkPacket = class
  public
    Current: Integer;
    procedure WriteQ(value: int64);
    procedure WriteD(value: Cardinal);
    procedure WriteH(value: Word);
    procedure WriteC(value: Byte);
    procedure WriteS(value: String);
    function ReadQ(): int64;
    function ReadD(): Cardinal;
    function ReadH(): Word;
    function ReadC(): Byte;
    function ReadS(): String;
    function ToHex(): String;
    constructor Create(pData: PChar; size: Word); overload;
    constructor Create(); overload;
  private
    data: Array[0..10240] of Byte;
  end;

constructor TNetworkPacket.Create(pData: PChar; size: Word);
begin
    inherited Create;
    Move(pData^, PChar(@data[0])^, size);
end;

constructor TNetworkPacket.Create();
begin
    inherited Create;
end;

function TNetworkPacket.ReadQ;
begin
    result:= PInt64(@data[Current])^;
    Current:= Current + sizeof(int64);
end;

function TNetworkPacket.ReadD;
begin
    result:= PCardinal(@data[Current])^;
    Current:= Current + sizeof(Cardinal);
end;
 
function TNetworkPacket.ReadH;
begin
    result:= PWord(@data[Current])^;
    Current:= Current + sizeof(Word);
end;
 
function TNetworkPacket.ReadC;
begin
    result:= PByte(@data[Current])^;
    Current:= Current + sizeof(Byte);
end;
 
function TNetworkPacket.ReadS;
begin
    result:= string(PChar(@data[Current]));
    Current:= Current + (length(result) + 1) * sizeof(Char);
end;

procedure TNetworkPacket.WriteQ;
begin
  (PInt64(@data[Current])^):= value;
  Current:= Current + sizeof(int64);
end;
 
procedure TNetworkPacket.WriteD;
begin
  (PCardinal(@data[Current])^):= value;
  Current:= Current + sizeof(Cardinal);
end;
 
procedure TNetworkPacket.WriteH;
begin
  (PWord(@data[Current])^):= value;
  Current:= Current + sizeof(Word);
end;
 
procedure TNetworkPacket.WriteC;
begin
  (PByte(@data[Current])^):= value;
  Current:= Current + sizeof(Byte);
end;
 
procedure TNetworkPacket.WriteS;
begin
  Move(value^, PChar(@data[Current])^, (length(value) + 1) * sizeof(Char));
  Current:= Current + (length(value) + 1) * sizeof(Char);
end;
 
function TNetworkPacket.ToHex;
var
  i: Cardinal;
begin
  result:= '';
  for i:= 0 to Current - 1 do
  begin
    result:= result + IntToHex(data[i], 2);
  end;
end;

procedure OnPacket(ID1, ID2: Cardinal; Data: Pointer; Size: Word);
begin

end;

procedure OnCliPacket(ID1, ID2: Cardinal; Data: Pointer; Size: Word);
begin

end;

procedure ClientSetTime(Hours: cardinal; Minutes: cardinal; Speed: integer = 6);
var
  Pck: TNetworkPacket;
begin
  Pck:= TNetworkPacket.Create;

  if (Engine.GameVersion <= 74) then
    Pck.WriteC($EC)
  else
    Pck.WriteC($F2);
  Pck.WriteD(Hours * 60 + Minutes);
  Pck.WriteD(Speed);

  Engine.SendToClient(Pck.ToHex);
end;

procedure ChangeTimeThread;
begin
  while (true) do
  begin
    ClientSetTime(12, 0);
    delay(1000);
  end;
end;

begin
  Script.NewThread(@ChangeTimeThread);
end.