CREATE TABLE [dbo].[Orders] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Content]     NVARCHAR (MAX) NOT NULL,
    [Total_Price] NVARCHAR (50)  NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Location]    NVARCHAR (50)  NOT NULL,
    [Phone]       NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

