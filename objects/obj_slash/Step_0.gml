// Kalau owner masih ada
if (instance_exists(owner))
{
    // Ikut posisi player
    x = owner.x + lengthdir_x(offset_dist, dir);
    y = owner.y + lengthdir_y(offset_dist, dir);
}