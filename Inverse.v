`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Aaryan Bhardwaj 
// 201501001
//////////////////////////////////////////////////////////////////////////////////
/*
Editor's Note : 
Please excuse the delay in submission. I was a bit busy with Navratri and Post- Navaratri stuff.
Also, the output still lacks a final step which I don't, yet, know the procedure to. So, the final answer is the augumented Identity matrix when the given matrix reaches the stage aij = * for i = j and 0 for i != j. 
*/
module Inverse(a11, a12, a13, a14, a15, a21, a22, a23, a24, a25, a31, a32, a33, a34, a35, a41, a42, a43, a44, a45, a51, a52, a53, a54, a55, b11, b12, b13, b14, b15, b21, b22, b23, b24, b25, b31, b32, b33, b34, b35, b41, b42, b43, b44, b45, b51, b52, b53, b54, b55, det);

input[19:0] a11, a12, a13, a14, a15, a21, a22, a23, a24, a25, a31, a32, a33, a34, a35, a41, a42, a43, a44, a45, a51, a52, a53, a54, a55;
output[19:0] b11, b12, b13, b14, b15, b21, b22, b23, b24, b25, b31, b32, b33, b34, b35, b41, b42, b43, b44, b45, b51, b52, b53, b54, b55, det;
wire[19:0] ta11, ta12, ta13, ta14, ta15, ta21, ta22, ta23, ta24, ta25, ta31, ta32, ta33, ta34, ta35, ta41, ta42, ta43, ta44, ta45, ta51, ta52, ta53, ta54, ta55;
wire[19:0] i11, i12, i13, i14, i15, i21, i22, i23, i24, i25, i31, i32, i33, i34, i35, i41, i42, i43, i44, i45, i51, i52, i53, i54, i55;
wire[19:0] ti11, ti12, ti13, ti14, ti15, ti21, ti22, ti23, ti24, ti25, ti31, ti32, ti33, ti34, ti35, ti41, ti42, ti43, ti44, ti45, ti51, ti52, ti53, ti54, ti55;
wire[19:0] t1a11, t1a12, t1a13, t1a14, t1a15, t1a21, t1a22, t1a23, t1a24, t1a25, t1a31, t1a32, t1a33, t1a34, t1a35, t1a41, t1a42, t1a43, t1a44, t1a45, t1a51, t1a52, t1a53, t1a54, t1a55;
wire[19:0] t1i11, t1i12, t1i13, t1i14, t1i15, t1i21, t1i22, t1i23, t1i24, t1i25, t1i31, t1i32, t1i33, t1i34, t1i35, t1i41, t1i42, t1i43, t1i44, t1i45, t1i51, t1i52, t1i53, t1i54, t1i55;
wire[19:0] t2a11, t2a12, t2a13, t2a14, t2a15, t2a21, t2a22, t2a23, t2a24, t2a25, t2a31, t2a32, t2a33, t2a34, t2a35, t2a41, t2a42, t2a43, t2a44, t2a45, t2a51, t2a52, t2a53, t2a54, t2a55;
wire[19:0] t2i11, t2i12, t2i13, t2i14, t2i15, t2i21, t2i22, t2i23, t2i24, t2i25, t2i31, t2i32, t2i33, t2i34, t2i35, t2i41, t2i42, t2i43, t2i44, t2i45, t2i51, t2i52, t2i53, t2i54, t2i55;
wire[19:0] t3a11, t3a12, t3a13, t3a14, t3a15, t3a21, t3a22, t3a23, t3a24, t3a25, t3a31, t3a32, t3a33, t3a34, t3a35, t3a41, t3a42, t3a43, t3a44, t3a45, t3a51, t3a52, t3a53, t3a54, t3a55;
wire[19:0] t3i11, t3i12, t3i13, t3i14, t3i15, t3i21, t3i22, t3i23, t3i24, t3i25, t3i31, t3i32, t3i33, t3i34, t3i35, t3i41, t3i42, t3i43, t3i44, t3i45, t3i51, t3i52, t3i53, t3i54, t3i55;
wire[19:0] t4a11, t4a12, t4a13, t4a14, t4a15, t4a21, t4a22, t4a23, t4a24, t4a25, t4a31, t4a32, t4a33, t4a34, t4a35, t4a41, t4a42, t4a43, t4a44, t4a45, t4a51, t4a52, t4a53, t4a54, t4a55;
wire[19:0] t4i11, t4i12, t4i13, t4i14, t4i15, t4i21, t4i22, t4i23, t4i24, t4i25, t4i31, t4i32, t4i33, t4i34, t4i35, t4i41, t4i42, t4i43, t4i44, t4i45, t4i51, t4i52, t4i53, t4i54, t4i55;
wire[19:0] t5a11, t5a12, t5a13, t5a14, t5a15, t5a21, t5a22, t5a23, t5a24, t5a25, t5a31, t5a32, t5a33, t5a34, t5a35, t5a41, t5a42, t5a43, t5a44, t5a45, t5a51, t5a52, t5a53, t5a54, t5a55;
wire[19:0] t5i11, t5i12, t5i13, t5i14, t5i15, t5i21, t5i22, t5i23, t5i24, t5i25, t5i31, t5i32, t5i33, t5i34, t5i35, t5i41, t5i42, t5i43, t5i44, t5i45, t5i51, t5i52, t5i53, t5i54, t5i55;
wire[19:0] t6a11, t6a12, t6a13, t6a14, t6a15, t6a21, t6a22, t6a23, t6a24, t6a25, t6a31, t6a32, t6a33, t6a34, t6a35, t6a41, t6a42, t6a43, t6a44, t6a45, t6a51, t6a52, t6a53, t6a54, t6a55;
wire[19:0] t6i11, t6i12, t6i13, t6i14, t6i15, t6i21, t6i22, t6i23, t6i24, t6i25, t6i31, t6i32, t6i33, t6i34, t6i35, t6i41, t6i42, t6i43, t6i44, t6i45, t6i51, t6i52, t6i53, t6i54, t6i55;
wire[19:0] t7a11, t7a12, t7a13, t7a14, t7a15, t7a21, t7a22, t7a23, t7a24, t7a25, t7a31, t7a32, t7a33, t7a34, t7a35, t7a41, t7a42, t7a43, t7a44, t7a45, t7a51, t7a52, t7a53, t7a54, t7a55;
wire[19:0] t7i11, t7i12, t7i13, t7i14, t7i15, t7i21, t7i22, t7i23, t7i24, t7i25, t7i31, t7i32, t7i33, t7i34, t7i35, t7i41, t7i42, t7i43, t7i44, t7i45, t7i51, t7i52, t7i53, t7i54, t7i55;
wire[19:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18;

assign i11 = 20'b1;
assign i12 = 20'b0;
assign i13 = 20'b0;
assign i14 = 20'b0;
assign i15 = 20'b0;
assign i21 = 20'b0;
assign i22 = 20'b1;
assign i23 = 20'b0;
assign i24 = 20'b0;
assign i25 = 20'b0;
assign i31 = 20'b0;
assign i32 = 20'b0;
assign i33 = 20'b1;
assign i34 = 20'b0;
assign i35 = 20'b0;
assign i41 = 20'b0;
assign i42 = 20'b0;
assign i43 = 20'b0;
assign i44 = 20'b1;
assign i45 = 20'b0;
assign i51 = 20'b0;
assign i52 = 20'b0;
assign i53 = 20'b0;
assign i54 = 20'b0;
assign i55 = 20'b1;
//Identity matrix initialized

assign temp1 = a11;

assign temp2 = a21;
assign ta21 = a21*temp1 - a11*temp2;
assign ta22 = a22*temp1 - a12*temp2;
assign ta23 = a23*temp1 - a13*temp2;
assign ta24 = a24*temp1 - a14*temp2;
assign ta25 = a25*temp1 - a15*temp2;
assign ti21 = i21*temp1 - i11*temp2;
assign ti22 = i22*temp1 - i12*temp2;
assign ti23 = i23*temp1 - i13*temp2;
assign ti24 = i24*temp1 - i14*temp2;
assign ti25 = i25*temp1 - i15*temp2;

assign temp3 = a31;
assign ta31 = a31*temp1 - a11*temp3;
assign ta32 = a32*temp1 - a12*temp3;
assign ta33 = a33*temp1 - a13*temp3;
assign ta34 = a34*temp1 - a14*temp3;
assign ta35 = a35*temp1 - a15*temp3;
assign ti31 = i31*temp1 - i11*temp3;
assign ti32 = i32*temp1 - i12*temp3;
assign ti33 = i33*temp1 - i13*temp3;
assign ti34 = i34*temp1 - i14*temp3;
assign ti35 = i35*temp1 - i15*temp3;

assign temp4 = a41;
assign ta41 = a41*temp1 - a11*temp4;
assign ta42 = a42*temp1 - a12*temp4;
assign ta43 = a43*temp1 - a13*temp4;
assign ta44 = a44*temp1 - a14*temp4;
assign ta45 = a45*temp1 - a15*temp4;
assign ti41 = i41*temp1 - i11*temp4;
assign ti42 = i42*temp1 - i12*temp4;
assign ti43 = i43*temp1 - i13*temp4;
assign ti44 = i44*temp1 - i14*temp4;
assign ti45 = i45*temp1 - i15*temp4;

assign temp5 = a51;
assign ta51 = a51*temp1 - a11*temp5;
assign ta52 = a52*temp1 - a12*temp5;
assign ta53 = a53*temp1 - a13*temp5;
assign ta54 = a54*temp1 - a14*temp5;
assign ta55 = a55*temp1 - a15*temp5;
assign ti51 = i51*temp1 - i11*temp5;
assign ti52 = i52*temp1 - i12*temp5;
assign ti53 = i53*temp1 - i13*temp5;
assign ti54 = i54*temp1 - i14*temp5;
assign ti55 = i55*temp1 - i15*temp5;

assign ti11 = i11;
assign ti12 = i12;
assign ti13 = i13;
assign ti14 = i14;
assign ti15 = i15;
assign ta11 = a11;
assign ta12 = a12;
assign ta13 = a13;
assign ta14 = a14;
assign ta15 = a15;
//EF - column 1 = 0

assign temp6 = ta22;

assign temp7 = ta32;
assign t1a31 = ta31*temp6 - ta21*temp7;
assign t1a32 = ta32*temp6 - ta22*temp7;
assign t1a33 = ta33*temp6 - ta23*temp7;
assign t1a34 = ta34*temp6 - ta24*temp7;
assign t1a35 = ta35*temp6 - ta25*temp7;
assign t1i31 = ti31*temp6 - ti21*temp7;
assign t1i32 = ti32*temp6 - ti22*temp7;
assign t1i33 = ti33*temp6 - ti23*temp7;
assign t1i34 = ti34*temp6 - ti24*temp7;
assign t1i35 = ti35*temp6 - ti25*temp7;

assign temp8 = ta42;
assign t1a41 = ta41*temp6 - ta41*temp8;
assign t1a42 = ta42*temp6 - ta42*temp8;
assign t1a43 = ta43*temp6 - ta43*temp8;
assign t1a44 = ta44*temp6 - ta44*temp8;
assign t1a45 = ta45*temp6 - ta45*temp8;
assign t1a41 = ti41*temp6 - ti41*temp8;
assign t1i42 = ti42*temp6 - ti42*temp8;
assign t1i43 = ti43*temp6 - ti43*temp8;
assign t1i44 = ti44*temp6 - ti44*temp8;
assign t1i45 = ti45*temp6 - ti45*temp8;

assign temp9 = ta52;
assign t1a51 = ta51*temp6 - ta51*temp9;
assign t1a52 = ta52*temp6 - ta52*temp9;
assign t1a53 = ta53*temp6 - ta53*temp9;
assign t1a54 = ta54*temp6 - ta54*temp9;
assign t1a55 = ta55*temp6 - ta55*temp9;
assign t1i51 = ta51*temp6 - ti51*temp9;
assign t1i52 = ti52*temp6 - ti52*temp9;
assign t1i53 = ti53*temp6 - ti53*temp9;
assign t1i54 = ti54*temp6 - ti54*temp9;
assign t1i55 = ti55*temp6 - ti55*temp9;

assign t1a11 = a11;
assign t1a12 = a12;
assign t1a13 = a13;
assign t1a14 = a14;
assign t1a15 = a15;
assign t1a21 = a21;
assign t1a22 = a22;
assign t1a23 = a23;
assign t1a24 = a24;
assign t1a25 = a25;
assign t1i11 = i11;
assign t1i12 = i12;
assign t1i13 = i13;
assign t1i14 = i14;
assign t1i15 = i15;
assign t1i21 = i21;
assign t1i22 = i22;
assign t1i23 = i23;
assign t1i24 = i24;
assign t1i25 = i25;
//EF - column 2 = 0

assign temp10 = t1a33;

assign temp11 = t1a43;
assign t2a41 = t1a41*temp10 - t1a31*temp11;
assign t2a42 = t1a42*temp10 - t1a32*temp11;
assign t2a43 = t1a43*temp10 - t1a33*temp11;
assign t2a44 = t1a44*temp10 - t1a34*temp11;
assign t2a45 = t1a45*temp10 - t1a35*temp11;
assign t2i41 = t1i41*temp10 - t1i31*temp11;
assign t2i42 = t1i42*temp10 - t1i32*temp11;
assign t2i43 = t1i43*temp10 - t1i33*temp11;
assign t2i44 = t1i44*temp10 - t1i34*temp11;
assign t2i45 = t1i45*temp10 - t1i35*temp11;

assign temp12 = t1a53;
assign t2a51 = t1a51*temp10 - t1a31*temp12;
assign t2a52 = t1a52*temp10 - t1a32*temp12;
assign t2a53 = t1a53*temp10 - t1a33*temp12;
assign t2a54 = t1a54*temp10 - t1a34*temp12;
assign t2a55 = t1a55*temp10 - t1a35*temp12;
assign t2i51 = t1i51*temp10 - t1i31*temp12;
assign t2i52 = t1i52*temp10 - t1i32*temp12;
assign t2i53 = t1i53*temp10 - t1i33*temp12;
assign t2i54 = t1i54*temp10 - t1i34*temp12;
assign t2i55 = t1i55*temp10 - t1i35*temp12;

assign t2a11 = t1a11;
assign t2a12 = t1a12;
assign t2a13 = t1a13;
assign t2a14 = t1a14;
assign t2a15 = t1a15;
assign t2a21 = t1a21;
assign t2a22 = t1a22;
assign t2a23 = t1a23;
assign t2a24 = t1a24;
assign t2a25 = t1a25;
assign t2a31 = t1a31;
assign t2a32 = t1a32;
assign t2a33 = t1a33;
assign t2a34 = t1a34;
assign t2a35 = t1a35;
assign t2i11 = t1i11;
assign t2i12 = t1i12;
assign t2i13 = t1i13;
assign t2i14 = t1i14;
assign t2i15 = t1i15;
assign t2i21 = t1i21;
assign t2i22 = t1i22;
assign t2i23 = t1i23;
assign t2i24 = t1i24;
assign t2i25 = t1i25;
assign t2i31 = t1i31;
assign t2i32 = t1i32;
assign t2i33 = t1i33;
assign t2i34 = t1i34;
assign t2i35 = t1i35;
//EF - column 3 = 0

assign temp13 = t2a44;

assign temp14 = t2a54;
assign t3a51 = t2a51*temp13 - t2a41*temp14;
assign t3a52 = t2a52*temp13 - t2a42*temp14;
assign t3a53 = t2a53*temp13 - t2a43*temp14;
assign t3a54 = t2a54*temp13 - t2a44*temp14;
assign t3a55 = t2a55*temp13 - t2a45*temp14;
assign t3i51 = t2i51*temp13 - t2i41*temp14;
assign t3i52 = t2i52*temp13 - t2i42*temp14;
assign t3i53 = t2i53*temp13 - t2i43*temp14;
assign t3i54 = t2i54*temp13 - t2i44*temp14;
assign t3i55 = t2i55*temp13 - t2i45*temp14;

assign t3a11 = t2a11;
assign t3a12 = t2a12;
assign t3a13 = t2a13;
assign t3a14 = t2a14;
assign t3a15 = t2a15;
assign t3a21 = t2a21;
assign t3a22 = t2a22;
assign t3a23 = t2a23;
assign t3a24 = t2a24;
assign t3a25 = t2a25;
assign t3a31 = t2a31;
assign t3a32 = t2a32;
assign t3a33 = t2a33;
assign t3a34 = t2a34;
assign t3a35 = t2a35;
assign t3a41 = t2a41;
assign t3a42 = t2a42;
assign t3a43 = t2a43;
assign t3a44 = t2a44;
assign t3a45 = t2a45;
assign t3i11 = t2i11;
assign t3i12 = t2i12;
assign t3i13 = t2i13;
assign t3i14 = t2i14;
assign t3i15 = t2i15;
assign t3i21 = t2i21;
assign t3i22 = t2i22;
assign t3i23 = t2i23;
assign t3i24 = t2i24;
assign t3i25 = t2i25;
assign t3i31 = t2i31;
assign t3i32 = t2i32;
assign t3i33 = t2i33;
assign t3i34 = t2i34;
assign t3i35 = t2i35;
assign t3i41 = t2i41;
assign t3i42 = t2i42;
assign t3i43 = t2i43;
assign t3i44 = t2i44;
assign t3i45 = t2i45;
//EF achieved - column 4 = 0

assign det = t3a11 * t3a22 * t3a33 * t3a55 * t3a44; 
//Determinant

assign t4i45 = t3i45*t3a55 - t3i55*t3a45;
assign t4i44 = t3i44*t3a55 - t3i54*t3a45;
assign t4i43 = t3i43*t3a55 - t3i53*t3a45;
assign t4i42 = t3i42*t3a55 - t3i52*t3a45;
assign t4i41 = t3i41*t3a55 - t3i51*t3a45;

assign t4i35 = t3i35*t3a55 - t3i55*t3a35;
assign t4i34 = t3i34*t3a55 - t3i54*t3a35;
assign t4i33 = t3i33*t3a55 - t3i53*t3a35;
assign t4i32 = t3i32*t3a55 - t3i52*t3a35;
assign t4i31 = t3i31*t3a55 - t3i51*t3a35;

assign t4i25 = t3i25*t3a55 - t3i55*t3a25;
assign t4i24 = t3i24*t3a55 - t3i54*t3a25;
assign t4i23 = t3i23*t3a55 - t3i53*t3a25;
assign t4i22 = t3i22*t3a55 - t3i52*t3a25;
assign t4i21 = t3i21*t3a55 - t3i51*t3a25;

assign t4i15 = t3i15*t3a55 - t3i55*t3a15;
assign t4i14 = t3i14*t3a55 - t3i54*t3a15;
assign t4i13 = t3i13*t3a55 - t3i53*t3a15;
assign t4i12 = t3i12*t3a55 - t3i52*t3a15;
assign t4i11 = t3i11*t3a55 - t3i51*t3a15;

assign t4i51 = t3i51;
assign t4i52 = t3i52;
assign t4i53 = t3i53;
assign t4i54 = t3i54;
assign t4i55 = t3i55;
//RREF - column 5 = 0

assign t5i35 = t4i35*t3a44 - t4i45*t3a34;
assign t5i34 = t4i34*t3a44 - t4i44*t3a34;
assign t5i33 = t4i33*t3a44 - t4i43*t3a34;
assign t5i32 = t4i32*t3a44 - t4i42*t3a34;
assign t5i31 = t4i31*t3a44 - t4i41*t3a34;

assign t5i25 = t4i25*t3a44 - t4i45*t3a24;
assign t5i24 = t4i24*t3a44 - t4i44*t3a24;
assign t5i23 = t4i23*t3a44 - t4i43*t3a24;
assign t5i22 = t4i22*t3a44 - t4i42*t3a24;
assign t5i21 = t4i21*t3a44 - t4i41*t3a24;

assign t5i15 = t4i15*t3a44 - t4i45*t3a14;
assign t5i14 = t4i14*t3a44 - t4i44*t3a14;
assign t5i13 = t4i13*t3a44 - t4i43*t3a14;
assign t5i12 = t4i12*t3a44 - t4i42*t3a14;
assign t5i11 = t4i11*t3a44 - t4i41*t3a14;

assign t5i51 = t4i51;
assign t5i52 = t4i52;
assign t5i53 = t4i53;
assign t5i54 = t4i54;
assign t5i55 = t4i55;
assign t5i41 = t4i41;
assign t5i42 = t4i42;
assign t5i43 = t4i43;
assign t5i44 = t4i44;
assign t5i45 = t4i45;
//RREF - column 4 = 0

assign t6i25 = t5i25*t3a33 - t5i35*t3a23;
assign t6i24 = t5i24*t3a33 - t5i34*t3a23;
assign t6i23 = t5i23*t3a33 - t5i33*t3a23;
assign t6i22 = t5i22*t3a33 - t5i32*t3a23;
assign t6i21 = t5i21*t3a33 - t5i31*t3a23;

assign t6i15 = t5i15*t3a33 - t5i35*t3a13;
assign t6i14 = t5i14*t3a33 - t5i34*t3a13;
assign t6i13 = t5i13*t3a33 - t5i33*t3a13;
assign t6i12 = t5i12*t3a33 - t5i32*t3a13;
assign t6i11 = t5i11*t3a33 - t5i31*t3a13;

assign t6i51 = t5i51;
assign t6i52 = t5i52;
assign t6i53 = t5i53;
assign t6i54 = t5i54;
assign t6i55 = t5i55;
assign t6i41 = t5i41;
assign t6i42 = t5i42;
assign t6i43 = t5i43;
assign t6i44 = t5i44;
assign t6i45 = t5i45;
assign t6i31 = t5i31;
assign t6i32 = t5i32;
assign t6i33 = t5i33;
assign t6i34 = t5i34;
assign t6i35 = t5i35;
//RREF - column 3 = 0

assign t7i15 = t6i15*t3a22 - t6i25*t3a12;
assign t7i14 = t6i14*t3a22 - t6i24*t3a12;
assign t7i13 = t6i13*t3a22 - t6i23*t3a12;
assign t7i12 = t6i12*t3a22 - t6i22*t3a12;
assign t7i11 = t6i11*t3a22 - t6i21*t3a12;

assign t7i51 = t6i51;
assign t7i52 = t6i52;
assign t7i53 = t6i53;
assign t7i54 = t6i54;
assign t7i55 = t6i55;
assign t7i41 = t6i41;
assign t7i42 = t6i42;
assign t7i43 = t6i43;
assign t7i44 = t6i44;
assign t7i45 = t6i45;
assign t7i31 = t6i31;
assign t7i32 = t6i32;
assign t7i33 = t6i33;
assign t7i34 = t6i34;
assign t7i35 = t6i35;
assign t7i21 = t6i21;
assign t7i22 = t6i22;
assign t7i23 = t6i23;
assign t7i24 = t6i24;
assign t7i25 = t6i25;
//RREF achieved - column 2 = 0

assign b51 = t7i51;
assign b52 = t7i52;
assign b53 = t7i53;
assign b54 = t7i54;
assign b55 = t7i55;
assign b41 = t7i41;
assign b42 = t7i42;
assign b43 = t7i43;
assign b44 = t7i44;
assign b45 = t7i45;
assign b31 = t7i31;
assign b32 = t7i32;
assign b33 = t7i33;
assign b34 = t7i34;
assign b35 = t7i35;
assign b21 = t7i21;
assign b22 = t7i22;
assign b23 = t7i23;
assign b24 = t7i24;
assign b25 = t7i25;
assign b11 = t7i11;
assign b12 = t7i12;
assign b13 = t7i13;
assign b14 = t7i14;
assign b15 = t7i15;

endmodule
