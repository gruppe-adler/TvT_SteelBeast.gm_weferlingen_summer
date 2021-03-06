/*
 * Name: gradTnT_bft_fnc_defaultType
 * Author: nomisum, DerZade
 * Return default type for vehicle depending on its type
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Type <STRING>
 *
 * Example:
 * [_veh] call gradTnT_bft_fnc_defaultType;
 *
 * Public: No
 */
params [["_veh", objNull, [objNull]]];

if (isNull _veh) exitWith {
	["Vehicle must not be objNull."] call BIS_fnc_error;
	"unknown";
};

if (_veh isKindOf "gm_flag_GE" || _veh isKindOf "gm_flag_UR") exitWith {
    "headquarter";
};

if (_veh isKindOf "gm_ge_army_shelteraceII_repair" || _veh isKindOf "gm_gc_army_shelterlakII_repair") exitWith {
	"depot";
};

if (((getModelInfo _veh) select 0) == "bridgewooden_01_f.p3d") exitWith {
	"bridge";
};

if (_veh getVariable ["gradTnT_isEngineerVehicle", false]) exitWith {
	"engineer";
};

if (_veh isKindOf "gm_helicopter_base") exitWith {
	"air";
};

if (_veh isKindOf "gm_gc_army_uaz469_spg9" || _veh isKindOf "gm_ge_army_iltis_milan") exitWith {
    "antitank";
};

// parent categories if something didnt fit until now
if (_veh isKindOf "gm_wheeled_car_base") exitWith {
    "transport";
};

if (_veh isKindOf "gm_wheeled_APC_base" || _veh isKindOf "gm_tracked_APC_base") exitWith {
	"recon";
};

if (_veh isKindOf "gm_tracked_Tank_base") exitWith {
	"armor";
};

"unknown";