--To disable this model, set the using_bill_payment variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select
    to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
    json_extract_path_text("CHECK_PAYMENT", 'bankAccountRef.value') as check_bank_account_id,
    json_extract_path_text("CHECK_PAYMENT", 'printStatus') as check_print_status,
    to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as created_at,
    json_extract_path_text("CREDIT_CARD_PAYMENT", 'ccAccountRef.value') as credit_card_account_id,
    json_extract_path_text("CURRENCY_REF", 'value') as currency_id,
    json_extract_path_text("DEPARTMENT_REF", 'value') as department_id,
    "DOC_NUMBER" as doc_number,
    Null as exchange_rate,
    "ID" as id,
    "PAY_TYPE" as pay_type,
    Null as payable_account_id,
    "PRIVATE_NOTE" as private_note,
    "SYNC_TOKEN" as sync_token,
    "TOTAL_AMT" as total_amount,
    to_timestamp("TXN_DATE" / 1000) as transaction_date,
    to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as updated_at,
    json_extract_path_text("VENDOR_REF", 'value') as vendor_id
from 
    {{ var('bill_payment') }}