
  create view "northwind"."dbt_dw"."stg_order_details__dbt_tmp"
    
    
  as (
    with source as (

    select 
        /*Primary key*/
          order_id
         ,product_id
         ,unit_price
         ,quantity
         ,discount   

    from "northwind"."public"."order_details"

)

select *
from source
  );