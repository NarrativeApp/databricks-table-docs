# Core Business Tables

This file contains documentation for 20 Databricks warehouse tables from the narrative.core schema.
These tables contain core business entities and relationships not covered in other categories.

---

## narrative.core.affiliate_clicks

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| Op                  | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| affiliate_scheme_id | `StringType()`    | True     |
| source_id           | `StringType()`    | True     |
| referrer            | `StringType()`    | True     |
| landing_page        | `StringType()`    | True     |
| user_agent          | `StringType()`    | True     |
| product_type        | `StringType()`    | True     |
| inserted_at         | `TimestampType()` | True     |
| updated_at          | `TimestampType()` | True     |
| \_rescued_data      | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "7c1968af-ae9d-47f4-9978-fc8db4833cf8",
  "affiliate_scheme_id": "a5602442-5e12-4ea7-86c2-91df6a0e8b85",
  "source_id": null,
  "referrer": "https://www.facebook.com/",
  "landing_page": "https://narrative.so/publish?affiliate=kelly78&fbclid=IwZXh0bgNhZW0CMTEAAR7I5WoU61pGDdA_Y4mRxEr8QwbMnVgYxm0q4Z-0hvDqcK1LfkLK-sBHl352VQ_aem_z12F6xHdz3uVPu0VUU2ZzA",
  "user_agent": "Mozilla/5.0 (Linux; Android 12; SM-M625F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/137.0.7151.89 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/512.0.0.54.109;]",
  "product_type": "publish",
  "inserted_at": "2025-06-24 07:26:14",
  "updated_at": "2025-06-24 07:26:14",
  "_rescued_data": null
}
```

---

## narrative.core.affiliate_schemes

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| Op                            | `StringType()`    | True     |
| id                            | `StringType()`    | True     |
| affiliate_code                | `StringType()`    | True     |
| tapfiliate_ref_id             | `StringType()`    | True     |
| tapfiliate_temporary_password | `StringType()`    | True     |
| account_id                    | `StringType()`    | True     |
| inserted_at                   | `TimestampType()` | True     |
| updated_at                    | `TimestampType()` | True     |
| \_rescued_data                | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "7f0472c9-1271-4214-bd38-c0e016c9cbeb",
  "affiliate_code": "harsheen2011",
  "tapfiliate_ref_id": null,
  "tapfiliate_temporary_password": null,
  "account_id": "695f4b56-aba5-4a7d-97e5-d71fdaddba78",
  "inserted_at": "2022-05-19 03:20:17",
  "updated_at": "2022-05-19 03:20:17",
  "_rescued_data": null
}
```

---

## narrative.core.affiliate_signups

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| Op                  | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| affiliate_scheme_id | `StringType()`    | True     |
| account_id          | `StringType()`    | True     |
| product_id          | `StringType()`    | True     |
| product_type        | `StringType()`    | True     |
| is_qualified        | `StringType()`    | True     |
| inserted_at         | `TimestampType()` | True     |
| updated_at          | `TimestampType()` | True     |
| machine_id          | `StringType()`    | True     |
| \_rescued_data      | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "6c2fb38b-ff20-459e-ac12-6fead6d30994",
  "affiliate_scheme_id": "b4dfdb72-4fed-472d-b208-8e178f7acab6",
  "account_id": "b15c838a-9df7-4844-87cd-5a22fac738fe",
  "product_id": "e3e88954-ed51-4f25-81b8-b7d9225878bf",
  "product_type": "select",
  "is_qualified": "false",
  "inserted_at": "2025-06-24 09:19:26",
  "updated_at": "2025-06-24 09:19:26",
  "machine_id": null,
  "_rescued_data": null
}
```

---

## narrative.core.asset_locations

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| id             | `StringType()`    | True     |
| path           | `StringType()`    | True     |
| status         | `StringType()`    | True     |
| should_observe | `StringType()`    | True     |
| should_recurse | `StringType()`    | True     |
| source_id      | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| deleted_on     | `TimestampType()` | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "5bf85a78-f273-4d44-938a-f26764d423c4",
  "path": "",
  "status": "available",
  "should_observe": "false",
  "should_recurse": "false",
  "source_id": "158d1dd5-0aaa-406a-8e4d-8a1d9a41fa35",
  "inserted_at": "2022-04-07 02:16:43",
  "updated_at": "2022-04-07 02:16:43",
  "deleted_on": "NaT",
  "_rescued_data": null
}
```

---

## narrative.core.asset_previews

### Schema

| Column           | Type              | Nullable |
| ---------------- | ----------------- | -------- |
| Op               | `StringType()`    | True     |
| id               | `StringType()`    | True     |
| asset_id         | `StringType()`    | True     |
| asset_version_id | `StringType()`    | True     |
| hash             | `StringType()`    | True     |
| status           | `StringType()`    | True     |
| width            | `IntegerType()`   | True     |
| height           | `IntegerType()`   | True     |
| inserted_at      | `TimestampType()` | True     |
| updated_at       | `TimestampType()` | True     |
| mimetype         | `StringType()`    | True     |
| \_rescued_data   | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "f41744ac-707c-4eaf-a3ac-fd1666d84432",
  "asset_id": "e11cc9a2-8e65-4765-b391-2ead6c74b1a6",
  "asset_version_id": "f41744ac-707c-4eaf-a3ac-fd1666d84432",
  "hash": "CFDA2F61F3D757A282D806FE7752F1201D65F77E",
  "status": "available",
  "width": 1500,
  "height": 1068,
  "inserted_at": "2021-06-15 02:55:56",
  "updated_at": "2021-06-15 02:58:07",
  "mimetype": "jpg",
  "_rescued_data": null
}
```

---

## narrative.core.asset_versions

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| Op                | `StringType()`    | True     |
| id                | `StringType()`    | True     |
| name              | `StringType()`    | True     |
| path              | `StringType()`    | True     |
| meta              | `StringType()`    | True     |
| hash              | `StringType()`    | True     |
| bytes             | `IntegerType()`   | True     |
| is_rollup         | `StringType()`    | True     |
| is_deleted        | `StringType()`    | True     |
| occurred_at       | `LongType()`      | True     |
| change_user_id    | `StringType()`    | True     |
| asset_id          | `StringType()`    | True     |
| inserted_at       | `TimestampType()` | True     |
| updated_at        | `TimestampType()` | True     |
| asset_location_id | `StringType()`    | True     |
| asset_preview_id  | `StringType()`    | True     |
| \_rescued_data    | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "ee1799e2-4dbd-4625-8b71-54cf4ba59efe",
  "name": "gooddaywed1540.jpg",
  "path": null,
  "meta": "{\"width\": 2400, \"height\": 3600, \"star_rating\": -1, \"in_use_count\": 1, \"colour_rating\": 0, \"focus_keywords\": []}",
  "hash": "1CF3252CD94578EA56B099D39BDDFF83D0B2F2CA",
  "bytes": NaN,
  "is_rollup": null,
  "is_deleted": null,
  "occurred_at": 1748536200492995,
  "change_user_id": "151ec37d-fa6b-4656-b8a5-5fd4a8190c2f",
  "asset_id": "4b3ea0e7-2c60-4c3a-b4fc-9c22d4dafc8a",
  "inserted_at": "2025-05-29 16:30:00",
  "updated_at": "2025-05-29 16:30:00",
  "asset_location_id": "b70a2b87-a4b4-4c4c-baba-c3c10dbb5835",
  "asset_preview_id": "1adbadc2-13cc-455e-ba34-6805f8e5a363",
  "_rescued_data": null
}
```

---

