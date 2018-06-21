//// @description Set up player variables
event_inherited();
// Overwrite parent vars
canTakeDamage = true;
healthPoints = 10;

// Set up player robot specific vars
// Set up image vars
imageScale = 2;
image_xscale = imageScale;
image_yscale = imageScale;
imageDirection = "down";

// Set up speed vars
image_speed = 0;

slowSpeed = 2;
fastSpeed = 4;
attackSpeed = slowSpeed;
walkSpeed = slowSpeed;
idleSpeed = slowSpeed;

// Set up idling vars
idling = true;
idleStartTime = -1;
longIdleThreshold = 6000; // 6000 milliseconds

//Create the map of sprites to use. Map direction -> map attacking/moving/idle/idleLong -> sprite
//Keep this synchronized with sub objects
var directionList = ["right","up","down"];
var actionList = ["attack","move","idle", "idleLong"];
spriteMap = ds_map_create();

for (var i = 0; i < array_length_1d(directionList); i++)
{
	ds_map_add(spriteMap, directionList[i], ds_map_create());
	var j = 0;
	for (j = 0; j < array_length_1d(actionList); j++)
	{
		ds_map_add(spriteMap[? directionList[i]], actionList[j], asset_get_index("spr_robot_" + actionList[j] + "_" +directionList[i]));
	}
}
// Add the mirror for left direction
ds_map_add(spriteMap, "left", spriteMap[? "right"]);
ds_map_add(spriteMap[? "down"], "damage", spr_robot_damage_down);

// Create fist object
fists = instance_create_layer(x, y, "PlayerLayer", obj_player_robot_fists);
with(fists)
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}
