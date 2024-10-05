var
item:tl2item;           
buff: tl2buff;


procedure hunter;
 begin
 engine.facecontrol(0, false);
 delay(15000);
 engine.bypasstoserver('_bbshome'); delay(100);//altb
 engine.bypasstoserver('_bbsgetfav');delay(1500); // Service
 engine.bypasstoserver('_bbsgatekeeper');delay(1500); // Gatekeeper
 engine.bypasstoserver('1c');delay(1500); // Hunter Village
 end;

 
procedure dead;
begin
 if User.Dead then begin                                           
 engine.facecontrol(0, false);
 Delay(500);
  Engine.GoHome;
 Delay(8000);
  end;
end;

procedure Buffs;
 //Buffs
 begin
  if not user.buffs.byname('Elemental Resistance', buff)
  or not user.buffs.byname('Noblesse Blessing', buff) then begin
 engine.facecontrol(0, false);
  Delay(5000);
  if not user.incombat then begin
   //Basic buffs
   engine.bypasstoserver('_bbshome'); delay(100);//altb
   engine.bypasstoserver('_bbsgetfav');delay(1500); // Service
   engine.bypasstoserver('_bbsbuffer');delay(1500); // Gatekeeper
  engine.bypasstoserver('_bbsbufferbypass_giveBuffSet figher 0 0');       delay(100); //Mage Scheme
 end;
 end;
 end;
 
 procedure sspots;
 begin
 if (inventory.user.byid(57, item) and (item.count >=100000000))
 then begin
    //SS no Grade
   if ((User.Level>=1) and (User.Level<40))
   and (not inventory.user.byid(1835, item)
   or (inventory.user.byid(1835, item) and (item.count <=500)))
   then begin
    if not user.inrange(116509, 76258, -2736,2000)
    then begin
     print ('ssnograde');
    hunter;
    sspots;
    end else
    begin
   //SS No Grade
   engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('116');delay(1500);
   engine.npcexchange(1835,10000);delay(1500);
   Delay(5000);
    end;
    end;
   //SS C GRADE
    if ((User.Level>=41) and (User.Level<60))
    and (not inventory.user.byid(1464, item)
   or (inventory.user.byid(1464, item) and (item.count <=500)))
   then begin
   if not user.inrange(116509, 76258, -2736,2000)
    then begin
     print ('ssCgrade');
    hunter;
    sspots;
    end else
    begin
    engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('116');delay(1500);
   engine.npcexchange(1464,10000);delay(1500);
   Delay(1500);
   end;
   end;
   //SS A GRADE
   if  ((User.Level>=61) and (User.Level<76))
   and (not inventory.user.byid(1466, item)
   or (inventory.user.byid(1466, item) and (item.count <=3000)))
   then begin
   if not user.inrange(116509, 76258, -2736,2000)
    then begin
     print ('ssAgrade');
    hunter;
    sspots
    end else
    begin
    engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('116');delay(1500);
   engine.npcexchange(1466,10000);delay(1500);
   Delay(1500);
   end;
   end;
   //SS S GRADE
 if  ((User.Level>=76) and (User.Level<86))
 and (not inventory.user.byid(1467, item)
   or (inventory.user.byid(1467, item) and (item.count <=3000)))
   then begin
   if not user.inrange(116509, 76258, -2736,2000)
    then begin
     print ('ssSgrade');
    hunter;
    end else
    begin
    engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('116');delay(1500);
   engine.npcexchange(1467,15000);delay(1500);
   Delay(1500);
   end;
   end;
 //HP POTS
  if  not inventory.user.byid(1539, item)
  or (inventory.user.byid(1539, item) and (item.count <=200))
   then begin
   if not user.inrange(116509, 76258, -2736,2000)
    then begin
    hunter;
    sspots;
    end else
    begin
   engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('115');delay(1500);
   engine.npcexchange(1539,500);delay(1500);
   Delay(5000);
    end;
    end;
 //Mana Pots
 if  not inventory.user.byid(728, item)
  or (inventory.user.byid(728, item) and (item.count <=200))
    then begin
    if not user.inrange(116509, 76258, -2736,2000)
    then begin
    hunter;
    sspots;
    end else
    begin
   engine.bypasstoserver('_bbshome');delay(1500);
   engine.bypasstoserver('_bbsgetfav');delay(1500);
   engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
   engine.bypasstoserver('115');delay(1500);
   engine.npcexchange(728,500);delay(1500);
   Delay(5000);
    end;
    end;
 end;
 end;
 
