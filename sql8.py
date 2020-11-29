import csv

with open("companyProduct.csv") as product:
    products=csv.reader(product, delimiter=',')
    maker={}
    for product in products:
        if product[1] not in maker:
            maker[product[1]]=[product[3]]
        else:
            maker[product[1]].append(product[3])
    del maker['maker']
# print(maker)

for key in maker:
    if 'PC' in maker[key] and 'Laptop' not in maker[key]:
        print(key)


