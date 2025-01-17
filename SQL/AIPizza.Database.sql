Use [AIPizza]

/****** Object:  Table [dbo].[Customer]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](2) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[VIPClub] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PizzaOrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Pepperoni] [bit] NOT NULL,
	[Sausage] [bit] NOT NULL,
	[GroundBeef] [bit] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PizzaOrder]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PizzaOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderType] [int] NOT NULL,
	[Filled] [bit] NOT NULL,
	[DriverDepartTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PizzaOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Customer_Delete]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [Customer]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Customer_FetchAll]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Address],[City],[Id],[Name],[PhoneNumber],[State],[VIPClub],[ZipCode]

    -- From tableName
    From [Customer]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Customer_Find]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Address],[City],[Id],[Name],[PhoneNumber],[State],[VIPClub],[ZipCode]

    -- From tableName
    From [Customer]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Customer_FindByPhoneNumber]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_FindByPhoneNumber]

    -- Create @PhoneNumber Paramater
    @PhoneNumber nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [Address],[City],[Id],[Name],[PhoneNumber],[State],[VIPClub],[ZipCode]

    -- From tableName
    From [Customer]

    -- Find Matching Record
    Where [PhoneNumber] = @PhoneNumber

END


-- End Custom Methods

-- Thank you for using DataTier.Net.

GO
/****** Object:  StoredProcedure [dbo].[Customer_Insert]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_Insert]

    -- Add the parameters for the stored procedure here
    @Address nvarchar(255),
    @City nvarchar(50),
    @Name nvarchar(50),
    @PhoneNumber nvarchar(20),
    @State nvarchar(2),
    @VIPClub bit,
    @ZipCode nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [Customer]
    ([Address],[City],[Name],[PhoneNumber],[State],[VIPClub],[ZipCode])

    -- Begin Values List
    Values(@Address, @City, @Name, @PhoneNumber, @State, @VIPClub, @ZipCode)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Customer_Update]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Customer_Update]

    -- Add the parameters for the stored procedure here
    @Address nvarchar(255),
    @City nvarchar(50),
    @Id int,
    @Name nvarchar(50),
    @PhoneNumber nvarchar(20),
    @State nvarchar(2),
    @VIPClub bit,
    @ZipCode nvarchar(20)

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [Customer]

    -- Update Each field
    Set [Address] = @Address,
    [City] = @City,
    [Name] = @Name,
    [PhoneNumber] = @PhoneNumber,
    [State] = @State,
    [VIPClub] = @VIPClub,
    [ZipCode] = @ZipCode

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Delete]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OrderDetail_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [OrderDetail]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_FetchAll]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OrderDetail_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [GroundBeef],[Id],[Pepperoni],[PizzaOrderId],[Price],[Quantity],[Sausage]

    -- From tableName
    From [OrderDetail]

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Find]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OrderDetail_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [GroundBeef],[Id],[Pepperoni],[PizzaOrderId],[Price],[Quantity],[Sausage]

    -- From tableName
    From [OrderDetail]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Insert]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OrderDetail_Insert]

    -- Add the parameters for the stored procedure here
    @GroundBeef bit,
    @Pepperoni bit,
    @PizzaOrderId int,
    @Price float,
    @Quantity int,
    @Sausage bit

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [OrderDetail]
    ([GroundBeef],[Pepperoni],[PizzaOrderId],[Price],[Quantity],[Sausage])

    -- Begin Values List
    Values(@GroundBeef, @Pepperoni, @PizzaOrderId, @Price, @Quantity, @Sausage)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[OrderDetail_Update]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OrderDetail_Update]

    -- Add the parameters for the stored procedure here
    @GroundBeef bit,
    @Id int,
    @Pepperoni bit,
    @PizzaOrderId int,
    @Price float,
    @Quantity int,
    @Sausage bit

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [OrderDetail]

    -- Update Each field
    Set [GroundBeef] = @GroundBeef,
    [Pepperoni] = @Pepperoni,
    [PizzaOrderId] = @PizzaOrderId,
    [Price] = @Price,
    [Quantity] = @Quantity,
    [Sausage] = @Sausage

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[PizzaOrder_Delete]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PizzaOrder_Delete]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Delete Statement
    Delete From [PizzaOrder]

    -- Delete Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[PizzaOrder_FetchAll]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PizzaOrder_FetchAll]

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CustomerId],[DriverDepartTime],[Filled],[Id],[OrderDate],[OrderType]

    -- From tableName
    From [PizzaOrder]

END

-- Begin Custom Methods


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[PizzaOrder_Find]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PizzaOrder_Find]

    -- Primary Key Paramater
    @Id int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Select Statement
    Select [CustomerId],[DriverDepartTime],[Filled],[Id],[OrderDate],[OrderType]

    -- From tableName
    From [PizzaOrder]

    -- Find Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[PizzaOrder_Insert]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PizzaOrder_Insert]

    -- Add the parameters for the stored procedure here
    @CustomerId int,
    @DriverDepartTime datetime,
    @Filled bit,
    @OrderDate datetime,
    @OrderType int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Insert Statement
    Insert Into [PizzaOrder]
    ([CustomerId],[DriverDepartTime],[Filled],[OrderDate],[OrderType])

    -- Begin Values List
    Values(@CustomerId, @DriverDepartTime, @Filled, @OrderDate, @OrderType)

    -- Return ID of new record
    SELECT SCOPE_IDENTITY()

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[PizzaOrder_Update]    Script Date: 12/1/2024 10:05:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[PizzaOrder_Update]

    -- Add the parameters for the stored procedure here
    @CustomerId int,
    @DriverDepartTime datetime,
    @Filled bit,
    @Id int,
    @OrderDate datetime,
    @OrderType int

AS
BEGIN

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Begin Update Statement
    Update [PizzaOrder]

    -- Update Each field
    Set [CustomerId] = @CustomerId,
    [DriverDepartTime] = @DriverDepartTime,
    [Filled] = @Filled,
    [OrderDate] = @OrderDate,
    [OrderType] = @OrderType

    -- Update Matching Record
    Where [Id] = @Id

END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
