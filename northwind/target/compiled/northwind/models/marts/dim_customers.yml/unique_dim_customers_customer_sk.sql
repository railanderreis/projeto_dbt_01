
    
    

select
    customer_sk as unique_field,
    count(*) as n_records

from "northwind"."dbt_dw"."dim_customers"
where customer_sk is not null
group by customer_sk
having count(*) > 1