## narrative.core.assets

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| id             | `StringType()`    | True     |
| mimetype       | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| save_id        | `StringType()`    | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "c8a5f992-728a-444a-b5fa-ea16b0424a69",
  "mimetype": "image/x-adobe-dng",
  "inserted_at": "2025-03-05 15:58:19",
  "updated_at": "2025-03-05 15:58:19",
  "save_id": "f627d655-7843-49ff-869b-e95ba0ae1ad5",
  "_rescued_data": null
}
```

---

## narrative.core.cdc_narrative_tables

### Schema

| Column      | Type            | Nullable |
| ----------- | --------------- | -------- |
| database    | `StringType()`  | True     |
| tableName   | `StringType()`  | True     |
| isTemporary | `BooleanType()` | True     |

### Sample Row

```json
{
  "database": "cdc",
  "tableName": "account_packs",
  "isTemporary": false
}
```

---

## narrative.core.clustering_tasks

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| id             | `StringType()`    | True     |
| user_id        | `StringType()`    | True     |
| status         | `StringType()`    | True     |
| xmps           | `StringType()`    | True     |
| clusters       | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "id": "ba99dd6b-d839-4324-92d2-8e5cf5b20cef",
  "user_id": "8e4ad48e-24cc-4d63-b437-0dee07d309c6",
  "status": "completed",
  "xmps": "[{\"id\": \"a24274a4-ca49-4dcd-9b2d-9feec28e018f\", \"body\": \"PHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAiPgoJPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KCQk8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgoJCQkJeG1sbnM6bmFycmF0aXZlPSJodHRwOi8vbnMubmFycmF0aXZlLnNvL25hcnJhdGl2ZV9zZWxlY3QvMS4wLyIKCQkJCXhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIgoJCQkJeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCgkJCQl4bWxuczpjcnM9Imh0dHA6Ly9ucy5hZG9iZS5jb20vY2FtZXJhLXJhdy1zZXR0aW5ncy8xLjAvIgoJCQluYXJyYXRpdmU6TGFzdERldmVsb3BlZD0iMjAyNC0xMi0wN1QwNDo0OTo0Ni45NTVaIgoJCQluYXJyYXRpdmU6TGFzdE1vZGlmaWVkPSIyMDI0LTExLTMwVDAwOjA5OjIzWiIKCQkJbmFycmF0aXZlOkRldmVsb3BTZXR0aW5ncz0iZlZadGI2TTRFUDRyRVovdUpLZ3dieUg1RmtqU3J0UjBvNlRidldwMUg5emdwTDZDblRPbUw3dmEvMzVqbTFBZzVGVFJkcDdITXg2UEg0Lzl5NXBWa3Q5aVNRVE8wNWsxUmJhVjVIajNVbm91OHF4cE9GRjJSVzRxWWsyZDBCaGJMQ3VCSmVVTU1PUUNLT2poV1RKU2x1QUJkb29MaUxjV2ZFOXo4TE5tR1g4aW82M0VMTU1pczNvRDV2UkFTZ25EZ2dBdG96aVpSMG5xKzlFa0NTZGVHQ1hJOWRPRmw4N0RWRG5tV0ZENVlaSnpQRWdvNVRrWDF3Sm5KTWtKeXlnN3dDSmN0MDFjNS93SjUzb0pBL2h0VlF6aXNNb2VmZ09yek5WS3oxMVdOSk9ja2ZNNWF1S2l4L2tzMjJlYzhiZU93eDJuSmRtUXJOcVpvcHQxTXltd3FsdmJxZ3VERFBSS2hMem5FUFdqM0dHMUUzdWNsd1NvU3J4Q3ZEMWxuYjNVWlp1VHZZQWlrbXRCQ0pzVnZHSW13UTRPNjd5aDFqUWF3Rys1TlExYStMb1N4NXdNQkRKRUhXazhSS2hRUGhDTDl5TXZLMkZLZXpMTVN0MnJ3TFpnZ2JSSlZWVkRBMXRDTXZDUFlqY0k0bWd5UHNIMEp6bU5NaG1EWmsvV21iSnY1cHRGUnVXS1oyWjJzRmY0L1FIbnlnMm1iaVJSbnhjbmlnQ3N5Q3o3cHlwbFFaaWMvVnRobUMvb3dZbU80S0FlckxNQTNBOTd4QW9mNERjMkJla3dYd1dHb3NFaWVyZ3BvenExWG8vWnFNSTRreDc2U1BLY3Y5WGl1U1dzaEJTRk5mMzEyMWdyekNxY3oya3B1VkFGYXUyb292dG5lZTdQeGxFWXVWNFF6Nko0bkVScHN2RGpPQW5Rd2swano3VjZicWV3V3lOVUxjWFdnQVhEVHhydm9FdjRHTFFTbUMvRmpMUFJIK2JQWmpueVltZnNGc1ZvNlkxdVI5KzJxejlIem1neiszNlY3NDdkcWIrVWkrS0paSm1xU1gwOFd1eWRpVzRhMlA5RTc4YmNFbGtkd1UxQm9HcGM1Ykxzam5pZ0IwYWtCTGwzRmx3VmxHRzJPNU9QNDQwSDJWcEZuamZJdHNVMFFKK0U0eUIva0c4RWhJYjlqWXd1a0kyYXZIYndiaVA3YkdHdzlxL1FyQVRONE5Eemw3bzZNTGNVRld6SUdndllCeW5vN3ZPOHFhbmpOblZxcU1lY1FzU2d3NW1lV2xNZXpMWW1vandTeU9LVjNIQkJmMEltT05kNXRKZ05sMWlTUHRyZXNCYjhBTDJXN3M2RC9OVUhIZzNBS1pPNnVaZm1qSUV3ZG5DQlFwaFN0eDhMaFZjQmlBYXF0ZmdnWDlpZW0zRmc2NTZsT2hqODMrNVlxalZzaU9UVjd2bHovSGErMFJlam5sVVpyYnZhSVBXZDJwanRYUUc3WFhLRG1HbzI1dmRuS2tsdHRiTHBtR2VDOWlmRGRLMW9KZGtoK2lUcHdCL21temJwK043d2lFYjEvb1VFRzlrSGFIaUEwYjEzSWNORytBSGNCS1pTOTFRMVNpYzQyYVZ1MXZYLzV0NFlJdzJJSTJGeklqSE56UWJYMENJN2tCVXVYL1RqUmoyd2FueURNMXFWdWl0cXhPenFXRGtxcWQ5ekJoNEp6dFhSZzFGZUIyLzIxVnlCYm9jMHlXa21DQWFZN3JQQnR1NUpjWVFYbmRTM05MVDlXRUh2eHRRWHFhbUJTZ0hDRVAwQVViM1ZyQjRlSk5EL0M2dEZyaDhNOVNPdzRTZXlmZCtPa1QyT2JPU3J6N2ZSSklZdnRMMVFmMytmK1JvbC9YQnQxNGJ1Q1RPRGN3UitLQUREdFJHVUhNR3I0S0ovTFRVZFFNMEhDYmgyRkxZQ2dLT0xMZ2ZRT21uY2tjcGZ6dy81ZTBpN3F6Vjh1bjg3NnFPWmdvaUlhRjRjSGZTT2kwSTFsS3R3Z0hqc0Vrc08zUWl1bklOODlzTUNYcE4rait0UHNlU1YySktERW5HWk5wZDdUYTRGZWFYa3Jia2phL2dlVGxPNWg4bHJoNmhobWthR1FnUVhQMUp2eFZaekcxK3BKOEFEZlJKR25PckpxQnRKSTlkUFVaZ0cwenl3ZnY4SCIKCQkJbmFycmF0aXZlOlRvb2xCdWlsZFZlcnNpb249Ijc5NmVhNTUiCgkJCWV4aWY6RGF0ZVRpbWVPcmlnaW5hbD0iMjAyNC0xMS0yOVQxODowOToyMi40IgoJCQl0aWZmOk9yaWVudGF0aW9uPSI4IgoJCQljcnM6QXV0b0xhdGVyYWxDQT0iMSIKCQkJY3JzOkJsYWNrczIwMTI9IjU5IgoJCQljcnM6Qmx1ZUh1ZT0iLTUiCgkJCWNyczpCbHVlU2F0dXJhdGlvbj0iLTEwIgoJCQljcnM6QnJpZ2h0bmVzcz0iNTAiCgkJCWNyczpDYW1lcmFQcm9maWxlPSJBZG9iZSBTdGFuZGFyZCIKCQkJY3JzOkNhbWVyYVByb2ZpbGVEaWdlc3Q9IjQ0MUY2OEJENkJDMzM2OUI1OTI1NkIxMDNDRTJDRDVDIgoJCQljcnM6Q2xhcml0eTIwMTI9Ii0yNSIKCQkJY3JzOkNvbG9yR3JhZGVCbGVuZGluZz0iMTAwIgoJCQljcnM6Q29sb3JHcmFkZUdsb2JhbEh1ZT0iMCIKCQkJY3JzOkNvbG9yR3JhZGVHbG9iYWxMdW09IjAiCgkJCWNyczpDb2xvckdyYWRlR2xvYmFsU2F0PSIwIgoJCQljcnM6Q29sb3JHcmFkZUhpZ2hsaWdodEx1bT0iMCIKCQkJY3JzOkNvbG9yR3JhZGVNaWR0b25lSHVlPSIwIgoJCQljcnM6Q29sb3JHcmFkZU1pZHRvbmVMdW09IjAiCgkJCWNyczpDb2xvckdyYWRlTWlkdG9uZVNhdD0iMCIKCQkJY3JzOkNvbG9yR3JhZGVTaGFkb3dMdW09IjAiCgkJCWNyczpDb2xvck5vaXNlUmVkdWN0aW9uPSIyNSIKCQkJY3JzOkNvbnRyYXN0PSIyNSIKCQkJY3JzOkNvbnRyYXN0MjAxMj0iLTE1IgoJCQljcnM6Q29udmVydFRvR3JheXNjYWxlPSJGYWxzZSIKCQkJY3JzOkN1cnZlUmVmaW5lU2F0dXJhdGlvbj0iMTAwIgoJCQljcnM6RGVmcmluZ2VHcmVlbkFtb3VudD0iMCIKCQkJY3JzOkRlZnJpbmdlR3JlZW5IdWVIaT0iNjAiCgkJCWNyczpEZWZyaW5nZUdyZWVuSHVlTG89IjQwIgoJCQljcnM6RGVmcmluZ2VQdXJwbGVBbW91bnQ9IjAiCgkJCWNyczpEZWZyaW5nZVB1cnBsZUh1ZUhpPSI3MCIKCQkJY3JzOkRlZnJpbmdlUHVycGxlSHVlTG89IjMwIgoJCQljcnM6RXhwb3N1cmU9IjAiCgkJCWNyczpFeHBvc3VyZTIwMTI9IjAuNDAwMDAwIgoJCQljcnM6R3JhaW5BbW91bnQ9IjI1IgoJCQljcnM6R3JhaW5TZWVkPSIzNjgwNDQ4Njk3IgoJCQljcnM6R3JhaW5TaXplPSIyNSIKCQkJY3JzOkdyZWVuSHVlPSI1NSIKCQkJY3JzOkdyZWVuU2F0dXJhdGlvbj0iLTEwIgoJCQljcnM6SERSRWRpdE1vZGU9IjAiCgkJCWNyczpIRFJNYXhWYWx1ZT0iNCIKCQkJY3JzOkhpZ2hsaWdodHMyMDEyPSItNjYiCgkJCWNyczpIdWVBZGp1c3RtZW50QXF1YT0iMjQiCgkJCWNyczpIdWVBZGp1c3RtZW50Qmx1ZT0iLTEiCgkJCWNyczpIdWVBZGp1c3RtZW50R3JlZW49Ii0zNSIKCQkJY3JzOkh1ZUFkanVzdG1lbnRNYWdlbnRhPSIzMCIKCQkJY3JzOkh1ZUFkanVzdG1lbnRPcmFuZ2U9IjUiCgkJCWNyczpIdWVBZGp1c3RtZW50UHVycGxlPSItNTIiCgkJCWNyczpIdWVBZGp1c3RtZW50UmVkPSItOSIKCQkJY3JzOkh1ZUFkanVzdG1lbnRZZWxsb3c9Ii0xNSIKCQkJY3JzOkxlbnNNYW51YWxEaXN0b3J0aW9uQW1vdW50PSIwIgoJCQljcnM6TGVuc1Byb2ZpbGVEaWdlc3Q9IkQzQTc2NTYwMjQ4QTY4N0I2Q0JFMzg4QjQxRTBDNjIwIgoJCQljcnM6TGVuc1Byb2ZpbGVEaXN0b3J0aW9uU2NhbGU9IjEwMCIKCQkJY3JzOkxlbnNQcm9maWxlRW5hYmxlPSIxIgoJCQljcnM6TGVuc1Byb2ZpbGVGaWxlbmFtZT0iQ2Fub24gKENhbm9uIFJGIDI4LTcwbW0gRjIgTCBVU00pIC0gUkFXLmxjcCIKCQkJY3JzOkxlbnNQcm9maWxlSXNFbWJlZGRlZD0iRmFsc2UiCgkJCWNyczpMZW5zUHJvZmlsZU5hbWU9IkFkb2JlIChDYW5vbiBSRiAyOC03MG1tIEYyIEwgVVNNKSIKCQkJY3JzOkxlbnNQcm9maWxlU2V0dXA9IkxlbnNEZWZhdWx0cyIKCQkJY3JzOkxlbnNQcm9maWxlVmlnbmV0dGluZ1NjYWxlPSIxMDAiCgkJCWNyczpMdW1pbmFuY2VBZGp1c3RtZW50QXF1YT0iLTI3IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudEJsdWU9Ii0yMiIKCQkJY3JzOkx1bWluYW5jZUFkanVzdG1lbnRHcmVlbj0iLTM1IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudE9yYW5nZT0iLTEzIgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFB1cnBsZT0iLTE1IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFJlZD0iLTE1IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFllbGxvdz0iLTIzIgoJCQljcnM6THVtaW5hbmNlTm9pc2VSZWR1Y3Rpb25Db250cmFzdD0iMCIKCQkJY3JzOk92ZXJyaWRlTG9va1ZpZ25ldHRlPSJUcnVlIgoJCQljcnM6UGFyYW1ldHJpY0hpZ2hsaWdodHM9Ii0xOCIKCQkJY3JzOlBhcmFtZXRyaWNNaWR0b25lU3BsaXQ9IjQ4IgoJCQljcnM6UGFyYW1ldHJpY1NoYWRvd1NwbGl0PSIyMCIKCQkJY3JzOlBlcnNwZWN0aXZlSG9yaXpvbnRhbD0iMCIKCQkJY3JzOlBlcnNwZWN0aXZlUm90YXRlPSIwIgoJCQljcnM6UGVyc3BlY3RpdmVTY2FsZT0iMTAwIgoJCQljcnM6UGVyc3BlY3RpdmVWZXJ0aWNhbD0iMCIKCQkJY3JzOlBlcnNwZWN0aXZlWD0iMCIKCQkJY3JzOlBlcnNwZWN0aXZlWT0iMCIKCQkJY3JzOlByb2Nlc3NWZXJzaW9uPSIxNS40IgoJCQljcnM6UmVkSHVlPSIyNSIKCQkJY3JzOlJlZFNhdHVyYXRpb249IjMwIgoJCQljcnM6U0RSQmxlbmQ9IjAiCgkJCWNyczpTRFJCcmlnaHRuZXNzPSIwIgoJCQljcnM6U0RSQ2xhcml0eT0iMCIKCQkJY3JzOlNEUkNvbnRyYXN0PSIwIgoJCQljcnM6U0RSSGlnaGxpZ2h0cz0iMCIKCQkJY3JzOlNEUlNoYWRvd3M9IjAiCgkJCWNyczpTRFJXaGl0ZXM9IjAiCgkJCWNyczpTYXR1cmF0aW9uPSIwIgoJCQljcnM6U2F0dXJhdGlvbkFkanVzdG1lbnRBcXVhPSItMzkiCgkJCWNyczpTYXR1cmF0aW9uQWRqdXN0bWVudEJsdWU9Ii0zNSIKCQkJY3JzOlNhdHVyYXRpb25BZGp1c3RtZW50R3JlZW49Ii00MyIKCQkJY3JzOlNhdHVyYXRpb25BZGp1c3RtZW50TWFnZW50YT0iLTMyIgoJCQljcnM6U2F0dXJhdGlvbkFkanVzdG1lbnRPcmFuZ2U9Ii0zMCIKCQkJY3JzOlNhdHVyYXRpb25BZGp1c3RtZW50UHVycGxlPSItNDEiCgkJCWNyczpTYXR1cmF0aW9uQWRqdXN0bWVudFJlZD0iLTI1IgoJCQljcnM6U2F0dXJhdGlvbkFkanVzdG1lbnRZZWxsb3c9Ii00NiIKCQkJY3JzOlNoYWRvd1RpbnQ9Ii00IgoJCQljcnM6U2hhZG93cz0iNSIKCQkJY3JzOlNoYWRvd3MyMDEyPSI3MSIKCQkJY3JzOlNoYXJwZW5EZXRhaWw9IjI1IgoJCQljcnM6U2hhcnBlbkVkZ2VNYXNraW5nPSI1MCIKCQkJY3JzOlNoYXJwZW5SYWRpdXM9IjEiCgkJCWNyczpTaGFycG5lc3M9Ijc1IgoJCQljcnM6U3BsaXRUb25pbmdCYWxhbmNlPSIxMiIKCQkJY3JzOlNwbGl0VG9uaW5nSGlnaGxpZ2h0SHVlPSI1MCIKCQkJY3JzOlNwbGl0VG9uaW5nU2hhZG93SHVlPSI0NCIKCQkJY3JzOlNwbGl0VG9uaW5nU2hhZG93U2F0dXJhdGlvbj0iMTAiCgkJCWNyczpUZW1wZXJhdHVyZT0iNTYwOCIKCQkJY3JzOlRleHR1cmU9Ii0xMCIKCQkJY3JzOlRpbnQ9IjEyIgoJCQljcnM6VG9uZUN1cnZlTmFtZTIwMTI9IkN1c3RvbSIKCQkJY3JzOlVwcmlnaHRDZW50ZXJNb2RlPSIwIgoJCQljcnM6VXByaWdodENlbnRlck5vcm1YPSIwLjUwMDAwMCIKCQkJY3JzOlVwcmlnaHRDZW50ZXJOb3JtWT0iMC41MDAwMDAiCgkJCWNyczpVcHJpZ2h0Rm9jYWxMZW5ndGgzNW1tPSIzNSIKCQkJY3JzOlVwcmlnaHRGb2NhbE1vZGU9IjAiCgkJCWNyczpVcHJpZ2h0Rm91clNlZ21lbnRzQ291bnQ9IjAiCgkJCWNyczpVcHJpZ2h0UHJldmlldz0iRmFsc2UiCgkJCWNyczpVcHJpZ2h0VHJhbnNmb3JtQ291bnQ9IjYiCgkJCWNyczpVcHJpZ2h0VmVyc2lvbj0iMTUxMzg4MTYwIgoJCQljcnM6VmVyc2lvbj0iMTcuMCIKCQkJY3JzOlZpYnJhbmNlPSI0MCIKCQkJY3JzOldoaXRlQmFsYW5jZT0iQ3VzdG9tIgoJCQljcnM6V2hpdGVzMjAxMj0iLTY2Ij4KCQkJPGNyczpUb25lQ3VydmVQVjIwMTI+CgkJCQk8cmRmOlNlcT4KCQkJCQk8cmRmOmxpPjQsIDQ8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjQ2LCAzMzwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+ODEsIDc2PC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4xMzYsIDEzMzwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+MTk4LCAxOTU8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjI1NSwgMjU1PC9yZGY6bGk+CgkJCQk8L3JkZjpTZXE+CgkJCTwvY3JzOlRvbmVDdXJ2ZVBWMjAxMj4KCQkJPGNyczpUb25lQ3VydmVQVjIwMTJCbHVlPgoJCQkJPHJkZjpTZXE+CgkJCQkJPHJkZjpsaT4wLCAwPC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4yNywgMTI8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjc2LCA2MzwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+MTE0LCAxMjA8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjE3MSwgMTk3PC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4yNTUsIDI1NTwvcmRmOmxpPgoJCQkJPC9yZGY6U2VxPgoJCQk8L2NyczpUb25lQ3VydmVQVjIwMTJCbHVlPgoJCQk8Y3JzOlRvbmVDdXJ2ZVBWMjAxMkdyZWVuPgoJCQkJPHJkZjpTZXE+CgkJCQkJPHJkZjpsaT4wLCAwPC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4zMywgMTM8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjgwLCA2NTwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+MTE0LCAxMjA8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjE3NSwgMjAxPC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4yNTUsIDI1NTwvcmRmOmxpPgoJCQkJPC9yZGY6U2VxPgoJCQk8L2NyczpUb25lQ3VydmVQVjIwMTJHcmVlbj4KCQkJPGNyczpUb25lQ3VydmVQVjIwMTJSZWQ+CgkJCQk8cmRmOlNlcT4KCQkJCQk8cmRmOmxpPjAsIDA8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjMzLCAxMTwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+ODEsIDYzPC9yZGY6bGk+CgkJCQkJPHJkZjpsaT4xMTYsIDEyMTwvcmRmOmxpPgoJCQkJCTxyZGY6bGk+MTc1LCAxOTg8L3JkZjpsaT4KCQkJCQk8cmRmOmxpPjI1NSwgMjU1PC9yZGY6bGk+CgkJCQk8L3JkZjpTZXE+CgkJCTwvY3JzOlRvbmVDdXJ2ZVBWMjAxMlJlZD4KCQk8L3JkZjpEZXNjcmlwdGlvbj4KCTwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cg==\"}, {\"id\": \"1e2e86de-6729-4091-bc65-01bd2c451758\", \"body\": \"PHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAiPgoJPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KCQk8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgoJCQkJeG1sbnM6bmFycmF0aXZlPSJodHRwOi8vbnMubmFycmF0aXZlLnNvL25hcnJhdGl2ZV9zZWxlY3QvMS4wLyIKCQkJCXhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIgoJCQkJeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCgkJCQl4bWxuczpjcnM9Imh0dHA6Ly9ucy5hZG9iZS5jb20vY2FtZXJhLXJhdy1zZXR0aW5ncy8xLjAvIgoJCQluYXJyYXRpdmU6TGFzdERldmVsb3BlZD0iMjAyNS0wMy0yMFQxNTowNjowMC44MDFaIgoJCQluYXJyYXRpdmU6TGFzdE1vZGlmaWVkPSIyMDI1LTAzLTAxVDIzOjU3OjQ3WiIKCQkJbmFycmF0aXZlOkRldmVsb3BTZXR0aW5ncz0iZlZaZGM1czZFUDBySHA3dW5jRWVFQVpqdi9rejZZemRaa3lhM3N5ZCs2QVkyZEVOU0s0UStXaW4vNzByQ2JBZ3BBOGszbk8wSzJsMWRxV2Z6cnlVZklzbEVUaGJ6cDJaN3pxTERCK2VDdVQ1eUprRlNOa2x1UzZKTXh2NnNiRVNMRXVCSmVXc0JnVTlQVXBHaXNLWmhaN3JMSEVPQVc4RVA5SU1ISjE1eWgvSUlKR1lwVmlrVG1mQWlwNUlJV0hZZU94dm9uaXhpaGJMSUlpbWkzQ0t3bWpoZThGeWpaYXJjS2tjTXl5b2ZET3JHL3BxTHA1eGNTVndTaFlaWVNsbEo5aUYxeUt1TXY2QU03MkhIbnhiNXIwNDdMS0RYOE11TTdWVDdSTGExSTZta2pPVHB5RHVZZDdQVWhGNkdtUVR5U05PK1l0MnFQSFBuQlprVDlMeVlMS085T1JNQ3F3U1oxdFZaaXJvbVFoNXl5SHFXM0hBNmlpT09Dc0lVS1Y0aG5oSHlscUhxZk8ySWtjQldTUlhnaEEyejNuSlRCNWFPR3owbWpxenFBZmZjbWMydHZDYlVwd3owaFBJRUZXa1NSK2hRZ1ZBckYvUHZDaUZPYi9hTUR2MVJqRnNGWFpJMlVhUTd5VmhoemR3cXJHRS9pQW1RZlh5elBsb3E2MWpDSDI5MnE5VEtuYzhOVk9CdmNPdmR6aFRibU93YXdFVWpRRFZxSkxNMC8vTFF1YUV5Zm4zRWtNaVVRZGU2QkRETHF5WEFYallEYlBESi9pTHRjcGFoTW1ObW5yU1lVQWU5VFpzK0o1a0dYOVJjOFBrVzhJS1dJcHdaajkvR1d1SFdZbXpGUzBrRnlvVDFqa3B1bHVpcTJBK2ljTElRK040SHNXVFJiUmNySU00WG96OXRiZU1rT2QwM09xd2laR2Z6cGMxWU0zd2c4WmI2QVkrQmgwQzVsdGl4dG5nTC9OdnZ4bWdlRGp4OG55d1FZUHQ0R3V5KzNzd0hPem4zMGJaNGR5ZStsT3h6aDlJbXFxa1ZLSzMyTThtdXVsTGY0amVqcGtRV1o3QlRVR2dWVnhtc21pUHVLTW5ScVFFRWJjMlhPYVVZWFo0SnhQVXl4bXQrUDJPbFdLVXdIdllMd0pEL1NnWjlQT05lbEIvOUl1R2VzaGFTV043MmUzT1pQVWthMHlTY3k0ZlRXY0cvQXQwSlVGVHFHNytWQ1hzMHBsdXNJQ3prWUllVmxnOEZTWVBGL0JTZ1YxbVc2R2hEWnBXV284bG9qZ1RXT2N6dWVhQy9vQzE0a3dyM1dMMlhHSkp1cWg5bWhaOEIrMlZIdDRIK2FjTDNCdUFVeVoxUHk5TUFZSnFEbkJwUXBoQ055SEhEMGRqVUJUa2MvMUdQckVqTitQQTFwMUxsVEQ4YnJWczJHK3kydXU3VDAraURPczZOa2gxYlRabWMwekd0ck5xa0NaeHh2ejJTQ1dwTEx0cGhyYmRWZmRIYktYdkQ5aTZKZnBlUDk5MFJuM0g5WTFvRlVIZmdLWUtJcjkvZ0M2REQ1eWJmcXBLMEtUcGxqS2orQ1pyRFZXL293d2d6b1N0aU1RME0zZFNCYTNURTluaDRrbFhDR3JnUFU1cHFiUTdxakZ6cEtyK2tuTkc0V1puNExMQW1Tb3lNK2tGYnM1VUsyZjhBZmxPU3BjeFpnUEdHL1V3WGRkYmtwL2hVU2YxUFIwRzZwYTlKYS9HSENxanpoSUVJZm9Cb3Jxd3lRODhTT0NteUIyTHZMa3oxTCtlNjdud0RrVlRONHBjT0RIZm43bys5QzgvVnAvdm9qQlUzMy92ZkkzT2pQL1VuYm9UNUliZzdxa3ZjbjBWNmsvdWxSQ05mK0RHN2lSMm93QjhFWHl4NjBNNFA0NCs5dGNpMHQ2UWZFalFKSFJoNkJRV0QxM0VuNmpGSTh2NzYxbFg3UklrUmtUekFtbWhuN25JVldzWmhUM0VmWnZZY09oTGNET2Q1R01RNXJtUm9NMTFwOWp3VWlUa3BDUmVMSnMzUUVYZUNQSk15VXZUcFN2NEZpcXRPTUxrbFVQVU1FMUw4ME1mM2dlK2VpaGFiVzR5UW5EV2QvUkJHT2txZmVnZTA0ajVvZ2pUZTZvSFY0eCsvUVkiCgkJCW5hcnJhdGl2ZTpUb29sQnVpbGRWZXJzaW9uPSI3OTZlYTU1IgoJCQlleGlmOkRhdGVUaW1lT3JpZ2luYWw9IjIwMjUtMDMtMDFUMTc6NTc6NDYuNzciCgkJCXRpZmY6T3JpZW50YXRpb249IjgiCgkJCWNyczpBdXRvTGF0ZXJhbENBPSIxIgoJCQljcnM6QmxhY2tzMjAxMj0iMzIiCgkJCWNyczpCbHVlSHVlPSItMTgiCgkJCWNyczpCbHVlU2F0dXJhdGlvbj0iLTE4IgoJCQljcnM6QnJpZ2h0bmVzcz0iNTAiCgkJCWNyczpDYW1lcmFQcm9maWxlPSJBZG9iZSBTdGFuZGFyZCIKCQkJY3JzOkNhbWVyYVByb2ZpbGVEaWdlc3Q9IjQ0MUY2OEJENkJDMzM2OUI1OTI1NkIxMDNDRTJDRDVDIgoJCQljcnM6Q2xhcml0eTIwMTI9Ii0xMCIKCQkJY3JzOkNvbG9yR3JhZGVCbGVuZGluZz0iMTAwIgoJCQljcnM6Q29sb3JHcmFkZUdsb2JhbEh1ZT0iMCIKCQkJY3JzOkNvbG9yR3JhZGVHbG9iYWxMdW09IjAiCgkJCWNyczpDb2xvckdyYWRlR2xvYmFsU2F0PSIwIgoJCQljcnM6Q29sb3JHcmFkZUhpZ2hsaWdodEx1bT0iNSIKCQkJY3JzOkNvbG9yR3JhZGVNaWR0b25lSHVlPSIzOCIKCQkJY3JzOkNvbG9yR3JhZGVNaWR0b25lTHVtPSIwIgoJCQljcnM6Q29sb3JHcmFkZU1pZHRvbmVTYXQ9IjIiCgkJCWNyczpDb2xvckdyYWRlU2hhZG93THVtPSIyIgoJCQljcnM6Q29sb3JOb2lzZVJlZHVjdGlvbj0iMjUiCgkJCWNyczpDb250cmFzdD0iMjUiCgkJCWNyczpDb250cmFzdDIwMTI9Ii0yNSIKCQkJY3JzOkNvbnZlcnRUb0dyYXlzY2FsZT0iRmFsc2UiCgkJCWNyczpDdXJ2ZVJlZmluZVNhdHVyYXRpb249IjEwMCIKCQkJY3JzOkRlZnJpbmdlR3JlZW5BbW91bnQ9IjAiCgkJCWNyczpEZWZyaW5nZUdyZWVuSHVlSGk9IjYwIgoJCQljcnM6RGVmcmluZ2VHcmVlbkh1ZUxvPSI0MCIKCQkJY3JzOkRlZnJpbmdlUHVycGxlQW1vdW50PSIwIgoJCQljcnM6RGVmcmluZ2VQdXJwbGVIdWVIaT0iNzAiCgkJCWNyczpEZWZyaW5nZVB1cnBsZUh1ZUxvPSIzMCIKCQkJY3JzOkV4cG9zdXJlPSIwIgoJCQljcnM6RXhwb3N1cmUyMDEyPSIwLjg1MDAwMCIKCQkJY3JzOkdyYWluRnJlcXVlbmN5PSIzNSIKCQkJY3JzOkdyYWluU2l6ZT0iMjUiCgkJCWNyczpHcmVlbkh1ZT0iMzgiCgkJCWNyczpHcmVlblNhdHVyYXRpb249Ii0xMCIKCQkJY3JzOkhEUkVkaXRNb2RlPSIwIgoJCQljcnM6SERSTWF4VmFsdWU9IjQiCgkJCWNyczpIaWdobGlnaHRzMjAxMj0iLTEwMCIKCQkJY3JzOkh1ZUFkanVzdG1lbnRBcXVhPSIxMiIKCQkJY3JzOkh1ZUFkanVzdG1lbnRCbHVlPSItMiIKCQkJY3JzOkh1ZUFkanVzdG1lbnRHcmVlbj0iLTUwIgoJCQljcnM6SHVlQWRqdXN0bWVudE1hZ2VudGE9IjUiCgkJCWNyczpIdWVBZGp1c3RtZW50UHVycGxlPSItMTciCgkJCWNyczpIdWVBZGp1c3RtZW50UmVkPSItMTAiCgkJCWNyczpIdWVBZGp1c3RtZW50WWVsbG93PSItMjIiCgkJCWNyczpMZW5zTWFudWFsRGlzdG9ydGlvbkFtb3VudD0iMCIKCQkJY3JzOkxlbnNQcm9maWxlRGlnZXN0PSJEM0E3NjU2MDI0OEE2ODdCNkNCRTM4OEI0MUUwQzYyMCIKCQkJY3JzOkxlbnNQcm9maWxlRGlzdG9ydGlvblNjYWxlPSIxMDAiCgkJCWNyczpMZW5zUHJvZmlsZUVuYWJsZT0iMSIKCQkJY3JzOkxlbnNQcm9maWxlRmlsZW5hbWU9IkNhbm9uIChDYW5vbiBSRiAyOC03MG1tIEYyIEwgVVNNKSAtIFJBVy5sY3AiCgkJCWNyczpMZW5zUHJvZmlsZUlzRW1iZWRkZWQ9IkZhbHNlIgoJCQljcnM6TGVuc1Byb2ZpbGVOYW1lPSJBZG9iZSAoQ2Fub24gUkYgMjgtNzBtbSBGMiBMIFVTTSkiCgkJCWNyczpMZW5zUHJvZmlsZVNldHVwPSJMZW5zRGVmYXVsdHMiCgkJCWNyczpMZW5zUHJvZmlsZVZpZ25ldHRpbmdTY2FsZT0iMTAwIgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudEFxdWE9IjIiCgkJCWNyczpMdW1pbmFuY2VBZGp1c3RtZW50Qmx1ZT0iMTAiCgkJCWNyczpMdW1pbmFuY2VBZGp1c3RtZW50R3JlZW49IjM1IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudE9yYW5nZT0iLTE1IgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFB1cnBsZT0iLTIwIgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFJlZD0iLTEwIgoJCQljcnM6THVtaW5hbmNlQWRqdXN0bWVudFllbGxvdz0iNDIiCgkJCWNyczpMdW1pbmFuY2VOb2lzZVJlZHVjdGlvbkNvbnRyYXN0PSIyIgoJCQljcnM6THVtaW5hbmNlU21vb3RoaW5nPSIxMiIKCQkJY3JzOk92ZXJyaWRlTG9va1ZpZ25ldHRlPSJGYWxzZSIKCQkJY3JzOlBhcmFtZXRyaWNEYXJrcz0iMTAiCgkJCWNyczpQYXJhbWV0cmljSGlnaGxpZ2h0cz0iMTAiCgkJCWNyczpQYXJhbWV0cmljTGlnaHRzPSI1IgoJCQljcnM6UGFyYW1ldHJpY1NoYWRvd3M9IjEwIgoJCQljcnM6UGVyc3BlY3RpdmVIb3Jpem9udGFsPSIwIgoJCQljcnM6UGVyc3BlY3RpdmVSb3RhdGU9IjAiCgkJCWNyczpQZXJzcGVjdGl2ZVNjYWxlPSIxMDAiCgkJCWNyczpQZXJzcGVjdGl2ZVZlcnRpY2FsPSIwIgoJCQljcnM6UGVyc3BlY3RpdmVYPSIwIgoJCQljcnM6UGVyc3BlY3RpdmVZPSIwIgoJCQljcnM6UHJvY2Vzc1ZlcnNpb249IjE1LjQiCgkJCWNyczpSZWRIdWU9IjIyIgoJCQljcnM6UmVkU2F0dXJhdGlvbj0iMTUiCgkJCWNyczpTRFJCbGVuZD0iMCIKCQkJY3JzOlNEUkJyaWdodG5lc3M9IjAiCgkJCWNyczpTRFJDbGFyaXR5PSIwIgoJCQljcnM6U0RSQ29udHJhc3Q9IjAiCgkJCWNyczpTRFJIaWdobGlnaHRzPSIwIgoJCQljcnM6U0RSU2hhZG93cz0iMCIKCQkJY3JzOlNEUldoaXRlcz0iMCIKCQkJY3JzOlNhdHVyYXRpb249Ii01IgoJCQljcnM6U2F0dXJhdGlvbkFkanVzdG1lbnRBcXVhPSItNSIKCQkJY3JzOlNhdHVyYXRpb25BZGp1c3RtZW50Qmx1ZT0iMTUiCgkJCWNyczpTYXR1cmF0aW9uQWRqdXN0bWVudEdyZWVuPSItMTAiCgkJCWNyczpTYXR1cmF0aW9uQWRqdXN0bWVudE1hZ2VudGE9Ii0yNSIKCQkJY3JzOl\u0000",
  "clusters": "[[\"00bdf805-21e6-4deb-9e1d-78fc29e80d69\"], [\"016459f8-cfbb-44bb-819b-c2c5ff12db30\", \"1e2e86de-6729-4091-bc65-01bd2c451758\", \"325a0ff5-51f4-4b97-97a2-44a9a7ecbe70\", \"d41f5eca-049b-421a-860d-fa64d4fe89fb\", \"f4fbe435-6aca-4b89-97d5-313af400ca3c\"], [\"0ab67d2c-34e2-4213-ae98-157c3bde8819\"], [\"1e09ada7-1b47-4b71-8cb1-7203b4415355\"], [\"2044a59a-397c-414f-9f1b-7e5e876cb8f6\"], [\"25a6e419-b26c-4dfc-92dd-570d445a7257\", \"2938225d-e5cc-48b7-a3d4-36729bbc0513\", \"5c6adbd5-9e6e-479f-80b2-8763a2c142d8\", \"b16ba577-008e-4627-a5d6-c8c7c1c2dd2e\"], [\"36759989-22ea-4a71-b2ad-92fb3d14444d\", \"4542b503-5e63-4193-a611-48987f9dc807\"], [\"3c2c113e-7a75-4652-af83-762f21b29b77\", \"f72b7448-8d6d-4cd7-91b6-40c2aa1db10b\"], [\"3f52a3ef-6ab6-4238-b204-c0eeaa4fda1a\"], [\"3faf1cca-b1ab-4533-9ba0-b4a9641c250b\"], [\"48624180-1c85-4e3c-8fc1-05ed36d36a6a\", \"52ceaeb1-d812-48b9-9a22-b79ff5e28b1a\"], [\"4965b3ef-58d2-4231-aa85-b66f1ce70876\", \"af2d259e-197f-44ae-8477-a020e784f3a9\"], [\"49c7eaa1-3b84-46b6-8d15-ec8afd6613f9\", \"5c1d9d64-23a7-4059-96d6-204421377193\", \"ac2974ff-dc43-4a36-9bc4-c0f03e26b6f8\", \"cf8d0564-3aa6-41b9-a062-b439aa5cf4ec\", \"d1ecf1ec-cf35-45c5-bf79-f0b56affe501\"], [\"4eb2b76b-2ca0-4b51-b8d5-820c30458240\"], [\"61ef668d-50be-446c-baa5-fc1b8e6a76df\"], [\"638d9d10-4bc0-4e71-ae5e-62bfcc43de3f\"], [\"644f7e33-908b-4774-b05b-e1388aa4f30a\", \"8de04eda-1d59-42d9-8f42-d54bb2f3b361\"], [\"6afde22b-61b6-43d4-a6bb-09a57eeb7f05\"], [\"71b0cab5-87af-412f-a11c-fab6b121fa9f\"], [\"71c2b287-ec09-48a5-a963-351d1e00941a\"], [\"751f2d80-cb9f-4f46-bbd5-3d434e9c5052\"], [\"8193f958-0c4b-471a-b68b-61128687e46d\"], [\"8d23bcd9-8bf4-4cdd-9ed3-733e59d6aafd\"], [\"8f1d5a32-ab29-43ec-8258-dd89b2e131a9\"], [\"9f25fc25-44a9-4837-86ff-82e0c56cc206\"], [\"a24274a4-ca49-4dcd-9b2d-9feec28e018f\"], [\"a535a6d8-9628-400b-8bab-784699196179\"], [\"aad6a7d5-35e3-4538-99fe-0da9d044ee79\", \"caf5b116-76f5-4ef8-9988-a24a5b2e1c45\"], [\"ae4a2e4c-cb67-4b0e-ad5d-f6e520ca3f72\"], [\"ae840b33-2953-4cb0-a772-51812002cee6\"], [\"b57dacad-b137-45d9-a666-164b3150244f\"], [\"bf899a8e-6402-4109-be0e-f8d919fb8184\"], [\"c05737c5-1759-4fa8-b377-d1d13c6d8a79\"], [\"c5732998-fb01-4618-8c2e-67fd22399e21\"], [\"c89a20c1-15df-446b-b476-cd425796ba2e\"], [\"f047aa67-c42d-46ac-9eb5-b869e084d79c\"], [\"fd7ad908-dbac-4abc-ba98-6b323c2452ad\"]]",
  "inserted_at": "2025-03-27 02:30:16.468114",
  "updated_at": "2025-03-27 02:36:49.705086",
  "_rescued_data": null
}
```

