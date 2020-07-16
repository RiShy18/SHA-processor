import sys
import cv2
import numpy as np
import os.path
from matplotlib import pyplot as plt 

def hexchk(num):
  if len(num) == 1:
    return "0"+num
  else:
    return num

#Arguments
args = sys.argv

if len(args) == 1:
  sys.exit("El uso del script es: python im2mif.py <imagen>")

if os.path.exists(args[1]) == False:
  sys.exit("La imagen no existe, verifique el nombre escrito")

#Carga de la image
A = cv2.imread(args[1])
m,n, c = A.shape

pixelesPorVector = 8
width = pixelesPorVector * 24
depth = int((n / pixelesPorVector) * m)

if n%pixelesPorVector != 0:
  sys.exit("El numero de columnas de la imagen debe ser multiplo de "+str(pixelesPorVector))

with open("imagen.txt", "w") as f:
  line = ""
  for i in range(0, m, 1):
    for j in range(0, n, 8):
      for p in range(0, 8, 1):
        for q in range(0,3,1):
          if c == 1:
            line += hexchk(str(hex(A[i,j+p,1])[2:]))
          else:
            line += hexchk(str(hex(A[i,j+p,q])[2:]))
      line += "\n"
      f.write(line)
      line = ""



