import numpy as np
from PIL import Image
from PIL import ImageFilter

p=97
q=43
n=p*q

e=3953
s=6

d=2705
c=0

def encrypt(num):
    c=(num**e)% n
    return c

def desencrypt(num):
    f=(num**d)%n
    if f>255:
        f=255
    return f


Altura= input("Ingrese altura (Height)")
Ancho= input("Ingrese ancho (Wide)")
Tamaño=(Altura, Ancho)

MaskSize=(3,3); #Dimension del Kernel
Coeficientes= (-2,-2,-2,-2,32,-2,-2,-2,-2)
# Open an already existing image
imageObject = Image.open("./4.jpg").convert('RGBA') #Obtengo valores RGB
arr = np.array(imageObject) #Convierto a Matriz
flat_arr = arr.ravel() #Convierto a Vector
#print(flat_arr)
out=[]
#imageObject.show()
#out = [640][480]
cnt=0
for i in range(len(arr)):
    for j in range(len(arr[0])):
        pix=str(bin(flat_arr[cnt]).replace("0b",""))+str(bin(flat_arr[cnt+1]).replace("0b",""))
        tmp=desencrypt(int(pix,2))
        out.append(tmp)
        cnt=cnt+2

W = np.mat(out)
W = W.reshape(320,640)
W.shape
print(W)
img = Image.fromarray(W, 'RGBA')
Image.fromarray(W).show()
img.save("imageOut.jpg")

"""
# Apply sharp filter
sharpened1 = imageObject.filter(ImageFilter.Kernel(MaskSize, Coeficientes));
sharpened2 = sharpened1.filter(ImageFilter.Kernel(MaskSize, Coeficientes));
sharpened3= sharpened2.filter(ImageFilter.Kernel(MaskSize, Coeficientes));

# Show the sharpened images
sharpened1.show();
sharpened2.show();
sharpened3.show();
"""
#print(Coeficientes)
