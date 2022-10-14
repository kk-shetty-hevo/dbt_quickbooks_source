{% macro get_refund_receipt_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "apply_tax_after_discount", "datatype": "boolean"},
    {"name": "balance", "datatype": dbt.type_float()},
    {"name": "bill_email", "datatype": dbt.type_string()},
    {"name": "billing_address_id", "datatype": dbt.type_string()},
    {"name": "check_payment_account_number", "datatype": dbt.type_string()},
    {"name": "check_payment_bank_name", "datatype": dbt.type_string()},
    {"name": "check_payment_check_number", "datatype": dbt.type_string()},
    {"name": "check_payment_name_on_account", "datatype": dbt.type_string()},
    {"name": "check_payment_status", "datatype": dbt.type_string()},
    {"name": "class_id", "datatype": dbt.type_string()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "credit_card_amount", "datatype": dbt.type_float()},
    {"name": "credit_card_auth_code", "datatype": dbt.type_string()},
    {"name": "credit_card_billing_address_street", "datatype": dbt.type_string()},
    {"name": "credit_card_cc_expiry_month", "datatype": dbt.type_string()},
    {"name": "credit_card_cc_expiry_year", "datatype": dbt.type_string()},
    {"name": "credit_card_cctrans_id", "datatype": dbt.type_string()},
    {"name": "credit_card_name_on_account", "datatype": dbt.type_string()},
    {"name": "credit_card_postal_code", "datatype": dbt.type_string()},
    {"name": "credit_card_process_payment", "datatype": "boolean"},
    {"name": "credit_card_status", "datatype": dbt.type_string()},
    {"name": "credit_card_transaction_authorization_time", "datatype": "date"},
    {"name": "credit_card_type", "datatype": dbt.type_string()},
    {"name": "currency_id", "datatype": dbt.type_string()},
    {"name": "customer_id", "datatype": dbt.type_string()},
    {"name": "customer_memo", "datatype": dbt.type_string()},
    {"name": "department_id", "datatype": dbt.type_string()},
    {"name": "deposit_to_account_id", "datatype": dbt.type_string()},
    {"name": "doc_number", "datatype": dbt.type_string()},
    {"name": "exchange_rate", "datatype": dbt.type_float()},
    {"name": "global_tax_calculation", "datatype": dbt.type_string()},
    {"name": "home_balance", "datatype": dbt.type_float()},
    {"name": "home_total_amount", "datatype": dbt.type_float()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "payment_method_id", "datatype": dbt.type_string()},
    {"name": "payment_reference_number", "datatype": dbt.type_string()},
    {"name": "payment_type", "datatype": dbt.type_string()},
    {"name": "print_status", "datatype": dbt.type_string()},
    {"name": "private_note", "datatype": dbt.type_string()},
    {"name": "shipping_address_id", "datatype": dbt.type_string()},
    {"name": "sync_token", "datatype": dbt.type_string()},
    {"name": "tax_code_id", "datatype": dbt.type_string()},
    {"name": "total_amount", "datatype": dbt.type_float()},
    {"name": "total_tax", "datatype": dbt.type_float()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "transaction_source", "datatype": dbt.type_string()},
    {"name": "updated_at", "datatype": dbt.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
