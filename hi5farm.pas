var
 Buff:Tl2Buff;
 item:TL2Item;
 member:TL2Live;
 const
 //TEXT for invite
    inviteText = 'beniz45cm';
 
  function SetForegroundWindow(hwnd: integer) : Boolean; stdcall;
    external 'user32.dll';
   function captcha:boolean; begin
             if engine.dlgtext.contains('Refresh') or
             engine.dlgtext.contains('Captcha') or
             engine.dlgtext.contains('60 seconds') or
             engine.dlgtext.contains('Bot')   then begin
       SetForegroundWindow(Engine.GameWindow);             
      PlaySound(exepath+'\sounds\'+'PlayerAlarm'+'.wav');
      delay(2500);  
      StopSound;
          end;   
  end;
function CheckDeath(Obj: TL2Live = nil): boolean;       
begin                                                        
  if (Obj = nil) then Obj:= User;                        
  result:= false;                                         
  if (Obj.Dead) then begin                               
    result:= true;                                                 
    Engine.FaceControl(0, false);                         
    while (User.Dead) and delay(999) do  Engine.GoHome;    
    delay(5555);                                          
  end;
  end;
function HaveAgroMobs(): boolean;
var i: integer;
begin
  result:= false;
  for i:= 0 to NpcList.Count-1 do begin
    if (IsAgr(NpcList(i))) then begin
      result:= true;
      exit;
    end;
  end;
end;

function IsAgr(Mob: TL2Npc): boolean;
begin
  result:= (Mob.AtkOID = User.OID) and (not Mob.Dead);
end;

procedure checkbuff;
  begin

   CheckDeath();
   if not (User.Buffs.ByID(1323, buff)) or (buff.EndTime < 300000) then begin
    print('NEED REBUFF ');
  delay(10000);

   Engine.BypassToServer('_bbshome', True);
delay(500);
Engine.BypassToServer('_bbsgetfav', True);
delay(500);
Engine.BypassToServer('_bbsbuffer', True);
delay(500);
Engine.BypassToServer('_bbsbufferbypass_cast 187 x x', True);
   if  (User.Buffs.ByID(1323, buff)) and (buff.EndTime < 300000) then
   print('REBUFF DONE');
delay(1500);



end;
end;
procedure restock;
begin
CheckDeath();
// IF SS less then 1000
if (inventory.user.byid(3951, item) and (item.count<1000)) then begin   //3951 id of BSSA
   print('RESTOCK SS');
   Engine.FaceControl(0, false);
   delay(1000);
    if (HaveAgroMobs) then begin                                                     
        print('Killing aggro mobs');
        Engine.FaceControl(0, true);                                                   
        while (HaveAgroMobs) do delay(10);                                           
        Engine.FaceControl(0, false);                                                  
        while (User.InCombat) do delay(555);                                           
      end;
 
 
 // PORT to town
    Engine.bypasstoserver('_bbshome', true);
    delay(500);
    Engine.BypassToServer('_bbsgetfav', True);
    delay(500);
     Engine.BypassToServer('_bbsgatekeeper', True);
        delay(500);
     Engine.BypassToServer('13', True);
     delay(3500);
 // OPEN GM SHOP
 if user.InRange(-44683, -113079, -224,10000) then begin // XYZ of ORC Village
         engine.bypasstoserver('_bbshome', true);
 delay(500);
         engine.bypasstoserver('_bbsgetfav', true);
 delay(500);

  engine.bypasstoserver('_bbsfile:smallNpcs/gmshop', true);
 delay(500);

  engine.bypasstoserver('110', true);
 delay(500);
  Engine.NPCExchange (3951, 25000); // Buy BSSA
  print('RESTOCK BSSS DONE');
  end;
  end;
// IF MP pots less then 50
   if (inventory.user.byid(728, item) and (item.count<50)) then begin // 728 id of mp pot
     // while user.incombat do delay(1000);
                  
   print('RESTOCK MP');
   Engine.FaceControl(0, false);
   delay(1000);
    if (HaveAgroMobs) then begin                                                     
        print('Killing aggro mobs');
        Engine.FaceControl(0, true);                                                   
        while (HaveAgroMobs) do delay(10);                                           
        Engine.FaceControl(0, false);                                                  
        while (User.InCombat) do delay(555);                                           
      end;
// PORT to town                
      Engine.BypassToServer('_bbshome', True);
      delay(500);
    Engine.BypassToServer('_bbsgetfav', True);
    delay(500);
     Engine.BypassToServer('_bbsgatekeeper', True);
        delay(500);
     Engine.BypassToServer('13', True);
     delay(3500);
 // OPEN GM SHOP
   if user.InRange(-44683, -113079, -224,10000) then begin   // XYZ of ORC Village
         engine.bypasstoserver('_bbshome', true);
 delay(500);
         engine.bypasstoserver('_bbsgetfav', true);
 delay(500);

  engine.bypasstoserver('_bbsfile:smallNpcs/gmshop', true);
 delay(500);

  engine.bypasstoserver('1c', true);
 delay(500);
  Engine.NPCExchange (728, 500);                 //buy mp pot
    print('RESTOCK MP POTS DONE');
  end;
  end;
  end;
procedure tospot;
begin
CheckDeath();
if not user.InRange(92504, 109576, -3744,20000) then begin //XYZ of SPOT
// IF NOT on spot move to spot
    print('Moving To Spot');
    engine.facecontrol(0,false);
    delay(1000);
      checkbuff;
      //PORT to Hunters
  Engine.BypassToServer('_bbshome', True);
  delay(500);
  Engine.BypassToServer('_bbsgetfav', True);
  delay(500);
  Engine.BypassToServer('_bbsgatekeeper', True);
  delay(500);
  Engine.BypassToServer('1e', True);
  delay(500);
    Engine.MoveTo(117160, 76808, -2672);
    engine.settarget(32864);   // Target NPC
    delay(100);
    engine.dlgopen;      // TALK with NPC
    delay(100);
    engine.dlgsel(2);    // Choose option 2
    delay(1500);
                                                             
    Engine.MoveTo(98488, 109720, -3696);
    Engine.MoveTo(97304, 109608, -3680);
    Engine.MoveTo(96552, 110216, -3712);
    Engine.MoveTo(95656, 110040, -3632);
    Engine.MoveTo(94536, 109816, -3680);
    Engine.MoveTo(93736, 109704, -3664);
    Engine.MoveTo(92504, 109576, -3744);
      
      delay(500);
      Engine.facecontrol(0,true);
      delay(5000);
      //Engine.dispel('dance of shadows');
    print('ON SPOT');
    print('Start FARM');
end;
end;
procedure onspot;
begin
CheckDeath();
// IF ON spot and buffs time less then 5min REBUFF
 while user.InRange(92504, 109576, -3744,20000) do begin // XYZ of SPOT
    
   if  ((User.Buffs.ByID(1323, buff)) and (buff.EndTime < 300000)) then begin
   print('REBUFF');
   Engine.FaceControl(0, false);
     Delay(1000);
    if (HaveAgroMobs) then begin                                                     
        print('Killing aggro mobs');
        Engine.FaceControl(0, true);                                                   
        while (HaveAgroMobs) do delay(10);                                           
        Engine.FaceControl(0, false);                                                  
        while (User.InCombat) do delay(555);                                           
      end;

      repeat checkbuff();                                          
      until ((User.Buffs.ByID(1323, buff)) and (buff.EndTime > 300000));                                                       
      Engine.FaceControl(0, true);                              

    end;
    restock();
    invitePT();
  end;
end;

procedure invitePT;
begin
//IF someone pm with inviteText inv him to PT
if (ChatMessage.Text = inviteText) and (ChatMessage.ChatType = mtPrivate) and ChatMessage.Unread and (ChatMessage.Time < 3000) then
begin
 if Party.Chars.Count < 8 then Engine.InviteParty(ChatMessage.Sender) else Engine.Say('party is full', 2, ChatMessage.Sender);
                end;

            
end;


begin
        delay(500);
        //load settings | Change name or comment
 Engine.LoadConfig(exepath+'\Settings\'+'LokrenUP3'+'.xml');
        //load map | Change name or comment
 Engine.loadzone(exepath+'\Settings\'+'GEM_L_3'+'.zmap');
 delay(500);
       
 
while true do begin

CheckDeath();
    

restock();
checkbuff();
onspot();
invitePT();
tospot();
    delay(1000);
  end;      
    delay(1500);
end.