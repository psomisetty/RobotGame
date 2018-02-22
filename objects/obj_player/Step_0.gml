if(keyboard_check_pressed(ord(global.button_player_weight)))
{
	walkSpeed = walkSpeed == fastSpeed ? slowSpeed : fastSpeed;
	attackSpeed = attackSpeed == fastSpeed ? slowSpeed : fastSpeed;
}

var buttons_used = 0;
var oldX = x;
var oldY = y;
var sprite_index_change = sprite_index;
var image_xscale_change = image_scale;
var image_speed_change = image_speed;
var x_change = x;
var y_change = y;

if(keyboard_check(ord(global.button_player_right)))
{
	sprite_index_change = spr_robot_right;
	x_change += walkSpeed;
	image_speed_change = walkSpeed / 3;
	buttons_used++;
}

if(keyboard_check(ord(global.button_player_left)))
{
	sprite_index_change = spr_robot_right;
	image_xscale_change = -1 * image_scale;
	x_change -= walkSpeed;
	image_speed_change = walkSpeed / 3;
	buttons_used++;
}

if(keyboard_check(ord(global.button_player_up)))
{
	sprite_index_change = spr_robot_up;
	y_change -= walkSpeed;
	image_speed_change = walkSpeed / 3;
	buttons_used++;
}

if(keyboard_check(ord(global.button_player_down)))
{
	sprite_index_change = spr_robot_down;
	y_change += walkSpeed;
	image_speed_change = walkSpeed / 3;
	buttons_used++;
}

if(keyboard_check(ord(global.button_player_attack)))
{
	x_change = oldX;
	y_change = oldY;
	image_speed_change = attackSpeed / 3;
	switch(sprite_index)
	{
		case (spr_robot_down):
		{
			sprite_index_change = spr_robot_attack_down;
			break;
		}
		default:
		{
			sprite_index_change = sprite_index;
			break;
		}
	}
	buttons_used++;
}

if (buttons_used == 0)
{
	image_speed = 0;
}
else
{
	x = x_change;
	y = y_change;
	sprite_index = sprite_index_change;
	image_speed = image_speed_change;
	image_xscale = image_xscale_change;
}