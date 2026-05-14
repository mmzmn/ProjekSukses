// Input
var right = keyboard_check(ord("D"));
var left = keyboard_check(ord("A"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

// Movement
var hsp = (right - left);
var vsp = (down - up);

// Speed
var move_speed = 4;

// Normalize diagonal movement
if (hsp != 0 || vsp != 0)
{
    var len = point_distance(0, 0, hsp, vsp);
    
    hsp /= len;
    vsp /= len;
}

// Apply movement
x += hsp * move_speed;
y += vsp * move_speed;





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