
with source as (

    select 
        /*Primary key*/
         product_id
        /*Foreign key*/
        ,supplier_id
        ,category_id
        ,product_name
        ,quantity_per_unit
        ,unit_price
        ,units_in_stock
        ,units_on_order
        ,reorder_level
        ,case 
            when discontinued =  1 then True
            else False
         end as is_discontinued    

    from {{source('northwind','products')}}

)

select *
from source