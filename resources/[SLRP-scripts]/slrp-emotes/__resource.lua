resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

export 'Pee'

client_scripts {
    "lib/Proxy.lua",
    "lib/Tunnel.lua",
    "cl.lua"
}
server_scripts {
    "@vrp/lib/utils.lua",
    "sv.lua"
}


--[[
__________         ___ ___                             .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____  
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \ 
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  /
        \/ \/           \/  \/     |__|        \/                     \/ 
--]]