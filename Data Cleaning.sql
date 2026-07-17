-- Data Cleaning
use world_layoffs;
select*from layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null values or blank values
-- 4. Remove any columns or rows

CREATE TABLE LAYOFFS_STAGING
LIKE LAYOFFS;

SELECT*FROM LAYOFFS_STAGING;
INSERT INTO LAYOFFS_STAGING 
SELECT*FROM LAYOFFS;

-- 1. Remove Duplicates
SELECT *,ROW_NUMBER() OVER(
PARTITION BY COMPANY,INDUSTRY,TOTAL_LAID_OFF,'DATA',PERCENTAGE_LAID_OFF,location,STAGE,COUNTRY,FUNDS_RAISED_millions)AS ROW_NUM
FROM LAYOFFS_STAGING;

with duplicate_cte as(
SELECT *,ROW_NUMBER() OVER(
PARTITION BY COMPANY,INDUSTRY,TOTAL_LAID_OFF,'DATA',PERCENTAGE_LAID_OFF,location,STAGE,COUNTRY,FUNDS_RAISED_millions)AS ROW_NUM
FROM LAYOFFS_STAGING)
select*from duplicate_cte
where row_num >1;

with duplicate_cte as(
SELECT *,ROW_NUMBER() OVER(
PARTITION BY COMPANY,INDUSTRY,TOTAL_LAID_OFF,'DATA',PERCENTAGE_LAID_OFF,location,STAGE,COUNTRY,FUNDS_RAISED_millions)AS ROW_NUM
FROM LAYOFFS_STAGING)
delete
from duplicate_cte
where row_num >1;




CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO LAYOFFS_STAGING2
SELECT *,ROW_NUMBER() OVER(
PARTITION BY COMPANY,location,INDUSTRY,TOTAL_LAID_OFF,PERCENTAGE_LAID_OFF,'DATA',STAGE,COUNTRY,FUNDS_RAISED_millions)AS ROW_NUM
FROM LAYOFFS_STAGING;

select*from layoffs_staging2
WHERE ROW_NUM>1;

select*from layoffs_staging2
WHERE country='Canada'
;

delete 
from layoffs_staging2
WHERE ROW_NUM>1;

select*from layoffs_staging2;
set sql_safe_updates=0;

-- 2. Standardize the data

select company,trim(company)
from layoffs_staging2;

update layoffs_staging2
set company=trim(company);

select distinct(industry)
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry='Crypto' where industry like 'crypto%';

select distinct(country)
from layoffs_staging2 order by 1;

update layoffs_staging2
set country=trim(trailing '.'from country)where country='united states%'; -- trailing to trim by mention the VALUE

select `date`,str_to_date(`date`,'%m/%d/%Y') 
from layoffs_staging2;
select `date` from layoffs_staging2;
update layoffs_staging2 
set `date`=str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_staging2 modify 
column `date` DATE;

-- 3. Null values or blank values

select*from layoffs_staging2
where total_laid_off is null and
percentage_laid_off is null;
 -- ------############
select * from layoffs_staging2
where industry is null or industry='' ; 

update layoffs_staging2
set industry=null
where industry='';

select*from layoffs_staging2
where company='airbnb';

select t1.industry,t2.industry from layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
on t1.company=t2.company
set t1.industry=t2.industry
where (t1.industry is null or t1.industry ='')
and t2.industry is not null;

-- 4. Remove any columns or rows
delete from layoffs_staging2
where total_laid_off is null and
percentage_laid_off is null;

alter table layoffs_staging2
drop column row_num;

select *from layoffs_staging2;
