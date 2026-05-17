window_set_cursor(cr_none);
persistent = true;

if (instance_number(obj_pointer) > 1) {
    instance_destroy();
    exit;
}