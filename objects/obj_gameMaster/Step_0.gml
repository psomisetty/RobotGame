/// @description Do game master stuff
// Deal with damage queue
while (not ds_queue_empty(global.damage_queue))
{
	var damage_handler = ds_queue_dequeue(global.damage_queue);
	// Sanity Checks
	if (array_length_1d(damage_handler) != 2 or not
		object_is_ancestor(damage_handler[0].object_index, obj_character_base) or not
		object_is_ancestor(damage_handler[1].object_index, obj_character_base))
	{
		show_debug_message("Dirty data in damage handler " + damage_handler);
		break;
	}
	if (damage_handler[1].canTakeDamage)
	{
		damage_handler[1].healthPoints -= damage_handler[0].damageValue;
		//damage_handler[1].canTakeDamage = false;
	}
}