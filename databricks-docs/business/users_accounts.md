# Users and Accounts Tables

This file contains documentation for 6 Databricks warehouse tables related to user management and accounts.
These tables track user data, accounts, customers, and permissions across the system.

---

## narrative.core.account_packs

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| Op                       | `StringType()`    | True     |
| id                       | `StringType()`    | True     |
| pack_id                  | `StringType()`    | True     |
| account_id               | `StringType()`    | True     |
| count                    | `IntegerType()`   | True     |
| stripe_payment_intent_id | `StringType()`    | True     |
| status                   | `StringType()`    | True     |
| inserted_at              | `TimestampType()` | True     |
| updated_at               | `TimestampType()` | True     |
| \_rescued_data           | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": null,
  "id": "bfad7f8a-1ac6-428d-94d1-d07c5ed49c0a",
  "pack_id": "f6c8becb-056b-49b0-b3cc-41824302caec",
  "account_id": "ab7dbdf5-ecf3-4145-acad-716837b7a4a4",
  "count": 1,
  "stripe_payment_intent_id": "pi_3R9efzGyxyMEWHoz0hHAVhLT",
  "status": "pending",
  "inserted_at": "2025-04-03 03:42:47",
  "updated_at": "2025-04-03 03:42:47",
  "_rescued_data": null
}
```

---

## narrative.core.accounts

### Schema

| Column             | Type              | Nullable |
| ------------------ | ----------------- | -------- |
| Op                 | `StringType()`    | True     |
| id                 | `StringType()`    | True     |
| stripe_cust_id     | `StringType()`    | True     |
| name               | `StringType()`    | True     |
| host               | `StringType()`    | True     |
| stripe_sub_id      | `StringType()`    | True     |
| status             | `IntegerType()`   | True     |
| active             | `StringType()`    | True     |
| status_action_date | `TimestampType()` | True     |
| inserted_at        | `TimestampType()` | True     |
| updated_at         | `TimestampType()` | True     |
| plan_id            | `StringType()`    | True     |
| gen_status         | `IntegerType()`   | True     |
| referred_ref_id    | `StringType()`    | True     |
| usage_status       | `StringType()`    | True     |
| credits            | `IntegerType()`   | True     |
| default_pack_id    | `StringType()`    | True     |
| \_rescued_data     | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "U",
  "id": "4dd019ed-4a5c-45ee-ae55-e6b3dcdd3f27",
  "stripe_cust_id": "cus_SYLwyNLOJqAHml",
  "name": null,
  "host": null,
  "stripe_sub_id": null,
  "status": 0,
  "active": "true",
  "status_action_date": "NaT",
  "inserted_at": "2025-06-23 18:36:56",
  "updated_at": "2025-06-23 18:36:57",
  "plan_id": null,
  "gen_status": 0,
  "referred_ref_id": null,
  "usage_status": "active",
  "credits": 1000,
  "default_pack_id": null,
  "_rescued_data": null
}
```

---

## narrative.core.user_permissions

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| user_id        | `StringType()`    | True     |
| account_id     | `StringType()`    | True     |
| is_owner       | `StringType()`    | True     |
| permissions    | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "user_id": "d9c4f6c9-aa18-4ec6-bbd7-2c31094054b1",
  "account_id": "0d9b9298-c9ee-48e0-a021-cec1aef7ed2f",
  "is_owner": "true",
  "permissions": null,
  "inserted_at": "2025-05-27 20:43:54",
  "updated_at": "2025-05-27 20:43:54",
  "_rescued_data": null
}
```

---

## narrative.core.users

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| Op                     | `StringType()`    | True     |
| id                     | `StringType()`    | True     |
| f_name                 | `StringType()`    | True     |
| l_name                 | `StringType()`    | True     |
| email                  | `StringType()`    | True     |
| email_verified         | `StringType()`    | True     |
| password               | `StringType()`    | True     |
| admin                  | `StringType()`    | True     |
| acl                    | `IntegerType()`   | True     |
| account_id             | `StringType()`    | True     |
| inserted_at            | `TimestampType()` | True     |
| updated_at             | `TimestampType()` | True     |
| app_usage              | `StringType()`    | True     |
| referral_auth_token    | `StringType()`    | True     |
| referral_user_id       | `IntegerType()`   | True     |
| has_logged_in_on_app   | `StringType()`    | True     |
| referral_ref_id        | `StringType()`    | True     |
| tfa_enabled            | `StringType()`    | True     |
| tfa_secret             | `StringType()`    | True     |
| tfa_recovery           | `StringType()`    | True     |
| oauth_provider         | `StringType()`    | True     |
| oauth_provider_user_id | `StringType()`    | True     |
| \_rescued_data         | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "65dcbbb7-8bad-4de6-bbd7-17c69fc0bb7e",
  "f_name": "Mary",
  "l_name": null,
  "email": "mary@lyfephotos.com",
  "email_verified": "false",
  "password": "$2b$12$IV7p00Kr6qOtUUvs.Rwo7.nRCsjLqI/vu.Mc6y2qlYJN7Q7..wYVO",
  "admin": "false",
  "acl": NaN,
  "account_id": null,
  "inserted_at": "2025-06-23 23:13:15",
  "updated_at": "2025-06-23 23:13:15",
  "app_usage": null,
  "referral_auth_token": null,
  "referral_user_id": NaN,
  "has_logged_in_on_app": "false",
  "referral_ref_id": null,
  "tfa_enabled": "false",
  "tfa_secret": null,
  "tfa_recovery": null,
  "oauth_provider": null,
  "oauth_provider_user_id": null,
  "_rescued_data": null
}
```

---

## narrative.default.user_last_app_version

### Schema

| Column                  | Type              | Nullable |
| ----------------------- | ----------------- | -------- |
| user_id                 | `StringType()`    | True     |
| last_occurred_at        | `TimestampType()` | True     |
| meta_app_version_number | `StringType()`    | True     |

### Sample Row

```json
{
  "user_id": "cbfff3c7-21cf-41c9-b725-47e3bf4739ea",
  "last_occurred_at": "2025-06-21 05:02:17.600000",
  "meta_app_version_number": "2.1.0"
}
```

---

## narrative.default.users_rating_2

### Schema

| Column  | Type           | Nullable |
| ------- | -------------- | -------- |
| user_id | `StringType()` | True     |
| day     | `DateType()`   | True     |

### Sample Row

```json
{
  "user_id": "08c1e9cc-7ffd-40b7-8424-a0271e37bc8c",
  "day": "2025-04-22"
}
```