/// @description Set up global and local variables

// Create player variables
global.buttons_type_list = ["left", "right", "up", "down", "weight", "attack"];
global.buttons_list = ["A", "D", "W", "S", " ", "P"];

// Sanity check for the buttons lists
if (array_length_1d(global.buttons_list) != array_length_1d(global.buttons_type_list))
{
	show_debug_message("GameMaster: Create: buttons list and buttons type list are different sizes!");
	game_end();
}

global.player_buttons = ds_map_create();
for (var i = 0; i < array_length_1d(global.buttons_list); ++i)
{
	ds_map_add(global.player_buttons, global.buttons_type_list, global.buttons_list);
}

global.damage_queue = ds_queue_create();

// Old buttons code
global.button_player_left = "A";
global.button_player_right = "D";
global.button_player_up = "W";
global.button_player_down = "S";
global.button_player_weight = " ";
global.button_player_attack = "P";