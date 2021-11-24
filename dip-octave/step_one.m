# step one

function img_d = dct_quant (img)
  
endfunction

function img_d = step_one(img, n)
  # downscalling method 1
##  img_d = img(1:n:end,1:n:end,:);
  img_d = img;
  map = colormap(gray(max(max(max(img_d)))));%vari�vel map recebe o colormap do tipo
  R = img_d(:,:,1); %separa o canal R na matriz R
  G = img_d(:,:,2); %separa o canal G na matriz G
  B = img_d(:,:,3); %separa o canal B na matriz B

  Y = 0.587*G+0.299*R+0.114*B; %calcula o valor da lumin�ncia em fun��o de R,G,B
  Cb = 128 + 0.564*(B-Y);%calcula o valor de Cb em fun��o de R,G,B
  Cr = 128+ 0.713*(R-Y);%calcula o valor de Cr em fun��o de R,G,B
  
  %'gray' que cont�m um escala de cinza com uma quantidade de n�veis igual
  %ao m�ximo valor que a matriz img_d pode assumir.
##  image(img_d)%mostra a imagem original
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  H = size(Y,2); %encontra o n�mero de colunas da matriz
  V = size(Y,1); %encontra o n�mero de linhas da matriz
  S=2; %scale factor (fator de compress�o)
  %inicializar as matrizes com zeros torna o algoritmo mais r�pido
  %ao utilizar loop For.
  xdct=zeros([V,H]);%matriz apos DCT
  xq=zeros([V,H]);%matriz apos DCT e quantiza��o
  xqinv=zeros([V,H]);%matriz apos quantiza��o inversa
  xfinal=zeros([V,H]);%matriz da imagem recuperada ap�s quantiza��o
  %inversa e IDCT
  %matriz de quantiza��o para canais de lumin�ncia.
  Q=[16 11 10 16 24 40 51 61;
   12 12 14 19 26 58 60 55;
   14 13 16 24 40 57 69 56;
   14 17 22 29 51 87 80 62;
   18 22 37 56 68 109 103 77;
   24 35 55 64 81 104 113 92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xdct recebe a DCT de um bloco 8x8
   %da matriz Y
   xdct(i:1:i+7,j:1:j+7)=dct(dct(Y(i:1:i+7,j:1:j+7))')';

   %cada bloco de 8x8 da matriz xq recebe o resultado da quantiza��o
   %de um bloco 8x8 da matriz xdct
   xq(i:1:i+7,j:1:j+7)=round(xdct(i:1:i+7,j:1:j+7)./(Q*S));
   end
  end
  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xqinv recebe o resultado da
   % quantiza��o inversa de um bloco 8x8 da matriz xq
   xqinv(i:1:i+7,j:1:j+7)=xq(i:1:i+7,j:1:j+7).*(Q*S);

   %cada bloco de 8x8 da matriz xfinal recebe a iDCT de um bloco 8x8
   %da matriz xqinv
   xfinal(i:1:i+7,j:1:j+7)=idct(idct(xqinv(i:1:i+7,j:1:j+7))')';
   end
  end
  figure
  image(xfinal)%exibe a imagem ap�s os processos inversos
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  
  
  
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  H = size(Cb,2); %encontra o n�mero de colunas da matriz
  V = size(Cb,1); %encontra o n�mero de linhas da matriz
  S=2; %scale factor (fator de compress�o)
  %inicializar as matrizes com zeros torna o algoritmo mais r�pido
  %ao utilizar loop For.
  xdct=zeros([V,H]);%matriz apos DCT
  xq=zeros([V,H]);%matriz apos DCT e quantiza��o
  xqinv=zeros([V,H]);%matriz apos quantiza��o inversa
  xfinal2=zeros([V,H]);%matriz da imagem recuperada ap�s quantiza��o
  %inversa e IDCT
  %matriz de quantiza��o para canais de lumin�ncia.
  Q=[16 11 10 16 24 40 51 61;
   12 12 14 19 26 58 60 55;
   14 13 16 24 40 57 69 56;
   14 17 22 29 51 87 80 62;
   18 22 37 56 68 109 103 77;
   24 35 55 64 81 104 113 92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xdct recebe a DCT de um bloco 8x8
   %da matriz Cb
   xdct(i:1:i+7,j:1:j+7)=dct(dct(Cb(i:1:i+7,j:1:j+7))')';

   %cada bloco de 8x8 da matriz xq recebe o resultado da quantiza��o
   %de um bloco 8x8 da matriz xdct
   xq(i:1:i+7,j:1:j+7)=round(xdct(i:1:i+7,j:1:j+7)./(Q*S));
   end
  end
  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xqinv recebe o resultado da
   % quantiza��o inversa de um bloco 8x8 da matriz xq
   xqinv(i:1:i+7,j:1:j+7)=xq(i:1:i+7,j:1:j+7).*(Q*S);

   %cada bloco de 8x8 da matriz xfinal recebe a iDCT de um bloco 8x8
   %da matriz xqinv
   xfinal2(i:1:i+7,j:1:j+7)=idct(idct(xqinv(i:1:i+7,j:1:j+7))')';
   end
  end
  figure
  image(xfinal2)%exibe a imagem ap�s os processos inversos
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  
  
  
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  H = size(Cr,2); %encontra o n�mero de colunas da matriz
  V = size(Cr,1); %encontra o n�mero de linhas da matriz
  S=2; %scale factor (fator de compress�o)
  %inicializar as matrizes com zeros torna o algoritmo mais r�pido
  %ao utilizar loop For.
  xdct=zeros([V,H]);%matriz apos DCT
  xq=zeros([V,H]);%matriz apos DCT e quantiza��o
  xqinv=zeros([V,H]);%matriz apos quantiza��o inversa
  xfinal3=zeros([V,H]);%matriz da imagem recuperada ap�s quantiza��o
  %inversa e IDCT
  %matriz de quantiza��o para canais de lumin�ncia.
  Q=[16 11 10 16 24 40 51 61;
   12 12 14 19 26 58 60 55;
   14 13 16 24 40 57 69 56;
   14 17 22 29 51 87 80 62;
   18 22 37 56 68 109 103 77;
   24 35 55 64 81 104 113 92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xdct recebe a DCT de um bloco 8x8
   %da matriz Cr
   xdct(i:1:i+7,j:1:j+7)=dct(dct(Cr(i:1:i+7,j:1:j+7))')';

   %cada bloco de 8x8 da matriz xq recebe o resultado da quantiza��o
   %de um bloco 8x8 da matriz xdct
   xq(i:1:i+7,j:1:j+7)=round(xdct(i:1:i+7,j:1:j+7)./(Q*S));
   end
  end
  %i e j variando com passo 8 apontam sempre para o ponto da esquerda
  %superior de um novo bloco a ser analisado.
  for i= 1:8:V
   for j=1:8:H
   %cada bloco de 8x8 da matriz xqinv recebe o resultado da
   % quantiza��o inversa de um bloco 8x8 da matriz xq
   xqinv(i:1:i+7,j:1:j+7)=xq(i:1:i+7,j:1:j+7).*(Q*S);

   %cada bloco de 8x8 da matriz xfinal recebe a iDCT de um bloco 8x8
   %da matriz xqinv
   xfinal3(i:1:i+7,j:1:j+7)=idct(idct(xqinv(i:1:i+7,j:1:j+7))')';
   end
  end
  figure
  image(xfinal3)%exibe a imagem ap�s os processos inversos
  colormap(map)%ajusta o colormap para o tipo armazenado na vari�vel map
  
  img_d(:,:,1) = xfinal;
  img_d(:,:,2) = xfinal2;
  img_d(:,:,3) = xfinal3;
  
  img_d = ycbcr2rgb(img_d);
  
endfunction