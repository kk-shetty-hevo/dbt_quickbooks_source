--To disable this model, set the using_bill_payment variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_bill', True)) }}

select
    to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
    "AMOUNT" as amount,
    Null as bill_id,
    Null as bill_payment_credit_card_id,
    "BILLPAYMENT_ID" as bill_payment_id,
    Null as check_id,
    Null as credit_card_charge_id,
    Null as credit_card_credit_id,
    Null as deposit_id,
    Null as expense_id,
    "LINE_INDEX"::text as index,
    Null as journal_entry_id,
    Null as linked_bill_payment_id,
    Null as vendor_credit_id
from 
    {{ var('bill_payment_line') }}