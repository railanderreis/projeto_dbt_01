
  create view "northwind"."dbt_dw"."stg_suppliers__dbt_tmp"
    
    
  as (
    with source as (

    select 
        /*Primary key*/
         supplier_id
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
        ,homepage
    from "northwind"."public"."suppliers"

)

select *
from source
  );