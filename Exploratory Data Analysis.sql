-- Exploratory Data Analysis 

select*from layoffs_staging2;

select max(total_laid_off) ,max(percentage_laid_off) from layoffs_staging2;

select*from layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;

select company,sum(total_laid_off)
from layoffs_staging2
group by company order by 2 desc;

select min(`date`),max(`date`)from layoffs_staging2;

select industry,sum(total_laid_off) 
from layoffs_staging2
group by industry order by 2 desc;

select country,sum(total_laid_off) 
from layoffs_staging2
group by country order by 2 desc;

select year(`date`),sum(total_laid_off) 
from layoffs_staging2
group by year(`date`) order by 1 desc;

select stage,sum(total_laid_off) 
from layoffs_staging2
group by stage order by 1 desc;

select country,avg(percentage_laid_off) 
from layoffs_staging2
group by country order by 2 desc;

select substring(`date`,6,2) as months ,sum(total_laid_off)-- to take values by (start,num of value
from layoffs_staging2
group by months;

select substring(`date`,1,7) as months ,sum(total_laid_off)-- to take values by (start,num of value
from layoffs_staging2
where  substring(`date`,1,7) is not null
group by months order by 1 asc;

with rolling_total as (select substring(`date`,1,7) as months,sum(total_laid_off) as total_off-- to take values by (start,num of value
from layoffs_staging2
where  substring(`date`,1,7) is not null
group by months order by 1 asc)
select months,total_off,sum(total_off) OVER(order by months) as rolling_total
from rolling_total;

select company,year(`date`),sum(total_laid_off) 
from layoffs_staging2
GROUP BY company,year(`date`) order by 3 desc;

with company_year(company,years,total_laid_off) as 
(select company,year(`date`),sum(total_laid_off) 
from layoffs_staging2
GROUP BY company,year(`date`) )
select*,DENSE_RANK() OVER(PARTITION BY YEARS ORDER BY TOTAL_LAID_OFF DESC) AS RANKING FROM company_year
WHERE YEARS IS NOT NULL 
ORDER BY RANKING;


with company_year(company,years,total_laid_off) as 
(select company,year(`date`),sum(total_laid_off) 
from layoffs_staging2
GROUP BY company,year(`date`)
), COMPANY_YEAR_RANK AS(
select*,
DENSE_RANK() OVER(PARTITION BY YEARS ORDER BY TOTAL_LAID_OFF DESC) AS RANKING 
FROM company_year
WHERE YEARS IS NOT NULL)
SELECT*FROM COMPANY_YEAR_RANK 
WHERE RANKING <=5
;
