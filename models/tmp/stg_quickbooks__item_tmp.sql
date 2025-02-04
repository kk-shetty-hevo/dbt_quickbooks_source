SELECT 
	to_timestamp("__HEVO__LOADED_AT" / 1000) as last_synced,
	"ACTIVE" as active,
	json_extract_path_text("ASSET_ACCOUNT_REF", 'value') as asset_account_id,
	to_timestamp(
        json_extract_path_text("META_DATA", 'createTime')::number / 1000
    ) as created_at,
	"DESCRIPTION" as description,
	json_extract_path_text("EXPENSE_ACCOUNT_REF", 'value') as expense_account_id,
	"FULLY_QUALIFIED_NAME" as fully_qualified_name,
	"ID" as id,
	json_extract_path_text("INCOME_ACCOUNT_REF", 'value') as income_account_id,
	to_timestamp("INV_START_DATE" /1000) as inventory_start_date,
	"LEVEL"::text as level,
	"NAME" as name,
	json_extract_path_text("PARENT_REF", 'value') as parent_item_id,
	"PURCHASE_COST" as purchase_cost,
	"PURCHASE_DESC" as purchase_description,
	Null as purchase_tax_code_id,
	Null as purchase_tax_included,
	"QTY_ON_HAND" as quantity_on_hand,
	Null as sales_tax_code_id,
	Null as sales_tax_included,
	"SKU" as stock_keeping_unit,
	"SUB_ITEM" as sub_item,
	"SYNC_TOKEN" as sync_token,
	"TAXABLE" as taxable,
	"TRACK_QTY_ON_HAND" as track_quantity_on_hand,
	"TYPE" as type,
	"UNIT_PRICE" as unit_price,
	to_timestamp(
        json_extract_path_text("META_DATA", 'lastUpdatedTime')::number / 1000
    ) as updated_at
from 
    {{ var('item') }}