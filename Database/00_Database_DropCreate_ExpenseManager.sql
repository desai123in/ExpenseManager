USE [master]
GO

/****** Object:  Database [ExpenseManager]    Script Date: 5/15/2016 12:00:37 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'ExpenseManager')
DROP DATABASE [ExpenseManager]
GO

/****** Object:  Database [ExpenseManager]    Script Date: 5/15/2016 12:00:37 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ExpenseManager')
BEGIN
CREATE DATABASE [ExpenseManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpenseManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExpenseManager.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExpenseManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExpenseManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO

ALTER DATABASE [ExpenseManager] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpenseManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ExpenseManager] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ExpenseManager] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ExpenseManager] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ExpenseManager] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ExpenseManager] SET ARITHABORT OFF 
GO

ALTER DATABASE [ExpenseManager] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ExpenseManager] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ExpenseManager] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ExpenseManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ExpenseManager] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ExpenseManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ExpenseManager] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ExpenseManager] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ExpenseManager] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ExpenseManager] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ExpenseManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ExpenseManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ExpenseManager] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ExpenseManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ExpenseManager] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ExpenseManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ExpenseManager] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ExpenseManager] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [ExpenseManager] SET  MULTI_USER 
GO

ALTER DATABASE [ExpenseManager] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ExpenseManager] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ExpenseManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ExpenseManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [ExpenseManager] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ExpenseManager] SET  READ_WRITE 
GO


