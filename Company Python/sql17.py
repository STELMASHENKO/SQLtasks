import csv

with open('companyProduct.csv') as productCSV:
    products = csv.reader(productCSV, delimiter=',')
    Prod = {}
    for product in products:
        if 'Laptop' in product:
            Prod[product[2]] = [product[1], product[3]]
# print(Prod)

with open('companyPC.csv') as PC_CSV:
    pcs = csv.reader(PC_CSV, delimiter=',')
    PCs = []
    for pc in pcs:
        PCs.append(pc[3])
    del PCs[0]
# print(PCs)
min_speed = min(PCs)
# print(min_speed)

with open('companyLaptop.csv') as laptopCSV:
    laptops = csv.reader(laptopCSV, delimiter=',')
    Lapt = {}
    for laptop in laptops:
        if laptop[2] in Lapt:
            Lapt[laptop[2]].append(laptop[3])
        else:
            Lapt[laptop[2]] = [laptop[3]]
    del Lapt['model']
# print(Lapt)

for model in Lapt:
    for speed in Lapt[model]:
        if int(speed) < int(min_speed):
            print(Prod[model][1], model, speed)
