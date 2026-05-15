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
    var mx = lengthdir_x(move_speed, dir);
    var my = lengthdir_y(move_speed, dir);

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

// Apply knockback
x += knock_x;
y += knock_y;

// Friction knockback
knock_x *= knock_friction;
knock_y *= knock_friction;

if (hit_cooldown > 0)
{
    hit_cooldown--;
}