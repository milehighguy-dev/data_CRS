---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by MileHighGuy.
--- DateTime: 3/29/2023 8:21 PM
---

--- My intent with this script is to add another option screen to instant action
--- I want to eventually configure options for a new era mod
--- "Cross Era" will allow for scenarios like Empire vs Droids, Clones vs Rebels, etc..
--- the player will be able to select which sides fight

-- To install: copy the Shell Folder into your mod project
-- munge with "Shell" checked
-- find the shell.lvl in the _LVL_PC folder in your mod project
-- rename it to custom_gc_6.lvl
-- move it to the game directory: GameData/data/_lvl_pc

-- requires the v1.3 patch or higher


--Load the code that will define the buttons on the new option page
ScriptCB_DoFile("crs_option_buttons")

--it works!

--TODO fix tab y spacing
--TODO fix localization
--TODO fix sounds not munging properly

print("DEBUG: loaded crs_instant_option_override.lua")

local override_missionSelect_pcMulti = function()
    print("DEBUG: override ifs_missionselect_pcMulti (pre)")

    table.insert(gPCMultiPlayerSettingsTabsLayout,
            { tag = "_opt_cross", string = "ifs.instantoptions.buttons.settings.cross" })

    --override functions called in the screens "enter" and "accept" functions

    local setting_y_pos = 120
    local setting_y_offset = 50
    local setting_y_offset1 = 30
    function ifs_missionselect_pcMulti_fnShowHostOptionButton(this, bHideButton)

        local tab_number = 2
        if (this == ifs_instant_options) then
            tab_number = 3
            print("DEBUG: fnShowHostOptionButton: this is ifs_instant_options")
        elseif (this == ifs_missionselect) then
            print("DEBUG: fnShowHostOptionButton: this is ifs_missionselect")
        else
            print("DEBUG: fnShowHostOptionButton: this is something else")
        end

        if (bHideButton == nil) then

            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_hero", tab_number, nil, setting_y_pos + setting_y_offset + (2) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_conquest", tab_number, nil, setting_y_pos + setting_y_offset + (3) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_ctf", tab_number, nil, setting_y_pos + setting_y_offset + (4) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_assault", tab_number, nil, setting_y_pos + setting_y_offset + (5) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_hunt", tab_number, nil, setting_y_pos + setting_y_offset + (6) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_cross", tab_number, nil, setting_y_pos + setting_y_offset + (7) * setting_y_offset1)

            ifelem_tabmanager_SetVisable(this, gPCMultiPlayerSettingsTabsLayout, "_opt_host", 1, tab_number)
        else

            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_hero", tab_number, nil, setting_y_pos + setting_y_offset + (1) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_conquest", tab_number, nil, setting_y_pos + setting_y_offset + (2) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_ctf", tab_number, nil, setting_y_pos + setting_y_offset + (3) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_assault", tab_number, nil, setting_y_pos + setting_y_offset + (4) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_hunt", tab_number, nil, setting_y_pos + setting_y_offset + (5) * setting_y_offset1)
            ifelem_tabmanager_SetPos(this, gPCMultiPlayerSettingsTabsLayout, "_opt_cross", tab_number, nil, setting_y_pos + setting_y_offset + (7) * setting_y_offset1)

            ifelem_tabmanager_SetVisable(this, gPCMultiPlayerSettingsTabsLayout, "_opt_host", nil, tab_number)
        end
    end

    local USING_NEW_PC_SHELL = 1
    function ifs_missionselect_pcMulti_fnClickOptionButtons(this)
        print("DEBUG: in ifs_missionselect_pcMulti_fnClickOptionButtons")
        if (USING_NEW_PC_SHELL) then
            print("DEBUG: this.CurButton =", this.CurButton)
            local cur_button = nil
            if (this.CurButton == "_opt_playlist") then
                if (ifs_main and ifs_main.option_mp) then
                    -- multiplayer
                    if (this ~= ifs_missionselect_pcMulti) then
                        print("DEBUG: fnClickOptionButtons: set screen to ifs_missionselect_pcMulti")
                        ScriptCB_SetIFScreen("ifs_missionselect_pcMulti")
                    end
                else
                    -- single player
                    if (this ~= ifs_missionselect) then
                        print("DEBUG: fnClickOptionButtons: set screen to ifs_missionselect")
                        ScriptCB_SetIFScreen("ifs_missionselect")
                    end
                end
            elseif (this.CurButton == "_opt_global") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[1].tag
            elseif (this.CurButton == "_opt_host") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[2].tag
            elseif (this.CurButton == "_opt_hero") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[3].tag
            elseif (this.CurButton == "_opt_conquest") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[4].tag
            elseif (this.CurButton == "_opt_ctf") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[5].tag
            elseif (this.CurButton == "_opt_hunt") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[6].tag
            elseif (this.CurButton == "_opt_assault") then
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[7].tag
            elseif (this.CurButton == "_opt_cross") then
                print("DEBUG: cross button selected")
                --tprint(ifs_ioo_OptionButton_layout.buttonlist)
                cur_button = ifs_ioo_OptionButton_layout.buttonlist[8].tag
            end

            print("DEBUG: cur_button =", cur_button)
            -- go to option screen
            if (cur_button) then
                ifs_instant_options_SetOptionGroup(cur_button, this.CurButton)
                ifelm_shellscreen_fnPlaySound(this.acceptSound)
                --ifs_movietrans_PushScreen(ifs_instant_options)
                ScriptCB_SetIFScreen("ifs_instant_options")
            end
        end
    end

    --fixes button placement
    ifs_missionselect_pcMulti_fnChangeSettingTabsLayout(ifs_missionselect_pcMulti)

