import csv

def readcsv(file):
    with open(file) as table:
        lines = csv.reader(table, delimiter=',')
        arr=[]
        for line in lines:
            arr.append(line)
    return arr

products = readcsv("companyProduct.csv")
pcs = readcsv("companyPC.csv")
laptops = readcsv("companyLaptop.csv")
printers = readcsv("companyPrinter.csv")

Products = {}
for product in products:
    if product[1] == 'B':
        Products[product[2]] = product[3]
# print(Products)

PCs={}
for pc in pcs:
    if pc[2] in Products:
        PCs[pc[2]] = pc[7]
# print(PCs)

Printers = {}
for printer in printers:
    if printer[2] in Products:
        Printers[printer[2]] = printer[5]
# print(Printers)

Laptops = {}
for laptop in laptops:
    if laptop[2] in Products:
        Laptops[laptop[2]] = laptop[6]
# print(Laptops)

res=[]
for i in PCs:
    res.append([i, PCs[i]])
for i in Printers:
    res.append([i, Printers[i]])
for i in Laptops:
    res.append([i, Laptops[i]])
n=0
for i in res:
    n+=1
    i.insert(0, n)
res.insert(0, ['#','model','price'])
print(res)

with open('res.csv', 'w', newline='') as file:
    writer = csv.writer(file, delimiter=',')
    writer.writerows(res)
