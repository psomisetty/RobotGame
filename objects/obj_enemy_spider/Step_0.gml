/// @description Do a random walk until death
if not (self.awake)
{
	exit;
}
timer--;
if (timer <= 0)
{
	//Random action time lengths in frames
	timer = random_range(30, 120);
	
	// Do a coin flip to determine what action this character is taking
	var coinFlip = random(1);
	if (coinFlip < .5)
	{
		walking = true;
		direction = round(random_range(0,360));
	}
	else walking = false;
}

if (walking)
{
	speed = walkSpeed;
	image_speed = walkSpeed;
}
else
{
	speed = 0;
	image_index = 0;
	image_speed = 0;
}