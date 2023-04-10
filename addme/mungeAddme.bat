set LUA_DEBUG_SYMBOLS=""


::mkdir MUNGED

::..\..\ToolsFL\bin\ScriptMunge.exe -inputfile *.lua -continue -platform PC -sourcedir . -outputdir MUNGED

::..\..\ToolsFL\bin\levelpack.exe -inputfile addme.req -writefiles MUNGED\addme.files -continue -platform PC -sourcedir . -inputdir MUNGED\ -outputdir .

::move addme.lvl addme.script

::copy addme.script ..\_LVL_XBOX\

::move *.log MUNGED

md munged
..\..\ToolsFL\bin\scriptmunge -sourcedir . -platform xbox -inputfile addme.lua -outputdir munged\ -checkdate -continue
copy munged\addme.script ..\_LVL_XBOX\