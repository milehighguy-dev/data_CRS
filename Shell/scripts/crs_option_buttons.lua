--- define global to store the team faction choices

gCrossEra = {
    attackerName = "",
    defenderName = "",
    attackerHero = "",
    defenderHero = "",
    attackerHeroes = {},
    defenderHeroes = {},
    factions = {
        {
            name = "rep",
            string = "common.sides.rep.name",
            heroes = {
                "rep_hero_aalya",
                "rep_hero_anakin",
                "rep_hero_cloakedanakin",
                "rep_hero_kiyadimundi",
                "rep_hero_macewindu",
                "rep_hero_macewindu_obi",
                "rep_hero_obiwan",
                "rep_hero_yoda"
            }
        },
        {
            name = "cis",
            string = "common.sides.cis.name",
            heroes = {
                "cis_hero_countdooku",
                "cis_hero_darthmaul",
                "cis_hero_grievous",
                "cis_hero_jangofett"
            }
        },
        {
            name = "all",
            string = "common.sides.all.name",
            heroes = {
                "all_hero_chewbacca",
                "all_hero_hansolo_storm",
                "all_hero_hansolo_tat",
                "all_hero_leia",
                "all_hero_luke_jedi",
                "all_hero_luke_pilot",
                "all_hero_luke_storm",
                "all_hero_luke_tat"
            }
        },
        {
            name = "imp",
            string = "common.sides.imp.name",
            heroes = {
                "imp_hero_bobafett",
                "imp_hero_darthvader",
                "imp_hero_emperor"
            }
        }
    }
}

gCrossEra.attackerName = gCrossEra.factions[1].name
gCrossEra.attackerHeroes = gCrossEra.factions[1].heroes
gCrossEra.attackerHero = gCrossEra.factions[1].heroes[1]

gCrossEra.defenderName = gCrossEra.factions[2].name
gCrossEra.defenderHeroes = gCrossEra.factions[2].heroes
gCrossEra.defenderHero = gCrossEra.factions[2].heroes[1]

--these functions reference the page tags
-- ifs_io_changeFunc
-- ifs_io_GetRealValueFor
-- ifs_io_GetElementLayoutFor
-- ifs_instant_options_PopulateItem
-- ifs_instant_options_fnAdjustItem
-- how is it 5 different functions...

