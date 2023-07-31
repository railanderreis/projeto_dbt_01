with staging as (
    select *
    from "northwind"."dbt_dw"."stg_employees"
)
, transformed as (
    select
        row_number() over (order by employee_id) as employee_sk
        ,employee_id
        ,concat(first_name,' ',last_name) as name
        ,first_name
        ,last_name
        ,title
        ,title_of_courtesy
        ,birth_date
        ,hire_date
        ,address
        ,city
        ,region
        ,postal_code
        ,country
        ,home_phone
        ,extension
        ,photo
        ,notes
        ,reports_to
        ,photo_path 
    from staging    
)

select *
from transformed