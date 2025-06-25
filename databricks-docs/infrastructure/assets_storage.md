# Assets and Storage Tables

This file contains documentation for 5 Databricks warehouse tables related to asset management and storage.
These tables track assets, S3 storage, inventory, and file management data.

---

## narrative.default.\_sync_s3_inventory_common_xmp

### Schema

| Column       | Type              | Nullable |
| ------------ | ----------------- | -------- |
| key          | `StringType()`    | True     |
| bucket       | `StringType()`    | True     |
| processed_at | `TimestampType()` | True     |

### Sample Row

```json
{
  "key": "20e848c7-88fb-4ede-ad5d-209ac770ce5d/style/97bda799-3129-479b-85a7-4ba99aef8332.common.xmp",
  "bucket": "prod.fetch.getnarrativeapp.com",
  "processed_at": "2025-06-22 17:38:35.621002"
}
```

---

## narrative.default.prod_fetch_inventory

### Schema

| Column             | Type              | Nullable |
| ------------------ | ----------------- | -------- |
| bucket             | `StringType()`    | True     |
| key                | `StringType()`    | True     |
| size               | `LongType()`      | True     |
| last_modified_date | `TimestampType()` | True     |
| e_tag              | `StringType()`    | True     |
| \_rescued_data     | `StringType()`    | True     |

### Sample Row

```json
{
  "bucket": "prod.fetch.getnarrativeapp.com",
  "key": "660aa5ba-45d3-4bb1-8283-60a0b795fdbb/40612abf-ae19-4532-aa80-681e86335abd/300",
  "size": 12779,
  "last_modified_date": "2023-02-04 20:19:18",
  "e_tag": "88d75422a5c124a380461aa6c3401428",
  "_rescued_data": null
}
```

---

## narrative.default.s3_inventory_common_xmp

### Schema

| Column             | Type              | Nullable |
| ------------------ | ----------------- | -------- |
| bucket             | `StringType()`    | True     |
| key                | `StringType()`    | True     |
| size               | `LongType()`      | True     |
| last_modified_date | `TimestampType()` | True     |
| e_tag              | `StringType()`    | True     |
| \_rescued_data     | `StringType()`    | True     |

### Sample Row

```json
{
  "bucket": "prod.fetch.getnarrativeapp.com",
  "key": "a82a90c2-53e4-4d9d-82e8-f26067b1b2d5/style/ca454fae-e8a9-4741-bf48-0437246d74c2.common.xmp",
  "size": 5858,
  "last_modified_date": "2025-01-30 07:26:35",
  "e_tag": "0c0e80c8f852cbe07dba504f4e828928",
  "_rescued_data": null
}
```

---

## narrative.default.staging_fetch_inventory

### Schema

| Column             | Type              | Nullable |
| ------------------ | ----------------- | -------- |
| bucket             | `StringType()`    | True     |
| key                | `StringType()`    | True     |
| size               | `LongType()`      | True     |
| last_modified_date | `TimestampType()` | True     |
| e_tag              | `StringType()`    | True     |
| \_rescued_data     | `StringType()`    | True     |

### Sample Row

```json
{
  "bucket": "staging.fetch.getnarrativeapp.com",
  "key": "9016e87f-6137-49c1-83d8-5d76b724f648/dd22bd23-2b22-4afe-b125-0b4415136f40/base.json",
  "size": 450,
  "last_modified_date": "2023-09-27 22:31:58",
  "e_tag": "c987c653cf8c39a8917c3de68ff81cf4",
  "_rescued_data": null
}
```

---

## narrative.default.view_inventory_test

### Schema

| Column  | Type           | Nullable |
| ------- | -------------- | -------- |
| s3_path | `StringType()` | True     |

### Sample Row

```json
{
  "s3_path": "s3a://staging.fetch.getnarrativeapp.com/9016e87f-6137-49c1-83d8-5d76b724f648/dd22bd23-2b22-4afe-b125-0b4415136f40/base.json"
}
```