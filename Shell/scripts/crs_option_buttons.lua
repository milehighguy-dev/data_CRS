--these functions reference the page tags
-- ifs_io_changeFunc
-- ifs_io_GetRealValueFor
-- ifs_io_GetElementLayoutFor
-- ifs_instant_options_PopulateItem
-- ifs_instant_options_fnAdjustItem
-- how is it 5 different functions...

add_crs_buttons = function()

    print("DEBUG: overriding ifs_instant_options buttons")

    --TODO: get dropdowns to display
    --TODO: change hero values to faction names
    --TODO: pass faction name to mission script
    -- use remaster DB ?

    local original_ifs_io_changeFunc = ifs_io_changeFunc
    ifs_io_changeFunc = function(form, element)
        original_ifs_io_changeFunc(form, element)
        local this = ifs_instant_options

        print("DEBUG: buttons: ifs_io_changeFunc")
        -- cross era opts
        if (element.tag == "cross_team1") then
            if(element.selValue == 1) then
                this.HeroPrefs.iHeroPlayer = 1
            elseif(element.selValue == 2) then
                this.HeroPrefs.iHeroPlayer = 4
            else
                this.HeroPrefs.iHeroPlayer = 7
            end
        elseif (element.tag == "cross_team2") then
            if(element.selValue == 1) then
                this.HeroPrefs.iHeroPlayer = 1
            elseif(element.selValue == 2) then
                this.HeroPrefs.iHeroPlayer = 4
            else
                this.HeroPrefs.iHeroPlayer = 7
            end
        end
    end

    local original_ifs_io_GetRealValueFor = ifs_io_GetRealValueFor
    ifs_io_GetRealValueFor = function(form, tag)
        original_ifs_io_GetRealValueFor(form, tag)

        print("DEBUG: buttons: ifs_io_GetRealValueFor")

        local this = ifs_instant_options

        local val = nil
        local mySliderString = nil

        if( tag == "cross_team1") then
            -- only 1, 4, 7 are valid
            if(this.HeroPrefs.iHeroPlayer == 1) then
                val = 1
            elseif(this.HeroPrefs.iHeroPlayer == 4) then
                val = 2
            else --this.HeroPrefs.iHeroPlayer == 7
                val = 3
            end
        elseif ( tag == "cross_team2") then
            -- only 1, 4, 7 are valid
            if(this.HeroPrefs.iHeroPlayer == 1) then
                val = 1
            elseif(this.HeroPrefs.iHeroPlayer == 4) then
                val = 2
            else --this.HeroPrefs.iHeroPlayer == 7
                val = 3
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

    local original_ifs_io_GetElementLayoutFor = ifs_io_GetElementLayoutFor
    ifs_io_GetElementLayoutFor = function(tagName, screen)
        local tagTable = original_ifs_io_GetElementLayoutFor(tagName, screen)

        print("DEBUG: buttons: ifs_io_GetElementLayoutFor")

        if tagTable == nil then
            tagTable = {}
        end

        local this = screen

        local factions = { "Republic", "CIS", "Empire", "Rebels" }

        --Do stuff with new buttons
        if (tagName == "cross_team1") then
            tagTable.myTitle = "Team 1"
            tagTable.myControl = "dropdown"
            tagTable.mySelValue = 1
            tagTable.myValues = factions
        elseif (tagName == "cross_team1") then
            tagTable.myTitle = "Team 2"
            tagTable.myControl = "dropdown"
            tagTable.mySelValue = 2
            tagTable.myValues = factions
        end

        if (tagTable.myControl ~= "radio") then
            tagTable. myFnChanged = ifs_io_changeFunc
        end

        return tagTable
    end

    local original_ifs_instant_options_PopulateItem = ifs_instant_options_PopulateItem
    ifs_instant_options_PopulateItem = function(Dest, Tag, bSelected, iColorR, iColorG, iColorB, fAlpha)

        print("DEBUG: buttons: ifs_instant_options_PopulateItem")

        local this = ifs_instant_options
        local ShowStr = Tag
        local ShowUStr = nil

        local OnStr = ScriptCB_getlocalizestr("common.on")
        local OffStr = ScriptCB_getlocalizestr("common.off")

        --TODO set correct strings
        if (Tag == "cross_team1") then
            if (this.GamePrefs.bHeroesEnabled) then
                if (this.HeroPrefs.iHeroPlayer == 1) then
                    ShowStr = "ifs.mp.heroopts.heroplayer1"
                elseif (this.HeroPrefs.iHeroPlayer == 2) then
                    ShowStr = "ifs.mp.heroopts.heroplayer2"
                elseif (this.HeroPrefs.iHeroPlayer == 3) then
                    ShowStr = "ifs.mp.heroopts.heroplayer3"
                elseif (this.HeroPrefs.iHeroPlayer == 4) then
                    ShowStr = "ifs.mp.heroopts.heroplayer4"
                end
            else
                ShowStr = ""
            end
        elseif (Tag == "cross_team2") then
            if (this.GamePrefs.bHeroesEnabled) then
                if (this.HeroPrefs.iHeroPlayer == 1) then
                    ShowStr = "ifs.mp.heroopts.heroplayer1"
                elseif (this.HeroPrefs.iHeroPlayer == 2) then
                    ShowStr = "ifs.mp.heroopts.heroplayer2"
                elseif (this.HeroPrefs.iHeroPlayer == 3) then
                    ShowStr = "ifs.mp.heroopts.heroplayer3"
                elseif (this.HeroPrefs.iHeroPlayer == 4) then
                    ShowStr = "ifs.mp.heroopts.heroplayer4"
                end
            else
                ShowStr = ""
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

    local original_ifs_instant_options_fnAdjustItem = ifs_instant_options_fnAdjustItem
    ifs_instant_options_fnAdjustItem = function(this, Tag, iAdjust)

        print("DEBUG: buttons: ifs_instant_options_fnAdjustItem")

        --TODO fix pref values
        if (Tag == "cross_team1") then
            if (this.HeroPrefs.iHeroPlayer == 1) then
                if (iAdjust > 0) then
                    this.HeroPrefs.iHeroPlayer = 4
                end
            elseif (this.HeroPrefs.iHeroPlayer == 4) then
                if (iAdjust > 0) then
                    this.HeroPrefs.iHeroPlayer = 7
                else
                    this.HeroPrefs.iHeroPlayer = 1
                end
            else
                if (iAdjust < 0) then
                    this.HeroPrefs.iHeroPlayer = 4
                end
            end
        elseif (Tag == "cross_team2") then
            if (this.HeroPrefs.iHeroPlayer == 1) then
                if (iAdjust > 0) then
                    this.HeroPrefs.iHeroPlayer = 4
                end
            elseif (this.HeroPrefs.iHeroPlayer == 4) then
                if (iAdjust > 0) then
                    this.HeroPrefs.iHeroPlayer = 7
                else
                    this.HeroPrefs.iHeroPlayer = 1
                end
            else
                if (iAdjust < 0) then
                    this.HeroPrefs.iHeroPlayer = 4
                end
            end
        end

        original_ifs_instant_options_fnAdjustItem(this, Tag, iAdjust)
    end

end