// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spawn_asteroid(asteroid_sprite, x_pos, y_pos, speed_multiplier, angle)
{


	//Checks to see if one of the sprites is named correctly
	if (asteroid_sprite != spr_asteroid_small 
		&& asteroid_sprite != spr_asteroid_med
		&& asteroid_sprite != spr_asteroid_huge)
	{
		show_debug_message("ERROR: Cannot spawn asteroid as it does not exist");		
	}

	//Checks to see that at least one axis is off screen otherwise do not spawn
	else if (x_pos != 0 && x_pos != 1 && y_pos != 0 && y_pos != 1)
	{
		show_debug_message("ERROR: Will not spawn as asteroid is not off screen");
	}


	else
	{
		//Sets speed based on size huge is 100%, med is 50%, and small is 25%)
		var new_speed;
	
		var sprite_width_asteroid = 0;
		//Gets three speed values & sprite widths
		if (asteroid_sprite == spr_asteroid_small) 
		{
			new_speed = 2;
			sprite_width_asteroid = sprite_get_width(spr_asteroid_small);
		}
	
		else if (asteroid_sprite == spr_asteroid_med) 
		{
			new_speed = 1;
			sprite_width_asteroid = sprite_get_width(spr_asteroid_med);
		}
	
		else if (asteroid_sprite == spr_asteroid_huge) 
		{
			new_speed = .5;
			sprite_width_asteroid = sprite_get_width(spr_asteroid_huge);
		}
	
		//Alters from normalized range back into room space

		x_pos = (x_pos * (room_width + sprite_width_asteroid - 2)) - (sprite_width_asteroid * .5 - 2) ;
		y_pos = (y_pos * (room_height + sprite_width_asteroid - 2)) - (sprite_width_asteroid * .5 - 2);

		//Instantiate new asteroid in position
		var new_asteroid = instance_create_layer(x_pos, y_pos, "Instances", obj_asteroid);

		//Adjust direction and speed with multiplier and sprite
		new_asteroid.direction = angle;
	
		new_asteroid.speed = new_speed * speed_multiplier;
	
		new_asteroid.sprite_index = asteroid_sprite;
	
		//set half sprite width
		new_asteroid.half_sprite_width  = sprite_width_asteroid * .5;
	}
}