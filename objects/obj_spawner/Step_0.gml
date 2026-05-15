

if (global.game_over)
{
    exit;
}


// Timer
spawn_timer++;
difficulty_timer++;

// Difficulty scaling
if (difficulty_timer >= difficulty_interval)
{
    difficulty_timer = 0;

    spawn_delay -= 8;
    spawn_delay = max(spawn_delay, min_spawn_delay);

    max_enemy += 1;
}

if (!instance_exists(obj_player))
{
    exit;
}

// Spawn enemy
if (spawn_timer >= spawn_delay)
{
    spawn_timer = 0;

    // Limit total enemy
    if (instance_number(obj_enemy1) + instance_number(obj_enemy2) < max_enemy)
    {
        var margin = 64;

        // Minimal jarak dari player
        var min_spawn_distance = 350;

        // Cari posisi random
        var rx;
        var ry;

        var tries = 0;

        repeat (20)
        {
            rx = random_range(margin, room_width - margin);
            ry = random_range(margin, room_height - margin);

            var dist = point_distance(rx, ry, obj_player.x, obj_player.y);

            // Valid kalau jauh dari player dan bukan wall
            if (dist >= min_spawn_distance &&
                !place_meeting(rx, ry, obj_wall))
            {
                break;
            }

            tries++;
        }

        // Random jenis enemy
        var chance = irandom(100);

        var enemy;

        if (chance < 35)
        {
            enemy = instance_create_layer(rx, ry, "Instances", obj_enemy2);
        }
        else
        {
            enemy = instance_create_layer(rx, ry, "Instances", obj_enemy1);
        }

        // Scale enemy 2x
        enemy.image_xscale = 2;
        enemy.image_yscale = 2;
    }
}