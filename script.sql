create database ecommerce
USE [ecommerce]
GO
/****** Object:  Table [dbo].[AddressInfo]    Script Date: 12/17/2022 4:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressInfo](
	[Region] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[BuildingNumber] [bigint] NOT NULL,
	[Floor] [int] NOT NULL,
	[Landmark] [nvarchar](50) NULL,
	[ZipCode] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardCredentials]    Script Date: 12/17/2022 4:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardCredentials](
	[CardNumber] [bigint] NULL,
	[CardHolderName] [nvarchar](50) NULL,
	[ExpityDate] [nvarchar](50) NULL,
	[CVC] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductHead]    Script Date: 12/17/2022 4:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHead](
	[Id] [int] NOT NULL,
	[ProdName] [nvarchar](50) NULL,
	[isFlag] [int] NULL,
	[serial] [int] IDENTITY(1,1) NOT NULL,
	[Price] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductHead] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTail]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTail](
	[Id] [int] NOT NULL,
	[ProdName] [nvarchar](50) NULL,
	[serial] [int] NOT NULL,
	[Price] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterAndLogin]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterAndLogin](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ConfirmPass] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Table]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Table](
	[no] [int] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[AddressInfo] ([Region], [City], [StreetName], [BuildingNumber], [Floor], [Landmark], [ZipCode]) VALUES (N'masrelgdida', N'cairo', N'20', 122, 2, NULL, 123)
GO
INSERT [dbo].[CardCredentials] ([CardNumber], [CardHolderName], [ExpityDate], [CVC]) VALUES (12345679, N'Toqaaa', N'23/12', 679)
GO
SET IDENTITY_INSERT [dbo].[ProductHead] ON 

INSERT [dbo].[ProductHead] ([Id], [ProdName], [isFlag], [serial], [Price]) VALUES (1, N'jacet', 1, 10, N'50')
INSERT [dbo].[ProductHead] ([Id], [ProdName], [isFlag], [serial], [Price]) VALUES (2, N'Tshirt', 1, 11, N'55')
INSERT [dbo].[ProductHead] ([Id], [ProdName], [isFlag], [serial], [Price]) VALUES (3, N'Tshirt', 1, 12, N'55')
INSERT [dbo].[ProductHead] ([Id], [ProdName], [isFlag], [serial], [Price]) VALUES (4, N'Hoodie', 1, 13, N'55')
INSERT [dbo].[ProductHead] ([Id], [ProdName], [isFlag], [serial], [Price]) VALUES (6, N'Men slim fit', 1, 15, N'56')
SET IDENTITY_INSERT [dbo].[ProductHead] OFF
GO
INSERT [dbo].[RegisterAndLogin] ([Email], [Password], [ConfirmPass]) VALUES (N'ttt@ssss', N'12345', N'12345')
INSERT [dbo].[RegisterAndLogin] ([Email], [Password], [ConfirmPass]) VALUES (N'ttt@ssss', N'123455', N'123455')
INSERT [dbo].[RegisterAndLogin] ([Email], [Password], [ConfirmPass]) VALUES (N'ttt@ssss', N'56987', N'56987')
INSERT [dbo].[RegisterAndLogin] ([Email], [Password], [ConfirmPass]) VALUES (N'test@g.com', N'12345', N'12345')
INSERT [dbo].[RegisterAndLogin] ([Email], [Password], [ConfirmPass]) VALUES (N'test@g.com', N'123456', N'123456')
GO
INSERT [dbo].[Test_Table] ([no], [name]) VALUES (1, N'test_1')
INSERT [dbo].[Test_Table] ([no], [name]) VALUES (2, N'test_2')
INSERT [dbo].[Test_Table] ([no], [name]) VALUES (3, N'test_3')
INSERT [dbo].[Test_Table] ([no], [name]) VALUES (6, N'eee')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Email], [Age], [Status]) VALUES (1, N'User1@gmail.com', 25, N'Active')
INSERT [dbo].[Users] ([ID], [Email], [Age], [Status]) VALUES (4, N'test@gmail.com', 22, N'Pending')
INSERT [dbo].[Users] ([ID], [Email], [Age], [Status]) VALUES (3, N'User3@gmail.com', 33, N'Reported')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddProdToCart]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddProdToCart]
@Id int = null ,
@ProdName nvarchar(50) = null 
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ProductTail WHERE Id = @Id)
	BEGIN
	INSERT INTO ProductTail
	SELECT Id , ProdName , serial,  Price  FROM ProductHead
	WHERE Id = @Id
	select ISNULL(ERROR_NUMBER(),0) as ErrorNumber , @Id as Id
	END
	ELSE
	BEGIN
	select ISNULL(ERROR_NUMBER(),1) as ErrorNumber , @Id as Id
	END
END


GO
/****** Object:  StoredProcedure [dbo].[AddressInsert]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddressInsert]
(
   @Region nvarchar(50) ,
   @City nvarchar(50) , 
   @StreetName nvarchar(50),
   @BuildingNumber bigint ,
   @Floor int ,
   @Landmark nvarchar(50) = null ,
   @ZipCode int 
)
AS
BEGIN
insert into dbo.AddressInfo  (Region , City , StreetName , BuildingNumber ,[Floor] ,Landmark ,ZipCode )  
values (@Region ,@City , @StreetName , @BuildingNumber , @Floor , @Landmark , @ZipCode)
select 'Entered succsessfuly' as ErrorMassege  
END

GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
@Email nvarchar(50) ,
@Age int ,
@Status nvarchar(50) 
AS
BEGIN
	insert into dbo.Users (Email , Age , [Status] ) values (@Email , @Age , @Status) 
END
select 'User Added' as ErrorNumber

GO
/****** Object:  StoredProcedure [dbo].[CardCredentialInsert]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CardCredentialInsert]
(
   @Cardnumber bigint NULL ,
   @CardHolderName nvarchar(50) NULL  , 
   @ExpityDate nvarchar(50) NULL ,
   @CVC INT NULL
  
)
AS
BEGIN
insert into dbo.CardCredentials  (Cardnumber , CardHolderName , ExpityDate , CVC )  
values (@Cardnumber ,@CardHolderName , @ExpityDate , @CVC)
select 'Entered succsessfuly' as ErrorMessage  
END

GO
/****** Object:  StoredProcedure [dbo].[deleteProcedure]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProcedure]
@no int null ,  
@name nvarchar(50) null
AS
delete from Test_Table where no = @no 
select '0' as errornumber



GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
@ID int 

AS
BEGIN
delete  from dbo.Users where (@ID = ID )	
END
select '0' as ErrorNumber

GO
/****** Object:  StoredProcedure [dbo].[InsertProcedure]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProcedure]
@no int ,  
@name nvarchar(50) 
AS
insert into Test_Table values (@no,@name)
select '0' as errornumber



GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Login]
@Email nvarchar(50) null ,
@Password nvarchar(50) null

AS
BEGIN
declare @strStatment nvarchar(max)
set @strStatment = 'select Email ,Password from RegisterAndLogin where 1=1'
if (@Email is not null) set @strStatment = @strStatment + ' and (RegisterAndLogin.Email = '+cast(@Email as varchar(20))+')'
if (@Password is not null) set @strStatment = @strStatment + ' and (RegisterAndLogin.Password = '+cast(@Password as varchar(20))+')'
exec (@strStatment)
END
select '0' as ErrorNumber

GO
/****** Object:  StoredProcedure [dbo].[ProductInsertHead]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductInsertHead]
@ProdName nvarchar(50) , 
@Price nvarchar(50)

AS
BEGIN
declare @Id as int 
declare @isFlag as int 
declare @serial as int 
set @serial = (select max (serial) from ProductHead) +1
set @isFlag = 1     -- isfalg = 1 as the product is available in website
set @Id =  (select Max (Id) from ProductHead)+1

	insert into dbo.ProductHead(ProdName , Id , Price, isFlag ) values  (@ProdName , @Id , @Price, @isFlag)
END
select ISNULL(ERROR_NUMBER(),0) as ErrorNumber , @Id as Id , @serial as SerialNumber

GO
/****** Object:  StoredProcedure [dbo].[ProductsSelect]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProductsSelect]

AS
BEGIN
select ProductHead.ProdName , ProductHead.Price , ProductHead.Id from ProductHead 
END

GO
/****** Object:  StoredProcedure [dbo].[Register]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Register]
@Email nvarchar(50) ,
@Password nvarchar(50) ,
@ConfirmPass nvarchar(50)

AS
BEGIN
if not exists (select Email,[Password] from RegisterAndLogin where Email=@Email ) 
  begin


	insert into dbo.RegisterAndLogin (Email , [Password] , ConfirmPass)   values (@Email,@Password,@ConfirmPass)


select '0' as ErrorNumber
end


       if exists (select Email,[Password] from RegisterAndLogin where Email=@Email ) 
	   begin
select 'the email is already exist' as ErrorNumber
end 
END

GO
/****** Object:  StoredProcedure [dbo].[RemoveProdFromCart]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RemoveProdFromCart]
@Id int NULL
AS
BEGIN
IF EXISTS (SELECT * FROM ProductTail WHERE Id = @Id)
BEGIN
delete from ProductTail where Id = @Id
select ISNULL(ERROR_NUMBER(),0) as ErrorNumber , @Id as Id
END
ELSE
BEGIN
select ISNULL(ERROR_NUMBER(),1) as ErrorNumber , @Id as Id
END
END

GO
/****** Object:  StoredProcedure [dbo].[SelectProcedure]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProcedure]
AS
SELECT * FROM Test_Table
GO;

GO
/****** Object:  StoredProcedure [dbo].[UsersSelect]    Script Date: 12/17/2022 4:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersSelect]

AS
BEGIN
	select ID , Email , Age, [Status] from dbo.Users 
	order by ID asc
END

GO
