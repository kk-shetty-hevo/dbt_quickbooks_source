--To disable this model, set the using_bill variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select
	to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
	json_extract_path_text("ACCOUNT_BASED_EXPENSE_LINE_DETAIL", 'accountRef.value') as account_expense_account_id,
	json_extract_path_text("ACCOUNT_BASED_EXPENSE_LINE_DETAIL", 'billableStatus') as account_expense_billable_status,
	json_extract_path_text("ACCOUNT_BASED_EXPENSE_LINE_DETAIL", 'classRef.value') as account_expense_class_id,
	Null as account_expense_customer_id,
	Null as account_expense_tax_amount,
	json_extract_path_text("ACCOUNT_BASED_EXPENSE_LINE_DETAIL", 'taxCodeRef.value') as account_expense_tax_code_id,
	"AMOUNT" as amount,
	"BILL_ID" as bill_id,
	"DESCRIPTION" as description,
	"LINE_INDEX"::text as index,
	Null as item_expense_billable_status,
	Null as item_expense_class_id,
	Null as item_expense_customer_id,
	Null as item_expense_item_id,
	Null as item_expense_quantity,
	Null as item_expense_tax_code_id,
	Null as item_expense_unit_price
from 
    {{ var('bill_line') }}