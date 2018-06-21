//// @description Deal damage to player character
if (dealsDamage and other.canTakeDamage)
{
	ds_queue_enqueue(global.damage_queue, [id, other.id]);
}