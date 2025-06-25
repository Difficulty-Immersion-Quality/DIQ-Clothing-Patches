local wares = {
"2e52d532-af5c-4acc-a474-9dec53f30d2c",
"98650c86-5aa3-420b-9207-446b228e7104",
"a1f3b878-9d75-4a41-ab8f-531d826a256a",
"674f2474-8ce5-4dba-8e79-b4b74568e6db",
}

Ext.Osiris.RegisterListener("PROC_StartTrade", 4, "before", function(player, trader, TRADEMODE, _)
    if trader == "S_GLO_JergalAvatar_0133f2ad-e121-4590-b5f0-a79413919805" then
        for _, itemTemplate in ipairs(wares) do
            TemplateAddTo(itemTemplate, trader, 1, 0)
        end
    end
end)

Ext.Osiris.RegisterListener("TradeEnds", 2, "before", function(player, trader)
    if trader == "S_GLO_JergalAvatar_0133f2ad-e121-4590-b5f0-a79413919805" then
        for _, itemTemplate in ipairs(wares) do
            amount = TemplateIsInInventory(itemTemplate, trader)
            TemplateRemoveFrom(itemTemplate, trader, amount)
        end
    end
end)
