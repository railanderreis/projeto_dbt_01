
  create view "northwind"."dbt_dw"."stg_orders__dbt_tmp"
    
    
  as (
    with source as (

    select 
        /*Primary Key*/
        order_id
        /*Foreign key*/
        ,customer_id
        ,employee_id
        ,ship_via as shipper_id
        
        ,order_date
        ,cast(required_date as timestamp) as required_date
        ,shipped_date
        ,freight
        ,ship_name
        ,ship_address
        ,ship_city
        ,ship_region
        ,ship_postal_code
        ,ship_country  

    from "northwind"."public"."orders"

)

select *
from source
  );