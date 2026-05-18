// Freeze blackhole saat timestop aktif
if (instance_exists(obj_player))
{
    if (obj_player.timestop_timer > 0)
    {
        exit;
    }
}


// Tambah speed perlahan
move_speed += accel;

move_speed = clamp(move_speed, 0, max_speed);

// Pastikan player ada
if (instance_exists(obj_player))
{
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

    // Kalau player kena blackhole
   if (place_meeting(x, y, obj_player))
{
    global.game_over = true;

    instance_destroy(obj_player);
}
}

// Destroy semua object lain yang kena blackhole
if (instance_exists(obj_player) && obj_player.timestop_timer <= 0)  // <-- tambah ini
{
    with (instance_place(x, y, all))
    {
        if (id != other.id)
        if (object_index != obj_wall)
        if (object_index != obj_blackhole)
        if (object_index != obj_pointer)
        {
            instance_destroy();
        }
    }
}

