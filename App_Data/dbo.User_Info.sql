CREATE TABLE [dbo].[User_Info] (
    [Id]    INT           IDENTITY (1, 1) NOT NULL,
    [fName] NVARCHAR (50) NOT NULL,
    [lname] NVARCHAR (50) NOT NULL,
    [uname] NVARCHAR (50) NOT NULL,
    [pass]  NVARCHAR (50) NOT NULL,
    [mail]  NVARCHAR (50) NOT NULL,
    [phone] CHAR(10) NULL, 
    [birthday] DATE NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

