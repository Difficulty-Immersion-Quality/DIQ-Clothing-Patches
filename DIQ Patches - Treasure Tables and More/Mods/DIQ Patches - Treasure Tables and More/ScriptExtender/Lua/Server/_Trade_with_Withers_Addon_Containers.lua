local wares = {
"165ddf26-6e63-4d88-a451-4559a17c9020",
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
