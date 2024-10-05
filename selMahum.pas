uses SysUtils, Classes, RegExpr;
 
var
  i: integer;
  item: TL2Item;
 
function Bypass(dlg: string): boolean;  
var
  RegExp: TRegExpr;
  SL: TStringList;
  k: integer;
  bps: string;
begin
  Result:= true;                                          
  RegExp:= TRegExpr.Create;                                
  SL:= TStringList.Create;
 
  RegExp.Expression:= '(<a *(.+?)</a>)|(<button *(.+?)>)';  
  if RegExp.Exec(Engine.DlgText) then                      
    repeat SL.Add(RegExp.Match[0]);                        
    until (not RegExp.ExecNext);                          
 
  for k:= 0 to SL.Count-1 do begin                        
    if (Pos(dlg, SL[k]) > 0) then begin                    
      RegExp.Expression:= '"bypass -h *(.+?)"';            
      if RegExp.Exec(SL[k]) then                              
        bps:= TrimLeft(Copy(RegExp.Match[0], 12, Length(RegExp.Match[0])-12));
    end;
  end;
                                            
  if (Length(bps) > 0) then Engine.BypassToServer(bps);    
 
  RegExp.Free;                                            
  SL.Free;
end;

begin
  Engine.SetTarget(30201); 
  while delay(222) do
  begin
    if Inventory.Quest.ByID(15714, item) and (item.count > 399) then
    begin
      Engine.DlgOpen;
      delay(222);
      bypass('Quest');
      delay(222);
      Engine.BypassToServer('10');
      delay(222);
      bypass('reward');
    end;
  end;
end.