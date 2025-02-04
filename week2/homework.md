## Module 2 Homework


1. Within the execution for `Yellow` Taxi data for the year `2020` and month `12`: what is the uncompressed file size (i.e. the output file `yellow_tripdata_2020-12.csv` of the `extract` task)?
- 128.3 MB
- 134.5 MB
- 364.7 MB
- 692.6 MB

**Answer**: 128,3 MB

2. What is the rendered value of the variable file when the inputs taxi is set to green, year is set to 2020, and month is set to 04 during execution?

- {{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv
- green_tripdata_2020-04.csv
- green_tripdata_04_2020.csv
- green_tripdata_2020.csv

file: "{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv"

**Answer**: green_tripdata_2020-04.csv

3. How many rows are there for the Yellow Taxi data for all CSV files in the year 2020?

- 13,537.299
- 24,648,499
- 18,324,219
- 29,430,127

**Answer**: 24,648,499

```sql

SELECT COUNT(*) 
FROM `ny-rides-nikolay.zoomcamp.yellow_tripdata` as yt
WHERE 1=1
    and yt.filename LIKE '%2020%';
```


4. How many rows are there for the Green Taxi data for all CSV files in the year 2020?

- 5,327,301
- 936,199
- 1,734,051
- 1,342,034

**Answer**: 1,734,051

```sql

SELECT COUNT(*) 
FROM `ny-rides-nikolay.zoomcamp.green_tripdata` AS gt
WHERE 1=1
    and gt.filename LIKE '%2020%';
```



5. How many rows are there for the Yellow Taxi data for the March 2021 CSV file?

- 1,428,092
- 706,911
- 1,925,152
- 2,561,031

**Answer**: 1,925,152

```sql

SELECT COUNT(*) 
FROM `ny-rides-nikolay.zoomcamp.yellow_tripdata` AS yt
WHERE yt.filename = 'yellow_tripdata_2021-03.csv;
```

6) How would you configure the timezone to New York in a Schedule trigger?

- Add a `timezone` property set to `EST` in the `Schedule` trigger configuration  
- Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration
- Add a `timezone` property set to `UTC-5` in the `Schedule` trigger configuration
- Add a `location` property set to `New_York` in the `Schedule` trigger configuration  

**Answer**: Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration