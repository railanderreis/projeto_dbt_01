with source as (

    select 
        /*Foreign key*/
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

    from "northwind"."public"."customers"

)

select *
from source