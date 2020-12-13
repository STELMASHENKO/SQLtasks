import csv

with open('companyProduct.csv') as productCSV:
    products = csv.reader(productCSV, delimiter=',')
    Prod = {}
    for product in products:
        Prod[product[2]] = product[1]
    del Prod['model']
print(Prod)

with open('companyPrinter.csv') as printerCSV:
    printers = csv.reader(printerCSV, delimiter=',')
    Print = []
    for printer in printers:
        if 'y' in printer:
            Print.append((printer[5], printer[2]))
print(Print)
min_price = min(Print)[0]
min_model = min(Print)[1]

print(Prod[min_model], min_price)
