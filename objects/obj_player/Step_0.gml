if (global.game_over)
{
    exit;
}

// INVINCIBILITY FRAME
if (invincible_timer > 0)
{
    invincible_timer--;
    image_alpha = (invincible_timer mod 4 < 2) ? 0.4 : 1.0; // efek kedip (opsional)
}
else
{
    image_alpha = 1.0;
}

// SPEED BUFF
if (speed_timer > 0)
{
    speed_timer--;

    spd = base_spd * speed_multiplier;
}
else
{
    spd = base_spd;
}

// TIMESTOP TIMER
if (timestop_timer > 0)
{
    timestop_timer--;
}

// SLOW ENEMY TIMER
if (slowenemy_timer > 0)
{
    slowenemy_timer--;
}

// Input movement
var hsp = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var vsp = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal
if (hsp != 0 || vsp != 0)
{
    var len = point_distance(0, 0, hsp, vsp);

    hsp /= len;
    vsp /= len;
}

// Score timer — berhenti saat phase intro
if (instance_exists(obj_spawner))
{
    if (!obj_spawner.phase_showing)
    {
        global.score += 0.1;
    }
}
else
{
    global.score += 0.1;
}

// =====================================
// NORMAL MOVEMENT
// =====================================

// Horizontal
if (!place_meeting(x + hsp * spd, y, obj_wall))
{
    x += hsp * spd;
}

// Vertical
if (!place_meeting(x, y + vsp * spd, obj_wall))
{
    y += vsp * spd;
}

// =====================================
// DASH MOVEMENT
// =====================================

// Apply dash horizontal
if (!place_meeting(x + dash_x, y, obj_wall))
{
    x += dash_x;
}

// Apply dash vertical
if (!place_meeting(x, y + dash_y, obj_wall))
{
    y += dash_y;
}

// Dash slowdown
dash_x *= dash_friction;
dash_y *= dash_friction;

// =====================================
// CAMERA
// =====================================

var cam = view_camera[0];

var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Camera target
var target_x = x - cam_w / 2;
var target_y = y - cam_h / 2;

// Clamp camera
target_x = clamp(target_x, 0, room_width - cam_w);
target_y = clamp(target_y, 0, room_height - cam_h);

// Apply camera
camera_set_view_pos(cam, target_x, target_y);

// =====================================
// ATTACK COOLDOWN
// =====================================

if (attack_cooldown > 0)
{
    attack_cooldown--;
}

// =====================================
// ATTACK
// =====================================

if (mouse_check_button_pressed(mb_left) && attack_cooldown <= 0)
{
    // Reset cooldown
    attack_cooldown = attack_delay;
	invincible_timer = 20;

    // Direction to mouse
    var dir = point_direction(x, y, mouse_x, mouse_y);

    // =====================================
    // DASH ATTACK
    // =====================================

    var dash_force = 10;

    dash_x += lengthdir_x(dash_force, dir);
    dash_y += lengthdir_y(dash_force, dir);

    // =====================================
    // SLASH SPAWN
    // =====================================

    var dist = 40;

    var sx = x + lengthdir_x(dist, dir);
    var sy = y + lengthdir_y(dist, dir);

	// Create slash
	var slash = instance_create_layer(sx, sy, "Instances", obj_slash);

	// Scale slash 2x
	slash.image_xscale = 3;
	slash.image_yscale = 3;
	
	

	// Rotation
	slash.image_angle = dir + 180;

	// Follow player
	slash.owner = id;
	slash.offset_dist = dist;
	slash.dir = dir;
}

