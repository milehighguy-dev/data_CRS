
print("DEBUG: loaded cross era instant action options script")

--copied from conquest for now
ifs_io_listtags_cross =
{
    title = "ifs.instantoptions.titles.conquest",
    tags  =
    {
        "con_numbots",
        "con_mult",
        "con_timer",
    }
}

if ifs_io_listtags then
    print("DEBUG: ifs_io_listtags exists")

    ifs_io_listtags["cross"] = ifs_io_listtags_cross
else
    print("DEBUG: ifs_io_listtags does not exist")
end