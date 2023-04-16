--Search through the missionlist to find a map that matches mapName,
--then insert the new flags into said entry.
--Use this when you know the map already exists, but this content patch is just
--adding new gamemodes (otherwise you should just add whole new entries to the missionlist)
function AddNewGameModes(missionList, mapName, newFlags)
	for i, mission in missionList do
		if mission.mapluafile == mapName then
			for flag, value in pairs(newFlags) do
				mission[flag] = value
			end
		end
	end
end


--insert totally new maps here:
local sp_n = 0
local mp_n = 0
sp_n = table.getn(sp_missionselect_listbox_contents)

sp_missionselect_listbox_contents[sp_n+1] = { isModLevel = 1, mapluafile = "CRS%s_%s", era_c = 1, era_v = 1, mode_con_c  = 1, mode_con_v  = 1}
mp_n = table.getn(mp_missionselect_listbox_contents)
mp_missionselect_listbox_contents[mp_n+1] = sp_missionselect_listbox_contents[sp_n+1]

-- associate this mission name with the current downloadable content directory
-- (this tells the engine which maps are downloaded, so you need to include all new mission lua's here)
-- first arg: mapluafile from above
-- second arg: mission script name
-- third arg: level memory modifier.  the arg to LuaScript.cpp: DEFAULT_MODEL_MEMORY_PLUS(x)

AddDownloadableContent("CRS","CRSc_con",4)
AddDownloadableContent("CRS","CRSv_con",4)

-- all done
newEntry = nil
n = nil


-- Now load our core.lvl into the shell to add our localize keys
ReadDataFile("..\\..\\addon\\CRS\\data\\_LVL_PC\\core.lvl")

print("DEBUG: in addme, finished file")