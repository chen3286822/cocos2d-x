
#include "lua_extensions.h"

#if __cplusplus
extern "C" {
#endif

// cjson
#include "lua_extensions/cjson/lua_cjson.h"
    
// zlib
#include "lua_extensions/zlib/lua_zlib.h"
    
// lpack
#include "lua_extensions/lpack/lpack.h"

// filesystem
#include "lua_extensions/filesystem/lfs.h"
    
// lsqlite3
#include "lua_extensions/lsqlite3/lsqlite3.h"
    
// socket
#include "lua_extensions/socket/luasocket.h"
#include "lua_extensions/socket/mime.h"

static luaL_Reg luax_exts[] = {
    {"cjson", luaopen_cjson_safe},
    {"zlib", luaopen_zlib},
    {"pack", luaopen_pack},
    {"lfs", luaopen_lfs},
    {"lsqlite3", luaopen_lsqlite3},
    {"socket.core", luaopen_socket_core},
    {"mime.core", luaopen_mime_core},
    {NULL, NULL}
};

void luaopen_lua_extensions(lua_State *L)
{
    // load extensions
    luaL_Reg* lib = luax_exts;
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "preload");
    for (; lib->func; lib++)
    {
        lua_pushcfunction(L, lib->func);
        lua_setfield(L, -2, lib->name);
    }
    lua_pop(L, 2);
}

#if __cplusplus
} // extern "C"
#endif
