# digital-img-processing
Image codec developed for audio and video systems classes at FEI University

This project is implemented in 4 steps, 3 steps to configure the image and the last one to compare results

# Step 1

Compact a image with the techniques listed bellow:
- Downscaling method 1
- DCT
- Quantization and zig-zag serialization

This techniques must be aplied in Y, Cb and Cr matrices of the selected image. Then one resultant vector must be generated, for this
the selected image should be read from left to right and from top to bottom grouping all 8x8 blocks as figure below.
  
![alt text](https://github.com/lucasluchi/digital-img-processing/blob/main/doc/img/step1.png)

# Step 2

The resultant vector generated in step 1 should be tranformed in a binary (9bits/coeficient) analyzing each block separately. The first being
reserved to indicate the end of block (EOB) and others 8 bits to transmite the information of dec-bin convertion of amplitude of each element in the matrix.

After quantization the values obtained in each element of the three matrices can be between -127 to +127, this way is possible to use 8 bits with sinalization and complement.

# Step 3

Transformation of the generated vector to decimal and decode the image with the inverse techniques aplied in step 1.
- Upscaling method 1
- IDCT
- Inverse quantization and zig-zag
 
In this step the full image are reconstructed.

# Step 4 (Final)

Comparation in bit the size of original image with the transmited image after step 2 and calculate the execution time of code for a FULL-HD image.