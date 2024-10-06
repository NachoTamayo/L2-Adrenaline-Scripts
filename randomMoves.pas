//No less than 3 seconds on back to center with no targets
procedure Random_Move;
var
OldX, OldY, OldXs, OldYs, def:integer;
move: boolean;

begin
  def:=200;
  OldX:=0;
  OldY:=0;
  while Engine.Status = lsOnline do begin
    move:=false;
    delay(2000+random(500));
    OldXs:=user.x;
    OldYs:=user.y;
    delay(200);
    if (OldXs<>user.x) or (OldYs <> user.y) then
    begin
       move:=true;
       Print('Stand');
    end
      else
      begin
       Print('Running..');
      end;
    if sqrt(power(user.x-OldX,2) + power(user.y-OldY,2))>sqrt(2*def*def) then
    begin
       OldX:=user.x;
       OldY:=user.y;
       print('The point has changed');
    end;
        if ((user.target = nil) or (user.target.dead)) and (not move) then
               Engine.DMoveTo(OldX+random(2*def)-def,OldY+random(2*def)-def,user.z);
  end;
end;

begin
  Script.NewThread(@Random_Move);
end.