CREATE ROLE Finanse
CREATE ROLE Waiter
CREATE ROLE Admins
CREATE ROLE Owners
CREATE ROLE StoreKeeper

grant all privileges ON u_wilkusz.dbo TO Admins

grant SELECT, EXECUTE  ON u_wilkusz.dbo TO Owners

GRANT SELECT ON Companies to Finanse
GRANT SELECT ON CompanyEmployees to Finanse
GRANT SELECT ON CompanyReservationParticipants to  Finanse
GRANT SELECT ON CustomersPersonalData to Finanse, Waiter
GRANT SELECT ON Customers to Finanse, Waiter
GRANT SELECT ON IndividualCustomers to Finanse, Waiter
GRANT SELECT ON DiningTables to Waiter
GRANT SELECT ON Invoices to Finanse
GRANT SELECT ON Menu to  Waiter, StoreKeeper
GRANT SELECT ON MenuDetails to  Waiter, StoreKeeper
GRANT SELECT ON OrderDetails to Finanse, Waiter
GRANT SELECT ON Orders to Finanse, Waiter
GRANT SELECT ON PaymentMethod to Finanse, Waiter
GRANT SELECT ON ProductIngredients to StoreKeeper

GRANT SELECT ON IngredientsWarehouse to StoreKeeper
GRANT SELECT ON Products to StoreKeeper, Waiter
GRANT SELECT ON ProductPrices to Finanse, Waiter
GRANT SELECT ON Categories to Waiter, StoreKeeper
GRANT SELECT ON Reservation to  Finanse, Waiter
GRANT SELECT ON RestaurantEmployees to Finanse
GRANT SELECT ON EmployeesSalary to Finanse
GRANT SELECT ON Takeaway to Waiter
GRANT SELECT ON VariablesData to Finanse

GRANT SELECT ON Current_Menu_View  to Waiter, StoreKeeper
GRANT SELECT ON Available_Products_View  to Waiter, StoreKeeper
GRANT SELECT ON Not_Available_Products_View  to StoreKeeper
GRANT SELECT ON Not_Available_Ingredients_View  to StoreKeeper
GRANT SELECT ON Not_Paid_Orders_View  to Finanse, Waiter
GRANT SELECT ON Today_Reservations_View  to Finanse,Waiter
GRANT SELECT ON Orders_Pending_For_Confirmation_View  to Finanse, Waiter
GRANT SELECT ON Order_Details_View to Finanse, Waiter
GRANT SELECT ON Total_Orders_Products_Prices_Report_View  to Finanse
GRANT SELECT ON Total_Products_Sales_View  to Finanse
GRANT SELECT ON Total_Categories_Sales_View  to Finanse
GRANT SELECT ON Available_Tables_View  to Waiter
GRANT SELECT ON Total_Reservation_Report_for_Customers_View to Finanse
GRANT SELECT ON CurrentMenuSalesStatsView to Finanse
GRANT SELECT ON TotalCustomersDiscountsView to Finanse
GRANT SELECT ON OrderStatisticsView to Finanse

GRANT EXECUTE ON GetDetailsOfOrder to  Finanse, Waiter
GRANT EXECUTE ON GetStateOfOrder to  Finanse, Waiter
GRANT EXECUTE ON GetDataOfEmployeee to Finanse
GRANT EXECUTE ON GetOrdersAboveValue to Finanse
GRANT EXECUTE ON GetValueOfOrdersOnDay to Finanse
GRANT EXECUTE ON GetValueOfOrdersOnMonth to Finanse
GRANT EXECUTE ON GetValueOfOrder to Finanse
GRANT EXECUTE ON GetCheapestProductInCategory to Finanse
GRANT EXECUTE ON GetMostExpensiveProductInCategory to Finanse
GRANT EXECUTE ON GetIngredientsForProduct to StoreKeeper
GRANT EXECUTE ON GetProductsFromCategory to StoreKeeper
GRANT EXECUTE ON GetProductsFromMenu to Waiter, StoreKeeper
GRANT EXECUTE ON GetCurrentEmployeeSalary to Finanse
GRANT EXECUTE ON GetCurrentAverageSalaryForOccupation to Finanse
GRANT EXECUTE ON GetTotalProductsAndAveragePriceOfMenu to Finanse
GRANT EXECUTE ON GetHighestSalaryForEmployee to Finanse
GRANT EXECUTE ON RemainingDaysForMenu to Waiter, StoreKeeper
GRANT EXECUTE ON RemainingFreeSeats to Waiter
GRANT EXECUTE ON CanAccommodateCustomers to Waiter

GRANT EXECUTE ON AddCategoryProcedure to StoreKeeper
GRANT EXECUTE ON RemoveCategoryProcedure to StoreKeeper
GRANT EXECUTE ON AddProductProcedure to StoreKeeper
GRANT EXECUTE ON RemoveProductProcedure to StoreKeeper
GRANT EXECUTE ON AddEmployeeProcedure to Finanse
GRANT EXECUTE ON RemoveEmployeeProcedure to Finanse
GRANT EXECUTE ON AddIngredientToWarehouse to StoreKeeper
GRANT EXECUTE ON RemoveIngredientFromWarehouse to StoreKeeper
GRANT EXECUTE ON AddIngredientToProduct to StoreKeeper
GRANT EXECUTE ON RemoveIngredientFromProduct to StoreKeeper
GRANT EXECUTE ON AddProductToOrder to Finanse, Waiter
GRANT EXECUTE ON RemoveProductFromOrder to Finanse, Waiter
GRANT EXECUTE ON AddCustomerProcedure  to Finanse
GRANT EXECUTE ON RemoveCustomerProcedure  to Finanse
GRANT EXECUTE ON updateDiscountProcedure to Finanse
GRANT EXECUTE ON AddReservationProcedure to Finanse, Waiter
GRANT EXECUTE ON RemoveReservationProcedure to Finanse, Waiter


-- Only for adnim and owner
--GRANT EXECUTE ON AddTableProcedure to 
--GRANT EXECUTE ON RemoveTableProcedure to
--GRANT EXECUTE ON AddMenuProcedure to
--GRANT EXECUTE ON RemoveMenuProcedure to
--GRANT EXECUTE ON AddProductToMenuProcedure to
--GRANT EXECUTE ON RemoveProductFromMenuProcedure to