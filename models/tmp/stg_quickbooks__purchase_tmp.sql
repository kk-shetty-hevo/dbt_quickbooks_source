SELECT 
	to_timestamp("__HEVO__LOADED_AT" / 1000) as "last_synced",
	json_extract_path_text("ACCOUNT_REF", 'value') as "account_id",
	to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as "created_at",
	"CREDIT" as "credit",
	json_extract_path_text("CURRENCY_REF", 'value') as "currency_id",
	Null as "customer_id",
	json_extract_path_text("DEPARTMENT_REF", 'value') as "department_id",
	"DOC_NUMBER" as "doc_number",
	CASE 
		WHEN json_extract_path_text("ENTITY_REF", 'type') = 'Employee' THEN 
			json_extract_path_text("ENTITY_REF", 'value')
		ELSE
			Null
	END as "employee_id",
	Null as "exchange_rate",
	Null as "global_tax_calculation",
	"ID" as "id",
	json_extract_path_text("PAYMENT_METHOD_REF", 'value') as "payment_method_id",
	"PAYMENT_TYPE" as "payment_type", 
	"PRINT_STATUS" as "print_status", 
	"PRIVATE_NOTE" as "private_note", 
	json_extract_path_text("REMIT_TO_ADDR", 'id') as "remit_to_address_id",
	"SYNC_TOKEN" as "sync_token",
	Null as "tax_code_id",
	"TOTAL_AMT" as "total_amount", 
	Null as "total_tax",
	to_timestamp("TXN_DATE" / 1000) as "transaction_date",
	Null as "transaction_source",
	to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as "updated_at",
	CASE 
		WHEN json_extract_path_text("ENTITY_REF", 'type') = 'Vendor' THEN 
			json_extract_path_text("ENTITY_REF", 'value')
		ELSE
			Null
	END as "vendor_id"
from 
    var('purchase')