---

## narrative.core.inference_groups

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| id             | `StringType()`    | True     |
| account_id     | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "66f06e88-14c9-4c3d-a0af-455b66d9dd94",
  "account_id": "9c8c67e3-4e62-41e1-ab9e-da0f7913b95d",
  "inserted_at": "2025-06-24 08:08:12",
  "updated_at": "2025-06-24 08:08:12",
  "_rescued_data": null
}
```

---

## narrative.core.inferences

### Schema

| Column             | Type           | Nullable |
| ------------------ | -------------- | -------- |
| Op                 | `StringType()` | True     |
| narrative_image_id | `StringType()` | True     |
| id                 | `StringType()` | True     |
| inference_group_id | `StringType()` | True     |
| account_id         | `StringType()` | True     |
| \_rescued_data     | `StringType()` | True     |

### Sample Row

```json
{
  "Op": "I",
  "narrative_image_id": "360b2e9d-76e8-4140-813a-1391da002627",
  "id": "ba436756-bf09-4397-9922-55dabb09242f",
  "inference_group_id": "7e45db12-ff75-423e-8adc-bcda70e8bb8a",
  "account_id": "88757d3e-bcc9-45cc-99a2-78369318372a",
  "_rescued_data": null
}
```

---

## narrative.core.packs

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| id              | `StringType()`    | True     |
| stripe_price_id | `StringType()`    | True     |
| description     | `StringType()`    | True     |
| name            | `StringType()`    | True     |
| slug            | `StringType()`    | True     |
| credits         | `IntegerType()`   | True     |
| inserted_at     | `TimestampType()` | True     |
| updated_at      | `TimestampType()` | True     |
| is_sale         | `StringType()`    | True     |
| is_secret       | `StringType()`    | True     |
| \_rescued_data  | `StringType()`    | True     |

### Sample Row

```json
{
  "id": "10a5ece4-66b6-4d55-980e-26efb4ec0159",
  "stripe_price_id": "price_1QIJQpGyxyMEWHozJAnaTgdk",
  "description": "Usually $90 USD",
  "name": "1500 credit pack",
  "slug": "edit_bf_amb_1500",
  "credits": 1500,
  "inserted_at": "2024-11-25 09:44:03",
  "updated_at": "2024-11-25 09:44:03",
  "is_sale": "true",
  "is_secret": "true",
  "_rescued_data": null
}
```

---

## narrative.core.plans

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| Op                | `StringType()`    | True     |
| id                | `StringType()`    | True     |
| name              | `StringType()`    | True     |
| stripe_product_id | `StringType()`    | True     |
| monthly_plan_id   | `StringType()`    | True     |
| yearly_plan_id    | `StringType()`    | True     |
| inserted_at       | `TimestampType()` | True     |
| updated_at        | `TimestampType()` | True     |
| status            | `StringType()`    | True     |
| status_label      | `StringType()`    | True     |
| default_free      | `StringType()`    | True     |
| slug              | `StringType()`    | True     |
| trial_period_days | `IntegerType()`   | True     |
| \_rescued_data    | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "2db637e8-fa0c-4f0e-9645-a4da83cc9bff",
  "name": "Publish Beta",
  "stripe_product_id": "prod_K32D875E2IdMZF",
  "monthly_plan_id": "plan_K32D7wP9zYfnSN",
  "yearly_plan_id": "plan_K32DW796MUScUG",
  "inserted_at": "2021-08-16 03:05:39",
  "updated_at": "2021-10-06 01:51:48",
  "status": "grandfathered",
  "status_label": null,
  "default_free": "false",
  "slug": "publish-beta",
  "trial_period_days": NaN,
  "_rescued_data": null
}
```

