// Kalau belum baru kena hit
if (hit_cooldown <= 0)
{
    // Masuk invincibility frame
    hit_cooldown = 18;

    // Damage
    hp -= 1;

    // Knockback direction
    var dir = point_direction(other.x, other.y, x, y);

    var force = 12;

    knock_x = lengthdir_x(force, dir);
    knock_y = lengthdir_y(force, dir);

    // Mati
    if (hp <= 0)
    {
        instance_destroy();
    }
}