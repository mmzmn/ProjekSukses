// Tambah speed perlahan
move_speed += accel;

move_speed = clamp(move_speed, 0, max_speed);

// Arah ke player
var dir = point_direction(x, y, obj_player.x, obj_player.y);

// Hitung movement
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

// Kill player
if (place_meeting(x, y, obj_player))
{
    show_message("GAME OVER");

    room_restart();
}