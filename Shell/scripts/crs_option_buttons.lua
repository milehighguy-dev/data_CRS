


--- define global to store the team faction choices

gCrossEra = {
    attackerName = "",
    defenderName = "",
    factions = {
        { name = "rep", string = "common.sides.rep.name" },
        { name = "cis", string = "common.sides.cis.name" },
        { name = "all", string = "common.sides.all.name" },
        { name = "imp", string = "common.sides.imp.name" }
    }
}

gCrossEra.attackerName = gCrossEra.factions[1].name
gCrossEra.defenderName = gCrossEra.factions[2].name




--these functions reference the page tags
-- ifs_io_changeFunc
-- ifs_io_GetRealValueFor
-- ifs_io_GetElementLayoutFor
-- ifs_instant_options_PopulateItem
-- ifs_instant_options_fnAdjustItem
-- how is it 5 different functions...

add_crs_buttons = function()

    print("DEBUG: overriding ifs_instant_options buttons")

    --TODO: pass faction name to mission script
    -- use remaster DB ?
    -- use mission setup?
    -- use save file?

    --choose what setting to set based on selection
    --called when you change a radio button
    local original_ifs_io_changeFunc = ifs_io_changeFunc
    ifs_io_changeFunc = function(form, element)
        original_ifs_io_changeFunc(form, element)
        local this = ifs_instant_options

        print("DEBUG: buttons: ifs_io_changeFunc")
        -- cross era opts
        if (element.tag == "cross_team1") then
            gCrossEra.attackerName = gCrossEra.factions[element.selValue].name
        elseif (element.tag == "cross_team2") then
            gCrossEra.defenderName = gCrossEra.factions[element.selValue].name
        end
    end

    --choose which selection to display based on what was set
    --called in Enter fn for ifs_instant_options
    local original_ifs_io_GetRealValueFor = ifs_io_GetRealValueFor
    ifs_io_GetRealValueFor = function(form, tag)
        original_ifs_io_GetRealValueFor(form, tag)

        local this = ifs_instant_options

        local val = nil
        local mySliderString = nil

        if( tag == "cross_team1") then

            val = 1
            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.attackerName then
                    val = i
                end
            end

        elseif ( tag == "cross_team2") then

            val = 2
            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.defenderName then
                    val = i
                end
            end

        end

        if (val) then
            form.elements[tag].selValue = val

            if (mySliderString) then
                form.elements[tag].sliderString = mySliderString
            else
                form.elements[tag].sliderString = nil
            end
        end
    end

    --This is called in ifs_instant_options build screen
    local original_ifs_io_GetElementLayoutFor = ifs_io_GetElementLayoutFor
    ifs_io_GetElementLayoutFor = function(tagName, screen)
        print("DEBUG: buttons: ifs_io_GetElementLayoutFor: tag name is " .. tostring(tagName))

        local tagTable = original_ifs_io_GetElementLayoutFor(tagName, screen)

        if tagTable == nil then
            tagTable = {}
        end

        local this = screen



        local factions = { }
        for _, entry in gCrossEra.factions do
            table.insert(factions, entry.string)
        end

        --Do stuff with new buttons
        if (tagName == "cross_team1") then
            tagTable.title = "Team 1"
            tagTable.control = "dropdown"
            tagTable.selValue = 1
            tagTable.values = factions
        elseif (tagName == "cross_team2") then
            tagTable.title = "Team 2"
            tagTable.control = "dropdown"
            tagTable.selValue = 2
            tagTable.values = factions
        end

        if (tagTable.control ~= "radio") then
            tagTable.fnChanged = ifs_io_changeFunc
        end

        return tagTable
    end

    --shows the specified string for the button
    --called in ifs_instant_options_layout
    local original_ifs_instant_options_PopulateItem = ifs_instant_options_PopulateItem
    ifs_instant_options_PopulateItem = function(Dest, Tag, bSelected, iColorR, iColorG, iColorB, fAlpha)

        print("DEBUG: buttons: ifs_instant_options_PopulateItem")

        local this = ifs_instant_options
        local ShowStr = Tag
        local ShowUStr = nil

        local OnStr = ScriptCB_getlocalizestr("common.on")
        local OffStr = ScriptCB_getlocalizestr("common.off")

        if (Tag == "cross_team1") then

            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.attackerName then
                    ShowStr = gCrossEra.factions[i].string
                end
            end

        elseif (Tag == "cross_team2") then

            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.defenderName then
                    ShowStr = gCrossEra.factions[i].string
                end
            end

        end

        if (ShowUStr) then
            IFText_fnSetUString(Dest.textitem, ShowUStr)
        elseif (ShowStr) then
            IFText_fnSetString(Dest.textitem, ShowStr)
        end

        if (Tag) then
            IFObj_fnSetColor(Dest.textitem, iColorR, iColorG, iColorB)
            IFObj_fnSetAlpha(Dest.textitem, fAlpha)
        end

        IFObj_fnSetVis(Dest.textitem, Tag)

        original_ifs_instant_options_PopulateItem(Dest, Tag, bSelected, iColorR, iColorG, iColorB, fAlpha)
    end

    --called in input functions to ifs_instant_options
    -- update selection based on controller input
    -- seems like this is only useful on consoles/ controllers, does nothing with mouse
    local original_ifs_instant_options_fnAdjustItem = ifs_instant_options_fnAdjustItem
    ifs_instant_options_fnAdjustItem = function(this, Tag, iAdjust)

        print("DEBUG: buttons: ifs_instant_options_fnAdjustItem, iAdjust is " .. tostring(iAdjust))

        local numElements = table.getn(gCrossEra.factions)

        if (Tag == "cross_team1") then

            local selectedIndex = 1
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.attackerName then
                    selectedIndex = i
                end
            end

            if  (selectedIndex == numElements and iAdjust > 0)
                    or (selectedIndex + iAdjust > numElements) then
                gCrossEra.attackerName = gCrossEra.factions[numElements].name
            elseif (selectedIndex == 1 and iAdjust < 0)
                    or (selectedIndex + iAdjust < 1) then
                gCrossEra.attackerName = gCrossEra.factions[1].name
            else
                gCrossEra.attackerName = gCrossEra.factions[selectedIndex + iAdjust]
            end

        elseif (Tag == "cross_team2") then

            local selectedIndex = 2
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.defenderName then
                    selectedIndex = i
                end
            end

            if  (selectedIndex == numElements and iAdjust > 0)
                    or (selectedIndex + iAdjust > numElements) then
                gCrossEra.defenderName = gCrossEra.factions[numElements].name
            elseif (selectedIndex == 1 and iAdjust < 0)
                    or (selectedIndex + iAdjust < 1) then
                gCrossEra.defenderName = gCrossEra.factions[1].name
            else
                gCrossEra.defenderName = gCrossEra.factions[selectedIndex + iAdjust]
            end

        end

        original_ifs_instant_options_fnAdjustItem(this, Tag, iAdjust)
    end

end