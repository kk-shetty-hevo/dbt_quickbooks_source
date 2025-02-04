--To disable this model, set the using_bill variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select
    to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
    "BALANCE" as balance,
    to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as created_at,
    json_extract_path_text("CURRENCY_REF", 'value') as currency_id,
    json_extract_path_text("DEPARTMENT_REF", 'value') as department_id,
    DOC_NUMBER as doc_number,
    to_timestamp("DUE_DATE" / 1000) as due_date,
    Null as exchange_rate,
    Null as global_tax_calculation,
    Null as home_balance,
    "ID" as id,
    CASE
    	WHEN json_extract_path_text("AP_ACCOUNT_REF", 'name') = 'Accounts Payable' THEN
    		json_extract_path_text("AP_ACCOUNT_REF", 'value')
    	ELSE 
    		Null
    END as payable_account_id,
    "PRIVATE_NOTE" as private_note,
    json_extract_path_text("SALES_TERM_REF", 'value') as sales_term_id,
    "SYNC_TOKEN" as sync_token,
    "TOTAL_AMT" as total_amount,
    to_timestamp("TXN_DATE" / 1000) as transaction_date,
    to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as updated_at,
    json_extract_path_text("VENDOR_REF", 'value') as vendor_id
from 
    {{ var('bill') }}