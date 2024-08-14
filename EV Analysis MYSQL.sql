-- Use EV_Sales_Data database

-- Tutorial and raw data can be found here: https://www.youtube.com/watch?v=qjjt87YoOMg&t=670s 


-- 1. How many total vehicles are there in this database?
      
SELECT count(distinct([Model Year])) FROM ev_sales;

select count(distinct VIN) FROM ev_sales; 
select count(distinct DOL_Vehicle_ID) FROM ev_sales; 
select count(county) from ev_sales; 

ALTER TABLE ev_sales RENAME COLUMN `VIN (1-10)` TO VIN

SELECT count(vin) from ev_sales

select * from ev_sales;

select count(DOL_Vehicle_ID) from ev_sales; 




--1. Total Vehicles:
	-- Understand the overall landscape of electric vehicles, encompassing both BEVs and PHEVs, to assess the market's size and growth.

	SELECT count(distinct(DOL_Vehicle_ID)) FROM ev_sales;

	SELECT count(DOL_Vehicle_ID) FROM [dbo].[Electric_Vehicle_Population_Data]

--2. Average Electric Range:
	-- Determine the average electric range of the electric vehicles in the dataset to gauge the technological advancements and efficiency of the EVs.

select avg(electric_range) FROM ev_sales

	

--3. Total BEV Vehicles and % of Total BEV Vehicles:

select * from ev_sales; 

select electric_vehicle_type, count(electric_vehicle_type) from ev_sales
group by electric_vehicle_type; 


	-- Identify and analyze the total number of battery electric vehicles (BEVs) in the dataset.

	select count(Electric_vehicle_type) FROM ev_sales
	WHERE electric_vehicle_type = 'Battery Electric Vehicle (BEV)';

	--Calculate the percentage of BEVs relative to the total number of electric vehicles, providing insights into the dominance of fully electric models.

		select electric_vehicle_type,
		count(electric_vehicle_type) AS total_electric_vehicles,
		count(electric_vehicle_type) * 100.0/ sum(count(*)) OVER () AS percentage_of_vehicles
	FROM ev_sales
	group by electric_vehicle_type;
    

--4. Total PHEV Vehicles and % of Total PHEV Vehicles:

	-- Identify and analyze the total number of plug-in Hybrid Electric Vehicles (PHEVs) in the dataset.

	select count(Electric_vehicle_type) FROM ev_sales
	WHERE electric_vehicle_type = 'Plug-in Hybrid Electric Vehicle (PHEV)';

	-- Calculate the percentage of PHEVs relative to the total number of electric vehicles, offering insights into the market share of plug-in hybrid models. 

	select electric_vehicle_type,
		count(electric_vehicle_type) AS total_electric_vehicles,
		count(*) * 100.0/ sum(count(*)) OVER () AS percentage_of_vehicles
	FROM ev_sales
	group by electric_vehicle_type;