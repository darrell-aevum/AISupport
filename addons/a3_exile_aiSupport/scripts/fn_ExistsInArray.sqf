params ["_array", "_name"];
private _exists = false;

{
	if(_name == _x select 2) then {
		_exists = true;
	};
}
forEach _array;

_exists
 