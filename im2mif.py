import sys
import cv2
import numpy as np
import os.path
from matplotlib import pyplot as plt 

#Arguments
args = sys.argv

if len(args) == 1:
  sys.exit("El uso del script es: python im2mif.py <imagen>")

if os.path.exists(args[1]) == False:
  sys.exit("La imagen no existe, verifique el nombre escrito")

#Carga de la image
A = cv2.imread(args[1])
m,n, c = A.shape

print(type(A[1][1][1]))

pixelesPorVector = 8
width = pixelesPorVector * 24
depth = int((n / pixelesPorVector) * m)

if n%pixelesPorVector != 0:
  sys.exit("El numero de columnas de la imagen debe ser multiplo de "+str(pixelesPorVector))

with open("imageIn.mif", "w") as f:
  f.write("WIDTH="+ str(width) +";\r")
  f.write("DEPTH="+ str(depth) +";\r\r")
  f.write("ADDRESS_RADIX=UNS;\r")
  f.write("DATA_RADIX=HEX;\r\r")
  f.write("CONTENT BEGIN\r")

  index = 0
  for i in range(0, m, 1):
    line = "\t"+str(index)+" : "
    for j in range(0, n, 8):
      for p in range(0, 8, 1):
        for q in range(0,3,1):
          if c == 1:
            line += str(hex(A[i,j+p,1])[2:])
          else:
            line += str(hex(A[i,j+p,q])[2:])
      line += ";\r"
      f.write(line)
      index += 1
      line = "\t"+str(index)+" : " 
      

  f.write("END")  



