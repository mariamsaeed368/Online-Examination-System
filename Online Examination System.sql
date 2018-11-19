USE [master]
GO

/****** Object:  Database [Online Examination System]    Script Date: 11/19/2018 12:22:13 PM ******/
CREATE DATABASE [Online Examination System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online Examination System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Online Examination System.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Online Examination System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Online Examination System_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Online Examination System] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online Examination System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Online Examination System] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Online Examination System] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Online Examination System] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Online Examination System] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Online Examination System] SET ARITHABORT OFF 
GO

ALTER DATABASE [Online Examination System] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Online Examination System] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Online Examination System] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Online Examination System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Online Examination System] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Online Examination System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Online Examination System] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Online Examination System] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Online Examination System] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Online Examination System] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Online Examination System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Online Examination System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Online Examination System] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Online Examination System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Online Examination System] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Online Examination System] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Online Examination System] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Online Examination System] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Online Examination System] SET  MULTI_USER 
GO

ALTER DATABASE [Online Examination System] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Online Examination System] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Online Examination System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Online Examination System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Online Examination System] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Online Examination System] SET  READ_WRITE 
GO

