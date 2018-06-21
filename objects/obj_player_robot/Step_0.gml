if(keyboard_check_pressed(ord(global.button_player_weight)))
{
	walkSpeed = walkSpeed == fastSpeed ? slowSpeed : fastSpeed;
	attackSpeed = attackSpeed == fastSpeed ? slowSpeed : fastSpeed;
	idleSpeed = idleSpeed == fastSpeed ? slowSpeed : fastSpeed;
}

var action = "move";
var oldY = y;
var oldX = x;

if(keyboard_check(ord(global.button_player_right))) // Go right
{
	imageDirection = "right";
	x += walkSpeed;
}
else if(keyboard_check(ord(global.button_player_left))) // Go left
{
	imageDirection = "left";
	x -= walkSpeed;
}
else if(keyboard_check(ord(global.button_player_up))) // Go up
{
	imageDirection = "up";
	y -= walkSpeed;
}
else if(keyboard_check(ord(global.button_player_down))) // Go down
{
	imageDirection = "down";
	y += walkSpeed;
}
else // Not moving
{
	action = "idle";
	if not idling
	{
		idling = true;
		idleStartTime = current_time; // Time in milliseconds
	} 
	else if (current_time - idleStartTime >= longIdleThreshold) 
	{
		action = "idleLong";
	}
}

if(keyboard_check(ord(global.button_player_attack))) // Player is attacking
{
	action = "attack";
}

image_xscale = imageDirection == "left" ? -1 * imageScale : imageScale;
var subMap = spriteMap[? imageDirection];
sprite_index = subMap[? action];

switch (action)
{
	case "damage":
		idling = false;
		y = oldY;
		x = oldX;
	case "attack":
		idling = false;
		y = oldY;
		x = oldX;
		image_speed = attackSpeed / 3;
		with (fists)
		{
			x = other.x;
			y = other.y;
		}
		if (image_index == 2)
		{
			with (fists)
			{
				var array = spriteMap[? other.imageDirection];
				sprite_index = array[0];
			}
		}
		if (image_index == 4)
		{
			with (fists)
			{
				var array = spriteMap[? other.imageDirection];
				sprite_index = array[1];
			}
		}
		break;
	case "move":
		idling = false;
		image_speed = walkSpeed / 3;
		break;
	case "idle":
		image_speed = idleSpeed / 25;
		break;
	case "idleLong":
		image_speed = idleSpeed / 25;
		var timeIdle = current_time - idleStartTime - longIdleThreshold;
		var idleIndex = floor(timeIdle / 1000);
		image_index = min(idleIndex, image_number - 1); 
}