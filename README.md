# SQL Stored Procedures — Аналитика продаж
Хранимые процедуры для аналитики и отчётности интернет-магазина.

## Что внутри

### Отчёты
- `Get_Sales_By_Product` — продажи по товарам
- `Get_Sales_By_Employee` — продажи по сотруднику
- `Get_Customer_Orders` — заказы клиента
- `Get_Top_Customers` — топ клиентов по выручке
- `Calculate_Monthly_Stats` — статистика за месяц

### Аналитика
- `Get_Inventory_Status` — статус запасов
- `Get_Order_Status_Report` — отчёт по статусам заказов
- `Get_Daily_Revenue` — ежедневная выручка

## Структура
sql-stored-procedures/
├── schema/
│ └── create_tables.sql
├── procedures/
│ ├── sales_reports.sql
│ └── analytics.sql
└── tests/
└── test_procedures.sql


## Запуск
1. Выполнить `schema/create_tables.sql`
2. Выполнить `procedures/sales_reports.sql`
3. Выполнить `procedures/analytics.sql`
4. Выполнить `tests/test_procedures.sql`

## Стек
MySQL 8+, Stored Procedures, Functions

## Автор
Alina Kazieva