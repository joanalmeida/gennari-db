IF OBJECT_ID(N'Image', N'U') IS NULL
    BEGIN
        CREATE TABLE Image
        (
            id int IDENTITY(1, 1),
            image varbinary(MAX),
            PRIMARY KEY (id)
        )
    END

IF OBJECT_ID(N'Category', N'U') IS NULL
    BEGIN
        CREATE TABLE Category
        (
            code varchar(30),
            name varchar(30),
            image int,
            PRIMARY KEY (code),
            CONSTRAINT FK_CATEGORY_IMAGE
                FOREIGN KEY (image)
                    REFERENCES Image (id)
        )
    END

IF OBJECT_ID(N'Product', N'U') IS NULL
    BEGIN
        CREATE TABLE Product
        (
            id int IDENTITY(1, 1),
            name varchar(50),
            description varchar(100),
            price money,
            quantity int,
            image int,
            size varchar(10),
            category varchar(30),
            highlight bit,
            PRIMARY KEY (id),
            CONSTRAINT FK_PRODUCT_CATEGORY
                FOREIGN KEY (category)
                    REFERENCES Category (code),
            CONSTRAINT FK_PRODUCT_IMAGE
                FOREIGN KEY (image)
                    REFERENCES Image (id)
        )
    END

GO