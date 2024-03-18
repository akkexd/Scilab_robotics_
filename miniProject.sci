// Define DH parameters
theta = [180 180 180 360] * %pi / 180; // Joint angles in radians
alpha = [0 -90 0 0] * %pi / 180; // Joint twist angles in radians
a = [308 390 0 0]; // Link lengths
d = [128 250 0 53]; // Link offsets

// Define DH transformation matrix function
function A = DH(theta, alpha, d, a)
    ct = cos(theta);
    st = sin(theta);
    ca = cos(alpha);
    sa = sin(alpha);
    A = [ct -st.*ca st.*sa a.*ct;
         st ct.*ca -ct.*sa a.*st;
         0 sa ca d;
         0 0 0 1];
endfunction

// Calculate DH matrices for each joint
A1 = DH(theta(1), alpha(1), d(1), a(1));
A2 = DH(theta(2), alpha(2), d(2), a(2));
A3 = DH(theta(3), alpha(3), d(3), a(3));
A4 = DH(theta(4), alpha(4), d(4), a(4));

// Calculate final DH matrix for endpoint
T = A1 * A2 * A3 * A4;

// Display the final DH matrix
disp('DH Matrix for Endpoint:');
disp(T);
