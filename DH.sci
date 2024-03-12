// Define DH transformation matrix function
function [A] = DH(alpha, a, d, theta)
    A = [cos(theta), -sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta);
         sin(theta), cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
         0, sin(alpha), cos(alpha), d;
         0, 0, 0, 1];
endfunction

// Define DH parameters
d1 = 1;
d2 = 1;
d3 = 1;
theta1_deg = 45;  // Angle in degrees
theta1_rad = theta1_deg * %pi / 180;  // Convert angle to radians

// Create DH transformation matrices for each link
A1 = DH(0, 0, d1, theta1_rad);
A2 = DH(-%pi/2, 0, d2, 0);
A3 = DH(0, 0, d3, 0);

// Calculate the end effector transformation matrix
T = A1 * A2 * A3;

// Extract the end effector position
x = T(1,4);
y = T(2,4);
z = T(3,4);

// Print the end effector coordinates
printf("End effector coordinates: (%f, %f, %f)\n", x, y, z);
