if (global.game_over)
{
    exit;
}

// =====================================
// PHASE INTRO — pause sementara
// =====================================
if (phase_showing)
{
    phase_timer--;
    if (phase_timer <= 0)
    {
        phase_showing = false;
        enemies_spawned = 0;
        spawn_timer = 0;
    }
    exit;
}

if (!instance_exists(obj_player))
{
    exit;
}

// =====================================
// TOTAL MUSUH PER STAGE
// =====================================
var total_enemies;
switch (global.phase)
{
    case 1: total_enemies = 4;  break;
    case 2: total_enemies = 6;  break;
    case 3: total_enemies = 6;  break;
    case 4: total_enemies = 8;  break;
    case 5: total_enemies = 8;  break;
    default: total_enemies = 8; break;
}

// =====================================
// SPAWN MUSUH
// =====================================
if (enemies_spawned < total_enemies)
{
    spawn_timer++;
    if (spawn_timer >= spawn_delay)
    {
        spawn_timer = 0;

        var margin = 64;
        var min_spawn_distance = 350;
        var rx;
        var ry;

        repeat (20)
        {
            rx = random_range(margin, room_width - margin);
            ry = random_range(margin, room_height - margin);
            var dist = point_distance(rx, ry, obj_player.x, obj_player.y);
            if (dist >= min_spawn_distance &&
                !place_meeting(rx, ry, obj_wall))
            {
                break;
            }
        }

        // Chance enemy2 per phase
        var enemy2_chance;
        switch (global.phase)
        {
            case 1: enemy2_chance = 0;  break;
            case 2: enemy2_chance = 15; break;
            case 3: enemy2_chance = 25; break;
            case 4: enemy2_chance = 35; break;
            case 5: enemy2_chance = 50; break;
            default: enemy2_chance = 50; break;
        }

        var chance = irandom(100);
        var enemy;
        if (chance < enemy2_chance)
        {
            enemy = instance_create_layer(rx, ry, "Instances", obj_enemy2);
        }
        else
        {
            enemy = instance_create_layer(rx, ry, "Instances", obj_enemy1);
        }

        enemy.image_xscale = 2;
        enemy.image_yscale = 2;
        enemies_spawned++;
    }
}

// =====================================
// CEK STAGE CLEAR
// =====================================
if (enemies_spawned >= total_enemies)
{
    var alive = instance_number(obj_enemy1) + instance_number(obj_enemy2);
    if (alive <= 0)
    {
        if (global.phase < 5)
        {
            global.phase++;
            phase_showing = true;
            phase_timer = 180;
        }
    }
}