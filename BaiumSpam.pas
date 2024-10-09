var
npc: TL2Npc;
i : integer;

begin
  while delay(400) do begin
    Engine.SetTarget(31862); // NPC ID
    Engine.DlgOpen;
    delay(500);
    Engine.DlgSel(1);
    delay(500);
    Engine.DlgSel(1);
    delay(500);
    if (User.TeleportDist > 100)  then 
        Engine.EnterText('#Baium Resp!');
        PlaySound(ExePath+'\sounds\'+'sirena'+'.wav');
        delay(2000);  
        StopSound;
        print('Baium respawned');
       exit;
      end;
end. 