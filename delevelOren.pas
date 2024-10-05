
const
delevelToLvl = 10;

procedure hitGuard;
var i: integer;
begin
for i:=0 to npclist.count-1 do begin
   if (npclist.items(i).title = 'Guard')
   or (npclist.items(i).name = 'Stan')
   or (npclist.items(i).name = 'Pinaps')
   or (npclist.items(i).name = 'Jerin')
   or (npclist.items(i).name = 'Yates')
   or (npclist.items(i).name = 'Emdrere')
   or (npclist.items(i).name = 'Hector') then begin
      engine.settarget(npclist.items(i));
      engine.movetotarget;
      engine.attack(true);
      delay(1500);
      exit;
   end;
end;
end;

begin
while (user.level > delevelToLvl) do begin
	if (user.distto(81016, 53528, -1536) < user.distto(80344, 54328, -1536)) 
	and (user.distto(81016, 53528, -1536) < user.distto(81688, 55832, -1504)) then begin
		engine.MoveTo(81016, 53528, -1536)
	end else
	if (user.distto(80344, 54328, -1536) < user.distto(81688, 55832, -1504)) 
	and (user.distto(80344, 54328, -1536) < user.distto(81016, 53528, -1536)) then begin
		engine.MoveTo(80344, 54328, -1536)
	end else engine.MoveTo(81688, 55832, -1504);
	
	while not user.dead do hitGuard;
	engine.gohome;
	delay(3000);
end;
end.