add_crs_buttons = function()

    print("DEBUG: overriding ifs_instant_options buttons")

    --TODO dropdown length is only based on the initial size...

    --choose what setting to set based on selection
    --called when you change a radio button
    local original_ifs_io_changeFunc = ifs_io_changeFunc
    ifs_io_changeFunc = function(form, element)
        original_ifs_io_changeFunc(form, element)
        --local this = ifs_instant_options

        print("DEBUG: buttons: ifs_io_changeFunc")
        -- cross era opts
        if (element.tag == "cross_team1") then

            gCrossEra.attackerName = gCrossEra.factions[element.selValue].name
            gCrossEra.attackerHeroes = gCrossEra.factions[element.selValue].heroes
            --update the hero options
            ifs_io_changeFunc(form, form.elements["cross_team1_hero"])

        elseif (element.tag == "cross_team2") then

            gCrossEra.defenderName = gCrossEra.factions[element.selValue].name
            gCrossEra.defenderHeroes = gCrossEra.factions[element.selValue].heroes
            --update the hero options
            ifs_io_changeFunc(form, form.elements["cross_team2_hero"])

        elseif (element.tag == "cross_team1_hero") then

            form.elements["cross_team1_hero"].values = gCrossEra.attackerHeroes
            gCrossEra.attackerHero = gCrossEra.attackerHeroes[element.selValue]
            -- do this otherwise you have to click for the options to update
            -- also updates the length of the dropdown
            --custom_form_updateDropdown(form, "cross_team1_hero")

        elseif (element.tag == "cross_team2_hero") then

            form.elements["cross_team2_hero"].values = gCrossEra.defenderHeroes
            gCrossEra.defenderHero = gCrossEra.defenderHeroes[element.selValue]
            --custom_form_updateDropdown(form, "cross_team2_hero")

        end
    end

    -- home made function to update the length of the list in the dropdown
    -- based on Form_CreateVertical
    custom_form_updateDropdown = function(form, dropDownKey)

        --reset these values
        local maxDropdownItems = 10
        form.dropdowns[dropDownKey].listbox.Layout.showcount = maxDropdownItems
        form.dropdowns[dropDownKey].listbox.Layout.slider = 1
        -- change to slider if needed
        local count = table.getn(form.elements[dropDownKey].values)
        if( count > 0 and count < form.dropdowns[dropDownKey].listbox.Layout.showcount ) then
            form.dropdowns[dropDownKey].listbox.Layout.showcount = count
            form.dropdowns[dropDownKey].listbox.Layout.slider = nil
        end

        local listboxheight = form.dropdowns[dropDownKey].listbox.Layout.showcount * (form.dropdowns[dropDownKey].listbox.Layout.yHeight + form.dropdowns[dropDownKey].listbox.Layout.ySpacing) + 30

        form.dropdowns[dropDownKey].listbox.height = listboxheight

        --local elementWidth = layout.width or 300
        --dropdown.Layout.showcount.width = elementWidth * 0.9
        --ListManager_fnInitList(form.dropdowns[dropDownKey].listbox, form.dropdowns[dropDownKey].listbox.Layout)
        form.dropdowns[dropDownKey].expanded = false
        --dropdown.tag = layout.elements[i].tag
        local index = form.elements[form.elements[dropDownKey].tag].selValue;
        form.dropdowns[dropDownKey].listbox.Layout.SelectedIdx = index
        form.dropdowns[dropDownKey].listbox.Layout.CursorIdx = index
        form.dropdowns[dropDownKey].listbox.Layout.FirstShownIdx = index
        ListManager_fnFillContents(form.dropdowns[dropDownKey].listbox,form.elements[dropDownKey].values or {},form.dropdowns[dropDownKey].listbox.Layout)
        IFObj_fnSetVis(form.dropdowns[dropDownKey].listbox,nil)

        Form_SetValues(form)
        ---- fix zordering on all the dropdowns.
        --local i = form.buttons[dropDownKey].y / 600 * 255
        --IFObj_fnSetZPos(form.dropdowns[dropDownKey], i)

        --print("DEBUG: AFTER: printing dropdown listbox for " .. tostring(dropDownKey))
        tprint(form.elements[dropDownKey])
        print("\n\n\n")
        tprint(form.dropdowns[dropDownKey])

        --form.elements[dropDownKey].values
        --form.dropdowns[dropDownKey].listbox.Contents

    end

    --choose which selection to display based on what was set
    --called in Enter fn for ifs_instant_options
    local original_ifs_io_GetRealValueFor = ifs_io_GetRealValueFor
    ifs_io_GetRealValueFor = function(form, tag)
        original_ifs_io_GetRealValueFor(form, tag)

        local this = ifs_instant_options

        local val = nil
        local mySliderString = nil

        if (tag == "cross_team1") then

            val = 1
            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.attackerName then
                    val = i
                end
            end

        elseif (tag == "cross_team2") then

            val = 2
            local numElements = table.getn(gCrossEra.factions)
            for i = 1, numElements do
                if gCrossEra.factions[i].name == gCrossEra.defenderName then
                    val = i
                end
            end
        elseif ( tag == "cross_team1_hero") then
            val = 1
            local numElements = table.getn(gCrossEra.attackerHeroes)
            for i = 1, numElements do
                if gCrossEra.attackerHeroes[i] == gCrossEra.attackerHero then
                    val = i
                end
            end
        elseif ( tag == "cross_team2_hero") then
            val = 1
            local numElements = table.getn(gCrossEra.defenderHeroes)
            for i = 1, numElements do
                if gCrossEra.defenderHeroes[i] == gCrossEra.defenderHero then
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
        elseif ( tagName == "cross_team1_hero") then
            tagTable.title = "Team 1 Hero"
            tagTable.control = "dropdown"
            tagTable.selValue = 1
            tagTable.values = gCrossEra.attackerHeroes
        elseif ( tagName == "cross_team2_hero") then
            tagTable.title = "Team 2 Hero"
            tagTable.control = "dropdown"
            tagTable.selValue = 1
            tagTable.values = gCrossEra.defenderHeroes
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
        elseif (Tag == "cross_team1_hero") then

            local numElements = table.getn(gCrossEra.attackerHeroes)
            for i = 1, numElements do
                if gCrossEra.attackerHeroes[i] == gCrossEra.attackerHero then
                    ShowStr = ScriptCB_getlocalizestr(gCrossEra.attackerHeroes[i])
                end
            end

        elseif (Tag == "cross_team2_hero") then

            local numElements = table.getn(gCrossEra.defenderHeroes)
            for i = 1, numElements do
                if gCrossEra.defenderHeroes[i] == gCrossEra.defenderHero then
                    ShowStr = ScriptCB_getlocalizestr(gCrossEra.defenderHeroes[i])
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

            if (selectedIndex == numElements and iAdjust > 0)
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

            if (selectedIndex == numElements and iAdjust > 0)
                    or (selectedIndex + iAdjust > numElements) then
                gCrossEra.defenderName = gCrossEra.factions[numElements].name
            elseif (selectedIndex == 1 and iAdjust < 0)
                    or (selectedIndex + iAdjust < 1) then
                gCrossEra.defenderName = gCrossEra.factions[1].name
            else
                gCrossEra.defenderName = gCrossEra.factions[selectedIndex + iAdjust]
            end
        elseif (Tag == "cross_team1_hero") then
        elseif (Tag == "cross_team2_hero") then
        end

        original_ifs_instant_options_fnAdjustItem(this, Tag, iAdjust)
    end

end