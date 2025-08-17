------------------------------- Financial Exploratory Data Analysis -------------------------------
			--------------------------------- BY AL ---------------------------------

------------------------------ Schema Selection ------------------------------
-- Selecting the correct database
    Use power_bi;
    
-- Reviewing the table data
    select * from power_bi.financial_data;
    
------------------------------ Reviewing Sales Data ------------------------------
	
    -- General review
    Select Country,count(`Gross Sales`) as order_count, sum(`Gross Sales`) as gross_sales,
			sum(Discounts),sum(Sales),sum(COGS),sum(Profit)
    from power_bi.financial_data
    group by Country
    order by gross_sales desc;
    
    -- Q. Highest sales by country?
    -- A. United States Of America
    Select Country,sum(`Gross Sales`) as gross_sales
    from power_bi.financial_data
    group by Country
    order by gross_sales desc;

	-- Q. Highest profit by country?
    -- A. France
    Select Country,sum(Profit) as profit
    from power_bi.financial_data
    group by Country
    order by profit desc;

	-- Q. Most orders by country?
	-- A. Countries tied with limited data
	Select Country,Count(`Units Sold`) as order_count
    from power_bi.financial_data
    group by Country
    order by order_count desc;

	-- Q. Most units sold and orders issued by country?
	-- A. Canada
	Select Country,Count(`Units Sold`) as order_count,sum(`Units Sold`) as total_units
    from power_bi.financial_data
    group by Country
    order by total_units desc;

	-- Q. Discounts issued by country?
	-- A. United States
	Select Country,Count(`Units Sold`) as order_count,sum(`Discounts`) as total_discount
    from power_bi.financial_data
	where `Discounts` > 0 
    group by Country
    order by total_discount desc;

	-- Q. Total discount rate by country
    -- A. Mexico 
	Select Country,avg(Discounts/`Gross Sales`) * 100 as discount_rate
    from power_bi.financial_data
    group by Country
    order by discount_rate desc;


------------------------------ Reviewing Product Data ------------------------------
   -- General review
    Select Product,count(`Gross Sales`) as order_count, sum(`Gross Sales`) as gross_sales,
			sum(Discounts),sum(Sales),sum(COGS),sum(Profit)
    from power_bi.financial_data
    group by Product
    order by gross_sales desc;

    -- Q. Highest sales by product?
    -- A. Paseo
    Select Product,sum(`Gross Sales`) as gross_sales
    from power_bi.financial_data
    group by Product
    order by gross_sales desc;
    
	-- Q. Highest manufacturing price by product?
    -- A. VTT
    Select Product,sum(`Manufacturing Price`) as mnf_price
    from power_bi.financial_data
    group by Product
    order by mnf_price desc;
    
	-- Q. Average manufacturing price by product?
    -- A. Amarilla
    Select Product,avg(`Manufacturing Price`) as avg_price
    from power_bi.financial_data
    group by Product
    order by avg_price desc;

	-- Q. Total discount rate by product
    -- A. Amarilla
	Select Product,avg(Discounts/`Gross Sales`) * 100 as discount_rate
    from power_bi.financial_data
    group by Product
    order by discount_rate desc;

------------------------------ Reviewing Segment Data ------------------------------
	-- General review
    Select ï»¿Segment,count(`Gross Sales`) as order_count, sum(`Gross Sales`) as gross_sales,
			sum(Discounts),sum(Sales),sum(COGS),sum(Profit)
    from power_bi.financial_data
    group by ï»¿Segment
    order by gross_sales desc;

	-- Q. Highest sales by segment?
    -- A. Government
    Select ï»¿Segment,sum(`Gross Sales`) as gross_sales
    from power_bi.financial_data
    group by ï»¿Segment
    order by gross_sales desc;

	-- Q. Total discount rate by segment
	-- A. Midmarket
	Select ï»¿Segment,avg(Discounts/`Gross Sales`) * 100 as discount_rate
    from power_bi.financial_data
    group by ï»¿Segment
    order by discount_rate desc;