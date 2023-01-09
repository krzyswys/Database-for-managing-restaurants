CREATE ROLE Accountant
CREATE ROLE Moderator
CREATE ROLE Admins
CREATE ROLE Worker
CREATE ROLE Owners

GRANT SELECT ON Companies to
GRANT SELECT ON CompanyEmployees to
GRANT SELECT ON CompanyReservationParticipants to
GRANT SELECT ON CustomersPersonalData to
GRANT SELECT ON Customers to
GRANT SELECT ON IndividualCustomers to
GRANT SELECT ON DiningTables to
GRANT SELECT ON Invoices to
GRANT SELECT ON Menu to
GRANT SELECT ON MenuDetails to
GRANT SELECT ON OrderDetails to
GRANT SELECT ON Orders to
GRANT SELECT ON PaymentMethod to
GRANT SELECT ON ProductIngredients to
GRANT SELECT ON IngredientsWarehouse to
GRANT SELECT ON Products to
GRANT SELECT ON ProductPrices to
GRANT SELECT ON Categories to
GRANT SELECT ON Reservation to
GRANT SELECT ON RestaurantEmployees to
GRANT SELECT ON EmployeesSalary to
GRANT SELECT ON Takeaway to
GRANT SELECT ON VariablesData to

GRANT SELECT ON Current_Menu_View  to
GRANT SELECT ON Available_Products_View  to
GRANT SELECT ON Not_Available_Products_View  to
GRANT SELECT ON Not_Available_Ingredients_View  to
GRANT SELECT ON Not_Paid_Orders_View  to
GRANT SELECT ON Today_Reservations_View  to
GRANT SELECT ON Orders_Pending_For_Confirmation_View  to
GRANT SELECT ON Order_Details_View to
GRANT SELECT ON Total_Orders_Products_Prices_Report_View  to
GRANT SELECT ON Total_Products_Sales_View  to
GRANT SELECT ON Total_Categories_Sales_View  to
GRANT SELECT ON Available_s_View  to
GRANT SELECT ON Total_Reservation_Report_for_Customers_View to

GRANT EXECUTE ON GetDetailsOfOrder to
GRANT EXECUTE ON GetStateOfOrder to
GRANT EXECUTE ON GetDataOfEmployeee to
GRANT EXECUTE ON GetOrdersAboveValue to
GRANT EXECUTE ON GetValueOfOrdersOnDay to
GRANT EXECUTE ON GetValueOfOrdersOnMonth to
GRANT EXECUTE ON GetValueOfOrder to
GRANT EXECUTE ON GetCheapestProductInCategory to
GRANT EXECUTE ON GetMostExpensiveProductInCategory to
GRANT EXECUTE ON GetIngredientsForProduct to
GRANT EXECUTE ON GetProductsFromCategory to
GRANT EXECUTE ON GetProductsFromMenu to
GRANT EXECUTE ON GetCurrentEmployeeSalary to
GRANT EXECUTE ON GetCurrentAverageSalaryForOccupation to
GRANT EXECUTE ON GetTotalProductsAndAveragePriceOfMenu to
GRANT EXECUTE ON GetHighestSalaryForEmployee to
GRANT EXECUTE ON RemainingDaysForMenu to
GRANT EXECUTE ON RemainingFreeSeats to
GRANT EXECUTE ON CanAccommodateCustomers to

GRANT EXECUTE ON AddCategoryProcedure to
GRANT EXECUTE ON RemoveCategoryProcedure to
GRANT EXECUTE ON AddProductProcedure to
GRANT EXECUTE ON RemoveProductProcedure to
GRANT EXECUTE ON AddProcedure to
GRANT EXECUTE ON RemoveProcedure to
GRANT EXECUTE ON AddEmployeeProcedure to
GRANT EXECUTE ON RemoveEmployeeProcedure to
GRANT EXECUTE ON AddMenuProcedure to
GRANT EXECUTE ON RemoveMenuProcedure to
GRANT EXECUTE ON AddIngredientToWarehouse to
GRANT EXECUTE ON RemoveIngredientFromWarehouse to
GRANT EXECUTE ON AddIngredientToProduct to
GRANT EXECUTE ON RemoveIngredientFromProduct to
GRANT EXECUTE ON AddProductToMenuProcedure to
GRANT EXECUTE ON RemoveProductFromMenuProcedure to
GRANT EXECUTE ON AddProductToOrder to
GRANT EXECUTE ON RemoveProductFromOrder to
GRANT EXECUTE ON AddCustomerProcedure  to
GRANT EXECUTE ON RemoveCustomerProcedure  to
GRANT EXECUTE ON updateDiscountProcedure to
GRANT EXECUTE ON AddReservationProcedure to
GRANT EXECUTE ON RemoveReservationProcedure to

GRANT EXECUTE ON AddMenuOneDayInAdvanceTrigger to
GRANT EXECUTE ON CorrectSeafoodOrderDateTrigger to
GRANT EXECUTE ON CheckReservationSeatsTrigger to
GRANT EXECUTE ON CheckReservationCapacityTrigger to
GRANT EXECUTE ON CheckDiscountAvailabilityTrigger to
GRANT EXECUTE ON CheckIndividualReservationAvailabilityTrigger to