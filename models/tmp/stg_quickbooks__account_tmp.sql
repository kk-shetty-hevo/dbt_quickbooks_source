select
    "__HEVO__LOADED_AT" as "last_synced",
	"ACCT_NUM" as "account_number",
	"ACCOUNT_SUB_TYPE" as "account_sub_type",
	"ACTIVE" as "active",
	"CURRENT_BALANCE" as "balance",
	"CURRENT_BALANCE_WITH_SUB_ACCOUNTS" as "balance_with_sub_accounts",
	"CLASSIFICATION" as "classification",
	to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as "created_at",
	json_extract_path_text("CURRENCY_REF", 'value') as "currency_id",
	"DESCRIPTION" as "description",
	"FULLY_QUALIFIED_NAME" as "fully_qualified_name",
	"ID" as "id",
	"NAME" as "name",
	json_extract_path_text("PARENT_REF", 'value') as "parent_account_id",
	"SUB_ACCOUNT" as "sub_account",
	"SYNC_TOKEN" as "sync_token",
	to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as "updated_at"
from 
    var('account')