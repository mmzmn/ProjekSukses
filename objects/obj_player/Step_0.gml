var hsp = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vsp = keyboard_check(ord("S")) - keyboard_check(ord("W"));



// Normalize diagonal
if (hsp != 0 || vsp != 0)
{
    var len = point_distance(0,0,hsp,vsp);

    hsp /= len;
    vsp /= len;
}


if (!global.game_over)
{
    global.score += 0.1;
}
// Horizontal collision
if (!place_meeting(x + hsp * spd, y, obj_wall))
{
    x += hsp * spd;
}

// Vertical collision
if (!place_meeting(x, y + vsp * spd, obj_wall))
{
    y += vsp * spd;
}





// Step Event camera

// Camera
var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Target position (player center)
var target_x = obj_player.x - cam_w / 2;
var target_y = obj_player.y - cam_h / 2;

// Clamp agar kamera tidak keluar room
target_x = clamp(target_x, 0, room_width - cam_w);
target_y = clamp(target_y, 0, room_height - cam_h);

// Apply
camera_set_view_pos(cam, target_x, target_y);


// Horizontal collision
if (!place_meeting(x + hsp * spd, y, obj_wall))
{
    x += hsp * spd;
}

// Vertical collision
if (!place_meeting(x, y + vsp * spd, obj_wall))
{
    y += vsp * spd;
}

if (attack_cooldown > 0)
{
    attack_cooldown--;
}

// Klik kiri mouse
if (mouse_check_button_pressed(mb_left) && attack_cooldown <= 0)
{
    // Reset cooldown
    attack_cooldown = attack_delay;

    // Arah mouse
    var dir = point_direction(x, y, mouse_x, mouse_y);

    // Jarak slash dari player
    var dist = 40;

    // Posisi slash
    var sx = x + lengthdir_x(dist, dir);
    var sy = y + lengthdir_y(dist, dir);

    // Spawn slash
    var slash = instance_create_layer(sx, sy, "Instances", obj_slash);

    // Rotasi
    slash.image_angle = dir + 180;

    // Ikut player
    slash.owner = id;
    slash.offset_dist = dist;
    slash.dir = dir;
}