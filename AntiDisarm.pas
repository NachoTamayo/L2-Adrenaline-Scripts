const
  ItemID = 6608;  // 6608 ID of Arcana Mace (Acumen)
var
  item: TL2Item;

begin
  while delay(1000) do 
    if inventory.user.byid(ItemID, item) and not (Item.Equipped)
      then
       begin
          Engine.UseItem(ItemID);
          delay(1000);
  end;
end.