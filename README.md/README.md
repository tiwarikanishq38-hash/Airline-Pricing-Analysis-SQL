# Airline Pricing Analysis Using SQL

## Project Overview

This project explores airline ticket pricing patterns in the Indian aviation market using SQL and MySQL.

The objective is to understand how listed ticket prices vary across airlines, travel classes, routes, booking windows, flight duration, number of stops and departure times.

The project also applies statistical screening techniques to identify unusually high-priced ticket listings and examine their distribution across airlines and routes.

## Dataset

- **Records:** Approximately 300,153
- **Columns:** 12
- **Database:** MySQL
- **Primary analysis tool:** MySQL Workbench

## Dataset Information

Dataset: Airlines Flights Data

Author: Rohit Grewal

Source:
https://www.kaggle.com/datasets/rohitgrewal/airlines-flights-data

Database License: ODbL
Contents License: DbCL

The dataset is used for educational and analytical purposes.
All original dataset rights and attribution are acknowledged.

### Key Variables

| Variable | Description |
|---|---|
| Airline | Airline operating the flight |
| Source City | Flight departure city |
| Destination City | Flight arrival city |
| Class | Economy or Business |
| Duration | Flight duration in hours |
| Stops | Number of stops |
| Departure Time | Departure-time category |
| Days Left | Days remaining before departure |
| Price | Listed ticket price |

## Business Questions and SQL Analysis

The project covers 12 analyses:

1. Airline-wise average pricing across travel classes.
2. Overall booking-window pricing comparison.
3. Airline-wise Economy booking-window comparison.
4. Route-level booking-window comparison.
5. Flight duration versus ticket pricing.
6. Number of stops versus ticket pricing.
7. Route-wise Economy pricing.
8. Airline-wise pricing within individual routes.
9. Booking-window comparison within the same route and class.
10. Departure time versus ticket pricing.
11. Statistical price-outlier screening by airline and class.
12. Route-level price-outlier screening.

## Key Findings

- Vistara recorded the highest average listed ticket price among the airlines in both Economy and Business categories represented in the dataset.
- Economy listings showed a substantially larger percentage difference between early and last-minute booking windows than Business listings.
- AirAsia's Hyderabad–Delhi route showed the highest recorded percentage difference between early and last-minute Economy prices among the qualifying route-airline combinations.
- Kolkata–Chennai recorded the highest average Economy price among the routes examined.
- Average Economy prices increased across the observed flight-duration categories.
- Average listed prices generally increased across the three stop categories in both Economy and Business classes.
- Morning departures recorded the highest average listed prices in both travel classes.
- Statistical screening identified differences in the proportion of unusually high-priced listings across airlines and routes.

## SQL Concepts Used

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- Aggregate functions: COUNT, SUM, AVG, MIN and MAX
- CASE WHEN conditional logic
- Common Table Expressions (CTEs)
- CONCAT
- Standard deviation
- Statistical threshold calculations
- Conditional aggregation
- Percentage and absolute difference calculations

## Methodology and Limitations

- Booking windows were classified using the number of days remaining before departure.
- Early booking was defined as 31–49 days before departure, while last-minute booking was defined as 1–7 days.
- Route-level comparisons used minimum listing-count requirements where appropriate.
- Unusually high-priced listings were screened using the mean price plus two standard deviations within each airline-class group.

**Important:** The dataset contains listed ticket prices, not confirmed transactions or actual airline revenue. The findings describe observed pricing patterns and associations; they do not establish causation. Differences may also reflect variations in route, airline, schedule, duration, stops and booking-window composition.

## Repository Structure

- `SQL/` — SQL scripts for the 12 analyses.
- `Results/` — Selected query output screenshots and key findings.
- `Dataset/` — Dataset source information.

## Tools

- MySQL
- MySQL Workbench
- GitHub

## Project Objective

The project demonstrates the application of SQL to business-oriented data analysis, with an emphasis on identifying pricing patterns, comparing market segments and translating query results into meaningful business observations.