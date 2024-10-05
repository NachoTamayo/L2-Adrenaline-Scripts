uses SysUtils;

var
  CenterX,CenterY,CenterZ,NowRadius,NowAngle: integer;
  GuardName:string;
  DisableBot:boolean;
  Obj:Tl2Live;

procedure GoToPoint(X,Y,Z,Radius,Angle:integer); //Calculate the end point given the angle
begin
  Engine.MoveTo(X+trunc(Radius*sin(Angle)),Y+trunc(Radius*cos(Angle)),Z+20); //Z is added a little, otherwise it will blunt on an uneven surface and try to "dig in" - a moot point, you can not add it.
end;

function MobAggrToMe:boolean; 
var num:integer;
begin
  result:=false; 
  for num:=0 to NpcList.Count - 1 do 
  if (NpcList.Items(num).Target=User) and not(NpcList.Items(num).Dead) then
  begin
    result:=true; //time to run
    exit;
  end;
end;

begin
  GuardName:='SuperDD'; //The name of the defender (whom to run around)
  NowRadius:=150; //Radius to run around the Defender
  NowAngle:=0; //Starting angle (can be left untouched)
  DisableBot:=true; //Disable other bot functions while running from mobs (heal, buff, etc.)
  while true do
  begin 
    CharList.ByName(GuardName,Obj); //In each cycle, update coordinates of the defender
    CenterX:=Obj.X; //X
    CenterY:=Obj.Y; //Y
    CenterZ:=Obj.Z; //Z
    if MobAggrToMe then
    begin
      if DisableBot then Engine.FaceControl(0,false);
      GoToPoint(CenterX, CenterY, CenterZ, NowRadius, NowAngle); // Move around the defender with a changing angle
      NowAngle:=NowAngle+20; 
      if NowAngle>=340 then NowAngle:=0; //If it's over 340 degrees, set to zero (it's better not to set 360)
      end else if DisableBot then Engine.FaceControl(0,true);
    end; 
end.