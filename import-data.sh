# wait for the SQL Server to come up
sleep 90s
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password123!" -i setup.sql
# import the data from the csv file
/opt/mssql-tools/bin/bcp Gennari.dbo.Category in "/home/usr/categories.csv" -c -t',' -S localhost -U SA -P "Password!23"

# Hay que reemplazar los true/false por 1/0
# Los ids autoincrementales se agregan a pesar de que haya ids en el csv. Los ignora totalmente
/opt/mssql-tools/bin/bcp Gennari.dbo.Product in "/home/usr/products.csv" -c -t',' -S localhost -U SA -P "Password!23"