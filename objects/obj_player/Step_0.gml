if(keyboard_check_pressed(ord(global.button_player_weight)))
{
	walkSpeed = walkSpeed == fastSpeed ? slowSpeed : fastSpeed;
}

if(keyboard_check(ord(global.button_player_right)))
{
	sprite_index = spr_robot_right;
	image_xscale = 1;
	x += walkSpeed;
	image_speed = walkSpeed / 3;
}

if(keyboard_check(ord(global.button_player_left)))
{
	sprite_index = spr_robot_right;
	image_xscale = -1;
	x -= walkSpeed;
	image_speed = walkSpeed / 3;
}

if(keyboard_check(ord(global.button_player_up)))
{
	sprite_index = spr_robot_up;
	image_xscale = 1;
	y -= walkSpeed;
	image_speed = walkSpeed / 3;
}

if(keyboard_check(ord(global.button_player_down)))
{
	sprite_index = spr_robot_down;
	image_xscale = 1;
	y += walkSpeed;
	image_speed = walkSpeed / 3;
}