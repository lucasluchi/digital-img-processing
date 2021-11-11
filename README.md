# digital-img-processing
Image codec developed for audio and video systems classes at FEI University

This project is implemented in 4 steps, 3 steps to configure the image and the last one to compare results

# Step 1

Compact a image with the techniques listed bellow:
- Chrominance undersampling
- DCT
- Quantization and zig-zag serialization

This techniques must be aplied in Y, Pb and Pr matrices of the selected image. Then one resultant vector must be generated, for this
the selected image should be read from left to right and from top to bottom grouping all 8x8 blocks as figure below.
  
![alt text](https://github.com/lucasluchi/digital-img-processing/blob/main/doc/img/step1.png)