---

## narrative.core.products

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| id              | `StringType()`    | True     |
| account_id      | `StringType()`    | True     |
| plan_id         | `StringType()`    | True     |
| name            | `StringType()`    | True     |
| stripe_sub_id   | `StringType()`    | True     |
| activation_date | `TimestampType()` | True     |
| inserted_at     | `TimestampType()` | True     |
| updated_at      | `TimestampType()` | True     |
| interval        | `StringType()`    | True     |
| billing_status  | `StringType()`    | True     |
| stripe_status   | `StringType()`    | True     |
| has_used_trial  | `StringType()`    | True     |
| \_rescued_data  | `StringType()`    | True     |
| Op              | `StringType()`    | True     |

### Sample Row

```json
{
  "id": "92a34054-a9e2-47bd-9b80-325cf3350ac5",
  "account_id": "bf6d8909-6b5d-4e6c-a31f-b950a12ee0b9",
  "plan_id": "bdfd6230-7f5a-4f8e-8f3e-1372d5ecef13",
  "name": "Publish",
  "stripe_sub_id": "sub_1K2MQ4GyxyMEWHozomUTYgP8",
  "activation_date": "NaT",
  "inserted_at": "2021-12-02 21:02:21",
  "updated_at": "2022-12-02 21:03:32",
  "interval": "year",
  "billing_status": "active",
  "stripe_status": "active",
  "has_used_trial": "false",
  "_rescued_data": null,
  "Op": null
}
```

