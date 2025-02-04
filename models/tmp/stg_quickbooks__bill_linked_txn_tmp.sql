--To disable this model, set the using_bill and using_bill_payment variables within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select
	to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
	"BILL_ID" as bill_id,
	"TXN_ID" as bill_payment_id,
	Null as index
from
    {{ var('bill_linked_txn') }}