procedure sta40;
//Gear40 lvl Jwelers
begin
if (not inventory.user.byid(119, item) or not inventory.user.byid(854, item) or not inventory.user.byid(886, item))
and ((User.Level>=40) and (User.Level<60))
then begin
 if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 end else
 begin
 engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('1e'); delay(1500);
 engine.npcexchange(119, 1); Delay (500);
 engine.npcexchange(854, 1); Delay (500);
 engine.npcexchange(854, 1); Delay (500);
 engine.npcexchange(886, 1); Delay (500);
 engine.npcexchange(886, 1); Delay (500);
 end;
 end;
 //Armor40 lvl
  if  (not inventory.user.byid(398, item)) and (not inventory.user.byid(418, item)) and (not inventory.user.byid(2431, item)) and (not inventory.user.byid(2462, item)) and (not inventory.user.byid(2414, item))
  and (User.Level>=40) and (User.Level<61)
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('18'); delay(1500);
 engine.npcexchange(398, 1); Delay (500);
 engine.npcexchange(418, 1); Delay (500);
 engine.npcexchange(2431, 1); Delay (500);
 engine.npcexchange(2414, 1); Delay (500);
 engine.npcexchange(2462, 1); Delay (500);
 end;
 end;
 //Weapon40 lvl
 if  (not inventory.user.byid(6358, item))
  and ((User.Level>=40) and (User.Level<61))
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('12'); delay(1500);
 engine.npcexchange(6358, 1); Delay (500);
 end;
 end;
