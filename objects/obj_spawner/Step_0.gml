spawn_timer++;

// Kalau waktunya spawn
if (spawn_timer >= spawn_delay)
{
    spawn_timer = 0;

    // Limit jumlah enemy
    if (instance_number(obj_enemy1) < max_enemy)
    {
        var margin = 64;

        // Posisi random map
        var rx = random_range(margin, room_width - margin);
        var ry = random_range(margin, room_height - margin);

        // Jangan spawn dalam wall
        if (!place_meeting(rx, ry, obj_wall))
        {
            instance_create_layer(rx, ry, "Instances", obj_enemy1);
        }
    }
}