// Default speed
var current_speed = move_speed;

// Slow enemy effect
if (instance_exists(obj_player))
{
    if (obj_player.slowenemy_timer > 0)
    {
        current_speed *= 0.4;
    }
}

// Kalau player ada
if (instance_exists(obj_player))
{
    // Flip sprite
    if (obj_player.x < x)
    {
        image_xscale = -2;
    }
    else
    {
        image_xscale = 2;
    }

    // Arah ke player
    var dir = point_direction(x, y, obj_player.x, obj_player.y);

    // Movement biasa
    var mx = lengthdir_x(current_speed, dir);
    var my = lengthdir_y(current_speed, dir)

    // Collision wall
    if (!place_meeting(x + mx, y, obj_wall))
    {
        x += mx;
    }

    if (!place_meeting(x, y + my, obj_wall))
    {
        y += my;
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