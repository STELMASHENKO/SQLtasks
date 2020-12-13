# Для каждого производителя, выпускающего ПК-блокноты
# c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов.
# Вывод: производитель, скорость.

import csv

with open('companyLaptop.csv') as laptop:
    laptops=csv.reader(laptop, delimiter=',')
    Laptops=[]
    for laptop in laptops:
        if laptop[5] != 'hd':
            if int(laptop[5]) >= 10:
                Laptops.append([laptop[2], laptop[3], laptop[5]])
print(Laptops)

with open('companyProduct.csv') as product:
    products=csv.reader(product, delimiter=',')
    Prod={}
    for product in products:
        if product[3] == 'Laptop':
            Prod[product[2]]=product[1]
print(Prod)

for laptop in Laptops:
    if laptop[0] in Prod:
        print(Prod[laptop[0]], laptop[1])




