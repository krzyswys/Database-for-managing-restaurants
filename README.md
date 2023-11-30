<h1>The subject of the project is a database system to support the operations of a company
providing catering services to individual customers and companies.
</h1>


<h3>Description</h3>
<p>Food (e.g. pizza, seafood, spaghetti) and soft drinks (e.g.
lemonade, water, orange juice). Services are provided on-site and for take-out.
Ordering take-out can be done on the spot or in advance using an
online form. The company has a limited number of tables, including
seating. It is possible to book a table in advance for at least two people.
Customers are individuals and companies . It is possible to issue an invoice for
a given order or a collective invoice once a month.
The menu is set at least a day in advance. The company's rule is that at
at least half of the menu items are changed at least once every two weeks.
On Thursday-Friday-Saturday it is possible to order in advance dishes
containing seafood. Due to individual import, such an order should be
placed by the Monday preceding the order at the most.
An online form allows the individual customer to reserve a table, while
simultaneous placement of the order, with the option of payment before or after the order, with a
minimum order value of WZ, for customers who have previously made at least
WK orders at least. The information with the order confirmation and the indication of the
table is sent after approval by the staff.
The online form also allows booking tables for companies, with two options:
reservation of tables per company and/or reservation of tables for specific company employees.
The system allows for discount programs for individual customers:
- After realizing a set number of Z1 orders for at least a certain amount of K1: R1%
discount on all orders;
- After realization of orders for a total amount K2: a one-time discount of R2% on orders
placed for D1 days, starting from the day the discount is granted .
Discounts do not combine.
The system allows you to generate monthly and weekly reports on
table reservations, discounts, menus, as well as order statistics - for customers
individuals and companies - regarding amounts and time of orders.</p>


<h2>2. Schemat bazy danych</h2>

![image](https://user-images.githubusercontent.com/110239601/226953782-3bed46f9-562d-4991-a4f0-579b6b0715d3.png)

<h2>Tables (Integrity Constraints)</h2>
<ul>
  <li>Companies</li>
  <li>CompanyEmployees</li>
  <li>CompanyReservationParticipants</li>
  <li>CustomersPersonalData</li>
  <li>Customers</li>
  <li>IndividualCustomers</li>
  <li>DiningTables</li>
  <li>Invoices</li>
  <li>Menu</li>
  <li>MenuDetails</li>
  <li>OrderDetails</li>
  <li>Orders</li>
  <li>PaymentMethod</li>
  <li>ProductIngredients</li>
  <li>IngredientsWarehouse</li>
  <li>Products</li>
  <li>ProductPrices</li>
  <li>Categories</li>
  <li>Reservations</li>
  <li>RestaurantEmployees</li>
  <li>EmployeesSalary</li>
  <li>Takeaway</li>
  <li>VariablesData</li>
  <li>TempDiscount</li>
</ul>




<h2>Views</h2>
<ul>
  <li>CurrentMenu</li>
  <li>AvailableProducts</li>
  <li>NotAvailableProducts</li>
  <li>NotAvailableIngredients</li>
  <li>NotPaidOrders</li>
  <li>TodayReservations</li>
  <li>OrdersPendingForConfirmation</li>
  <li>OrderDetailsView</li>
  <li>TotalOrdersProductsPricesReport</li>
  <li>AverageSalaryOfRestaurantEmployee</li>
  <li>FiveBestEmployees</li>
  <li>TotalProductsSales</li>
  <li>TotalCategoreisSales</li>
  <li>AvailableTables</li>
  <li>TotalReservationReport</li>
  <li>CurrentMenuSalesStatsView</li>
  <li>TotalCustomersDiscountsView</li>
  <li>OrderStatisticsView</li>
</ul>


<h2>Procedures</h2>
<ul>
  <li>AddMenu</li>
  <li>RemoveMenu</li>
  <li>AddIngredientToWarehouse</li>
  <li>RemoveIngredientFromWarehouse</li>
  <li>AddIngredientToProduct</li>
  <li>RemoveIngredientFromProduct</li>
  <li>AddProductToMenu</li>
  <li>RemoveProductFromMenu</li>
  <li>AddProductToOrder</li>
  <li>RemoveProductFromOrder</li>
  <li>AddCustomerProcedure</li>
  <li>RemoveCustomerProcedure</li>
  <li>updateDiscountProcedure</li>
  <li>AddReservationProcedure</li>
  <li>RemoveReservationProcedure</li>
</ul>


<h2>Functions</h2>
<ul>
  <li>GetIngredientsForProduct</li>
  <li>GetProductsFromCategory</li>
  <li>GetProductsFromMenu</li>
  <li>GetCurrentEmployeeSalary</li>
  <li>GetCurrentAverageSalaryForOccupation</li>
  <li>GetTotalProductsAndAveragePriceOfMenu</li>
  <li>GetHighestSalaryForEmployee</li>
  <li>RemainingDaysForMenu</li>
  <li>RemainingFreeSeats</li>
  <li>CanAccommodateCustomers</li>
  <li>GetDetailsOfOrder</li>
  <li>GetOrdersAboveValue</li>
  <li>GetValueOfOrdersOnDay</li>
  <li>GetValueOfOrdersOnMonth</li>
  <li>GetValueOfOrder</li>
  <li>Invoice</li>
  <li>CollectiveInvoice</li>
</ul>


<h2>Triggers</h2>
<ul>
  <li>AddMenuOneDayInAdvance</li>
  <li>CorrectSeaFoodOrderDateTrigger</li>
  <li>CheckReservationSeatsTrigger</li>
  <li>CheckReservationCapacityTrigger</li>
  <li>CheckDiscountAviabilityTrigger</li>
  <li>CheckIndividualReservationAviabilityTrigger</li>
</ul>

<h2>Indexes</h2>
<ul>
  <li>RestaurantEmployees_RestaurantEmployeeID_Index</li>
  <li>Products_ProductID_Index</li>
  <li>Menu_MenuID_Index</li>
  <li>MenuDetails_MenuID_Index</li>
  <li>Orders_OrderID_Index</li>
  <li>OrderDetails_OrderID_Index</li>
  <li>Customers_CustomerID_Index</li>
</ul>

<h2>Roles and Permissions</h2>
<ul>
  <li>Role na tabele</li>
  <li>Role na widoki</li>
  <li>Role na funkcje</li>
  <li>Role na procedury</li>
  <li>Dane które są dostępne tylko dla: Admin, Owner</li>
</ul>

<h2>Sample data</h2>



