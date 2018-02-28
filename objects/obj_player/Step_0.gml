if(keyboard_check_pressed(ord(global.button_player_weight)))
{
	walkSpeed = walkSpeed == fastSpeed ? slowSpeed : fastSpeed;
	attackSpeed = attackSpeed == fastSpeed ? slowSpeed : fastSpeed;
}

var buttonsUsed = 0;
var attacking = false;
var moving = true;

if(keyboard_check(ord(global.button_player_right))) // Go right
{
	imageDirection = "right";
	buttonsUsed++;
}
else if(keyboard_check(ord(global.button_player_left))) // Go left
{
	imageDirection = "left";
	buttonsUsed++;
}
else if(keyboard_check(ord(global.button_player_up))) // Go up
{
	imageDirection = "up";
	buttonsUsed++;
}
else if(keyboard_check(ord(global.button_player_down))) // Go down
{
	imageDirection = "down";
	buttonsUsed++;
}
else // Not moving
{
	moving = false;
}

if(keyboard_check(ord(global.button_player_attack)))
{
	attacking = true;
	buttonsUsed++;
	moving = false;
}

if (buttonsUsed == 0)
{
	image_speed = 0;
}
else if (attacking)
{
	image_speed = attackSpeed / 3;
	image_xscale = imageScale;
	switch (imageDirection)
	{
		case ("left"):
		{
			sprite_index = spr_robot_attack_right;
			image_xscale = -1 * imageScale;
			break;
		}
		case ("right"):
		{
			sprite_index = spr_robot_attack_right;
			break;
		}
		case ("up"):
		{
			sprite_index = spr_robot_attack_up;
			break;
		}
		case ("down"):
		{
			sprite_index = spr_robot_attack_down;
			break;
		}
	}
}
else if (moving and not attacking)
{
	image_speed = walkSpeed / 3;
	image_xscale = imageScale;
	switch (imageDirection)
	{
		case ("left"):
		{
			sprite_index = spr_robot_right;
			image_xscale = -1 * imageScale;
			x -= walkSpeed;
			break;
		}
		case ("right"):
		{
			sprite_index = spr_robot_right;
			x += walkSpeed;
			break;
		}
		case ("up"):
		{
			sprite_index = spr_robot_up;
			y -= walkSpeed;
			break;
		}
		case ("down"):
		{
			sprite_index = spr_robot_down;
			y += walkSpeed;
			break;
		}
	}
}