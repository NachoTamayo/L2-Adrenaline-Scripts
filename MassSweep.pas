var
int: integer;
npc: TL2npc;
sweep: TL2skill;

begin
  while true do begin
    for int:=0 to npclist.count-1 do begin
        npc := npclist.items(int);
        if npc.valid and npc.dead and npc.sweepable and (skilllist.byid(42,sweep) and (sweep.endtime = 0)) then
            if (user.distto(npc) < 300) then   //max range of sweeping
                if Engine.SetTarget(npc) then Engine.UseSkill(sweep);
    end;
    delay(300);   //0.3sec delay
  end;
end.