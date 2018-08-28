params [
    ["_body", objNull, [objNull]],
    ["_asker", objNull, [objNull]]
];

if (btc_debug_log) then {
    [format ["%1", _body getVariable "intel"], __FILE__, [false]] call btc_fnc_debug_message;
};

if (_body getVariable ["intel", false] && !(_body getVariable ["btc_already_interrogated", false])) then {
    _body setVariable ["intel", false];
    if (isServer) then    {
        [_asker] spawn btc_fnc_info_give_intel;
    } else {
        [_asker] remoteExec ["btc_fnc_info_give_intel", 2];
    };
} else {
    [3] remoteExec ["btc_fnc_show_hint", _asker];
};
