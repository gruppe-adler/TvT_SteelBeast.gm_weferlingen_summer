if (!isServer) exitWith {};

[{
    call BIS_fnc_missionTimeLeft < 1 && call BIS_fnc_missionTimeLeft > -1
},{
    remoteExec ["gradTnT_fnc_showStats", 0];


    [{
        [] call GRAD_replay_fnc_stopRecord;

        // ends mission after replay is over
        [{
            missionNamespace getVariable ["REPLAY_FINISHED",false]
        }, {
            [] remoteExec ["gradTnT_fnc_endMissionLocal",0,false]; // your custom end mission call or whatever you want to do after replay
        }, []] call CBA_fnc_waitUntilAndExecute;
    }, [], 10] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;
