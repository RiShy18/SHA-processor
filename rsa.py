

#Encriptar c = me m´od n,
#desencriptar m = cd m´od n,

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
    return f
