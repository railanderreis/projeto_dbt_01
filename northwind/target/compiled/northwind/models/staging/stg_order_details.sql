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