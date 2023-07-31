with selected as (

    select 
        customer_id
        ,company_name
        ,contact_name
        ,contact_title
        ,address
        ,city
        ,region
        ,postal_code
        ,country
        ,phone
        ,fax  

    from "northwind"."dbt_dw"."stg_customers"
)
, transformed as (
    select
        row_number() over (order by customer_id) as customer_sk
        , *
    from selected    
)

select *
from transformed