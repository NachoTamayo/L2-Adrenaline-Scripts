uses SysUtils, Classes, RegExpr;
 
procedure PrintAllTags();  
var RegExp: TRegExpr;
begin  
  RegExp:= TRegExpr.Create;
  RegExp.Expression:= '(<a *(.+?)</a>)|(<button *(.+?)>)';  
  if RegExp.Exec(Engine.DlgText) then
    repeat Print(RegExp.Match[0]);
    until (not RegExp.ExecNext);  
  RegExp.Free;
end;
 
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
 
  Print(bps);                                              
  if (Length(bps) > 0) then Engine.BypassToServer(bps);    
 
  RegExp.Free;                                            
  SL.Free;
end;
 
begin
  PrintAllTags();
  delay(1500);
  Bypass('Mage set');
end.