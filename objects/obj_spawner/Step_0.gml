// Timer
spawn_timer++;
difficulty_timer++;

// Difficulty scaling
if (difficulty_timer >= difficulty_interval)
{
    difficulty_timer = 0;

    spawn_delay -= 5;
    spawn_delay = max(spawn_delay, min_spawn_delay);

    max_enemy += 1;
}

// Spawn enemy
if (spawn_timer >= spawn_delay)
{
    spawn_timer = 0;

    // Limit total enemy
    if (instance_number(obj_enemy1) + instance_number(obj_enemy2) < max_enemy)
    {
        var margin = 64;

        var rx = random_range(margin, room_width - margin);
        var ry = random_range(margin, room_height - margin);

        // Jangan spawn dalam wall
        if (!place_meeting(rx, ry, obj_wall))
        {
            // Random chance
            var chance = irandom(100);

            // 15% enemy2
            if (chance < 35)
            {
                instance_create_layer(rx, ry, "Instances", obj_enemy2);
            }

            // 85% enemy1
            else
            {
                instance_create_layer(rx, ry, "Instances", obj_enemy1);
            }
        }
    }
}