---

## narrative.core.projects

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| Op                | `StringType()`    | True     |
| id                | `StringType()`    | True     |
| name              | `StringType()`    | True     |
| status            | `StringType()`    | True     |
| inserted_at       | `TimestampType()` | True     |
| updated_at        | `TimestampType()` | True     |
| select_id         | `StringType()`    | True     |
| publish_id        | `StringType()`    | True     |
| archived          | `StringType()`    | True     |
| deleted_on        | `TimestampType()` | True     |
| legacy_post_id    | `StringType()`    | True     |
| sharelink_created | `StringType()`    | True     |
| \_rescued_data    | `StringType()`    | True     |
| locked            | `StringType()`    | True     |
| allow_corrections | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "U",
  "id": "215f0b92-a7a9-49f1-825a-b496ef05583d",
  "name": "Hochzeiten",
  "status": "active",
  "inserted_at": "2024-11-08 11:34:27",
  "updated_at": "2025-06-24 09:54:23",
  "select_id": "2d077ddf-19a0-443b-8cb8-344bd72a6b15",
  "publish_id": null,
  "archived": "false",
  "deleted_on": "NaT",
  "legacy_post_id": null,
  "sharelink_created": "true",
  "_rescued_data": null,
  "locked": "false",
  "allow_corrections": "true"
}
```

---

## narrative.core.reward_schemes

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| Op                            | `StringType()`    | True     |
| id                            | `StringType()`    | True     |
| referral_code                 | `StringType()`    | True     |
| max_rewards                   | `IntegerType()`   | True     |
| months_valid                  | `IntegerType()`   | True     |
| tapfiliate_ref_id             | `StringType()`    | True     |
| product_id                    | `StringType()`    | True     |
| account_id                    | `StringType()`    | True     |
| inserted_at                   | `TimestampType()` | True     |
| updated_at                    | `TimestampType()` | True     |
| scheme_type                   | `StringType()`    | True     |
| tapfiliate_temporary_password | `StringType()`    | True     |
| \_rescued_data                | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "c542929a-f6fb-4c90-90a3-ec42c2a120e2",
  "referral_code": "daria9326",
  "max_rewards": 10,
  "months_valid": 12,
  "tapfiliate_ref_id": null,
  "product_id": null,
  "account_id": "b2be10bf-4b33-407c-87cc-fd2426cce343",
  "inserted_at": "2025-06-24 14:53:25",
  "updated_at": "2025-06-24 14:53:25",
  "scheme_type": "referral_scheme",
  "tapfiliate_temporary_password": null,
  "_rescued_data": null
}
```

