{% macro get_bill_columns() %}

{% set columns = [
    {"name": "last_synced", "datatype": dbt.type_timestamp()},
    {"name": "balance", "datatype": dbt.type_float()},
    {"name": "created_at", "datatype": dbt.type_timestamp()},
    {"name": "currency_id", "datatype": dbt.type_string()},
    {"name": "department_id", "datatype": dbt.type_string()},
    {"name": "doc_number", "datatype": dbt.type_string()},
    {"name": "due_date", "datatype": "date"},
    {"name": "exchange_rate", "datatype": dbt.type_float()},
    {"name": "global_tax_calculation", "datatype": dbt.type_string()},
    {"name": "home_balance", "datatype": dbt.type_float()},
    {"name": "id", "datatype": dbt.type_string()},
    {"name": "payable_account_id", "datatype": dbt.type_string()},
    {"name": "private_note", "datatype": dbt.type_string()},
    {"name": "sales_term_id", "datatype": dbt.type_string()},
    {"name": "sync_token", "datatype": dbt.type_string()},
    {"name": "total_amount", "datatype": dbt.type_float()},
    {"name": "transaction_date", "datatype": "date"},
    {"name": "updated_at", "datatype": dbt.type_timestamp()},
    {"name": "vendor_id", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
