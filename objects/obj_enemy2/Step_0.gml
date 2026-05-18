// Cooldown tembak
if (shoot_cooldown > 0)
{
    shoot_cooldown--;
}

// Pastikan player ada
if (instance_exists(obj_player))
{
    // Arah ke player
    var dir = point_direction(x, y, obj_player.x, obj_player.y);

    // Jarak ke player
    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    // Kalau terlalu jauh → kejar player
    if (dist > stop_distance)
    {
        var mx = lengthdir_x(move_speed, dir);
        var my = lengthdir_y(move_speed, dir);

        // Collision wall horizontal
        if (!place_meeting(x + mx, y, obj_wall))
        {
            x += mx;
        }

        // Collision wall vertical
        if (!place_meeting(x, y + my, obj_wall))
        {
            y += my;
        }
    }

    // Kalau sudah dekat → tembak
    else
    {
        if (shoot_cooldown <= 0)
        {
            // Reset cooldown
            shoot_cooldown = shoot_delay;

            // Jarak spawn laser dari enemy
            var shoot_offset = 50;

            // Posisi laser di depan enemy
            var lx = x + lengthdir_x(shoot_offset, dir);
            var ly = y + lengthdir_y(shoot_offset, dir);

            // Spawn laser
            var laser = instance_create_layer(lx, ly, "Instances", obj_laser);

            // Arah laser
            laser.direction = dir;
            laser.image_angle = dir;

            // Speed laser
            laser.speed = 4;
        }
    }
}

// Apply knockback dengan collision check
if (!place_meeting(x + knock_x, y, obj_wall))
{
    x += knock_x;
}
else
{
    knock_x = 0;
}
if (!place_meeting(x, y + knock_y, obj_wall))
{
    y += knock_y;
}
else
{
    knock_y = 0;
}
// Friction knockback
knock_x *= knock_friction;
knock_y *= knock_friction;

// ✅ Pastikan baris ini ada
if (hit_cooldown > 0)
{
    hit_cooldown--;
}