/// @description Set up spider vars
event_inherited();
// Overwrite parent vars
self.canTakeDamage = true;
self.dealsDamage = true;
self.damageValue = 1;
self.healthPoints = 5;
self.awake = true;

// Set up spider specific vars
walkSpeed = 1;
walking = false;
playerVisible = false;
timer = 0;