---

## narrative.core.rewards

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| Op                  | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| issue_date          | `TimestampType()` | True     |
| expiry_date         | `TimestampType()` | True     |
| discount_percentage | `IntegerType()`   | True     |
| discount_cents      | `IntegerType()`   | True     |
| reward_scheme_id    | `StringType()`    | True     |
| rewardee_account_id | `StringType()`    | True     |
| inserted_at         | `TimestampType()` | True     |
| updated_at          | `TimestampType()` | True     |
| account_info        | `StringType()`    | True     |
| status              | `StringType()`    | True     |
| rewardee_product_id | `StringType()`    | True     |
| rewarder_account_id | `StringType()`    | True     |
| rewarder_product_id | `StringType()`    | True     |
| rewardee_machine_id | `StringType()`    | True     |
| \_rescued_data      | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "dde49c00-10dd-4d2c-984f-28d5c591cd8a",
  "issue_date": "2025-06-24 12:51:36",
  "expiry_date": "2026-06-24 12:51:36",
  "discount_percentage": 10,
  "discount_cents": NaN,
  "reward_scheme_id": "0d93f57c-8111-43a9-bfb1-4f4dae39ad0e",
  "rewardee_account_id": "84b164cd-de30-46ca-a840-424d81cd59a0",
  "inserted_at": "2025-06-24 12:51:36",
  "updated_at": "2025-06-24 12:51:36",
  "account_info": "{\"email\": \"hess.alexander2000@gmail.com\", \"f_name\": \"Alexander\", \"l_name\": \"He\u00df\"}",
  "status": "active",
  "rewardee_product_id": "a6c7f92c-3a21-41ae-a727-5c2cb38c7e84",
  "rewarder_account_id": "3761748e-ffc2-4206-9759-136f55f7b861",
  "rewarder_product_id": "d8abad48-af08-4896-a452-fba4fc207245",
  "rewardee_machine_id": null,
  "_rescued_data": null
}
```

---

## narrative.core.set_asset_locations

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| Op                | `StringType()`    | True     |
| set_id            | `StringType()`    | True     |
| asset_location_id | `StringType()`    | True     |
| inserted_at       | `TimestampType()` | True     |
| updated_at        | `TimestampType()` | True     |
| \_rescued_data    | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "set_id": "134631b1-2f0f-4e53-a324-37bb204c393e",
  "asset_location_id": "ef8e31fd-b1a7-4fda-8386-4f8fdd1fcf2b",
  "inserted_at": "2025-06-24 13:25:37",
  "updated_at": "2025-06-24 13:25:37",
  "_rescued_data": null
}
```

