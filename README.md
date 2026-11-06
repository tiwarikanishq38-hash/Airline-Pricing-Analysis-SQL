# Airline Pricing Analysis Using SQL

## Project Overview

This project explores airline ticket pricing patterns in the Indian aviation market using SQL and MySQL.

The objective is to understand how listed ticket prices vary across airlines, travel classes, routes, booking windows, flight duration, number of stops and departure times.

The analysis also applies statistical screening techniques to identify unusually high-priced ticket listings and examine their distribution across airlines and routes.

## Dataset

- **Dataset:** Airlines Flights Data
- **Records:** Approximately 300,153
- **Columns:** 12
- **Database:** MySQL
- **Primary Analysis Tool:** MySQL Workbench

### Dataset Source & Attribution

The project uses the Airlines Flights Data dataset created by **Rohit Grewal**.

- **Original Dataset:** [Kaggle – Airlines Flights Data](https://www.kaggle.com/datasets/rohitgrewal/airlines-flights-data)
- **Creator:** Rohit Grewal
- **Database Licence:** [Open Database Licence (ODbL) v1.0](https://opendatacommons.org/licenses/odbl/1-0/)
- **Contents Licence:** [Database Contents Licence (DbCL) v1.0](https://opendatacommons.org/licenses/dbcl/1-0/)

The original dataset creator and applicable licences are acknowledged. The dataset is redistributed subject to the applicable licence terms.

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

## Business Questions & SQL Analysis

The project addresses 12 business questions:

1. Airline-wise average pricing across travel classes.
2. Overall booking-window pricing comparison.
3. Airline-wise Economy booking-window comparison.
4. Route-level booking-window comparison.
5. Flight duration versus ticket pricing.
6. Number of stops versus ticket pricing.
7. Route-wise Economy pricing.
8. Airline-wise pricing within individual routes.
9. Same-route booking-window comparison within the same travel class.
10. Departure time versus ticket pricing.
11. Statistical price-outlier screening by airline and class.
12. Route-level price-outlier screening.

## Key Findings

- **Airline Pricing:** Vistara recorded the highest average listed ticket price in both Economy and Business classes among the airlines represented.
- **Booking Window:** Economy listings showed a 136.50% difference between last-minute and early-booking average prices, compared with 9.87% for Business listings.
- **Airline-level Comparison:** AirAsia recorded the highest percentage difference in Economy booking-window prices at 177.00%, followed by Indigo at 174.87%.
- **Route-level Comparison:** AirAsia's Hyderabad–Delhi route recorded the highest percentage difference at 327.86%. Air India's Chennai–Bangalore route recorded the highest absolute difference, approximately ₹12,234.
- **Flight Duration:** Average Economy listing prices increased across the four observed flight-duration categories.
- **Number of Stops:** Average listed prices generally increased across zero-stop, one-stop and two-or-more-stop categories in both travel classes.
- **Route Pricing:** Kolkata–Chennai recorded the highest average Economy listing price at ₹8,011.75, while Mumbai–Hyderabad recorded the lowest at ₹5,774.89.
- **Airline and Route Comparison:** Vistara recorded the highest average Economy listing prices on several Kolkata routes. On Kolkata–Bangalore, its average was approximately ₹9,286, compared with approximately ₹4,629 for AirAsia.
- **Same-route Booking Window:** On Kolkata–Bangalore Economy listings, Indigo recorded the highest percentage difference at approximately 135.8%, while Air India recorded the highest absolute difference at approximately ₹8,414.
- **Departure Time:** Morning departures recorded the highest average listed prices in both Economy and Business classes.
- **Statistical Screening:** SpiceJet recorded the highest flagged proportion in Economy at 5.24%, while Vistara had the highest absolute number of flagged Economy listings, with 3,401.
- **Route-level Outliers:** Vistara's Kolkata–Chennai Economy listings had a flagged rate of approximately 13.35%.

For detailed findings and analysis-specific observations, see [`RESULTS/key_findings.md`](RESULTS/key_findings.md).

## SQL Concepts & Techniques Used

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

## Methodology

- Booking windows were classified using the number of days remaining before departure.
- Early booking was defined as 31–49 days before departure.
- Last-minute booking was defined as 1–7 days before departure.
- Route-level comparisons used minimum listing-count requirements where appropriate.
- Unusually high-priced listings were screened using the mean price plus two standard deviations within each airline-class group.

## Limitations

- The dataset contains listed ticket prices, not confirmed bookings or actual airline revenue.
- Observed price differences do not establish causal relationships.
- Route composition, airline mix, flight duration, number of stops and departure schedules may influence observed averages.
- Statistical outlier flags are screening indicators, not proof of incorrect or unfair pricing.
- Smaller sample sizes should be interpreted cautiously.

## Repository Structure

```text
Airline-Pricing-Analysis-SQL/
│
├── DATASET/
│   └── airlines_flights_data.csv
│
├── SQL/
│   └── 12 SQL analysis scripts
│
├── RESULTS/
│   ├── Screenshots/
│   └── key_findings.md
│
└── README.md
```

## Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

## Project Objective

This project demonstrates the application of SQL to business-oriented data analysis, with an emphasis on identifying pricing patterns, comparing market segments, investigating unusual observations and translating query results into meaningful business insights.

