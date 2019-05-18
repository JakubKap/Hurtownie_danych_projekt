USE [AirStatsDWH]
GO
/****** Object:  StoredProcedure [dbo].[matchFactWacToAirport]    Script Date: 18.05.2019 12:33:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[matchFactWacToAirport]
@Iata varchar(1024)
AS
DECLARE @WAC int
SET @WAC = (SELECT WordAreaCode FROM DimAirportWorldAreaCode
WHERE Region='United States');
UPDATE DimAirport
SET AirportWorldAreaCode = @WAC
WHERE AirportIata = CAST(@Iata AS varchar(10))