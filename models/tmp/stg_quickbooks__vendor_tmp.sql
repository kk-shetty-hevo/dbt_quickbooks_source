select 
	to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
	"ACCT_NUM" as account_number,
	"ACTIVE" as active,
	Null as alternate_phone,
	"BALANCE" as balance,
	json_extract_path_text("BILL_ADDR", 'id') as billing_address_id, 
	"COMPANY_NAME" as company_name,
	to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as created_at,
	json_extract_path_text("CURRENCY_REF", 'value') as currency_id,
	"DISPLAY_NAME" as display_name,
	json_extract_path_text("PRIMARY_EMAIL_ADDR", 'address') as email,
	FAMILY_NAME as family_name,
	json_extract_path_text("FAX", 'freeFormNumber') as fax_number,
	"GIVEN_NAME" as given_name,
	"ID" as id,
	"MIDDLE_NAME" as middle_name,
	json_extract_path_text("MOBILE", 'freeFormNumber') as mobile_phone,
	"OTHER_CONTACT_INFO"::text as other_contacts,
	json_extract_path_text("PRIMARY_PHONE", 'freeFormNumber') as primary_phone,
	"PRINT_ON_CHECK_NAME" as print_on_check_name,
	Null as suffix,
	"SYNC_TOKEN" as sync_token,
	"TAX_IDENTIFIER" as tax_identifier,
	json_extract_path_text("TERM_REF", 'value') as term_id,
	"TITLE" as title,
	to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as updated_at,
	"VENDOR1099" as vendor_1099,
	Null as web_url
from 
    {{ var('vendor') }}
