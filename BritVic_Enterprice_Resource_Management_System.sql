-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2026 at 12:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BritVic_Enterprice_Resource_Management_System`
--

-- --------------------------------------------------------

--
-- Table structure for table `Asset`
--

CREATE TABLE `Asset` (
  `assetId` int(11) NOT NULL,
  `assetName` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `purchaseDate` date NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `depreciationRate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AssetMaintenance`
--

CREATE TABLE `AssetMaintenance` (
  `assetMaintenanceId` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `maintenanceDate` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE `Attendance` (
  `attendanceID` int(11) NOT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `checkInTime` time DEFAULT NULL,
  `checkOutTime` time DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customerId` int(11) NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `emailAddress1` varchar(100) NOT NULL,
  `emailAddress2` varchar(100) NOT NULL,
  `emailAddress3` varchar(100) NOT NULL,
  `contactNum1` varchar(10) NOT NULL,
  `contactNum2` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DeliveryNote`
--

CREATE TABLE `DeliveryNote` (
  `deliveryId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `shipmentDate` date NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `departmentID` int(11) NOT NULL,
  `departmentName` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `employeeID` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeReview`
--

CREATE TABLE `EmployeeReview` (
  `reviewId` int(11) NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `reviewerId` int(11) DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeLeave`
--

CREATE TABLE `EmployeLeave` (
  `leaveId` int(11) NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `leaveType` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GoodsReceivedNote`
--

CREATE TABLE `GoodsReceivedNote` (
  `grnId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `receiveDate` date NOT NULL,
  `quantityReceived` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Machine`
--

CREATE TABLE `Machine` (
  `machineId` int(11) NOT NULL,
  `machineName` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Material`
--

CREATE TABLE `Material` (
  `materialId` int(11) NOT NULL,
  `materialName` varchar(50) NOT NULL,
  `materialType` varchar(25) NOT NULL,
  `measurementUnit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MaterialRequest`
--

CREATE TABLE `MaterialRequest` (
  `materialRequestId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `componentId` int(11) NOT NULL,
  `quantityRequired` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `unitSize` varchar(50) NOT NULL,
  `stockQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ProductionPlan`
--

CREATE TABLE `ProductionPlan` (
  `productionPlanId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `inspectionDate` date NOT NULL,
  `result` varchar(50) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseOrder`
--

CREATE TABLE `PurchaseOrder` (
  `purchaseOrderId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PurchaseRequisition`
--

CREATE TABLE `PurchaseRequisition` (
  `orderId` int(11) NOT NULL,
  `requesterId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Quotation`
--

CREATE TABLE `Quotation` (
  `quotationId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `issuedDate` date NOT NULL,
  `validDate` date NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `QuotationRequest`
--

CREATE TABLE `QuotationRequest` (
  `quotationRequestId` int(11) NOT NULL,
  `issueDate` date NOT NULL,
  `validUntil` date NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ReturnRequest`
--

CREATE TABLE `ReturnRequest` (
  `returnId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `returnDate` date NOT NULL,
  `reason` text NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Salary`
--

CREATE TABLE `Salary` (
  `salaryId` int(11) NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `netAmount` decimal(10,2) DEFAULT NULL,
  `payPeriod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SalesOrder`
--

CREATE TABLE `SalesOrder` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StockMovement`
--

CREATE TABLE `StockMovement` (
  `stockMovementId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `movementType` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `movementDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `supplierId` int(11) NOT NULL,
  `supplierName` varchar(100) NOT NULL,
  `contactPerson` varchar(100) NOT NULL,
  `contactNum1` varchar(15) NOT NULL,
  `contactNum2` varchar(15) NOT NULL,
  `emailAddress1` varchar(100) NOT NULL,
  `emailAddress2` varchar(100) NOT NULL,
  `emailAddress3` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Training`
--

CREATE TABLE `Training` (
  `trainingId` int(11) NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `courseName` varchar(30) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Vendor`
--

CREATE TABLE `Vendor` (
  `vendorId` int(11) NOT NULL,
  `vendorName` varchar(100) NOT NULL,
  `contactPerson` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contactNum1` varchar(15) NOT NULL,
  `contactNum2` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkOrder`
--

CREATE TABLE `WorkOrder` (
  `workOrderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `confirmationStatus` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Asset`
--
ALTER TABLE `Asset`
  ADD PRIMARY KEY (`assetId`);

--
-- Indexes for table `AssetMaintenance`
--
ALTER TABLE `AssetMaintenance`
  ADD PRIMARY KEY (`assetMaintenanceId`);

--
-- Indexes for table `Attendance`
--
ALTER TABLE `Attendance`
  ADD PRIMARY KEY (`attendanceID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `DeliveryNote`
--
ALTER TABLE `DeliveryNote`
  ADD PRIMARY KEY (`deliveryId`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`departmentID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `EmployeeReview`
--
ALTER TABLE `EmployeeReview`
  ADD PRIMARY KEY (`reviewId`);

--
-- Indexes for table `EmployeLeave`
--
ALTER TABLE `EmployeLeave`
  ADD PRIMARY KEY (`leaveId`);

--
-- Indexes for table `GoodsReceivedNote`
--
ALTER TABLE `GoodsReceivedNote`
  ADD PRIMARY KEY (`grnId`);

--
-- Indexes for table `Machine`
--
ALTER TABLE `Machine`
  ADD PRIMARY KEY (`machineId`);

--
-- Indexes for table `Material`
--
ALTER TABLE `Material`
  ADD PRIMARY KEY (`materialId`);

--
-- Indexes for table `MaterialRequest`
--
ALTER TABLE `MaterialRequest`
  ADD PRIMARY KEY (`materialRequestId`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `ProductionPlan`
--
ALTER TABLE `ProductionPlan`
  ADD PRIMARY KEY (`productionPlanId`);

--
-- Indexes for table `PurchaseOrder`
--
ALTER TABLE `PurchaseOrder`
  ADD PRIMARY KEY (`purchaseOrderId`);

--
-- Indexes for table `PurchaseRequisition`
--
ALTER TABLE `PurchaseRequisition`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `Quotation`
--
ALTER TABLE `Quotation`
  ADD PRIMARY KEY (`quotationId`);

--
-- Indexes for table `QuotationRequest`
--
ALTER TABLE `QuotationRequest`
  ADD PRIMARY KEY (`quotationRequestId`);

--
-- Indexes for table `ReturnRequest`
--
ALTER TABLE `ReturnRequest`
  ADD PRIMARY KEY (`returnId`);

--
-- Indexes for table `Salary`
--
ALTER TABLE `Salary`
  ADD PRIMARY KEY (`salaryId`);

--
-- Indexes for table `SalesOrder`
--
ALTER TABLE `SalesOrder`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `StockMovement`
--
ALTER TABLE `StockMovement`
  ADD PRIMARY KEY (`stockMovementId`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `Training`
--
ALTER TABLE `Training`
  ADD PRIMARY KEY (`trainingId`);

--
-- Indexes for table `Vendor`
--
ALTER TABLE `Vendor`
  ADD PRIMARY KEY (`vendorId`);

--
-- Indexes for table `WorkOrder`
--
ALTER TABLE `WorkOrder`
  ADD PRIMARY KEY (`workOrderId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
