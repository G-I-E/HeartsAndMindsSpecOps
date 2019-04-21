
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_init

Description:
    Initialise the ammo cache system with all necessary variable and start the search of a suitable position for it.

Parameters:
    _cache_n - Cache number. [Number]

Returns:

Examples:
    (begin example)
        [0] call btc_fnc_cache_init;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_cache_n", 0, [0]]
];

btc_cache_pos = [];
btc_cache_n = _cache_n;
btc_cache_obj = objNull;
btc_cache_markers = [];
{
	remoteExecCall ["", _x];
} forEach (btc_cache_pictures select 2);
btc_cache_pictures = [[], [], []];
btc_cache_info = btc_info_cache_def;
[] call btc_fnc_cache_find_pos;
