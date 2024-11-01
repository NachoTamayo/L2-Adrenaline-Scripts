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
  OnPacketTemp(ID1, ID2, Data, Size);
end;

procedure OnCliPacket(ID1, ID2: Cardinal; Data: Pointer; Size: Word);
begin
  OnCliPacketTemp(ID1, ID2, Data, Size);
end;

procedure OnPacketTemp(ID1, ID2: Cardinal; Data: Pointer; Size: Word);
var
  Pck: TNetworkPacket;
begin
  Pck:= TNetworkPacket.Create;

  
  Pck.Free;
end;

procedure OnCliPacketTemp(ID1, ID2: Cardinal; Data: Pointer; Size: Word);
var
  Pck: TNetworkPacket;
begin
  Pck:= TNetworkPacket.Create;

  
  Pck.Free;
end;

procedure SendToServerTemp;
var
  Pck: TNetworkPacket;
begin
  Pck:= TNetworkPacket.Create;

  Engine.SendToServer(Pck.ToHex);
  Pck.Free;
end;

procedure SendToClientTemp;
var
  Pck: TNetworkPacket;
begin
  Pck:= TNetworkPacket.Create;

  Engine.SendToClient(Pck.ToHex);
  Pck.Free;
end;

procedure RequestCharacterCreate(GameVersion: byte; Name: string; Race, ClassID: cardinal; Sex, HairStyle, HairColor, Face: integer = 0);
var
  Pck: TNetworkPacket;
  INT, STR, CON, MEN, DEX, WIT: cardinal;
begin
  Pck:= TNetworkPacket.Create;

  INT:= 1;
  STR:= 1;
  CON:= 1;
  MEN:= 1;
  DEX:= 1;
  WIT:= 1;
  
  {
  GameVersion
  1 = Interlude - Interlude Update 3
  2 = The Kamael - ...
  }
  case GameVersion of
  1:
  begin
    Pck.WriteC($0B);
    Pck.WriteS(Name);
    Pck.WriteD(Race);
    Pck.WriteD(Sex);
    Pck.WriteD(ClassID);
    Pck.WriteD(INT);
    Pck.WriteD(STR);
    Pck.WriteD(CON);
    Pck.WriteD(MEN);
    Pck.WriteD(DEX);
    Pck.WriteD(WIT);
    Pck.WriteD(HairStyle);
    Pck.WriteD(HairColor);
    Pck.WriteD(Face);
  end;
  2:
  begin
    Pck.WriteC($0C);
    Pck.WriteS(Name);
    Pck.WriteD(Race);
    Pck.WriteD(Sex);
    Pck.WriteD(ClassID);
    Pck.WriteD(INT);
    Pck.WriteD(STR);
    Pck.WriteD(CON);
    Pck.WriteD(MEN);
    Pck.WriteD(DEX);
    Pck.WriteD(WIT);
    Pck.WriteD(HairStyle);
    Pck.WriteD(HairColor);
    Pck.WriteD(Face);
  end;
  end;

  Engine.SendToServer(Pck.ToHex);
  Pck.Free;
end;

begin
	RequestCharacterCreate(1, 'Nacho', 0, 0); //- will create a human male warrior named Nacho.
end.