---

## narrative.core.share_link_trainings

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| id             | `StringType()`    | True     |
| kind           | `StringType()`    | True     |
| status         | `StringType()`    | True     |
| attempts       | `IntegerType()`   | True     |
| version        | `StringType()`    | True     |
| model_info     | `StringType()`    | True     |
| share_link_id  | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| processing_id  | `StringType()`    | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "U",
  "id": "b478c00e-f60e-4a62-8e4f-c2f470abf48c",
  "kind": "style",
  "status": "success",
  "attempts": 1,
  "version": null,
  "model_info": "{\"ml_version\": \"3.0.0\", \"cluster_score\": 74.0, \"training_loss\": -107.37646187676324, \"validation_loss\": -59.07897186279297, \"time_saved_score\": 75.0, \"model_image_count\": 322, \"training_accuracy\": 0.9227430555555556, \"training_approach\": \"learning-without-forgetting\", \"edit_runner_version\": \"0.4.79-prod\", \"validation_accuracy\": 0.8529411764705883, \"training_image_count\": 2581, \"corrected_image_count\": 669, \"dng_converter_version\": \"16_5\", \"image_converter_version\": \"0.2.32-prod\"}",
  "share_link_id": "81c09ecd-682c-4d12-968f-1e48f8a81dc2",
  "inserted_at": "2025-04-16 09:12:31",
  "updated_at": "2025-04-16 09:23:27",
  "processing_id": "baa60a9f-972a-4b44-95fc-ccbd4a108e04",
  "_rescued_data": null
}
```

---

## narrative.core.share_links

### Schema

| Column             | Type              | Nullable |
| ------------------ | ----------------- | -------- |
| Op                 | `StringType()`    | True     |
| id                 | `StringType()`    | True     |
| project_id         | `StringType()`    | True     |
| project_version_id | `StringType()`    | True     |
| kind               | `StringType()`    | True     |
| status             | `StringType()`    | True     |
| permalink          | `StringType()`    | True     |
| inserted_at        | `TimestampType()` | True     |
| updated_at         | `TimestampType()` | True     |
| version            | `StringType()`    | True     |
| failure_reason     | `StringType()`    | True     |
| \_rescued_data     | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "U",
  "id": "75e4b8fa-6f51-4ffb-a9a2-7a66a386651e",
  "project_id": "394b26d9-08f6-4c24-86aa-1b6b0cb4b324",
  "project_version_id": "aa11322b-6248-415f-b48c-cc1758b2ba34",
  "kind": "style",
  "status": "failed",
  "permalink": "fetch.getnarrativeapp.com/share/style/394b26d9-08f6-4c24-86aa-1b6b0cb4b324",
  "inserted_at": "2025-06-23 23:11:20",
  "updated_at": "2025-06-24 03:11:21",
  "version": "1.0.0",
  "failure_reason": "upload_asset_failure",
  "_rescued_data": null
}
```