// EquipItems
if  (User.Level>=40) and (User.Level<61)
then begin
if Inventory.User.ByID(6358,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(6358); delay(1000);
 end;
 if Inventory.User.ByID(398,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(398); delay(1000);
 end;
 if Inventory.User.ByID(418,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(418);delay(1000);
 end;
  if Inventory.User.ByID(2431,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(2431); delay(1000);
 end;
  if Inventory.User.ByID(2414,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(2414); delay(1000);
 end;
  if Inventory.User.ByID(2462,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(2462); delay(1000);
 end;
  if Inventory.User.ByID(886,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(886); delay(2000);  
 end;
  if Inventory.User.ByID(854,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(854); delay(2000);  
 end;
  if Inventory.User.ByID(119,Item)and not Item.Equipped then if (User.Level>=40) and (User.Level<61)  then begin
 Engine.UseItem(119); delay(1000);
 end;
 end;
 end;

 procedure sta61;
begin
 //Armor61 lvl
  if  not inventory.user.byid(2385, item) and not inventory.user.byid(2389, item) and not inventory.user.byid(5778, item) and not inventory.user.byid(5766, item) and not inventory.user.byid(512, item)
  and ((User.Level>=61) and (User.Level<76))
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('1a'); delay(1500);
 engine.npcexchange(2385, 1); Delay (500);
 engine.npcexchange(2389, 1); Delay (500);
 engine.npcexchange(5778, 1); Delay (500);
 engine.npcexchange(5766, 1); Delay (500);
 engine.npcexchange(512, 1); Delay (500);
 end;
 end;
 //Weapon61 lvl
 if  (not inventory.user.byid(5618, item))
  and (User.Level>=61) and (User.Level<76)
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('14'); delay(1500);
 engine.npcexchange(5618, 1); Delay (500);
 end;
 end;
// EquipItems
if (User.Level>=61) and (User.Level<76)
then begin
if Inventory.User.ByID(5618,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(5618); delay(1000);
 end;
 if Inventory.User.ByID(2385,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(2385); delay(1000);
 end;
 if Inventory.User.ByID(2389,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(2389);delay(1000);
 end;
  if Inventory.User.ByID(5778,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(5778); delay(1000);
 end;
  if Inventory.User.ByID(5766,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(5766); delay(1000);
 end;
  if Inventory.User.ByID(512,Item)and not Item.Equipped then if (User.Level>=61) and (User.Level<76)  then begin
 Engine.UseItem(512); delay(1000);
 end;
 end;
 end;

procedure sta76;
//Gear40 lvl Jwelers
begin
if (not inventory.user.byid(889, item) or not inventory.user.byid(858, item) or not inventory.user.byid(920, item))
and ((User.Level>=76) and (User.Level<85))
then begin
 if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 sta76;
 end else
 begin
 engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('111'); delay(1500);
 engine.npcexchange(889, 1); Delay (500);
 engine.npcexchange(920, 1); Delay (500);
 engine.npcexchange(858, 1); Delay (500);
 engine.npcexchange(858, 1); Delay (500);
 engine.npcexchange(889, 1); Delay (500);
 end;
 end;
 //Armor76 lvl
  if  not inventory.user.byid(6382, item) and not inventory.user.byid(6381, item) and not inventory.user.byid(6380, item) and not inventory.user.byid(6379, item)
  and ((User.Level>=76) and (User.Level<85))
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 sta76;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('1b'); delay(1500);
 engine.npcexchange(6382, 1); Delay (500);
 engine.npcexchange(6381, 1); Delay (500);
 engine.npcexchange(6380, 1); Delay (500);
 engine.npcexchange(6379, 1); Delay (500);
 end;
 end;
 //Weapon76 lvl
 if  (not inventory.user.byid(6592, item))
  and (User.Level>=76) and (User.Level<85)
  then begin
  if not user.inrange(116509, 76258, -2736,2000)
 then begin
 hunter;
 sta76;
 end else
 begin
  engine.bypasstoserver('_bbshome');delay(1500);
 engine.bypasstoserver('_bbsgetfav');delay(1500);
 engine.bypasstoserver('_bbsfile:smallNpcs/gmshop');delay(1500);
 engine.bypasstoserver('15'); delay(1500);
 engine.npcexchange(6592, 1); Delay (500);
 end;
 end;
// EquipItems
if (User.Level>=76) and (User.Level<85)
then begin
if Inventory.User.ByID(6592,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(6592); delay(1000);
 end;
 if Inventory.User.ByID(6379,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(6379); delay(1000);
 end;
 if Inventory.User.ByID(6380,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(6380);delay(1000);
 end;
  if Inventory.User.ByID(6381,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(6381); delay(1000);
 end;
  if Inventory.User.ByID(6382,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(6382); delay(1000);
 end;
   if Inventory.User.ByID(920,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(920); delay(1000);
 end;
   if Inventory.User.ByID(858,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(858); delay(1000);
 end;
   if Inventory.User.ByID(889,Item)and not Item.Equipped then if (User.Level>=76) and (User.Level<85)  then begin
 Engine.UseItem(889); delay(1000);
 end;
 end;
 end;

 var Captcha:string;
var i:integer;
  procedure PassCaptcha;
begin
    Captcha := Engine.DlgText;
    i:=pos('to Enter',Captcha);
    //Cap:=copy(Captcha,i+6,5);
    if i <> 0 then
    PlaySound('Sounds/Good.wav',false);
   // Delay(1800);
 end;
 


 
begin
 while delay(1500) do begin
 dead;
if  (user.level<=6) then begin  
if (User.Level>=1) and (User.Level<6) then
 begin  buffs;
 engine.loadconfig('tcank');
 engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=6) and (User.Level<20) then
 begin    delay(1000);
 if not user.InRange(694, 179081, -3728,15000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 buffs;
 sspots;
 engine.facecontrol(0, false);  
 Delay (15000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper_Dion.htm');
 Engine.BypassToServer('13', True);Delay (500);
 end else
  if not user.incombat then begin
  buffs;
  sspots;
  engine.loadconfig('tcank');
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=20) and (User.Level<40) then
 begin  delay(500);
 if not user.InRange(85968, 131549, -3664,15000)then
 begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 buffs;
 sspots;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper_Giran.htm');
 Engine.BypassToServer('13', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=40) and (User.Level<52) then
 begin
 sta40;  delay(1500);
 if not user.InRange(172122, 20376, -3328,10000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 sta40;
 buffs;
 sspots;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper_Aden.htm');
 Engine.BypassToServer('16', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta40;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=52) and (User.Level<61) then
 begin
 delay(1500);
 if not user.InRange(182584, -13272, -3040,15000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 sta40;
 buffs;
 sspots;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper_Aden.htm');
 Engine.BypassToServer('14', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta40;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=61) and (User.Level<70) then
 begin
 delay(1500);
 if not user.InRange(176899, -50881, -3392,15000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 sta61;
 buffs;
 sspots;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer(' _bbsgatekeeper_Goddard.htm');
 Engine.BypassToServer('12', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta61;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=70) and (User.Level<76) then
 begin
 delay(1500);
 if not user.InRange(149577, -112475, -2064,15000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 buffs;
 sspots;
 sta61;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_bbsgetfav');Delay (500);
 Engine.BypassToServer('_bbsgatekeeper');Delay (500);
 Engine.BypassToServer(' _bbsgatekeeper_Goddard.htm');
 Engine.BypassToServer('17', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta61;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=76) and (User.Level<78) then
 begin
 delay(1500);
 if not user.InRange(116776, -84984, -3392,15000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 buffs;
 sspots;
 sta76;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_friendlist_0_');Delay (500);
 Engine.BypassToServer('_dropMonstersByName_ solina');Delay (500);
 Engine.BypassToServer('_dropMonsterDetailsByName_22793');
 Engine.BypassToServer('_dropMonsterDetailsByName_22793_3', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta76;
  engine.facecontrol(0, true);
 end;
 end;
 if (User.Level>=78) and (User.Level<86) then
 begin
 delay(1500);
 if not user.InRange(138088, 164104, -2856,20000)
 then begin
 engine.loadconfig('tcank');
 engine.useskill('Escape');
 sta76; buffs; sspots;
 engine.facecontrol(0, false);
 Delay (20000);
 Engine.BypassToServer('_bbshome');Delay (500);
 Engine.BypassToServer('_friendlist_0_');Delay (500);
 Engine.BypassToServer(' _dropMonstersByName_ pythia');Delay (500);
 Engine.BypassToServer('_dropMonsterDetailsByName_22266');
 Engine.BypassToServer('_dropMonsterDetailsByName_22266_3', True);Delay (500);
  end else
  if not user.incombat then begin
  buffs;
  sspots;
  sta76;
  engine.facecontrol(0, true);
 end;
 end;
 
 end;
end.