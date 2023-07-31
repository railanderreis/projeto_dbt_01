with source as (

    select 
        /*Primary key*/
        shipper_id
        ,company_name
        ,phone
    from "northwind"."public"."shippers"

)

select *
from source