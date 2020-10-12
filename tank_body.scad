tank_body(200, 500, 100);

module tank_body(width, depth, height)
{
    translate([-width / 2,0,0])
    {
        cube([width, depth, height], center = false);
    }
}