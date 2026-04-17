// Spacer between black panel and silver frame rail
//
// Orientation:
//   X = length along the rail (50mm)
//   Y = depth bridging the gap, panel-side to frame-wall-side (50mm)
//   Z = height fitting inside rail (12mm)
//
// The screw passes through the Y axis (the 50mm gap).
// Panel-side face is at Y = 50, frame-wall-side face is at Y = 0.
// The spacer backs against the wall at Y = 0.

// === Parameters ===
length         = 50;    // along the rail
depth          = 50;     // bridging the gap (panel to frame wall)
height         = 12;     // fits inside the frame rail

lip_depth      = 6.4;    // frame rail lip depth (for reference)
panel_depth    = 16.8;   // panel face to wall (for reference)

// Screw hole
hole_diameter  = 5.2;    // #10 machine screw clearance
hole_from_panel = 9.7;   // hole center distance from panel edge

// === Derived ===
// Panel-side face is at Y = depth (50mm).
// Hole center measured from panel edge into the spacer:
hole_y = depth - hole_from_panel;  // 50 - 9.7 = 40.3mm from frame wall

// === Model ===
difference() {
    cube([length, depth, height]);

    // Screw hole through the depth (Y axis)
    // Centered on length (X), centered on height (Z)
    translate([22.5, -1, height / 2])
        rotate([-90, 0, 0])
            cylinder(h = depth + 2, d = hole_diameter, $fn = 48);
}

// === Print notes ===
// Best printed with the 50mm x 50mm face (XY) flat on the bed.
// The 12mm height becomes the Z print dimension.
//
// The lip_depth (6.4mm) describes how far the rail protrudes —
// the spacer at 12mm height fits neatly within the rail opening.
// Screw enters from the frame-wall side, passes through the 
// spacer, and the head bears against the frame.
