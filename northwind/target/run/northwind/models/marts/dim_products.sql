
  
    

  create  table "northwind"."dbt_dw"."dim_products__dbt_tmp"
  
  
    as
  
  (
    with staging as (
    select *
    from "northwind"."dbt_dw"."stg_products"
)
, transformed as (
    select
        row_number() over (order by product_id) as product_sk
        ,product_id
        ,supplier_id
        ,category_id
        ,product_name
        ,quantity_per_unit
        ,unit_price
        ,units_in_stock
        ,units_on_order
        ,reorder_level
        ,is_discontinued
    from staging    
)

select *
from transformed
  );
  