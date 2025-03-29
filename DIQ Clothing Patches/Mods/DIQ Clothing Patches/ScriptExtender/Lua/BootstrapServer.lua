-- Listener to track when gameplay starts
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)
    local shadowheartUUID = "S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679"
    local orchidContainerTemplate = "Kinn_Shadowheart_Orchid_Container"

    -- List of flags to track
    local flagsToTrack = {
        "ORI_Shadowheart_State_PickedOrchidHerself",
        "ORI_Shadowheart_State_HasReceivedNightOrchid",
        "ORI_Shadowheart_State_ShitHerself" -- Ajax's fault
    }

    -- Function to check and give the container
    local function CheckAndGiveContainer(flagName)
        -- Ensure the flag is set and Shadowheart exists in the game world
        if Osi.IsFlag(shadowheartUUID, flagName, 1) and Osi.Exists(shadowheartUUID) == 1 then
            -- Avoid duplicating the container
            if not Osi.TemplateHasInventoryItem(shadowheartUUID, orchidContainerTemplate) then
                Osi.TemplateAddTo(orchidContainerTemplate, shadowheartUUID, 1, 1)
            end
        end
    end

    -- Register a single listener for all flags
    Ext.Osiris.RegisterListener("CharacterFlagSet", 3, "after", function(characterUUID, flagName, flagValue)
        if characterUUID == shadowheartUUID and flagValue == 1 then
            for _, relevantFlag in ipairs(flagsToTrack) do
                if flagName == relevantFlag then
                    CheckAndGiveContainer(flagName)
                    break
                end
            end
        end
    end)
end)