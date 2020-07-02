params ["_depot"];

private _destroyAction = [
    "RepairHole",
    "Destroy Depot",
    "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa",
    {
        [_target] execVM "functions\fn_destroyDepot.sqf";
    }, {
        !(_target getVariable ["SB_depotDestroyed", false])
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;


[_depot, 0, ["ACE_MainActions"], _destroyAction] call ace_interact_menu_fnc_addActionToObject;