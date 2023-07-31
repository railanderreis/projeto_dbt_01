
  
    

  create  table "northwind"."dbt_dw"."dim_shippers__dbt_tmp"
  
  
    as
  
  (
    with selected as (

    select *
    from "northwind"."dbt_dw"."stg_shippers"
)
, transformed as (
    select
        row_number() over (order by shipper_id) as shipper_sk
        ,shipper_id
        ,company_name
        ,phone
    from selected    
)

select *
from transformed
  );
  