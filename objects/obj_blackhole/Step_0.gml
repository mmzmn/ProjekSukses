// Tambah speed perlahan
move_speed += accel;

// Limit speed
move_speed = clamp(move_speed, 0, max_speed);

// Arah ke player
var dir = point_direction(x, y, obj_player.x, obj_player.y);

// Gerak menuju player
x += lengthdir_x(move_speed, dir);
y += lengthdir_y(move_speed, dir);

// Collision dengan player
if (place_meeting(x, y, obj_player))
{
    instance_destroy(obj_player);

    show_message("GAME OVER");

    room_restart();
}