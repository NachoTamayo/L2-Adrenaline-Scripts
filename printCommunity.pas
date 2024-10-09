uses SysUtils, Classes, RegExpr;

var RegExp: TRegExpr;
begin  
  RegExp:= TRegExpr.Create;
  RegExp.Expression:= '(<a *(.+?)</a>)|(<button *(.+?)>)';  
  if RegExp.Exec(Engine.cbtext) then
    repeat Print(RegExp.Match[0]);
    until (not RegExp.ExecNext);  
  RegExp.Free;
end.