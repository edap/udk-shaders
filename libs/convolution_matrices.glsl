mat3 gaussianBlurKernel(){
   return mat3(
   0.045, 0.122, 0.045,
   0.122, 0.332, 0.122,
   0.045, 0.122, 0.045
   );
}

mat3 gaussianBlur2Kernel(){
return mat3(
   1.0, 2.0, 1.0,
   2.0, 4, 2.0,
   1.0, 2.0,1.0
);
}

mat3 gaussianBlur3Kernel(){
return mat3(
   0.0, 1.0, 0.0,
   1.0, 1.0, 1.0,
   0.0, 1.0, 0.0
);
}

mat3 unsharpenKernel(){
return mat3(
   -1.0, -1.0, -1.0,
   -1.0,  9, -1.0,
   -1.0, -1.0,-1.0
);
}

mat3 sharpnessKernel(){
return mat3(

   0.0,-1.0, 0.0,
-1.0, 5,-1.0,
   0.0,-1.0, 0.0
);}

mat3 sharpenKernel(){
return mat3(
   -1.0, -1.0, -1.0,
   -1.0, 16, -1.0,
   -1.0, -1.0,-1.0
);
}

mat3 edgeDetectKernel(){
return mat3(
   -0.125, -0.125, -0.125,
   -0.125,  1.0,     -0.125,
   -0.125, -0.125, -0.125
);
}

mat3 edgeDetect2Kernel(){
return mat3(
   -1.0, -1.0, -1.0,
   -1.0,  8, -1.0,
   -1.0, -1.0,-1.0
);
}

mat3 edgeDetect3Kernel(){
return mat3(
   -5.0, 0.0, 0.0,
   0.0, 0.0, 0.0,
   0.0, 0.0, 5.0
);}

mat3 edgeDetect4Kernel(){
return mat3(
   -1.0, -1.0, -1.0,
   0.0,  0.0,  0.0,
   1.0,  1.0, 1.0
);
}

mat3 edgeDetect5Kernel(){
return mat3(
   -1.0, -1.0, -1.0,
   2.0,  2.0,  2.0,
   -1.0, -1.0,-1.0
);
}

mat3 edgeDetect6Kernel(){
return mat3(
   -5.0, -5.0, -5.0,
   -5.0, 39.0, -5.0,
   -5.0, -5.0, -5.0
);
}

mat3 sobelHorizontalKernel(){
return mat3(
   1.0,  2.0,  1.0,
   0.0,  0.0,  0.0,
   -1.0, -2,-1.0
);
}

mat3 sobelVerticalKernel(){
return mat3(
   1.0,  0.0, -1.0,
   2.0,  0.0, -2.0,
   1.0,  0.0, -1.0
);
}

mat3 previtHorizontalKernel(){
return mat3(

   1.0,  1.0,  1.0,
   0.0,  0.0,  0.0,
   -1.0, -1.0,-1.0
);}

mat3 previtVerticalKernel(){
return mat3(

   1.0,  0.0, -1.0,
   1.0,  0.0, -1.0,
   1.0,  0.0,-1.0
);}

mat3 boxBlurKernel(){
return mat3(
   0.111, 0.111, 0.111,
   0.111, 0.111, 0.111,
   0.111, 0.111, 0.111
);
}

mat3 triangleBlurKernel(){
return mat3(
   0.0625, 0.125, 0.0625,
   0.125,  0.25,  0.125,
   0.0625, 0.125, 0.0625
);
}

mat3 embossKernel(){
return mat3(
   -2.0, -1.0,  0.0,
   -1.0,  1.0,  1.0,
   0.0,  1.0,  2.0
);
}