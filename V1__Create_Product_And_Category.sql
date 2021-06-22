IF OBJECT_ID(N'Category', N'U') IS NULL
    BEGIN
        CREATE TABLE Category
        (
            code varchar(30),
            name varchar(30),
            image varbinary(MAX),
            PRIMARY KEY (code)
        )
    END

IF OBJECT_ID(N'Product', N'U') IS NULL
    BEGIN
        CREATE TABLE Product
        (
            id int,
            name varchar(50),
            description varchar(100),
            price money,
            quantity int,
            image varbinary(MAX),
            size varchar(10),
            category varchar(30),
            highlight bit,
            PRIMARY KEY (id),
            CONSTRAINT FK_PRODUCT_CATEGORY
                FOREIGN KEY (category)
                    REFERENCES Category (code),
        )
    END

GO