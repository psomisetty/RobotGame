healthPoints = 2;
canTakeDamage = true;
imageScale = 2;
image_xscale = imageScale;
image_yscale = imageScale;

image_speed = 0;

slowSpeed = 2;
fastSpeed = 4;
attackSpeed = slowSpeed;
walkSpeed = slowSpeed;
idleSpeed = slowSpeed;
imageDirection = "down";
idling = true;
idleStartTime = -1;
longIdleThreshold = 6000; // 6000 milliseconds

//Create the map of sprites to use. Map direction -> map attacking/moving/idle/idleLong -> sprite
var directionList = ["right","up","down"];
var directions = 3;
var actionList = ["attack","move","idle", "idleLong"];
var actions = 4;
spriteMap = ds_map_create();

var i = 0;
for (i = 0; i < directions; i++)
{
	ds_map_add(spriteMap, directionList[i], ds_map_create());
	var j = 0;
	for (j = 0; j < actions; j++)
	{
		ds_map_add(spriteMap[? directionList[i]], actionList[j], asset_get_index("spr_robot_" + actionList[j] + "_" +directionList[i]));
	}
}
ds_map_add(spriteMap, "left", spriteMap[? "right"]);
ds_map_add(spriteMap[? "down"], "damage", spr_robot_damage_down);