end

local override_instantOptions = function()
    print("DEBUG: override ifs_instant_options")

    -- add the new option button

    ifs_io_listtags_cross = {
        title = "ifs.instantoptions.buttons.cross",
        tags = {
            "cross_team1",
            "cross_team1_hero",
            "cross_team2",
            "cross_team2_hero"
        }
    }
    --these functions reference the page tags
    -- ifs_io_changeFunc
    -- ifs_io_GetRealValueFor
    -- ifs_io_GetElementLayoutFor
    -- ifs_instant_options_PopulateItem
    -- ifs_instant_options_fnAdjustItem
    -- how is it 5 different functions...

    ifs_io_listtags["cross"] = ifs_io_listtags_cross

    -- Do things that usually happen in ifs_instant_options_fnBuildScreen

    ifs_missionselect_pcMulti_fnAddOptionButtons(ifs_instant_options)

     -- from ifelem_tabmanager_Create in ifs_instant_options_fnBuildScreen
    ifs_instant_options._Tabs3 = ifelem_tabmanager_DoCreateTabs(gPCMultiPlayerSettingsTabsLayout)

    ifs_instant_options.screens["cross"] = NewIFContainer {}
    Form_CreateVertical(ifs_instant_options.screens["cross"], ifs_io_GetLayoutFor(ifs_io_listtags["cross"], ifs_instant_options))
    IFObj_fnSetVis(ifs_instant_options.screens["cross"], nil)

    --Update the mission setup with our choices
    --use this function because it also pushes the preferences on exit,
    --we want the same behavior
    local original_ifs_instant_options_exit = ifs_instant_options.Exit
    ifs_instant_options.Exit = function(this, bFwd)
        original_ifs_instant_options_exit(this, bFwd)
        print("DEBUG: ifs_instant_options.Exit")

        print("DEBUG: is mission setup saved? " .. tostring(ScriptCB_IsMissionSetupSaved()))
        local missionSetup = ScriptCB_LoadMissionSetup()
        if missionSetup == nil then
            missionSetup = {}
        end
        missionSetup.crossEraEnabled = 1
        missionSetup.attackerTeam = gCrossEra.attackerName
        missionSetup.attackerHero = gCrossEra.attackerHero
        missionSetup.defenderTeam = gCrossEra.defenderName
        missionSetup.defenderHero = gCrossEra.defenderHero
        ScriptCB_SaveMissionSetup(missionSetup)
        print("DEBUG: mission setup saved!")

    end

end

local override_missionSelect = function()
    print("DEBUG: override ifs_missionselect")

    --Add our new button

    table.insert(ifs_ioo_OptionButton_layout.buttonlist,
            { tag = "cross", string = "ifs.instantoptions.buttons.layout.cross" })


    -- create the specific tab we need which would have been done in ifs_missionselect_pcMulti_fnBuildScreen in ifelem_tabmanager_Create
    ifs_missionselect._Tabs2 = ifelem_tabmanager_DoCreateTabs(gPCMultiPlayerSettingsTabsLayout)


end

if AddIFScreen then

    print("DEBUG: AddIFScreen is defined, overriding")

    local crs_originalAddIfScreen = AddIFScreen
    AddIFScreen = function(tableName, ScreenName)
        --print("DEBUG: AddIFScreen " .. tostring(ScreenName))
        if (ScreenName == "ifs_missionselect_pcMulti") then
            override_missionSelect_pcMulti()
            crs_originalAddIfScreen(tableName, ScreenName)
        elseif (ScreenName == "ifs_instant_options") then
            add_crs_buttons()
            override_instantOptions()
            crs_originalAddIfScreen(tableName, ScreenName)
        elseif (ScreenName == "ifs_missionselect") then
            override_missionSelect()
            crs_originalAddIfScreen(tableName, ScreenName)
        else
            crs_originalAddIfScreen(tableName, ScreenName)
        end
    end

else
    print("DEBUG: AddIFScreen is not defined yet!")
end

local gOriginalPushScreen = ScriptCB_PushScreen

ScriptCB_PushScreen = function(screen)
    print("DEBUG: ScriptCB_PushScreen " .. tostring(screen))
    if screen then
        gOriginalPushScreen(screen)
    else
        print("DEBUG: ScriptCB_PushScreen: no screen provided. This should not happen?")
        gOriginalPushScreen()
    end
end

local gOriginalSetScreen = ScriptCB_SetIFScreen
ScriptCB_SetIFScreen = function(screen)
    if screen then
        print("DEBUG: ScriptCB_SetIFScreen " .. tostring(screen))
        gOriginalSetScreen(screen)
    else
        print("DEBUG: ScriptCB_SetIFScreen: no screen provided. This should not happen?")
        gOriginalSetScreen()
    end
end



