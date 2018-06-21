/// @description Set up fist specific vars
event_inherited();
//Overwrite parent vars
dealsDamage = true;
damageValue = 1;

// Keep this synchronized with player
image_list = [];
//var directionList = ["right","up","down"];
var directionList = ["up", "down"];
spriteMap = ds_map_create();
for (var i = 0; i < array_length_1d(directionList); ++i)
{
	//Add both fists for each direction
	ds_map_add(spriteMap, directionList[i],
				[asset_get_index("spr_robot_attack_" + directionList[i] + "_fists_1"),
				asset_get_index("spr_robot_attack_" + directionList[i] + "_fists_2")]);
}

//TODO: remove below when full license is aquired
ds_map_add(spriteMap, "right", [-1,-1]);
//TODO: remove above when full license is aquired

ds_map_add(spriteMap, "left", spriteMap[? "right"]);