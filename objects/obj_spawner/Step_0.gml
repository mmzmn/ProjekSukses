// Timer spawn
spawn_timer++;

// Timer difficulty
difficulty_timer++;

// Scaling difficulty
if (difficulty_timer >= difficulty_interval)
{
    difficulty_timer = 0;

    // Spawn makin cepat
    spawn_delay -= 5;

    // Jangan terlalu gila
    spawn_delay = max(spawn_delay, min_spawn_delay);

    // Tambah limit enemy
    max_enemy += 2;
}

// Spawn enemy
if (spawn_timer >= spawn_delay)
{
    spawn_timer = 0;

    if (instance_number(obj_enemy1) < max_enemy)
    {
        var margin = 64;

        var rx = random_range(margin, room_width - margin);
        var ry = random_range(margin, room_height - margin);

        // Jangan spawn di wall
        if (!place_meeting(rx, ry, obj_wall))
        {
            instance_create_layer(rx, ry, "Instances", obj_enemy1);
        }
    }
}