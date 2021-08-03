ALTER TABLE SalesLT.Customer ADD [OfficeAddress] VARCHAR(512)

EXECUTE sp_executesql N'
UPDATE customer
SET customer.[OfficeAddress] = ISNULL(address.AddressLine1, ''No address Found'')
FROM SalesLT.Customer customer
LEFT JOIN SalesLT.CustomerAddress custAddress ON customer.CustomerID = custAddress.CustomerID AND custAddress.AddressType = ''Main Office''
LEFT JOIN SalesLT.Address address on address.AddressID = custAddress.AddressID'

EXECUTE sp_executesql N'
ALTER TABLE SalesLT.Customer ALTER COLUMN [OfficeAddress] VARCHAR(512) NOT NULL'