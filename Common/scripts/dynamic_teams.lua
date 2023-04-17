-- dynamically load teams from missionSetup in galactic conquest



function AddSide(teamNumber, teamName, environmentName)

    local sides = {
        all = {
            urban = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    --turret = "all_bldg_defensegridturret",
                    soldier  = { "all_inf_rifleman",7, 25},
                    assault  = { "all_inf_rocketeer",1, 4},
                    engineer = { "all_inf_engineer",1, 4},
                    sniper   = { "all_inf_sniper",1, 4},
                    officer = {"all_inf_officer",1, 4},
                    special = { "all_inf_wookiee",1, 4},
                    hero = "all_hero_luke_jedi"
                },

                lvl = {
                    file = "SIDE\\all.lvl",
                    children = {"all_bldg_defensegridturret",
                                "all_inf_rifleman",
                                "all_inf_rocketeer",
                                "all_inf_engineer",
                                "all_inf_sniper",
                                "all_inf_officer",
                                "all_hero_luke_jedi",
                                "all_inf_wookiee"}
                }
            },

            snow = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier = {"all_inf_rifleman_snow",9, 25},
                    assault = {"all_inf_rocketeer_snow",1, 4},
                    engineer = {"all_inf_engineer_snow",1, 4},
                    sniper  = {"all_inf_sniper_snow",1, 4},
                    officer = {"all_inf_officer_snow",1, 4},
                    special = {"all_inf_wookiee_snow",1, 4},
                    hero = "all_hero_luke_jedi"
                },

                lvl = {
                    file = "SIDE\\all.lvl",
                    children = {"all_fly_snowspeeder",
                                "all_inf_rifleman_snow",
                                "all_inf_rocketeer_snow",
                                "all_inf_engineer_snow",
                                "all_inf_sniper_snow",
                                "all_inf_officer_snow",
                                "all_inf_wookiee_snow",
                                "all_hero_luke_jedi",
                                "all_walk_tauntaun"}
                }
            },

            jungle = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier = {"all_inf_rifleman_jungle",9, 25},
                    assault = {"all_inf_rocketeer_jungle",1, 4},
                    engineer = {"all_inf_engineer_jungle",1, 4},
                    sniper  = {"all_inf_sniper_jungle",1, 4},
                    officer = {"all_inf_officer_jungle",1, 4},
                    special = {"all_inf_wookiee",1, 4},
                    hero = "all_hero_luke_jedi"
                },

                lvl = {
                    file = "SIDE\\all.lvl",
                    children = { "all_inf_rifleman_jungle",
                                 "all_inf_rocketeer_jungle",
                                 "all_inf_engineer_jungle",
                                 "all_inf_sniper_jungle",
                                 "all_inf_officer_jungle",
                                 "all_inf_wookiee",
                                 "all_hero_luke_jedi",
                                 "all_hover_combatspeeder"}
                }
            },

            fleet = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier = {"all_inf_rifleman_fleet",9, 25},
                    assault = {"all_inf_rocketeer_fleet",1, 4},
                    engineer = {"all_inf_engineer_fleet",1, 4},
                    sniper  = {"all_inf_sniper_fleet",1, 4},
                    officer = {"all_inf_officer",1, 4},
                    special = {"all_inf_wookiee",1, 4},
                    hero = "all_hero_luke_jedi"
                },

                lvl = {
                    file = "SIDE\\all.lvl",
                    children = { "all_inf_rifleman_fleet",
                                 "all_inf_rocketeer_fleet",
                                 "all_inf_engineer_fleet",
                                 "all_inf_sniper_fleet",
                                 "all_inf_officer",
                                 "all_inf_wookiee",
                                 "all_hero_luke_jedi",
                                 "all_hover_combatspeeder"}
                }
            },
            space = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = -1,
                    pilot    = { "all_inf_pilot",25},
                    marine   = { "all_inf_marine",8},
                },

                lvl = {
                    file = "SIDE\\all.lvl",
                    children = { "all_inf_pilot",
                                 "all_inf_marine",
                                 "all_fly_xwing_sc",
                                 "all_fly_ywing_sc",
                                 "all_fly_awing",
                                 "all_fly_gunship_sc"}
                }
            }
        },
        imp = {
            default = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier  = { "imp_inf_rifleman",9, 25},
                    assault  = { "imp_inf_rocketeer",1, 4},
                    engineer = { "imp_inf_engineer",1, 4},
                    sniper   = { "imp_inf_sniper",1, 4},
                    officer = {"imp_inf_officer",1, 4},
                    special = { "imp_inf_dark_trooper",1, 4},
                    hero = "imp_hero_emperor"
                },
                lvl = {
                    file = "SIDE\\imp.lvl",
                    children = {"imp_inf_rifleman",
                                "imp_inf_rocketeer",
                                "imp_inf_engineer",
                                "imp_inf_sniper",
                                "imp_inf_officer",
                                "imp_inf_dark_trooper",
                                "imp_hero_emperor",
                                "imp_hover_fightertank"}
                }
            },
            snow = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier = {"imp_inf_rifleman_snow",9, 25},
                    assault = {"imp_inf_rocketeer_snow",1, 4},
                    engineer   = {"imp_inf_engineer_snow",1, 4},
                    sniper  = {"imp_inf_sniper_snow",1, 4},
                    officer = {"imp_inf_officer",1, 4},
                    special = {"imp_inf_dark_trooper",1, 4},
                    hero = "imp_hero_darthvader"
                },
                lvl = {
                    file = "SIDE\\imp.lvl",
                    children = {"imp_inf_rifleman_snow",
                                "imp_inf_rocketeer_snow",
                                "imp_inf_sniper_snow",
                                "imp_inf_dark_trooper",
                                "imp_inf_engineer_snow",
                                "imp_inf_officer",
                                "imp_hero_darthvader",
                                "imp_walk_atat",
                                "imp_walk_atst_snow"}
                }
            },
            space = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = -1,
                    pilot    = { "imp_inf_pilot",25},
                    marine   = { "imp_inf_marine",8},
                },
                lvl = {
                    file = "SIDE\\imp.lvl",
                    children = {"imp_inf_pilot",
                                "imp_inf_marine",
                                "imp_fly_tiefighter_sc",
                                "imp_fly_tiebomber_sc",
                                "imp_fly_tieinterceptor",
                                "imp_fly_trooptrans"}
                }
            }
        },
        rep = {
            ep3 = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier  = { "rep_inf_ep3_rifleman",9, 25},
                    assault  = { "rep_inf_ep3_rocketeer",1, 4},
                    engineer = { "rep_inf_ep3_engineer",1, 4},
                    sniper   = { "rep_inf_ep3_sniper",1, 4},
                    officer = {"rep_inf_ep3_officer",1, 4},
                    special = { "rep_inf_ep3_jettrooper",1, 4},
                    hero = "rep_hero_obiwan"
                },
                lvl = {
                    file = "SIDE\\rep.lvl",
                    children = { "rep_inf_ep3_rifleman",
                                 "rep_inf_ep3_rocketeer",
                                 "rep_inf_ep3_engineer",
                                 "rep_inf_ep3_sniper",
                                 "rep_inf_ep3_officer",
                                 "rep_inf_ep3_jettrooper",
                                 "rep_hero_obiwan",
                                 "rep_walk_oneman_atst"}
                }
            },
            ep2 = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier  = { "rep_inf_ep2_rifleman",9, 25},
                    assault  = { "rep_inf_ep2_rocketeer",1, 4},
                    engineer = { "rep_inf_ep2_engineer",1, 4},
                    sniper   = { "rep_inf_ep2_sniper",1, 4},
                    officer = {"rep_inf_ep3_officer",1, 4},
                    special = { "rep_inf_ep2_jettrooper",1, 4},
                    hero = "rep_hero_macewindu"
                },
                lvl = {
                    file = "SIDE\\rep.lvl",
                    children = {"rep_fly_assault_dome",
                                "rep_fly_gunship_dome",
                                "rep_fly_jedifighter_dome",
                                "rep_inf_ep2_rocketeer",
                                "rep_inf_ep2_rifleman",
                                "rep_inf_ep2_jettrooper",
                                "rep_inf_ep2_sniper",
                                "rep_inf_ep3_officer",
                                "rep_inf_ep2_engineer",
                                "rep_hero_macewindu",
                                "rep_walk_atte"}
                }
            },
            space = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = -1,
                    pilot    = { "rep_inf_ep3_pilot",26},
                    marine   = { "rep_inf_ep3_marine",6}
                },
                lvl = {
                    file = "SIDE\\rep.lvl",
                    children = {"rep_inf_ep3_pilot",
                                "rep_inf_ep3_marine",
                                "rep_fly_assault_dome",
                                "rep_fly_anakinstarfighter_sc",
                                "rep_fly_arc170fighter_sc",
                                "rep_veh_remote_terminal",
                                "rep_fly_gunship_sc",
                                "rep_fly_arc170fighter_dome",
                                "rep_fly_vwing"}
                }
            }
        },
        cis = {
            default = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = 150,
                    soldier  = { "cis_inf_rifleman",9, 25},
                    assault  = { "cis_inf_rocketeer",1, 4},
                    engineer = { "cis_inf_engineer",1, 4},
                    sniper   = { "cis_inf_sniper",1, 4},
                    officer = {"cis_inf_officer",1, 4},
                    special = { "cis_inf_droideka",1, 4},
                    hero = "cis_hero_countdooku"
                },
                lvl = {
                    file ="SIDE\\cis.lvl",
                    children = {"cis_fly_droidfighter_dome",
                                "cis_inf_rifleman",
                                "cis_inf_rocketeer",
                                "cis_inf_sniper",
                                "cis_inf_officer",
                                "cis_inf_engineer",
                                "cis_hero_countdooku",
                                "cis_inf_droideka",
                                "cis_tread_hailfire",
                                "cis_walk_spider" }
                }
            },
            space = {
                setup_team = {
                    team = teamNumber,
                    units = 32,
                    reinforcements = -1,
                    pilot    = { "cis_inf_pilot",26},
                    marine   = { "cis_inf_marine",6},
                },
                lvl = {
                    file ="SIDE\\cis.lvl",
                    children = {"cis_inf_pilot",
                                "cis_inf_marine",
                                "cis_fly_fedlander_dome",
                                "cis_fly_droidfighter_sc",
                                "cis_fly_droidfighter_dome",
                                "cis_fly_greviousfighter",
                                "cis_fly_droidgunship",
                                "cis_fly_tridroidfighter" }
                }
            }
        }
    }

    --set up defaults if not set up already
    sides.all.default = sides.all.urban
    sides.rep.default = sides.rep.ep3

    local side = sides[teamName]
    local environment = side[environmentName] or side.default

    --print("loading side " .. tostring(side) .. " with environment " .. tostring(environment))

    ReadDataFile(environment.lvl.file, unpack(environment.lvl.children))
    SetupTeams{[teamName] = environment.setup_team}

    --sides.all.default = sides.all.urban
    --sides.rep.default = sides.rep.ep3
    --
    --local side2 = sides[defendingTeamName]
    --local environment2 = side2[environmentName] or side2.default
    --
    ----print("loading side " .. tostring(side) .. " with environment " .. tostring(environment))
    --
    --ReadDataFile(environment2.lvl.file, unpack(environment2.lvl.children))
    --SetupTeams{[defendingTeamName] = environment2.setup_team}
