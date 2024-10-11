var
Skill: TL2Skill;
novengine: TL2Control;
begin
    novengine := getcontrol('Summoner name');              // Summoner name
    if novengine.getUser.inrange(147529,-113290,-2111,250) // Character position
    and novengine.getskilllist.byid(1403, Skill)           // And have 'Summon friend' skill
    and (Skill.endtime = 0)                                // And skill is ready
    then
        begin
        delay(700);                                        // Min delay
        novengine.SetTarget('Your name');                  // Name who should be summoned
        delay(700);                                        // Min delay
        novengine.UseSkill(Skill);                         // Use skill
        end;
end.