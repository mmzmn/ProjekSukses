if (global.game_over)
{
    exit;
}

// Timer
orb_timer++;

// Spawn orb
if (orb_timer >= orb_delay)
{
    orb_timer = 0;

    // Total orb sekarang
    var total_orbs =
        instance_number(obj_slowenemy_orb) +
        instance_number(obj_timestop_orb) +
        instance_number(obj_speed_orb);

    // Limit orb
    if (total_orbs < max_orbs)
    {
        var margin = 64;
        var min_spawn_distance = 250;

        var rx;
        var ry;

        // Cari posisi valid
        repeat (20)
        {
            rx = random_range(margin, room_width - margin);
            ry = random_range(margin, room_height - margin);

            var dist = point_distance(rx, ry, obj_player.x, obj_player.y);

            if (dist >= min_spawn_distance
            && !place_meeting(rx, ry, obj_wall))
            {
                break;
            }
        }

        // Random jenis orb
        var orb_type = irandom(2);

        var orb;

        switch (orb_type)
        {
            case 0:
                orb = instance_create_layer(
                    rx,
                    ry,
                    "Instances",
                    obj_slowenemy_orb
                );
            break;

            case 1:
                orb = instance_create_layer(
                    rx,
                    ry,
                    "Instances",
                    obj_timestop_orb
                );
            break;

            case 2:
                orb = instance_create_layer(
                    rx,
                    ry,
                    "Instances",
                    obj_speed_orb
                );
            break;
        }

        // Scale orb 2x
        orb.image_xscale = 2;
        orb.image_yscale = 2;
    }
}