end

function SetupSounds(attackingTeamName, defendingTeamName, planetName )

    -- load common sounds, attacking team sounds, and defending team sounds
    -- hopefully they contain everything we need!
    --ReadDataFile("dc:sound\\gdb.lvl;commonsound")
    --ReadDataFile("dc:sound\\gdb.lvl;" .. attackingTeamName)
    --ReadDataFile("dc:sound\\gdb.lvl;" .. defendingTeamName)

    -- example values "imp", "all", "yav"
    -- attacker is 1 defender is 2
    -- this assumes all sound streams have the same naming conventions (which they do in the stock maps)
    -- TODO handle cases like hoth, endor, geonosis where there are not 2 eras. probably will have to add sounds manually

    --might as well leave this out of this script, leave in level script
    --ReadDataFile("sound\\nab.lvl;nab2cw")

    --choose random music
    local chooseMusic = math.random(1,2)
    if chooseMusic == 1 then
        OpenAudioStream("sound\\global.lvl",  "cw_music")
    else
        OpenAudioStream("sound\\global.lvl",  "gcw_music")
    end

    if planetName == "spa" then

        voiceSlow = OpenAudioStream("sound\\global.lvl", "spa1_objective_vo_slow")
        AudioStreamAppendSegments("sound\\global.lvl", defendingTeamName .. "_unit_vo_slow", voiceSlow)
        AudioStreamAppendSegments("sound\\global.lvl", attackingTeamName .. "_unit_vo_slow", voiceSlow)
        AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)

        voiceQuick = OpenAudioStream("sound\\global.lvl",  "spa1_objective_vo_slow")
        AudioStreamAppendSegments("sound\\global.lvl",  defendingTeamName .. "_unit_vo_quick", voiceSlow)
        AudioStreamAppendSegments("sound\\global.lvl",  attackingTeamName .. "_unit_vo_quick", voiceQuick)

    else
        voiceSlow = OpenAudioStream("sound\\global.lvl", defendingTeamName .. "_unit_vo_slow")
        AudioStreamAppendSegments("sound\\global.lvl", attackingTeamName .. "_unit_vo_slow", voiceSlow)
        AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)

        voiceQuick = OpenAudioStream("sound\\global.lvl",  defendingTeamName .. "_unit_vo_quick")
        AudioStreamAppendSegments("sound\\global.lvl",  attackingTeamName .. "_unit_vo_quick", voiceQuick)

    end

    if planetName == "tat1" or planetName == "tat2" or planetName == "tat3" then
        planetName = "tat"
    end

    SetBleedingVoiceOver(2, 2, defendingTeamName .. "_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(2, 1, defendingTeamName .. "_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(1, 2, attackingTeamName .. "_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(1, 1, attackingTeamName .. "_off_com_report_us_overwhelmed", 1)

    SetOutOfBoundsVoiceOver(1, attackingTeamName .. "leaving")
    SetOutOfBoundsVoiceOver(2, defendingTeamName .. "leaving")

    SetAmbientMusic(2, 1.0, defendingTeamName .. "_" .. planetName .. "_amb_start",  0,1)
    SetAmbientMusic(2, 0.8, defendingTeamName .. "_" .. planetName .. "_amb_middle", 1,1)
    SetAmbientMusic(2, 0.2, defendingTeamName .. "_" .. planetName .. "_amb_end",    2,1)
    SetAmbientMusic(1, 1.0, attackingTeamName .. "_" .. planetName .. "_amb_start",  0,1)
    SetAmbientMusic(1, 0.8, attackingTeamName .. "_" .. planetName .. "_amb_middle", 1,1)
    SetAmbientMusic(1, 0.2, attackingTeamName .. "_" .. planetName .. "_amb_end",    2,1)

    SetVictoryMusic(2, defendingTeamName .. "_" .. planetName .. "_amb_victory")
    SetDefeatMusic (2, defendingTeamName .. "_" .. planetName .. "_amb_defeat")
    SetVictoryMusic(1, attackingTeamName .. "_" .. planetName .. "_amb_victory")
    SetDefeatMusic (1, attackingTeamName .. "_" .. planetName .. "_amb_defeat")

end

function addDynamicSides(environmentName, worldName)

    local attackingTeamName = nil
    local defendingTeamName = nil
    local teamItems = nil

    if ScriptCB_IsMissionSetupSaved() then
        local missionSetup = ScriptCB_LoadMissionSetup()
        teamItems = missionSetup.units -- Galactic Conquest Only (for now)
        attackingTeamName = missionSetup.attackerTeam
        defendingTeamName = missionSetup.defenderTeam
        worldName = missionSetup.world or worldName
    end

    print("addDynamicSides, loaded mission setup")
    print("attacker is " .. tostring(attackingTeamName) .. " defender is " .. tostring(defendingTeamName))

    --for mission scripts attacker is 1 and defender 2
    AddSide(1, attackingTeamName, environmentName)
    print("addDynamicSides, added team 1")
    AddSide(2, defendingTeamName, environmentName)
    print("addDynamicSides, added team 2")

    SetupSounds(attackingTeamName, defendingTeamName, worldName)
    print("addDynamicSides, loaded sounds")

end

function addDynamicSidesSpace()

    local attackingTeamName = nil
    local defendingTeamName = nil
    local worldName = nil
    local teamItems = nil

    if ScriptCB_IsMissionSetupSaved() then
        local missionSetup = ScriptCB_LoadMissionSetup()
        teamItems = missionSetup.units -- GC only
        attackingTeamName = missionSetup.teams.attackerName
        defendingTeamName = missionSetup.teams.defenderName
        worldName = missionSetup.world
    end

    print("addDynamicSides, loaded mission setup")
    print("attacker is " .. tostring(attackingTeamName) .. " defender is " .. tostring(defendingTeamName))

    SetupSounds(attackingTeamName, defendingTeamName, "spa")
    print("addDynamicSides, loaded sounds")

    --for mission scripts attacker is 1 and defender 2
    AddSide(1, attackingTeamName, "space")
    print("addDynamicSides, added team 1")
    AddSide(2, defendingTeamName, "space")
    print("addDynamicSides, added team 2")



end
