local mp = require 'mp'

function on_end_file(event)
    if event.reason == "eof" then
        mp.commandv("loadfile", "/sdcard/Videos/mpv.png", "replace")
    end
end

mp.register_event("end-file", on_end_file)
