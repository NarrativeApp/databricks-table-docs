# Event Tracking Tables

This file contains documentation for 8 Databricks warehouse tables related to event tracking and analytics.
These tables capture various user interaction events throughout the application.

---

## narrative.default.first_project_events

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| user_id           | `StringType()`    | True     |
| project_id        | `StringType()`    | True     |
| first_inserted_at | `TimestampType()` | True     |

### Sample Row

```json
{
  "user_id": "a435128b-e089-43ab-88c1-8eb614bc4cce",
  "project_id": "78888bf88bf94486a3c0c075cd5f317f",
  "first_inserted_at": "2025-06-23 18:20:14"
}
```

---

## narrative.default.installer_events

### Schema

| Column                  | Type              | Nullable |
| ----------------------- | ----------------- | -------- |
| id                      | `StringType()`    | True     |
| user_id                 | `BinaryType()`    | True     |
| account_id              | `BinaryType()`    | True     |
| transaction_id          | `StringType()`    | True     |
| topic                   | `StringType()`    | True     |
| data                    | `StringType()`    | True     |
| initialized_at          | `TimestampType()` | True     |
| occurred_at             | `TimestampType()` | True     |
| source                  | `BinaryType()`    | True     |
| inserted_at             | `TimestampType()` | True     |
| updated_at              | `TimestampType()` | True     |
| updated_date            | `StringType()`    | True     |
| resource_id             | `StringType()`    | True     |
| vsn                     | `IntegerType()`   | True     |
| meta_os                 | `StringType()`    | True     |
| meta_app                | `StringType()`    | True     |
| meta_location_region    | `StringType()`    | True     |
| meta_location_country   | `StringType()`    | True     |
| meta_location_continent | `StringType()`    | True     |
| meta_install_id         | `StringType()`    | True     |
| meta_os_version         | `StringType()`    | True     |
| meta_serial_number      | `StringType()`    | True     |
| meta_installer_version  | `StringType()`    | True     |
| \_rescued_data          | `StringType()`    | True     |

### Sample Row

```json
{
  "id": "cfcd7218-3892-4073-af9d-9c43ffc80c4d",
  "user_id": null,
  "account_id": null,
  "transaction_id": "1612a003-90e6-43e3-ba14-7df2423f485b",
  "topic": "installer_install_started",
  "data": "{}",
  "initialized_at": "NaT",
  "occurred_at": "1970-01-21 05:19:44.874000",
  "source": null,
  "inserted_at": "2025-05-14 01:07:56",
  "updated_at": "2025-05-14 01:07:56",
  "updated_date": "2025-05-14",
  "resource_id": null,
  "vsn": 1,
  "meta_os": "macos",
  "meta_app": "select",
  "meta_location_region": "Chihuahua",
  "meta_location_country": "Mexico",
  "meta_location_continent": "North America",
  "meta_install_id": "555ED044-5506-49EF-B63F-FDEFA1381E07",
  "meta_os_version": "13.7.1",
  "meta_serial_number": "FVFWM13WHV22",
  "meta_installer_version": "1.1.1",
  "_rescued_data": null
}
```

---

## narrative.default.post_renderer_events

### Schema

| Column                          | Type              | Nullable |
| ------------------------------- | ----------------- | -------- |
| id                              | `StringType()`    | True     |
| user_id                         | `StringType()`    | True     |
| account_id                      | `StringType()`    | True     |
| transaction_id                  | `StringType()`    | True     |
| topic                           | `StringType()`    | True     |
| data                            | `StringType()`    | True     |
| initialized_at                  | `TimestampType()` | True     |
| occurred_at                     | `TimestampType()` | True     |
| source                          | `StringType()`    | True     |
| inserted_at                     | `TimestampType()` | True     |
| updated_at                      | `TimestampType()` | True     |
| updated_date                    | `StringType()`    | True     |
| resource_id                     | `StringType()`    | True     |
| vsn                             | `IntegerType()`   | True     |
| meta_browser_os                 | `StringType()`    | True     |
| meta_browser_name               | `StringType()`    | True     |
| meta_browser_locale             | `StringType()`    | True     |
| meta_browser_version            | `StringType()`    | True     |
| meta_browser_timezone           | `DoubleType()`    | True     |
| meta_browser_os_version         | `StringType()`    | True     |
| meta_browser_user_agent         | `StringType()`    | True     |
| meta_browser_device_type        | `StringType()`    | True     |
| meta_browser_version_array      | `StringType()`    | True     |
| meta_browser_os_version_array   | `StringType()`    | True     |
| meta_project_id                 | `StringType()`    | True     |
| meta_project_total_block_count  | `LongType()`      | True     |
| meta_project_project_version_id | `StringType()`    | True     |
| meta_location_region            | `StringType()`    | True     |
| meta_location_country           | `StringType()`    | True     |
| meta_location_continent         | `StringType()`    | True     |
| meta_renderer_vsn               | `StringType()`    | True     |
| meta_renderer_vsn_array         | `StringType()`    | True     |
| meta_viewport_width             | `LongType()`      | True     |
| meta_viewport_height            | `LongType()`      | True     |
| meta_viewport_offset_x          | `LongType()`      | True     |
| meta_viewport_offset_y          | `LongType()`      | True     |
| meta_oroject_share_link_id      | `StringType()`    | True     |
| \_rescued_data                  | `StringType()`    | True     |

### Sample Row

```json
{
  "id": "0a31c2df-788c-4a2b-88c4-8cb182605e0e",
  "user_id": null,
  "account_id": "b36498bb-1eaa-42d7-9e16-d4d66b7644ff",
  "transaction_id": "f2d8bd8e-51dc-469b-97cd-df064e26dcbf",
  "topic": "post_renderer_resized",
  "data": "{\"path\": \"/sneak-peeks/zonzo\", \"domain\": \"www.emotionsandmath.com.au\", \"referrer\": null, \"path_array\": [\"sneak-peeks\", \"zonzo\"], \"session_id\": \"90d041fd-e54f-4086-ad72-e48315ccab0b\", \"page_load_id\": \"b38fa0c4-fa2e-4e6b-92bd-226113e0bad7\", \"website_locale\": \"en-US\", \"ms_since_page_load\": 3086}",
  "initialized_at": "NaT",
  "occurred_at": "2025-01-23 06:59:57.253000",
  "source": null,
  "inserted_at": "2025-01-23 07:00:00",
  "updated_at": "2025-01-23 07:00:00",
  "updated_date": "2025-01-23",
  "resource_id": null,
  "vsn": 1,
  "meta_browser_os": "iOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-au",
  "meta_browser_version": "17.6",
  "meta_browser_timezone": -660.0,
  "meta_browser_os_version": "17.6.1",
  "meta_browser_user_agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1",
  "meta_browser_device_type": "mobile",
  "meta_browser_version_array": "[17, 6]",
  "meta_browser_os_version_array": "[17, 6, 1]",
  "meta_project_id": "6f055b4d-eb64-42d1-8aab-1142d6479d51",
  "meta_project_total_block_count": 50,
  "meta_project_project_version_id": "2b7aa234-963f-4af6-9680-e34daca7174d",
  "meta_location_region": "Victoria",
  "meta_location_country": "Australia",
  "meta_location_continent": "Oceania",
  "meta_renderer_vsn": "1.0.35",
  "meta_renderer_vsn_array": "[1, 0, 35]",
  "meta_viewport_width": 393,
  "meta_viewport_height": 774,
  "meta_viewport_offset_x": 0,
  "meta_viewport_offset_y": 778,
  "meta_oroject_share_link_id": null,
  "_rescued_data": null
}
```

---

## narrative.default.sample_trips_installer_events

### Schema

| Column      | Type            | Nullable |
| ----------- | --------------- | -------- |
| pickup_zip  | `IntegerType()` | True     |
| fare_amount | `DoubleType()`  | True     |

### Sample Row

```json
{
  "pickup_zip": 10103,
  "fare_amount": 8.0
}
```

---

## narrative.default.sample_zones_installer_events

### Schema

| Column     | Type            | Nullable |
| ---------- | --------------- | -------- |
| pickup_zip | `IntegerType()` | True     |
| total_fare | `DoubleType()`  | True     |

### Sample Row

```json
{
  "pickup_zip": 11224,
  "total_fare": 61.0
}
```

---

## narrative.default.service_events

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| id             | `StringType()`    | True     |
| user_id        | `StringType()`    | True     |
| account_id     | `StringType()`    | True     |
| transaction_id | `StringType()`    | True     |
| topic          | `StringType()`    | True     |
| data           | `StringType()`    | True     |
| initialized_at | `TimestampType()` | True     |
| occurred_at    | `TimestampType()` | True     |
| source         | `StringType()`    | True     |
| inserted_at    | `TimestampType()` | True     |
| updated_at     | `TimestampType()` | True     |
| updated_date   | `StringType()`    | True     |
| resource_id    | `StringType()`    | True     |
| meta           | `StringType()`    | True     |
| vsn            | `IntegerType()`   | True     |
| \_rescued_data | `StringType()`    | True     |

### Event Samples

#### Event Type: `product_upgraded`

```json
{
  "id": "6651de79-be17-480b-a1c6-1122873aae76",
  "user_id": "ebf35416-d451-4d94-9993-5a8d25ac77b6",
  "account_id": "845d916c-b732-48f8-a7e6-1f0841c5192d",
  "transaction_id": null,
  "topic": "product_upgraded",
  "data": {
    "id": "7404bfda-272f-49ee-afc5-94fb2ab23cdd",
    "name": "Select",
    "plan": {
      "id": "63f53632-fea4-4a4c-8d79-dfd7146d1e5f",
      "name": "Select Pro",
      "slug": "select-pro",
      "type": "plans",
      "status": 1,
      "features": [
        {
          "name": "Face Zoom",
          "slug": "face-zoom",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Ship to Lightroom",
          "slug": "ship-to-lightroom",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Scenes",
          "slug": "scene-detection",
          "quantity": null,
          "description": "Scenes let you navigate between, and within, the scenes of your shoot.",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Locking",
          "slug": "face-lock",
          "quantity": null,
          "description": "Lock a particular face or point of your image into the Close-ups panel so you can focus on it across your shoot.",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Eye Assessments",
          "slug": "eye-assessment",
          "quantity": null,
          "description": "Eyes and focus assessments are color-coded indicators that tell you if your subjects are in focus and if their eyes are open.",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Close-ups Panel",
          "slug": "closeups-panel",
          "quantity": null,
          "description": "The Close-ups panel makes comparing the same people across a series of similar images a breeze with closeup crops of all faces, all at once.",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Focus Assessments",
          "slug": "focus-assessment",
          "quantity": null,
          "description": "Eyes and focus assessments are color-coded indicators that tell you if your subjects are in focus and if their eyes are open.",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Image Assessments",
          "slug": "distill",
          "quantity": null,
          "description": "Reject your worst images with Distill (Beta).",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Scenes View",
          "slug": "scenes-view",
          "quantity": null,
          "description": "Scenes View",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "First pass thumbnails",
          "slug": "first-pass-thumbnails",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "First scene sorting",
          "slug": "first-pass-scene-sorting",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Focus score filter",
          "slug": "focus-score-filter",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "First pass filters",
          "slug": "first-pass-filters",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "First pass sidebar",
          "slug": "first-pass-sidebar",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Face assessments",
          "slug": "face-assessments",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Face compare",
          "slug": "face-compare",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        },
        {
          "name": "Proioritise premium feature survey questions",
          "slug": "prioritise-premium-feature-survey-questions",
          "quantity": null,
          "description": "_",
          "plural_noun": "features",
          "singular_noun": "feature",
          "only_during_trial": false
        }
      ],
      "updated_at": {
        "day": 8,
        "hour": 20,
        "year": 2022,
        "month": 11,
        "minute": 47,
        "second": 44,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 8,
        "hour": 20,
        "year": 2022,
        "month": 11,
        "minute": 33,
        "second": 2,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "default_free": false,
      "product_name": "Select",
      "status_label": "live",
      "yearly_price": 18000,
      "yearly_trial": 0,
      "monthly_price": 2000,
      "monthly_trial": 0
    },
    "type": "products",
    "coupon": {
      "code": "6KZYByAO",
      "name": "referral one year free",
      "type": "coupons",
      "valid": true,
      "created": 1632358180,
      "duration": "repeating",
      "redeem_by": null,
      "amount_off": null,
      "percent_off": 100.0,
      "duration_in_months": 12
    },
    "status": "active",
    "user_id": "ebf35416-d451-4d94-9993-5a8d25ac77b6",
    "interval": "year",
    "account_id": "845d916c-b732-48f8-a7e6-1f0841c5192d",
    "updated_at": {
      "day": 9,
      "hour": 10,
      "year": 2023,
      "month": 11,
      "minute": 3,
      "second": 27,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 6,
      "hour": 10,
      "year": 2023,
      "month": 10,
      "minute": 0,
      "second": 16,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "stripe_status": "active",
    "billing_status": null,
    "has_used_trial": false,
    "activation_date": null,
    "current_period_end": 1731146607
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-11-09 10:03:30",
  "source": null,
  "inserted_at": "2023-11-09 10:03:39",
  "updated_at": "2023-11-09 10:03:39",
  "updated_date": null,
  "resource_id": "7404bfda-272f-49ee-afc5-94fb2ab23cdd",
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `product_created`

```json
{
  "id": "36f5d237-9ed4-4f8d-837e-d5cad44a9e60",
  "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
  "account_id": "8bc49ae9-4a3e-4548-bffc-f1234f16acf9",
  "transaction_id": null,
  "topic": "product_created",
  "data": {
    "changes": [
      "account_id",
      "interval",
      "name",
      "plan_id",
      "stripe_status",
      "stripe_sub_id"
    ],
    "resource": {
      "id": "75885fb7-10e5-4951-9bc8-c398b98fa152",
      "name": "Select",
      "type": "products",
      "coupon": null,
      "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
      "interval": "year",
      "account_id": "8bc49ae9-4a3e-4548-bffc-f1234f16acf9",
      "updated_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 36,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 36,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "stripe_status": "active",
      "has_used_trial": false,
      "activation_date": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 11:07:36.195370",
  "source": null,
  "inserted_at": "2025-04-03 11:07:48",
  "updated_at": "2025-04-03 11:07:48",
  "updated_date": "2025-04-03",
  "resource_id": "75885fb7-10e5-4951-9bc8-c398b98fa152",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `user_updated`

```json
{
  "id": "0b8629bf-ee9f-4ee8-b71e-eff5a0cc0410",
  "user_id": "171fb9cf-53d6-45dc-96e7-2ba2be686ce3",
  "account_id": null,
  "transaction_id": null,
  "topic": "user_updated",
  "data": {
    "changes": ["l_name"],
    "resource": {
      "id": "171fb9cf-53d6-45dc-96e7-2ba2be686ce3",
      "type": "users",
      "email": "andreacaponi@yahoo.com",
      "f_name": "Andrea",
      "l_name": "Caponi",
      "user_id": "171fb9cf-53d6-45dc-96e7-2ba2be686ce3",
      "updated_at": {
        "day": 20,
        "hour": 22,
        "year": 2025,
        "month": 5,
        "minute": 20,
        "second": 45,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 20,
        "hour": 22,
        "year": 2025,
        "month": 5,
        "minute": 8,
        "second": 49,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "auth_providers": ["email"],
      "email_verified": false
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-20 22:20:45.117099",
  "source": null,
  "inserted_at": "2025-05-20 22:20:56",
  "updated_at": "2025-05-20 22:20:56",
  "updated_date": "2025-05-20",
  "resource_id": "171fb9cf-53d6-45dc-96e7-2ba2be686ce3",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `share_link_training_created`

```json
{
  "id": "2a7a05cf-778d-4277-95eb-176bf14b8cbf",
  "user_id": "89ece8ae-7f05-4329-98ba-cfced26500d9",
  "account_id": "8490153b-4440-4d5b-b068-55322b72e6f4",
  "transaction_id": null,
  "topic": "share_link_training_created",
  "data": {
    "changes": ["kind", "share_link_id"],
    "resource": {
      "id": "5ce7c086-b977-419c-82d7-34507b6296f7",
      "kind": "style",
      "type": "share_link_trainings",
      "status": "preparing",
      "user_id": "89ece8ae-7f05-4329-98ba-cfced26500d9",
      "version": null,
      "attempts": 0,
      "account_id": "8490153b-4440-4d5b-b068-55322b72e6f4",
      "model_info": null,
      "updated_at": {
        "day": 5,
        "hour": 21,
        "year": 2024,
        "month": 12,
        "minute": 14,
        "second": 58,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 5,
        "hour": 21,
        "year": 2024,
        "month": 12,
        "minute": 14,
        "second": 58,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "processing_id": null,
      "share_link_id": "8fccf253-9d0a-4e2e-bbba-6fe8dcb644be"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2024-12-05 21:14:58",
  "source": null,
  "inserted_at": "2024-12-05 21:15:07",
  "updated_at": "2024-12-05 21:15:07",
  "updated_date": null,
  "resource_id": "5ce7c086-b977-419c-82d7-34507b6296f7",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `share_link_created`

```json
{
  "id": "25542e15-5671-488d-a333-57e2461cd106",
  "user_id": "000819ac-3cc9-4ee4-9896-facef92f419e",
  "account_id": "91559e69-f46c-4661-a388-031af6475ebe",
  "transaction_id": "",
  "topic": "share_link_created",
  "data": {
    "changes": [
      "kind",
      "permalink",
      "project_id",
      "project_version_id",
      "version"
    ],
    "resource": {
      "id": "b43274f6-9a12-4427-a350-11444dfcd432",
      "kind": "blog",
      "type": "share_links",
      "status": "preparing",
      "user_id": "000819ac-3cc9-4ee4-9896-facef92f419e",
      "permalink": "fetch.getnarrativeapp.com/share/blog/c05c39dc-8df0-4eae-b391-f15aefd63d6b",
      "account_id": "91559e69-f46c-4661-a388-031af6475ebe",
      "project_id": "c05c39dc-8df0-4eae-b391-f15aefd63d6b",
      "updated_at": {
        "day": 4,
        "hour": 10,
        "year": 2022,
        "month": 7,
        "minute": 54,
        "second": 19,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 4,
        "hour": 10,
        "year": 2022,
        "month": 7,
        "minute": 54,
        "second": 19,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "project_version_id": "fe745bf3-4390-40e2-8665-7714f9e374c6"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2022-07-04 10:54:19",
  "source": "",
  "inserted_at": "2022-07-04 10:54:30",
  "updated_at": "2022-07-04 10:54:30",
  "updated_date": null,
  "resource_id": "b43274f6-9a12-4427-a350-11444dfcd432",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `publisher_updated`

```json
{
  "id": "ecd3a66c-fbf2-4c6f-b34f-b2efce620fbb",
  "user_id": "8412a117-c55a-489b-94fb-624ea07b60c5",
  "account_id": "f19e57f3-3b61-40aa-96b0-c30b0cf55ac4",
  "transaction_id": null,
  "topic": "publisher_updated",
  "data": {
    "changes": ["auto_publish", "detected_type", "theme_info"],
    "resource": {
      "id": "823cfdd0-5a7e-4739-bdc7-ce8f6dceaa54",
      "host": "storiesofus.de",
      "info": {
        "wp_version": "5.9.7",
        "has_gutenberg": "false",
        "plugin_version": "1.0.7",
        "guttenburg_available": "false"
      },
      "tags": null,
      "type": "publisher",
      "status": "ok",
      "user_id": "8412a117-c55a-489b-94fb-624ea07b60c5",
      "account_id": "f19e57f3-3b61-40aa-96b0-c30b0cf55ac4",
      "categories": [
        "After Wedding",
        "Babybauch",
        "Boudoir",
        "Familien",
        "Hochzeitsreportage",
        "Hochzeitsreportagen",
        "Honeymoon Pictures",
        "Neugeborene",
        "Paare",
        "Privat",
        "Reisen",
        "Reportage",
        "Ricarda",
        "Styleshooting",
        "Uncategorized"
      ],
      "publish_id": "bc305d26-ef98-49b5-87c2-534ebd88f8a8",
      "theme_info": "Flothemes",
      "updated_at": {
        "day": 20,
        "hour": 7,
        "year": 2023,
        "month": 7,
        "minute": 42,
        "second": 17,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 19,
        "hour": 14,
        "year": 2023,
        "month": 7,
        "minute": 50,
        "second": 58,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "auto_publish": true,
      "detected_type": "WordPress",
      "publisher_type": "WordPressAuto",
      "default_category": "Publish via Code"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-07-20 07:42:17",
  "source": null,
  "inserted_at": "2023-07-20 07:42:29",
  "updated_at": "2023-07-20 07:42:29",
  "updated_date": null,
  "resource_id": "823cfdd0-5a7e-4739-bdc7-ce8f6dceaa54",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `edit_credit_usage`

```json
{
  "id": "9671a9d2-bd4a-4c4b-8888-de37d8be7d7e",
  "user_id": "eb3fc5e0-a7b4-466d-bfaa-fedabac9cf61",
  "account_id": "91a7d8c2-8f7a-45a8-960f-ffea9c50f760",
  "transaction_id": null,
  "topic": "edit_credit_usage",
  "data": {
    "user_id": "eb3fc5e0-a7b4-466d-bfaa-fedabac9cf61",
    "account_id": "91a7d8c2-8f7a-45a8-960f-ffea9c50f760",
    "credit_balance": 537,
    "total_credits_used": 463,
    "trial_credits_used": 463
  },
  "initialized_at": "NaT",
  "occurred_at": "2024-07-09 02:59:43",
  "source": null,
  "inserted_at": "2024-07-09 02:59:44",
  "updated_at": "2024-07-09 02:59:44",
  "updated_date": null,
  "resource_id": null,
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `user_created`

```json
{
  "id": "6b212fc5-41d3-4d9f-9c20-884e55405bd1",
  "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
  "account_id": null,
  "transaction_id": null,
  "topic": "user_created",
  "data": {
    "changes": [
      "email",
      "f_name",
      "l_name",
      "oauth_provider",
      "oauth_provider_user_id"
    ],
    "resource": {
      "id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
      "type": "users",
      "email": "jairojcn@gmail.com",
      "f_name": "Jairo",
      "l_name": "Crespo",
      "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
      "updated_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 34,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 34,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "auth_providers": ["google"],
      "email_verified": false
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 11:07:34.021476",
  "source": null,
  "inserted_at": "2025-04-03 11:07:48",
  "updated_at": "2025-04-03 11:07:48",
  "updated_date": "2025-04-03",
  "resource_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `email_delivered`

```json
{
  "id": "1b644965-3951-4061-bd42-bdf4ff87ff60",
  "user_id": "4c913e1a-4244-46a2-8e5a-9103cf04d20f",
  "account_id": "",
  "transaction_id": "",
  "topic": "email_delivered",
  "data": {
    "resource": {
      "id": "0e4f9738-10f5-4126-b075-b1da691a1304",
      "code": "5f4840b6-9b89-45d2-9314-0348ffd403e1",
      "scope": 1,
      "e_date": "2021-06-25T04:10:33Z",
      "user_id": "4c913e1a-4244-46a2-8e5a-9103cf04d20f",
      "updated_at": "2021-06-24T04:10:33Z",
      "inserted_at": "2021-06-24T04:10:33Z"
    },
    "email_type": "verify_email"
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-06-24 04:11:09",
  "source": "",
  "inserted_at": "2021-06-24 04:11:09",
  "updated_at": "2021-06-24 04:11:09",
  "updated_date": null,
  "resource_id": "0e4f9738-10f5-4126-b075-b1da691a1304",
  "meta": null,
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `project_version_created`

```json
{
  "id": "2f497d63-dcec-4c06-ae30-a3d262796f96",
  "user_id": "66dc36db-ece6-486c-aa7c-783b07455608",
  "account_id": "7cf22726-602f-4941-b966-6d8911b58fd1",
  "transaction_id": null,
  "topic": "project_version_created",
  "data": {
    "changes": ["project_id", "publish_info", "set_ids"],
    "resource": {
      "id": "4ca94b68-b8f9-4dfc-bdc1-38914a6f2fd4",
      "type": "project_versions",
      "set_ids": ["f0aad8b9-be77-4d07-a8c7-15fe4ccf0524"],
      "user_id": "66dc36db-ece6-486c-aa7c-783b07455608",
      "account_id": "7cf22726-602f-4941-b966-6d8911b58fd1",
      "updated_at": {
        "day": 20,
        "hour": 10,
        "year": 2023,
        "month": 6,
        "minute": 18,
        "second": 37,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 20,
        "hour": 10,
        "year": 2023,
        "month": 6,
        "minute": 18,
        "second": 37,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "select_info": null,
      "publish_info": {
        "meta": null,
        "seo_title": null,
        "focus_keywords": null,
        "legacy_remote_id": null,
        "meta_description": null,
        "display_image_ref": null,
        "wordpress_category": null,
        "wordpress_destination_id": null,
        "wordpress_destination_url": null
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-06-20 10:18:37",
  "source": null,
  "inserted_at": "2023-06-20 10:18:48",
  "updated_at": "2023-06-20 10:18:48",
  "updated_date": null,
  "resource_id": "4ca94b68-b8f9-4dfc-bdc1-38914a6f2fd4",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `account_created`

```json
{
  "id": "05d450c4-42a1-42f4-96c3-debd908de9f8",
  "user_id": "66d81340-2f52-4113-ba6f-6359a4ee172c",
  "account_id": "fa467e8e-da3d-4d0d-8ec7-4b1e8064ed54",
  "transaction_id": null,
  "topic": "account_created",
  "data": {
    "changes": ["active", "status", "stripe_cust_id"],
    "resource": {
      "id": "fa467e8e-da3d-4d0d-8ec7-4b1e8064ed54",
      "name": "",
      "type": "accounts",
      "active": true,
      "status": 0,
      "address": {},
      "billing": {},
      "user_id": "66d81340-2f52-4113-ba6f-6359a4ee172c",
      "account_id": "fa467e8e-da3d-4d0d-8ec7-4b1e8064ed54",
      "updated_at": {
        "day": 29,
        "hour": 22,
        "year": 2023,
        "month": 7,
        "minute": 0,
        "second": 19,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 29,
        "hour": 22,
        "year": 2023,
        "month": 7,
        "minute": 0,
        "second": 19,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "usage_status": "active",
      "status_action_date": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-07-29 22:00:19",
  "source": null,
  "inserted_at": "2023-07-29 22:00:27",
  "updated_at": "2023-07-29 22:00:27",
  "updated_date": null,
  "resource_id": "fa467e8e-da3d-4d0d-8ec7-4b1e8064ed54",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `affiliate_signup_created`

```json
{
  "id": "aa3a1f47-36f3-4230-86f5-e6f8b6a565a1",
  "user_id": "7995c8c1-4f67-41a2-9df5-da6b33e9e16c",
  "account_id": "94dc8d89-2f12-4195-921e-1a87fcb2e124",
  "transaction_id": null,
  "topic": "affiliate_signup_created",
  "data": {
    "id": "3f0a133c-bb1c-4ce0-a7c4-80ce1ae03492",
    "user_id": "7995c8c1-4f67-41a2-9df5-da6b33e9e16c",
    "account_id": "94dc8d89-2f12-4195-921e-1a87fcb2e124",
    "product_id": "c015eb85-b867-454b-bb81-c2faa6595b05",
    "is_qualified": false,
    "product_type": "select"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 12:54:27.246287",
  "source": null,
  "inserted_at": "2025-04-03 12:54:38",
  "updated_at": "2025-04-03 12:54:38",
  "updated_date": "2025-04-03",
  "resource_id": "3f0a133c-bb1c-4ce0-a7c4-80ce1ae03492",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `backbone_product_select_plan_upgraded`

```json
{
  "id": "260c4fa9-f5ff-484f-a79d-0e3a6a71f2fb",
  "user_id": "672c510f-7282-4bc1-97c0-d3bff0c848f4",
  "account_id": "71d81fc7-3e13-498f-8a3c-962acb85f71f",
  "transaction_id": null,
  "topic": "backbone_product_select_plan_upgraded",
  "data": {
    "changes": ["interval", "plan_id"],
    "resource": {
      "id": "a94ede23-3184-47b8-94c6-90bd57ab84cb",
      "name": "Select",
      "type": "products",
      "coupon": null,
      "user_id": "672c510f-7282-4bc1-97c0-d3bff0c848f4",
      "interval": "month",
      "account_id": "71d81fc7-3e13-498f-8a3c-962acb85f71f",
      "updated_at": {
        "day": 12,
        "hour": 20,
        "year": 2023,
        "month": 10,
        "minute": 22,
        "second": 57,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 25,
        "hour": 3,
        "year": 2022,
        "month": 4,
        "minute": 33,
        "second": 47,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "stripe_status": "active",
      "billing_status": "active",
      "has_used_trial": false,
      "activation_date": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-10-12 20:22:57",
  "source": null,
  "inserted_at": "2023-10-12 20:23:09",
  "updated_at": "2023-10-12 20:23:09",
  "updated_date": null,
  "resource_id": "a94ede23-3184-47b8-94c6-90bd57ab84cb",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `create_asset`

```json
{
  "id": "3dd5243c-a39e-43bb-85d5-dad3686155fc",
  "user_id": "e35b12a6-344c-47f1-9f3b-dcc5051d1ec9",
  "account_id": "",
  "transaction_id": "",
  "topic": "create_asset",
  "data": {
    "user_id": "e35b12a6-344c-47f1-9f3b-dcc5051d1ec9",
    "space_time": {
      "time": "latest",
      "space": "988501fe-6bf8-4689-b78e-617f41ea7fbd"
    },
    "asset_params": {
      "id": "d6389446-a8a0-48cc-9db0-8c334eca9180",
      "hash": "E8DF0026EFABA5B6E3F1C8621A5896F9B6462593",
      "meta": {
        "width": 3088,
        "height": 4632,
        "star_rating": 1,
        "colour_rating": 0,
        "focus_keywords": []
      },
      "name": "Courtney & Jonathan Reception-50.jpg",
      "type": "assets",
      "mimetype": "jpg"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-09-15 20:51:34",
  "source": "",
  "inserted_at": "2021-09-15 20:51:34",
  "updated_at": "2021-09-15 20:51:34",
  "updated_date": null,
  "resource_id": "",
  "meta": null,
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `share_link_training_updated`

```json
{
  "id": "701080d9-e2f0-4499-90af-17ea9160908c",
  "user_id": "004cdb9d-2a70-45ce-a4a4-da9c14d67b0c",
  "account_id": "fdc5ef0e-6510-479e-ab24-b5de88d0ec79",
  "transaction_id": null,
  "topic": "share_link_training_updated",
  "data": {
    "changes": ["processing_id"],
    "resource": {
      "id": "594e69c6-c7fe-4a78-9c9a-45c64154826d",
      "kind": "style",
      "type": "share_link_trainings",
      "status": "preparing",
      "user_id": "004cdb9d-2a70-45ce-a4a4-da9c14d67b0c",
      "version": null,
      "attempts": 0,
      "account_id": "fdc5ef0e-6510-479e-ab24-b5de88d0ec79",
      "model_info": null,
      "updated_at": {
        "day": 12,
        "hour": 16,
        "year": 2025,
        "month": 2,
        "minute": 31,
        "second": 51,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 12,
        "hour": 16,
        "year": 2025,
        "month": 2,
        "minute": 29,
        "second": 40,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "processing_id": "fa5e0653-bbf0-4e7a-9ff3-962287449270",
      "share_link_id": "5487b8ad-fa96-4025-b568-e5553af25b99"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-12 16:31:51.286205",
  "source": null,
  "inserted_at": "2025-02-12 16:32:01",
  "updated_at": "2025-02-12 16:32:01",
  "updated_date": "2025-02-12",
  "resource_id": "594e69c6-c7fe-4a78-9c9a-45c64154826d",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `stripe_subscription_deleted`

```json
{
  "id": "945a2616-6365-433c-9d7d-dadf89bc227e",
  "user_id": "",
  "account_id": "44afbe3f-c611-478b-9840-76e2317f7121",
  "transaction_id": "",
  "topic": "stripe_subscription_deleted",
  "data": {
    "id": "evt_1IdNbNGyxyMEWHozJPeNj9Fk",
    "data": {
      "object": {
        "id": "sub_J8PoK5E5d6AONf",
        "plan": {
          "id": "plan_JFZvyQJshJ4QEz",
          "tiers": null,
          "active": true,
          "amount": 0,
          "object": "plan",
          "created": 1617676540,
          "product": "prod_HE50j3A0xeeU2J",
          "currency": "usd",
          "interval": "month",
          "livemode": true,
          "metadata": {},
          "nickname": "Select Pro Trial-Month",
          "tiers_mode": null,
          "usage_type": "licensed",
          "amount_decimal": "0",
          "billing_scheme": "per_unit",
          "interval_count": 1,
          "aggregate_usage": null,
          "transform_usage": null,
          "trial_period_days": 30
        },
        "items": {
          "url": "/v1/subscription_items?subscription=sub_J8PoK5E5d6AONf",
          "data": [
            {
              "id": "si_J8PoUjT407tBxj",
              "plan": {
                "id": "plan_JFZvyQJshJ4QEz",
                "tiers": null,
                "active": true,
                "amount": 0,
                "object": "plan",
                "created": 1617676540,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "interval": "month",
                "livemode": true,
                "metadata": {},
                "nickname": "Select Pro Trial-Month",
                "tiers_mode": null,
                "usage_type": "licensed",
                "amount_decimal": "0",
                "billing_scheme": "per_unit",
                "interval_count": 1,
                "aggregate_usage": null,
                "transform_usage": null,
                "trial_period_days": 30
              },
              "price": {
                "id": "plan_JFZvyQJshJ4QEz",
                "type": "recurring",
                "active": true,
                "object": "price",
                "created": 1617676540,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "livemode": true,
                "metadata": {},
                "nickname": "Select Pro Trial-Month",
                "recurring": {
                  "interval": "month",
                  "usage_type": "licensed",
                  "interval_count": 1,
                  "aggregate_usage": null,
                  "trial_period_days": 30
                },
                "lookup_key": null,
                "tiers_mode": null,
                "unit_amount": 0,
                "billing_scheme": "per_unit",
                "transform_quantity": null,
                "unit_amount_decimal": "0"
              },
              "object": "subscription_item",
              "created": 1616024461,
              "metadata": {},
              "quantity": 1,
              "tax_rates": [],
              "subscription": "sub_J8PoK5E5d6AONf",
              "billing_thresholds": null
            }
          ],
          "object": "list",
          "has_more": false,
          "total_count": 1
        },
        "object": "subscription",
        "status": "canceled",
        "created": 1616024461,
        "customer": "cus_J8Po2xbzZmp5jb",
        "discount": null,
        "ended_at": 1617748949,
        "livemode": true,
        "metadata": {},
        "quantity": 1,
        "schedule": null,
        "cancel_at": null,
        "trial_end": 1620332643,
        "start_date": 1616024461,
        "canceled_at": 1617748949,
        "tax_percent": null,
        "trial_start": 1617740643,
        "transfer_data": null,
        "days_until_due": null,
        "default_source": null,
        "latest_invoice": "in_1IdLRQGyxyMEWHozhZxyLrCE",
        "pending_update": null,
        "pause_collection": null,
        "collection_method": "charge_automatically",
        "default_tax_rates": [
          {
            "id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
            "state": null,
            "active": true,
            "object": "tax_rate",
            "country": null,
            "created": 1557282561,
            "livemode": true,
            "metadata": {},
            "inclusive": true,
            "percentage": 0.0,
            "description": null,
            "display_name": "Tax",
            "jurisdiction": null
          }
        ],
        "billing_thresholds": null,
        "current_period_end": 1620332643,
        "billing_cycle_anchor": 1620332643,
        "cancel_at_period_end": false,
        "current_period_start": 1617740643,
        "pending_setup_intent": null,
        "default_payment_method": null,
        "application_fee_percent": null,
        "pending_invoice_item_interval": null,
        "next_pending_invoice_item_invoice": null
      }
    },
    "type": "customer.subscription.deleted",
    "object": "event",
    "created": 1617748949,
    "request": {
      "id": "req_NDJN6hsXA9XAOZ",
      "idempotency_key": null
    },
    "livemode": true,
    "api_version": "2019-12-03",
    "pending_webhooks": 4
  },
  "initialized_at": "2021-04-06 22:42:30",
  "occurred_at": "2021-04-06 22:42:30",
  "source": "",
  "inserted_at": "2021-04-06 22:42:30",
  "updated_at": "2021-04-06 22:42:30",
  "updated_date": null,
  "resource_id": "9ed110e0-5179-4977-905a-e77abcd21d91",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `share_link_published`

```json
{
  "id": "a89a74b9-feb9-43d4-81a9-c8425606595e",
  "user_id": "a96f814d-1909-4fb3-9141-4e59df0d5c9b",
  "account_id": "0e6e1463-d15c-4f87-aa9c-3e8fbb04faad",
  "transaction_id": null,
  "topic": "share_link_published",
  "data": {
    "id": "b97ff39d-8004-40ca-a57f-e8584d553f0c",
    "kind": "style",
    "type": "share_links",
    "status": "active",
    "user_id": "a96f814d-1909-4fb3-9141-4e59df0d5c9b",
    "permalink": "fetch.getnarrativeapp.com/share/style/c5825b5a-924c-4fae-9d75-c78beb626cbd",
    "account_id": "0e6e1463-d15c-4f87-aa9c-3e8fbb04faad",
    "project_id": "c5825b5a-924c-4fae-9d75-c78beb626cbd",
    "updated_at": {
      "day": 30,
      "hour": 18,
      "year": 2025,
      "month": 5,
      "minute": 31,
      "second": 21,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 30,
      "hour": 18,
      "year": 2025,
      "month": 5,
      "minute": 5,
      "second": 1,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "failure_reason": null,
    "project_version_id": "9f272953-032d-45f9-965f-3b44d757cbbe"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-30 18:31:21.901062",
  "source": null,
  "inserted_at": "2025-05-30 18:31:28",
  "updated_at": "2025-05-30 18:31:28",
  "updated_date": "2025-05-30",
  "resource_id": "b97ff39d-8004-40ca-a57f-e8584d553f0c",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `project_created`

```json
{
  "id": "61fdff97-be8d-4b97-9af4-417fb98cdf2e",
  "user_id": "1611af53-9f2b-4a33-832d-137e8f3e3790",
  "account_id": "ac887455-298c-41a9-ab4b-c33e6c4cfa70",
  "transaction_id": null,
  "topic": "project_created",
  "data": {
    "changes": ["name", "publish_id", "status"],
    "resource": {
      "id": "46de4b79-4c61-4b43-a747-c7cce5c0ce1a",
      "name": "Untitled Post",
      "type": "projects",
      "status": "active",
      "user_id": "1611af53-9f2b-4a33-832d-137e8f3e3790",
      "archived": false,
      "select_id": null,
      "account_id": "ac887455-298c-41a9-ab4b-c33e6c4cfa70",
      "deleted_on": null,
      "publish_id": "bacbd80d-55b1-46c6-8ebc-17d4efc47dba",
      "updated_at": {
        "day": 12,
        "hour": 19,
        "year": 2023,
        "month": 10,
        "minute": 31,
        "second": 46,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 12,
        "hour": 19,
        "year": 2023,
        "month": 10,
        "minute": 31,
        "second": 46,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "legacy_post_id": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-10-12 19:31:46",
  "source": null,
  "inserted_at": "2023-10-12 19:31:47",
  "updated_at": "2023-10-12 19:31:47",
  "updated_date": null,
  "resource_id": "46de4b79-4c61-4b43-a747-c7cce5c0ce1a",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `backbone_product_select_plan_downgraded`

```json
{
  "id": "72b9e010-2a57-41d4-afc4-af7aee3c17b1",
  "user_id": "c3fadcf0-1340-4247-bd31-d3a19453ca0a",
  "account_id": "3e558482-7070-4daf-ab41-eb8a23d02c11",
  "transaction_id": null,
  "topic": "backbone_product_select_plan_downgraded",
  "data": {
    "changes": ["interval", "plan_id"],
    "resource": {
      "id": "f93df39f-2ab6-4002-a372-fdf682323736",
      "name": "Select",
      "type": "products",
      "coupon": null,
      "user_id": "c3fadcf0-1340-4247-bd31-d3a19453ca0a",
      "interval": "year",
      "account_id": "3e558482-7070-4daf-ab41-eb8a23d02c11",
      "updated_at": {
        "day": 13,
        "hour": 11,
        "year": 2025,
        "month": 3,
        "minute": 23,
        "second": 52,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 27,
        "hour": 12,
        "year": 2025,
        "month": 2,
        "minute": 54,
        "second": 1,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "stripe_status": "active",
      "billing_status": null,
      "has_used_trial": false,
      "activation_date": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-03-13 11:23:52.149003",
  "source": null,
  "inserted_at": "2025-03-13 11:24:04",
  "updated_at": "2025-03-13 11:24:04",
  "updated_date": "2025-03-13",
  "resource_id": "f93df39f-2ab6-4002-a372-fdf682323736",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `product_updated`

```json
{
  "id": "213cdc54-3774-49d0-af5c-a775c5d7af2f",
  "user_id": "b14452d2-ceef-4791-9236-b4cf50317ea4",
  "account_id": "e6d069ab-9217-4db2-93f1-920991287e9f",
  "transaction_id": null,
  "topic": "product_updated",
  "data": {
    "changes": ["interval", "plan_id"],
    "resource": {
      "id": "02249665-cc9d-4ebf-bb35-00e5a72f91bf",
      "name": "Select",
      "type": "products",
      "coupon": null,
      "user_id": "b14452d2-ceef-4791-9236-b4cf50317ea4",
      "interval": "year",
      "account_id": "e6d069ab-9217-4db2-93f1-920991287e9f",
      "updated_at": {
        "day": 30,
        "hour": 20,
        "year": 2025,
        "month": 5,
        "minute": 48,
        "second": 38,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 30,
        "hour": 19,
        "year": 2024,
        "month": 10,
        "minute": 58,
        "second": 50,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "stripe_status": "active",
      "billing_status": null,
      "has_used_trial": false,
      "activation_date": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-30 20:48:38.256878",
  "source": null,
  "inserted_at": "2025-05-30 20:48:50",
  "updated_at": "2025-05-30 20:48:50",
  "updated_date": "2025-05-30",
  "resource_id": "02249665-cc9d-4ebf-bb35-00e5a72f91bf",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `stripe_subscription_updated`

```json
{
  "id": "76dbff9d-979d-4cbf-9e85-07e0fbbd84d4",
  "user_id": "",
  "account_id": "47b08871-0ff8-4191-8ccf-f6224a120beb",
  "transaction_id": "",
  "topic": "stripe_subscription_updated",
  "data": {
    "id": "evt_1IbF53GyxyMEWHoz5iAoXAxU",
    "data": {
      "object": {
        "id": "sub_IUM7vm3l6vOgfT",
        "plan": {
          "id": "plan_HE53uyvOZPkHbY",
          "tiers": null,
          "active": true,
          "amount": 0,
          "object": "plan",
          "created": 1588731698,
          "product": "prod_HE50j3A0xeeU2J",
          "currency": "usd",
          "interval": "month",
          "livemode": true,
          "metadata": {},
          "nickname": "Select - Monthly",
          "tiers_mode": null,
          "usage_type": "licensed",
          "amount_decimal": "0",
          "billing_scheme": "per_unit",
          "interval_count": 1,
          "aggregate_usage": null,
          "transform_usage": null,
          "trial_period_days": null
        },
        "items": {
          "url": "/v1/subscription_items?subscription=sub_IUM7vm3l6vOgfT",
          "data": [
            {
              "id": "si_IUM7MG8Ovrllfm",
              "plan": {
                "id": "plan_HE53uyvOZPkHbY",
                "tiers": null,
                "active": true,
                "amount": 0,
                "object": "plan",
                "created": 1588731698,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "interval": "month",
                "livemode": true,
                "metadata": {},
                "nickname": "Select - Monthly",
                "tiers_mode": null,
                "usage_type": "licensed",
                "amount_decimal": "0",
                "billing_scheme": "per_unit",
                "interval_count": 1,
                "aggregate_usage": null,
                "transform_usage": null,
                "trial_period_days": null
              },
              "price": {
                "id": "plan_HE53uyvOZPkHbY",
                "type": "recurring",
                "active": true,
                "object": "price",
                "created": 1588731698,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "livemode": true,
                "metadata": {},
                "nickname": "Select - Monthly",
                "recurring": {
                  "interval": "month",
                  "usage_type": "licensed",
                  "interval_count": 1,
                  "aggregate_usage": null,
                  "trial_period_days": null
                },
                "lookup_key": null,
                "tiers_mode": null,
                "unit_amount": 0,
                "billing_scheme": "per_unit",
                "transform_quantity": null,
                "unit_amount_decimal": "0"
              },
              "object": "subscription_item",
              "created": 1606785129,
              "metadata": {},
              "quantity": 1,
              "tax_rates": [],
              "subscription": "sub_IUM7vm3l6vOgfT",
              "billing_thresholds": null
            }
          ],
          "object": "list",
          "has_more": false,
          "total_count": 1
        },
        "object": "subscription",
        "status": "active",
        "created": 1606785128,
        "customer": "cus_IUM70Xhx477Ptg",
        "discount": null,
        "ended_at": null,
        "livemode": true,
        "metadata": {},
        "quantity": 1,
        "schedule": null,
        "cancel_at": null,
        "trial_end": null,
        "start_date": 1606785128,
        "canceled_at": null,
        "tax_percent": null,
        "trial_start": null,
        "transfer_data": null,
        "days_until_due": null,
        "default_source": null,
        "latest_invoice": "in_1IbF53GyxyMEWHozDI4Ra8zK",
        "pending_update": null,
        "pause_collection": null,
        "collection_method": "charge_automatically",
        "default_tax_rates": [
          {
            "id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
            "state": null,
            "active": true,
            "object": "tax_rate",
            "country": null,
            "created": 1557282561,
            "livemode": true,
            "metadata": {},
            "inclusive": true,
            "percentage": 0.0,
            "description": null,
            "display_name": "Tax",
            "jurisdiction": null
          }
        ],
        "billing_thresholds": null,
        "current_period_end": 1619831528,
        "billing_cycle_anchor": 1606785128,
        "cancel_at_period_end": false,
        "current_period_start": 1617239528,
        "pending_setup_intent": null,
        "default_payment_method": null,
        "application_fee_percent": null,
        "pending_invoice_item_interval": null,
        "next_pending_invoice_item_invoice": null
      },
      "previous_attributes": {
        "latest_invoice": "in_1IQ0JLGyxyMEWHoz5l2kWlXx",
        "current_period_end": 1617239528,
        "current_period_start": 1614561128
      }
    },
    "type": "customer.subscription.updated",
    "object": "event",
    "created": 1617239537,
    "request": {
      "id": null,
      "idempotency_key": null
    },
    "livemode": true,
    "api_version": "2019-12-03",
    "pending_webhooks": 5
  },
  "initialized_at": "2021-04-01 01:12:18",
  "occurred_at": "2021-04-01 01:12:18",
  "source": "",
  "inserted_at": "2021-04-01 01:12:18",
  "updated_at": "2021-04-01 01:12:18",
  "updated_date": null,
  "resource_id": "b3738b29-fa92-4bf4-aa31-fab53da59510",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `verification_created_password`

```json
{
  "id": "3cf02ea1-f9d8-4f78-b06f-13c99a16752c",
  "user_id": "eff0d6a9-37fe-4a92-b28c-5cfb778f8dc7",
  "account_id": null,
  "transaction_id": null,
  "topic": "verification_created_password",
  "data": {
    "changes": ["code", "e_date", "scope", "user_id"],
    "resource": {
      "id": "c16a9adc-d52e-4359-bb67-9b8d90e51adc",
      "code": "08c88c00-406b-4042-b5b9-8af214d4cb4f",
      "user": {
        "__field__": "user",
        "__owner__": "Elixir.Backbone.Repo.Verification",
        "__cardinality__": "one"
      },
      "scope": 2,
      "e_date": {
        "day": 3,
        "hour": 20,
        "year": 2025,
        "month": 5,
        "minute": 30,
        "second": 9,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "user_id": "eff0d6a9-37fe-4a92-b28c-5cfb778f8dc7",
      "__meta__": {
        "state": "loaded",
        "prefix": null,
        "schema": "Elixir.Backbone.Repo.Verification",
        "source": "verifications",
        "context": null
      },
      "updated_at": {
        "day": 2,
        "hour": 20,
        "year": 2025,
        "month": 5,
        "minute": 30,
        "second": 9,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 2,
        "hour": 20,
        "year": 2025,
        "month": 5,
        "minute": 30,
        "second": 9,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-02 20:30:09.234967",
  "source": null,
  "inserted_at": "2025-05-02 20:30:20",
  "updated_at": "2025-05-02 20:30:20",
  "updated_date": "2025-05-02",
  "resource_id": "c16a9adc-d52e-4359-bb67-9b8d90e51adc",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `edit_credit_manual_adjustment`

```json
{
  "id": "25e561aa-3cec-44cd-b9d2-6ba33d50a4ab",
  "user_id": "5b2286dd-3f99-4b2b-8f21-27d38d9a4ab5",
  "account_id": "aa2a1c6b-de61-400b-ba6c-967dc1fa7f9c",
  "transaction_id": null,
  "topic": "edit_credit_manual_adjustment",
  "data": {
    "user_id": "5b2286dd-3f99-4b2b-8f21-27d38d9a4ab5",
    "account_id": "aa2a1c6b-de61-400b-ba6c-967dc1fa7f9c",
    "credit_balance": 1000,
    "adjustment_amount": 1000
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-09 02:02:28.964825",
  "source": null,
  "inserted_at": "2025-02-09 02:02:41",
  "updated_at": "2025-02-09 02:02:41",
  "updated_date": "2025-02-09",
  "resource_id": null,
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `reward_scheme_created`

```json
{
  "id": "32491aba-3542-49b4-a5b4-4652e675652d",
  "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
  "account_id": "8bc49ae9-4a3e-4548-bffc-f1234f16acf9",
  "transaction_id": null,
  "topic": "reward_scheme_created",
  "data": {
    "changes": ["account_id", "referral_code"],
    "resource": {
      "id": "01abceaa-2bdd-47dd-a77f-27707783a016",
      "type": "reward_schemes",
      "user_id": "8ea2cb8b-5a0b-4784-8aa9-68a67e00a0af",
      "account_id": "8bc49ae9-4a3e-4548-bffc-f1234f16acf9",
      "updated_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 36,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 7,
        "second": 36,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "scheme_type": "referral_scheme",
      "referral_code": "jairo3264"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 11:07:36.203851",
  "source": null,
  "inserted_at": "2025-04-03 11:07:48",
  "updated_at": "2025-04-03 11:07:48",
  "updated_date": "2025-04-03",
  "resource_id": "01abceaa-2bdd-47dd-a77f-27707783a016",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `project_updated`

```json
{
  "id": "9838d8e5-fec6-4f18-b86c-5a733099791a",
  "user_id": "87784039-d58f-4de0-884d-550aa838ab97",
  "account_id": "7c70a49b-4ead-4ba9-800b-0be574368ebf",
  "transaction_id": null,
  "topic": "project_updated",
  "data": {
    "changes": ["deleted_on"],
    "resource": {
      "id": "7c47be57-d5b4-44f3-a965-a48e01acf3fd",
      "name": "AI Preset 6",
      "type": "projects",
      "status": "active",
      "user_id": "87784039-d58f-4de0-884d-550aa838ab97",
      "archived": false,
      "select_id": "f7ab8dd7-1a8e-468c-96b1-e2983efac748",
      "account_id": "7c70a49b-4ead-4ba9-800b-0be574368ebf",
      "deleted_on": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 0,
        "second": 15,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "publish_id": null,
      "updated_at": {
        "day": 3,
        "hour": 11,
        "year": 2025,
        "month": 4,
        "minute": 0,
        "second": 15,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 3,
        "hour": 1,
        "year": 2025,
        "month": 4,
        "minute": 50,
        "second": 11,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "legacy_post_id": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 11:00:15.665556",
  "source": null,
  "inserted_at": "2025-04-03 11:00:27",
  "updated_at": "2025-04-03 11:00:27",
  "updated_date": "2025-04-03",
  "resource_id": "7c47be57-d5b4-44f3-a965-a48e01acf3fd",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `device_created`

```json
{
  "id": "927ce242-4008-4507-a6e5-6f6b8d7ef89c",
  "user_id": "bf109f58-b4df-4174-b170-3ba9234fb2ca",
  "account_id": "9e894f22-efd1-4330-9b5b-ec8aabd17c9c",
  "transaction_id": null,
  "topic": "device_created",
  "data": {
    "changes": ["kind", "name", "save_id"],
    "resource": {
      "id": "dcda1fcd-346d-4aab-9144-5889b44ed946",
      "kind": "Mac",
      "name": "Cassandra\u2019s MacBook Pro",
      "type": "devices",
      "save_id": "6abc40f8-611f-4602-bcf0-c1fe3a0343b5",
      "user_id": "bf109f58-b4df-4174-b170-3ba9234fb2ca",
      "cpu_count": null,
      "mem_count": null,
      "account_id": "9e894f22-efd1-4330-9b5b-ec8aabd17c9c",
      "updated_at": {
        "day": 13,
        "hour": 19,
        "year": 2025,
        "month": 2,
        "minute": 2,
        "second": 35,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 13,
        "hour": 19,
        "year": 2025,
        "month": 2,
        "minute": 2,
        "second": 35,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-13 19:02:35.742548",
  "source": null,
  "inserted_at": "2025-02-13 19:02:44",
  "updated_at": "2025-02-13 19:02:44",
  "updated_date": "2025-02-13",
  "resource_id": "dcda1fcd-346d-4aab-9144-5889b44ed946",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `affiliate_signup_qualified`

```json
{
  "id": "c2acb01f-4f03-4bd6-80f8-ccfdfa4048b7",
  "user_id": "77fe3cab-085a-4b6c-a965-285fcc8dcb54",
  "account_id": "10f6c415-7131-4631-8f59-f9eda513cae5",
  "transaction_id": null,
  "topic": "affiliate_signup_qualified",
  "data": {
    "id": "93123098-8ef0-42de-8360-80da8abed30e",
    "user_id": "77fe3cab-085a-4b6c-a965-285fcc8dcb54",
    "account_id": "10f6c415-7131-4631-8f59-f9eda513cae5",
    "product_id": "15bd6916-9701-43dc-a725-67e404cbaaa8",
    "is_qualified": true,
    "product_type": "select"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-20 16:53:42.290080",
  "source": null,
  "inserted_at": "2025-02-20 16:53:54",
  "updated_at": "2025-02-20 16:53:54",
  "updated_date": "2025-02-20",
  "resource_id": "93123098-8ef0-42de-8360-80da8abed30e",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `reward_created`

```json
{
  "id": "bc09a449-fb47-4d13-86a4-52cf50aa33d8",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "reward_created",
  "data": {
    "id": "356b00de-97d3-4093-a176-5884efb5d5f4",
    "type": "rewards",
    "status": "active",
    "issue_date": {
      "day": 18,
      "hour": 21,
      "year": 2025,
      "month": 2,
      "minute": 48,
      "second": 4,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "updated_at": {
      "day": 18,
      "hour": 22,
      "year": 2025,
      "month": 2,
      "minute": 2,
      "second": 12,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "expiry_date": {
      "day": 18,
      "hour": 21,
      "year": 2026,
      "month": 2,
      "minute": 48,
      "second": 4,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 18,
      "hour": 21,
      "year": 2025,
      "month": 2,
      "minute": 48,
      "second": 4,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "account_info": {
      "f_name": "Micha\u0142",
      "l_name": null
    },
    "rewardee_account_id": "0dbdac12-e3ac-44c0-a98e-df98a4d8e371",
    "rewardee_product_id": "834da6bd-f750-488e-90bf-5c4e7a300030",
    "rewarder_account_id": "75789388-38b7-4b5a-a876-b786050ea15e",
    "rewarder_product_id": "8447692b-eae3-4cfc-a78b-b36cee4934a1"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-18 22:02:12.981993",
  "source": null,
  "inserted_at": "2025-02-18 22:02:23",
  "updated_at": "2025-02-18 22:02:23",
  "updated_date": "2025-02-18",
  "resource_id": "356b00de-97d3-4093-a176-5884efb5d5f4",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `affiliate_scheme_deleted`

```json
{
  "id": "e931b4f6-d713-448e-a3b8-0bb603361625",
  "user_id": "e5b5c101-99a2-4eb7-b34a-6c0256571ecc",
  "account_id": "d89d822c-a597-4f90-b059-8736018c67c8",
  "transaction_id": "",
  "topic": "affiliate_scheme_deleted",
  "data": {
    "id": "5054c0ae-725e-4b16-b2d7-5ac6a826b082",
    "type": "affiliate_schemes",
    "user_id": "e5b5c101-99a2-4eb7-b34a-6c0256571ecc",
    "account_id": "d89d822c-a597-4f90-b059-8736018c67c8",
    "updated_at": {
      "day": 29,
      "hour": 21,
      "year": 2021,
      "month": 8,
      "minute": 9,
      "second": 55,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 27,
      "hour": 12,
      "year": 2021,
      "month": 8,
      "minute": 36,
      "second": 6,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "affiliate_code": "yemi10",
    "tapfiliate_ref_id": "yemiomotoyinbo",
    "tapfiliate_temporary_password": "76d33f06od15ac51c"
  },
  "initialized_at": "NaT",
  "occurred_at": "2022-03-10 01:54:10",
  "source": "",
  "inserted_at": "2022-03-10 01:54:21",
  "updated_at": "2022-03-10 01:54:21",
  "updated_date": null,
  "resource_id": "5054c0ae-725e-4b16-b2d7-5ac6a826b082",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `publisher_created`

```json
{
  "id": "ca9d2459-b037-4a29-8089-6d480c2a9769",
  "user_id": "6aebdcd1-0c24-471b-bcca-7cfb5e6399a4",
  "account_id": "e679f5f9-0919-4c8c-ad4d-31d51803b5ed",
  "transaction_id": null,
  "topic": "publisher_created",
  "data": {
    "changes": [
      "detected_type",
      "host",
      "password",
      "publish_id",
      "publisher_type",
      "status_label",
      "theme_info"
    ],
    "resource": {
      "id": "64f2b098-6d7c-489b-8f3c-270e29e13984",
      "host": "corneliakindsvater.ch",
      "info": null,
      "tags": null,
      "type": "publisher",
      "status": "no_plugin",
      "user_id": "6aebdcd1-0c24-471b-bcca-7cfb5e6399a4",
      "account_id": "e679f5f9-0919-4c8c-ad4d-31d51803b5ed",
      "categories": null,
      "publish_id": "05be9bfa-9e7e-4b3c-866b-48a7b60d9e33",
      "theme_info": "Flothemes",
      "updated_at": {
        "day": 22,
        "hour": 17,
        "year": 2024,
        "month": 1,
        "minute": 43,
        "second": 52,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 22,
        "hour": 17,
        "year": 2024,
        "month": 1,
        "minute": 43,
        "second": 52,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "auto_publish": false,
      "detected_type": "WordPress",
      "publisher_type": "WordPressAuto",
      "default_category": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2024-01-22 17:43:52",
  "source": null,
  "inserted_at": "2024-01-22 17:44:02",
  "updated_at": "2024-01-22 17:44:02",
  "updated_date": null,
  "resource_id": "64f2b098-6d7c-489b-8f3c-270e29e13984",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `session_updated`

```json
{
  "id": "bc437eec-0348-48e2-a1aa-a8d84748feab",
  "user_id": "4b3a0f40-9527-40c9-8617-05581cbdffa8",
  "account_id": null,
  "transaction_id": null,
  "topic": "session_updated",
  "data": {
    "type": "sessions",
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJOYXJyYXRpdmUiLCJleHAiOjE3NTAwMTIyMDMsImlhdCI6MTc0NzQyMDIwMywiaXNzIjoiTmFycmF0aXZlIiwianRpIjoiNDg2ZGVjOTQtZGJlMC00YmEzLWExYzktZDc4Zjk5MzIyNGQ2IiwibmJmIjoxNzQ3NDIwMjAyLCJzdWIiOiJVc2VyOjRiM2EwZjQwLTk1MjctNDBjOS04NjE3LTA1NTgxY2JkZmZhOCIsInR5cCI6ImFjY2VzcyJ9.9yDQ6W4-8o5hCy2xTinvL5qxsp9N6oBy3Q9ZyPjHnwoOjJhnvUAojUbhytHYyhyRTZx4qIdJ5Xba8tP5MzVpfw",
    "device": "select",
    "user_id": "4b3a0f40-9527-40c9-8617-05581cbdffa8"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-16 18:30:03.019233",
  "source": null,
  "inserted_at": "2025-05-16 18:30:05",
  "updated_at": "2025-05-16 18:30:05",
  "updated_date": "2025-05-16",
  "resource_id": null,
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `verification_created_email`

```json
{
  "id": "a43034ef-ae44-4898-87b4-cb3aca86af80",
  "user_id": "f2909281-eeb2-465b-8f51-07230b553640",
  "account_id": null,
  "transaction_id": null,
  "topic": "verification_created_email",
  "data": {
    "changes": ["code", "e_date", "scope", "user_id"],
    "resource": {
      "id": "86717207-5cf6-4fca-bfe8-e42f360ac89b",
      "code": "ab2c3ea4-edee-48ff-a26d-c4d7343a3e9f",
      "user": {
        "__field__": "user",
        "__owner__": "Elixir.Backbone.Repo.Verification",
        "__cardinality__": "one"
      },
      "scope": 1,
      "e_date": {
        "day": 24,
        "hour": 19,
        "year": 2025,
        "month": 2,
        "minute": 32,
        "second": 21,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "user_id": "f2909281-eeb2-465b-8f51-07230b553640",
      "__meta__": {
        "state": "loaded",
        "prefix": null,
        "schema": "Elixir.Backbone.Repo.Verification",
        "source": "verifications",
        "context": null
      },
      "updated_at": {
        "day": 23,
        "hour": 19,
        "year": 2025,
        "month": 2,
        "minute": 32,
        "second": 21,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 23,
        "hour": 19,
        "year": 2025,
        "month": 2,
        "minute": 32,
        "second": 21,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-23 19:32:21.318091",
  "source": null,
  "inserted_at": "2025-02-23 19:32:33",
  "updated_at": "2025-02-23 19:32:33",
  "updated_date": "2025-02-23",
  "resource_id": "86717207-5cf6-4fca-bfe8-e42f360ac89b",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `source_created`

```json
{
  "id": "abdcd055-2db0-4113-9cba-05297019c8e1",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "source_created",
  "data": {
    "changes": ["available_bytes", "kind", "name", "save_id", "total_bytes"],
    "resource": {
      "id": "95dd8bc2-688a-4559-8fa4-2738932e107e",
      "kind": "internal",
      "name": "Edit Dummy Source",
      "type": "sources",
      "save_id": "18080fac-3cfe-4707-bd8f-ea9355e7bab1",
      "updated_at": {
        "day": 30,
        "hour": 18,
        "year": 2025,
        "month": 5,
        "minute": 28,
        "second": 22,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 30,
        "hour": 18,
        "year": 2025,
        "month": 5,
        "minute": 28,
        "second": 22,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "total_bytes": 99999,
      "is_ephemeral": false,
      "available_bytes": 99999
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-05-30 18:28:22.648141",
  "source": null,
  "inserted_at": "2025-05-30 18:28:32",
  "updated_at": "2025-05-30 18:28:32",
  "updated_date": "2025-05-30",
  "resource_id": "95dd8bc2-688a-4559-8fa4-2738932e107e",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `project_retrieved`

```json
{
  "id": "de4649c2-dba0-48be-9c7d-7cb3a2129c7e",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "project_retrieved",
  "data": {
    "id": "ee6d9530-bbf9-4d3c-b205-9046f126ef2d",
    "name": "The Fenech Family | A Farm Session",
    "select": {
      "__field__": "select",
      "__owner__": "Elixir.Fetch.Model.Project",
      "__cardinality__": "one"
    },
    "status": "active",
    "publish": {
      "__field__": "publish",
      "__owner__": "Elixir.Fetch.Model.Project",
      "__cardinality__": "one"
    },
    "__meta__": {
      "state": "loaded",
      "prefix": null,
      "schema": "Elixir.Fetch.Model.Project",
      "source": "projects",
      "context": null
    },
    "archived": false,
    "select_id": null,
    "deleted_on": null,
    "publish_id": "4b90796b-7ba7-4747-b161-210e244245f4",
    "updated_at": {
      "day": 13,
      "hour": 17,
      "year": 2021,
      "month": 9,
      "minute": 55,
      "second": 47,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 13,
      "hour": 17,
      "year": 2021,
      "month": 9,
      "minute": 55,
      "second": 47,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "project_versions": {
      "__field__": "project_versions",
      "__owner__": "Elixir.Fetch.Model.Project",
      "__cardinality__": "many"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-09-14 05:12:52",
  "source": "",
  "inserted_at": "2021-09-14 05:12:57",
  "updated_at": "2021-09-14 05:12:57",
  "updated_date": null,
  "resource_id": "ee6d9530-bbf9-4d3c-b205-9046f126ef2d",
  "meta": "{\"origin\":\"https://stefaniechilds.com\",\"callsite\":\"Elixir.Fetch.Retrieve.Project.with_project_and_product/4\",\"remote_ip\":\"2406:5a00:a234:1d00:ac12:24ff:87c4:48ff\",\"user_agent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15\",\"request_path\":\"/core/retrieve-doc/ee6d9530-bbf9-4d3c-b205-9046f126ef2d\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `reward_coupon_used`

```json
{
  "id": "7ac7fed1-0c45-43ee-bbbf-a87f4512a480",
  "user_id": "0831c7fa-dcc5-4502-b510-2591ac8a77fb",
  "account_id": "75789388-38b7-4b5a-a876-b786050ea15e",
  "transaction_id": null,
  "topic": "reward_coupon_used",
  "data": {
    "user_id": "0831c7fa-dcc5-4502-b510-2591ac8a77fb",
    "paid_plan": false,
    "account_id": "75789388-38b7-4b5a-a876-b786050ea15e",
    "coupon_code": "narrative13328",
    "created_product_id": "834da6bd-f750-488e-90bf-5c4e7a300030"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-18 22:02:12.983211",
  "source": null,
  "inserted_at": "2025-02-18 22:02:23",
  "updated_at": "2025-02-18 22:02:23",
  "updated_date": "2025-02-18",
  "resource_id": null,
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `stripe_subscription_created`

```json
{
  "id": "0e85c121-a099-4b86-bda0-9c3c0dc59cf0",
  "user_id": "",
  "account_id": "7ca126cd-83f8-46ce-9f83-359d049821af",
  "transaction_id": "",
  "topic": "stripe_subscription_created",
  "data": {
    "id": "evt_1IbPpeGyxyMEWHozAd7H8rMV",
    "data": {
      "object": {
        "id": "sub_JDrYSsHQv5pJy3",
        "plan": {
          "id": "plan_HE53uyvOZPkHbY",
          "tiers": null,
          "active": true,
          "amount": 0,
          "object": "plan",
          "created": 1588731698,
          "product": "prod_HE50j3A0xeeU2J",
          "currency": "usd",
          "interval": "month",
          "livemode": true,
          "metadata": {},
          "nickname": "Select - Monthly",
          "tiers_mode": null,
          "usage_type": "licensed",
          "amount_decimal": "0",
          "billing_scheme": "per_unit",
          "interval_count": 1,
          "aggregate_usage": null,
          "transform_usage": null,
          "trial_period_days": null
        },
        "items": {
          "url": "/v1/subscription_items?subscription=sub_JDrYSsHQv5pJy3",
          "data": [
            {
              "id": "si_JDrYvUBO62o1VS",
              "plan": {
                "id": "plan_HE53uyvOZPkHbY",
                "tiers": null,
                "active": true,
                "amount": 0,
                "object": "plan",
                "created": 1588731698,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "interval": "month",
                "livemode": true,
                "metadata": {},
                "nickname": "Select - Monthly",
                "tiers_mode": null,
                "usage_type": "licensed",
                "amount_decimal": "0",
                "billing_scheme": "per_unit",
                "interval_count": 1,
                "aggregate_usage": null,
                "transform_usage": null,
                "trial_period_days": null
              },
              "price": {
                "id": "plan_HE53uyvOZPkHbY",
                "type": "recurring",
                "active": true,
                "object": "price",
                "created": 1588731698,
                "product": "prod_HE50j3A0xeeU2J",
                "currency": "usd",
                "livemode": true,
                "metadata": {},
                "nickname": "Select - Monthly",
                "recurring": {
                  "interval": "month",
                  "usage_type": "licensed",
                  "interval_count": 1,
                  "aggregate_usage": null,
                  "trial_period_days": null
                },
                "lookup_key": null,
                "tiers_mode": null,
                "unit_amount": 0,
                "billing_scheme": "per_unit",
                "transform_quantity": null,
                "unit_amount_decimal": "0"
              },
              "object": "subscription_item",
              "created": 1617280866,
              "metadata": {},
              "quantity": 1,
              "tax_rates": [],
              "subscription": "sub_JDrYSsHQv5pJy3",
              "billing_thresholds": null
            }
          ],
          "object": "list",
          "has_more": false,
          "total_count": 1
        },
        "object": "subscription",
        "status": "active",
        "created": 1617280865,
        "customer": "cus_JDrYRIZ37jdLeJ",
        "discount": null,
        "ended_at": null,
        "livemode": true,
        "metadata": {},
        "quantity": 1,
        "schedule": null,
        "cancel_at": null,
        "trial_end": null,
        "start_date": 1617280865,
        "canceled_at": null,
        "tax_percent": null,
        "trial_start": null,
        "transfer_data": null,
        "days_until_due": null,
        "default_source": null,
        "latest_invoice": "in_1IbPpdGyxyMEWHozNHwvHEeR",
        "pending_update": null,
        "pause_collection": null,
        "collection_method": "charge_automatically",
        "default_tax_rates": [
          {
            "id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
            "state": null,
            "active": true,
            "object": "tax_rate",
            "country": null,
            "created": 1557282561,
            "livemode": true,
            "metadata": {},
            "inclusive": true,
            "percentage": 0.0,
            "description": null,
            "display_name": "Tax",
            "jurisdiction": null
          }
        ],
        "billing_thresholds": null,
        "current_period_end": 1619872865,
        "billing_cycle_anchor": 1617280865,
        "cancel_at_period_end": false,
        "current_period_start": 1617280865,
        "pending_setup_intent": null,
        "default_payment_method": null,
        "application_fee_percent": null,
        "pending_invoice_item_interval": null,
        "next_pending_invoice_item_invoice": null
      }
    },
    "type": "customer.subscription.created",
    "object": "event",
    "created": 1617280865,
    "request": {
      "id": "req_DfOyIuZ1nCWYtI",
      "idempotency_key": null
    },
    "livemode": true,
    "api_version": "2019-12-03",
    "pending_webhooks": 4
  },
  "initialized_at": "2021-04-01 12:41:07",
  "occurred_at": "2021-04-01 12:41:07",
  "source": "",
  "inserted_at": "2021-04-01 12:41:07",
  "updated_at": "2021-04-01 12:41:07",
  "updated_date": null,
  "resource_id": "c46c100e-d7a0-45b8-8907-53c14a716640",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `set_asset_location_created`

```json
{
  "id": "195b93f9-4d75-4e83-b5b3-b02ea296b441",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "set_asset_location_created",
  "data": {
    "changes": ["asset_location_id", "set_id"],
    "resource": {
      "type": "sets",
      "updated_at": {
        "day": 16,
        "hour": 5,
        "year": 2021,
        "month": 8,
        "minute": 21,
        "second": 46,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 16,
        "hour": 5,
        "year": 2021,
        "month": 8,
        "minute": 21,
        "second": 46,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-08-16 05:21:46",
  "source": "",
  "inserted_at": "2021-08-16 05:21:48",
  "updated_at": "2021-08-16 05:21:48",
  "updated_date": null,
  "resource_id": "",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `reward_scheme_deleted`

```json
{
  "id": "4a0ac84a-df32-4f86-893e-a943d3fc27f3",
  "user_id": null,
  "account_id": "8831e160-d23c-4e1e-aacf-1cefc87490c0",
  "transaction_id": null,
  "topic": "reward_scheme_deleted",
  "data": {
    "id": "1dc011d9-f00a-404d-a15b-ba2008d10a32",
    "type": "reward_schemes",
    "account_id": "8831e160-d23c-4e1e-aacf-1cefc87490c0",
    "updated_at": {
      "day": 8,
      "hour": 21,
      "year": 2022,
      "month": 4,
      "minute": 34,
      "second": 49,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 8,
      "hour": 21,
      "year": 2022,
      "month": 4,
      "minute": 34,
      "second": 49,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "scheme_type": "referral_scheme",
    "referral_code": "narrative47309"
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-12-30 00:00:00",
  "source": null,
  "inserted_at": "2023-12-30 00:00:11",
  "updated_at": "2023-12-30 00:00:11",
  "updated_date": null,
  "resource_id": "1dc011d9-f00a-404d-a15b-ba2008d10a32",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `set_created`

```json
{
  "id": "b07ba3da-03dd-414c-a5f8-95cdd077d881",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "set_created",
  "data": {
    "changes": ["name", "save_id"],
    "resource": {
      "id": "647966bc-6c3a-4a17-bd11-ff1c7ddbd239",
      "name": "Set for Project AI Preset 1",
      "type": "sets",
      "save_id": "65fc01c4-f291-452c-85bb-bc575bbad30e",
      "updated_at": {
        "day": 3,
        "hour": 12,
        "year": 2025,
        "month": 4,
        "minute": 52,
        "second": 13,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 3,
        "hour": 12,
        "year": 2025,
        "month": 4,
        "minute": 52,
        "second": 13,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 12:52:13.614535",
  "source": null,
  "inserted_at": "2025-04-03 12:52:25",
  "updated_at": "2025-04-03 12:52:25",
  "updated_date": "2025-04-03",
  "resource_id": "647966bc-6c3a-4a17-bd11-ff1c7ddbd239",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `account_updated`

```json
{
  "id": "063a7c18-1a21-4b91-8a3d-f4aca9ff9a0f",
  "user_id": "88e18a1d-c35a-4f91-a2bf-8fc0cb4cb0c3",
  "account_id": "6b7dc707-52d2-483b-baf0-45fc0026457b",
  "transaction_id": null,
  "topic": "account_updated",
  "data": {
    "id": "6b7dc707-52d2-483b-baf0-45fc0026457b",
    "name": "",
    "type": "accounts",
    "active": true,
    "status": 0,
    "address": {
      "city": "Lumberton",
      "line1": "535 W Walton Rd",
      "line2": "",
      "state": "TX",
      "country": "United States of America",
      "postal_code": "77657"
    },
    "billing": {
      "type": "card",
      "brand": "Visa",
      "last4": "1388",
      "country": "US",
      "exp_year": 2027,
      "exp_month": 11
    },
    "user_id": "88e18a1d-c35a-4f91-a2bf-8fc0cb4cb0c3",
    "account_id": "6b7dc707-52d2-483b-baf0-45fc0026457b",
    "updated_at": {
      "day": 3,
      "hour": 21,
      "year": 2024,
      "month": 4,
      "minute": 29,
      "second": 50,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 12,
      "hour": 18,
      "year": 2022,
      "month": 4,
      "minute": 6,
      "second": 54,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "preferences": {
      "default_pack_id": null
    },
    "usage_status": "active",
    "status_action_date": null
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-09 02:23:22.952329",
  "source": null,
  "inserted_at": "2025-02-09 02:23:34",
  "updated_at": "2025-02-09 02:23:34",
  "updated_date": "2025-02-09",
  "resource_id": "6b7dc707-52d2-483b-baf0-45fc0026457b",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `backbone_product_deletion_scheduled`

```json
{
  "id": "1151fb95-ade9-4652-bd42-58ce7894d460",
  "user_id": "fabb44b9-5c8d-463a-8199-a33c8893c8f9",
  "account_id": "3ca1c1e5-3916-41f0-9040-c431f6a0f5ca",
  "transaction_id": null,
  "topic": "backbone_product_deletion_scheduled",
  "data": {
    "id": "a499950b-17f3-4cf0-ac78-b4a4b516c6cd",
    "name": "Select",
    "type": "products",
    "user_id": "fabb44b9-5c8d-463a-8199-a33c8893c8f9",
    "interval": "month",
    "account_id": "3ca1c1e5-3916-41f0-9040-c431f6a0f5ca",
    "updated_at": {
      "day": 17,
      "hour": 19,
      "year": 2025,
      "month": 3,
      "minute": 55,
      "second": 39,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 17,
      "hour": 12,
      "year": 2025,
      "month": 3,
      "minute": 0,
      "second": 12,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "stripe_status": "canceled",
    "billing_status": null,
    "has_used_trial": false,
    "activation_date": {
      "day": 16,
      "hour": 19,
      "year": 2025,
      "month": 4,
      "minute": 55,
      "second": 39,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-03-17 19:55:39.302490",
  "source": null,
  "inserted_at": "2025-03-17 19:55:51",
  "updated_at": "2025-03-17 19:55:51",
  "updated_date": "2025-03-17",
  "resource_id": "a499950b-17f3-4cf0-ac78-b4a4b516c6cd",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `share_link_updated`

```json
{
  "id": "97c4adc6-75f3-4719-92b9-e6587c69f0c7",
  "user_id": "6eb52227-0fb6-4e54-8d7c-b718e7ac80e1",
  "account_id": "cedd7fe9-3374-45cd-8c68-e52d60fcf3c2",
  "transaction_id": null,
  "topic": "share_link_updated",
  "data": {
    "id": "cb38f8e6-abbe-4768-b5a3-c6a501a89b41",
    "kind": "style",
    "type": "share_links",
    "status": "preparing",
    "user_id": "6eb52227-0fb6-4e54-8d7c-b718e7ac80e1",
    "permalink": "fetch.getnarrativeapp.com/share/style/7fc10c74-8fa4-4f8c-be63-39a39dd2a64c",
    "account_id": "cedd7fe9-3374-45cd-8c68-e52d60fcf3c2",
    "project_id": "7fc10c74-8fa4-4f8c-be63-39a39dd2a64c",
    "updated_at": {
      "day": 17,
      "hour": 19,
      "year": 2025,
      "month": 3,
      "minute": 35,
      "second": 18,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "frequencies": {
      "required": 577
    },
    "inserted_at": {
      "day": 17,
      "hour": 19,
      "year": 2025,
      "month": 3,
      "minute": 35,
      "second": 18,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "server_status": "sharelink_process_waiting_for_assets",
    "project_version_id": "6f37fb89-5206-49fc-9fb5-88e52bcddc89"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-03-17 19:35:18.968350",
  "source": null,
  "inserted_at": "2025-03-17 19:35:24",
  "updated_at": "2025-03-17 19:35:24",
  "updated_date": "2025-03-17",
  "resource_id": "cb38f8e6-abbe-4768-b5a3-c6a501a89b41",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `stripe_webhook`

```json
{
  "id": "48744375-44e0-45ca-b74e-2b0d0bd8315d",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "stripe_webhook",
  "data": {
    "id": "evt_1R9lVaGyxyMEWHoznrb45ulG",
    "data": {
      "object": {
        "id": "in_1R9kYxGyxyMEWHoz22aHyLyL",
        "tax": 0,
        "paid": true,
        "lines": {
          "url": "/v1/invoices/in_1R9kYxGyxyMEWHoz22aHyLyL/lines",
          "data": [
            {
              "id": "il_1R9kYxGyxyMEWHoz7eDQvugr",
              "plan": {
                "id": "plan_K32Dodo2s48X6g",
                "name": null,
                "tiers": null,
                "active": true,
                "amount": 0,
                "object": "plan",
                "created": 1629083138,
                "deleted": null,
                "product": "prod_K32D875E2IdMZF",
                "currency": "usd",
                "interval": "month",
                "livemode": true,
                "metadata": {},
                "nickname": "Publish Trial-Month",
                "tiers_mode": null,
                "usage_type": "licensed",
                "amount_decimal": "0",
                "billing_scheme": "per_unit",
                "interval_count": 1,
                "aggregate_usage": null,
                "transform_usage": null,
                "trial_period_days": null
              },
              "type": "subscription",
              "price": {
                "id": "plan_K32Dodo2s48X6g",
                "type": "recurring",
                "tiers": null,
                "active": true,
                "object": "price",
                "created": 1629083138,
                "product": "prod_K32D875E2IdMZF",
                "currency": "usd",
                "livemode": true,
                "metadata": {},
                "nickname": "Publish Trial-Month",
                "recurring": {
                  "meter": null,
                  "interval": "month",
                  "usage_type": "licensed",
                  "interval_count": 1,
                  "aggregate_usage": null,
                  "trial_period_days": null
                },
                "lookup_key": null,
                "tiers_mode": null,
                "unit_amount": 0,
                "tax_behavior": "unspecified",
                "billing_scheme": "per_unit",
                "transform_quantity": null,
                "unit_amount_decimal": "0",
                "transform_lookup_key": null
              },
              "amount": 0,
              "object": "line_item",
              "period": {
                "end": 1746266377,
                "start": 1743674377
              },
              "currency": "usd",
              "livemode": true,
              "metadata": {},
              "quantity": 1,
              "proration": false,
              "tax_rates": [],
              "description": "1 \u00d7 Publish (at $0.00 / month)",
              "tax_amounts": [
                {
                  "amount": 0,
                  "tax_rate": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
                  "inclusive": true,
                  "taxable_amount": 0,
                  "taxability_reason": null
                }
              ],
              "discountable": true,
              "invoice_item": null,
              "subscription": "sub_1MhVOnGyxyMEWHozmDwftyll",
              "subscription_item": "si_NSQFI2Tgohx9SI"
            }
          ],
          "object": "list",
          "has_more": false,
          "total_count": 1
        },
        "total": 0,
        "charge": null,
        "footer": "Please note that all dollar amounts are in USD, including any Tax listed.",
        "number": "D3EBD3B0-0081",
        "object": "invoice",
        "status": "paid",
        "created": 1743674395,
        "deleted": null,
        "currency": "usd",
        "customer": "cus_I0uFyh0kgkmM9a",
        "discount": {
          "id": "di_1Id643GyxyMEWHozPNiRz23Y",
          "end": null,
          "start": 1617681535,
          "coupon": {
            "id": "cVUB6fyJ",
            "name": "EARLYWELCOME10",
            "valid": true,
            "object": "coupon",
            "created": 1617679650,
            "deleted": null,
            "currency": null,
            "duration": "once",
            "livemode": true,
            "metadata": {},
            "redeem_by": null,
            "amount_off": null,
            "applies_to": null,
            "percent_off": 10.0,
            "times_redeemed": 952,
            "max_redemptions": null,
            "duration_in_months": null
          },
          "object": "discount",
          "deleted": null,
          "customer": "cus_I0uFyh0kgkmM9a",
          "subscription": null,
          "promotion_code": null
        },
        "due_date": null,
        "livemode": true,
        "metadata": {},
        "subtotal": 0,
        "attempted": true,
        "discounts": ["di_1Id643GyxyMEWHozPNiRz23Y"],
        "amount_due": 0,
        "period_end": 1743674377,
        "amount_paid": 0,
        "description": null,
        "invoice_pdf": "https://pay.stripe.com/invoice/acct_1BGFUcGyxyMEWHoz/live_YWNjdF8xQkdGVWNHeXh5TUVXSG96LF9TM3NKYWV0WFpkN3NFdWU1R0E2c0RSZDIyY1dBaWlMLDEzNDIxODgzMA02002f0Y4ZbH/pdf?s=ap",
        "tax_percent": null,
        "account_name": "Narrative",
        "auto_advance": false,
        "on_behalf_of": null,
        "period_start": 1740995977,
        "subscription": "sub_1MhVOnGyxyMEWHozmDwftyll",
        "attempt_count": 0,
        "automatic_tax": {
          "status": null,
          "enabled": false,
          "liability": null,
          "disabled_reason": null
        },
        "custom_fields": [
          {
            "name": "GST #",
            "value": "123034368"
          }
        ],
        "customer_name": null,
        "transfer_data": null,
        "billing_reason": "subscription_cycle",
        "customer_email": "info@djd.ie",
        "customer_phone": null,
        "default_source": null,
        "ending_balance": 0,
        "payment_intent": null,
        "receipt_number": null,
        "account_country": "NZ",
        "account_tax_ids": null,
        "amount_remaining": 0,
        "customer_address": {
          "city": "",
          "line1": "",
          "line2": "",
          "state": "",
          "country": "",
          "postal_code": ""
        },
        "customer_tax_ids": [],
        "payment_settings": {
          "default_mandate": null,
          "payment_method_types": null,
          "payment_method_options": null
        },
        "starting_balance": 0,
        "threshold_reason": null,
        "collection_method": "charge_automatically",
        "customer_shipping": null,
        "default_tax_rates": [
          {
            "id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
            "state": null,
            "active": true,
            "object": "tax_rate",
            "country": null,
            "created": 1557282561,
            "livemode": true,
            "metadata": {},
            "inclusive": true,
            "percentage": 0.0,
            "description": null,
            "display_name": "Tax",
            "jurisdiction": null
          }
        ],
        "total_tax_amounts": [
          {
            "amount": 0,
            "tax_rate": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
            "inclusive": true,
            "taxable_amount": 0,
            "taxability_reason": null
          }
        ],
        "hosted_invoice_url": "https://invoice.stripe.com/i/acct_1BGFUcGyxyMEWHoz/live_YWNjdF8xQkdGVWNHeXh5TUVXSG96LF9TM3NKYWV0WFpkN3NFdWU1R0E2c0RSZDIyY1dBaWlMLDEzNDIxODgzMA02002f0Y4ZbH?s=ap",
        "status_transitions": {
          "paid_at": 1743678026,
          "voided_at": null,
          "finalized_at": 1743678026,
          "marked_uncollectible_at": null
        },
        "customer_tax_exempt": "none",
        "next_payment_attempt": null,
        "statement_descriptor": null,
        "webhooks_delivered_at": 1743674397,
        "application_fee_amount": null,
        "default_payment_method": null,
        "total_discount_amounts": [
          {
            "amount": 0,
            "discount": "di_1Id643GyxyMEWHozPNiRz23Y"
          }
        ],
        "last_finalization_error": null,
        "subscription_proration_date": null,
        "pre_payment_credit_notes_amount": 0,
        "post_payment_credit_notes_amount": 0
      }
    },
    "type": "invoice.payment_succeeded",
    "object": "event",
    "account": null,
    "created": 1743678028,
    "request": {
      "id": null,
      "idempotency_key": null
    },
    "livemode": true,
    "api_version": "2019-12-03",
    "pending_webhooks": 2
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-03 11:00:31.308280",
  "source": null,
  "inserted_at": "2025-04-03 11:00:32",
  "updated_at": "2025-04-03 11:00:32",
  "updated_date": "2025-04-03",
  "resource_id": "evt_1R9lVaGyxyMEWHoznrb45ulG",
  "meta": "{\"host\": \"api.getnarrativeapp.com\", \"method\": \"POST\", \"scheme\": \"http\", \"status\": null, \"remote_ip\": \"10.10.10.208\", \"req_headers\": {\"host\": \"api.getnarrativeapp.com\", \"accept\": \"*/*; q=0.5, application/xml\", \"user-agent\": \"Stripe/1.0 (+https://stripe.com/docs/webhooks)\", \"content-type\": \"application/json; charset=utf-8\", \"cache-control\": \"no-cache\", \"content-length\": \"11387\", \"x-amzn-trace-id\": \"Root=1-67ee6a4f-56d2a88746b8e192307ef3ba\", \"x-forwarded-for\": \"54.187.174.169\", \"stripe-signature\": \"t=1743678030,v1=885c02bad40ea2a845a1b429ed017ada76a48f814fc2c2454498d2e3a63c1c27\", \"x-forwarded-port\": \"443\", \"x-forwarded-proto\": \"https\"}, \"query_string\": \"\", \"request_path\": \"/hooks/stripe\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `session_created`

```json
{
  "id": "10164a12-97d7-46df-bc33-39a1dbea032f",
  "user_id": "396154c6-860e-4464-ac02-771f71f9e43f",
  "account_id": null,
  "transaction_id": null,
  "topic": "session_created",
  "data": {
    "type": "sessions",
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJOYXJyYXRpdmUiLCJleHAiOjE2ODEwNDcxMjcsImlhdCI6MTY3ODQ1NTEyNywiaXNzIjoiTmFycmF0aXZlIiwianRpIjoiZWU3YjEzZGYtNDI5NS00MDlkLTgwZDUtODE2MTQ3YTM4YjE5IiwibmJmIjoxNjc4NDU1MTI2LCJzdWIiOiJVc2VyOjM5NjE1NGM2LTg2MGUtNDQ2NC1hYzAyLTc3MWY3MWY5ZTQzZiIsInR5cCI6ImFjY2VzcyJ9.LUliQUfKq7ni7ETZglTwuftPiVRVeKsLh7tu3D0Ozt4jnn1Rr0JKCHJ65AHAxDyv2IS_9S_ImTBzg1dZVX9qEw",
    "device": "web",
    "user_id": "396154c6-860e-4464-ac02-771f71f9e43f"
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-03-10 13:32:07",
  "source": null,
  "inserted_at": "2023-03-10 13:32:09",
  "updated_at": "2023-03-10 13:32:09",
  "updated_date": null,
  "resource_id": null,
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `reward_scheme_updated`

```json
{
  "id": "20377faf-f9fa-44a2-bb6b-96f1cae1d32c",
  "user_id": "e9a57f1c-1414-4952-b075-30676b528034",
  "account_id": "0e7ca7d7-9c5a-4ac5-90d4-ccf8a33fe8a7",
  "transaction_id": "",
  "topic": "reward_scheme_updated",
  "data": {
    "changes": ["scheme_type", "tapfiliate_ref_id"],
    "resource": {
      "id": "de4da253-1cbe-4e22-99ae-115acad37c18",
      "type": "reward_schemes",
      "user_id": "e9a57f1c-1414-4952-b075-30676b528034",
      "account_id": "0e7ca7d7-9c5a-4ac5-90d4-ccf8a33fe8a7",
      "product_id": "c401b8f3-c002-4515-94f2-b5d071495226",
      "updated_at": "2020-11-03T03:25:05Z",
      "inserted_at": "2020-11-03T03:00:09Z",
      "scheme_type": "affiliate_scheme",
      "referral_code": "johansson2252",
      "temp_password": "eaef29bbaebaee736",
      "tapfiliate_ref_id": "johanssoncorreia"
    }
  },
  "initialized_at": "2020-11-03 03:25:05",
  "occurred_at": "2020-11-03 03:25:05",
  "source": "",
  "inserted_at": "2020-11-03 03:25:05",
  "updated_at": "2020-11-03 03:25:05",
  "updated_date": null,
  "resource_id": "de4da253-1cbe-4e22-99ae-115acad37c18",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `source_connection_created`

```json
{
  "id": "a830a7ff-bc45-432e-92df-89d5091d8d55",
  "user_id": "e805303f-31f8-4ad8-a153-8f7bffeefef3",
  "account_id": "c7e573ce-2faf-4f94-8783-2bd37999b2ab",
  "transaction_id": "",
  "topic": "source_connection_created",
  "data": {
    "changes": ["device_id", "source_id"],
    "resource": {
      "id": "15e9d537-ff34-459c-be98-0f77c236a2a4",
      "type": "devices",
      "user_id": "e805303f-31f8-4ad8-a153-8f7bffeefef3",
      "account_id": "c7e573ce-2faf-4f94-8783-2bd37999b2ab",
      "updated_at": {
        "day": 26,
        "hour": 17,
        "year": 2021,
        "month": 10,
        "minute": 26,
        "second": 5,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 26,
        "hour": 17,
        "year": 2021,
        "month": 10,
        "minute": 26,
        "second": 5,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      }
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-10-26 17:26:05",
  "source": "",
  "inserted_at": "2021-10-26 17:26:14",
  "updated_at": "2021-10-26 17:26:14",
  "updated_date": null,
  "resource_id": "15e9d537-ff34-459c-be98-0f77c236a2a4",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `affiliate_scheme_created`

```json
{
  "id": "d94f95f8-d1c4-48af-92f0-e506caffdd8d",
  "user_id": "c60cb590-ec1b-43a9-938f-586e7b57bc13",
  "account_id": "3631ca5b-5efe-473b-af9d-8b6dbf545e8d",
  "transaction_id": null,
  "topic": "affiliate_scheme_created",
  "data": {
    "changes": ["account_id", "affiliate_code"],
    "resource": {
      "id": "4ede75fa-9173-4584-b27f-3a2fb5820dec",
      "type": "affiliate_schemes",
      "user_id": "c60cb590-ec1b-43a9-938f-586e7b57bc13",
      "account_id": "3631ca5b-5efe-473b-af9d-8b6dbf545e8d",
      "updated_at": {
        "day": 17,
        "hour": 20,
        "year": 2025,
        "month": 2,
        "minute": 54,
        "second": 54,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 17,
        "hour": 20,
        "year": 2025,
        "month": 2,
        "minute": 54,
        "second": 54,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "affiliate_code": "narrative44201",
      "tapfiliate_ref_id": null,
      "tapfiliate_temporary_password": null
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-17 20:54:54.685489",
  "source": null,
  "inserted_at": "2025-02-17 20:54:57",
  "updated_at": "2025-02-17 20:54:57",
  "updated_date": "2025-02-17",
  "resource_id": "4ede75fa-9173-4584-b27f-3a2fb5820dec",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `asset_version_created`

```json
{
  "id": "8543ded6-b886-4dfd-8616-50e5041dc939",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "asset_version_created",
  "data": {
    "changes": [
      "asset_id",
      "asset_location_id",
      "change_user_id",
      "hash",
      "meta",
      "name",
      "occurred_at"
    ],
    "resource": {
      "id": "ccdcb43a-da8b-4f0a-aea1-d7674a5102b9",
      "hash": "64AA1F5BFE2CD679C0A3CED6B41584617A7F9BBB",
      "meta": {
        "width": 3500,
        "height": 2333,
        "star_rating": 5,
        "in_use_count": 0,
        "colour_rating": 0,
        "focus_keywords": []
      },
      "name": "Alina & Max-440.jpg",
      "type": "assets",
      "bytes": null,
      "mimetype": "jpg",
      "is_deleted": false,
      "updated_at": {
        "day": 4,
        "hour": 20,
        "year": 2021,
        "month": 11,
        "minute": 48,
        "second": 23,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "version_id": "8a629a05-23a4-4462-8739-a56469534e63",
      "inserted_at": {
        "day": 4,
        "hour": 20,
        "year": 2021,
        "month": 11,
        "minute": 48,
        "second": 23,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "occurred_at": 1636058903564107,
      "change_user_id": "2fc8c70c-60da-4c6d-b9c7-a0517325ea3a",
      "asset_location_id": "9588f2dc-eeff-4ff5-abee-59cdba9f38f5"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-11-04 20:48:23",
  "source": "",
  "inserted_at": "2021-11-04 20:48:29",
  "updated_at": "2021-11-04 20:48:29",
  "updated_date": null,
  "resource_id": "ccdcb43a-da8b-4f0a-aea1-d7674a5102b9",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `asset_created`

```json
{
  "id": "8a4c47b0-1404-41da-9bc7-41e127c13c53",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "asset_created",
  "data": {
    "id": "2ca5f0a9-e046-4c26-91b6-a04e3066d642",
    "meta": {},
    "type": "assets",
    "mimetype": "jpg",
    "version_id": null
  },
  "initialized_at": "NaT",
  "occurred_at": "2022-04-27 08:04:56",
  "source": "",
  "inserted_at": "2022-04-27 08:05:15",
  "updated_at": "2022-04-27 08:05:15",
  "updated_date": null,
  "resource_id": "2ca5f0a9-e046-4c26-91b6-a04e3066d642",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `asset_location_updated`

```json
{
  "id": "c31eae27-4ea2-403d-9d51-9a58f3a746a7",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "asset_location_updated",
  "data": {
    "changes": ["path"],
    "resource": {
      "id": "3a946671-8f2f-402f-b74f-1c71a2912408",
      "path": "/Volumes/T7/Alyssa + Brock Engagement/Edits/Film edits",
      "type": "asset_locations",
      "status": "available",
      "source_id": "f8bd294e-4671-412a-b263-9e614e52a7fe",
      "updated_at": {
        "day": 20,
        "hour": 16,
        "year": 2025,
        "month": 2,
        "minute": 37,
        "second": 59,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 20,
        "hour": 15,
        "year": 2025,
        "month": 2,
        "minute": 59,
        "second": 49,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "should_observe": true,
      "should_recurse": true
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-20 16:37:59.546062",
  "source": null,
  "inserted_at": "2025-02-20 16:38:05",
  "updated_at": "2025-02-20 16:38:05",
  "updated_date": "2025-02-20",
  "resource_id": "3a946671-8f2f-402f-b74f-1c71a2912408",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `activecampaign_webhook`

```json
{
  "id": "11cefb8f-2628-4838-80d3-c8cd08b411fa",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "activecampaign_webhook",
  "data": {
    "tag": "select_temp_hold_for_updating_last_app_session",
    "list": "0",
    "type": "contact_tag_added",
    "contact": {
      "id": "140499",
      "ip": "74.125.209.4",
      "tags": "select_user, select_NPS_sent, send_narrative_news, send_publish_updates, send_select_updates, select_temp_hold_for_updating_last_app_session, CloseUps_Grandfathered, 2024_your_year_with_narrative",
      "email": "azamuki81@gmail.com",
      "phone": "",
      "fields": {
        "23": "||cleared||",
        "29": "2025-02-08",
        "30": "muhammad6093",
        "33": "Publish and Select",
        "34": "select_free",
        "38": "active",
        "39": "UPGRADE50",
        "42": "2025-04-20",
        "88": "2024-04-20",
        "90": "2024-04-20",
        "97": "waiting",
        "98": "families",
        "107": "45",
        "149": "https://stats.narrative.so/image-grid?bg=default&h=120&sp=53.5&i=26996&cards=Gift%2CHoursSaved"
      },
      "last_name": "Azam",
      "first_name": "Muhammad"
    },
    "date_time": "2025-02-08T20:13:33-06:00",
    "initiated_by": "admin",
    "initiated_from": "admin"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-09 02:13:33.361671",
  "source": null,
  "inserted_at": "2025-02-09 02:13:34",
  "updated_at": "2025-02-09 02:13:34",
  "updated_date": "2025-02-09",
  "resource_id": null,
  "meta": "{\"host\": \"api.getnarrativeapp.com\", \"method\": \"POST\", \"scheme\": \"http\", \"status\": null, \"remote_ip\": \"10.10.10.127\", \"req_headers\": {\"host\": \"api.getnarrativeapp.com\", \"user-agent\": \"okhttp/3.14.1\", \"content-type\": \"application/x-www-form-urlencoded; charset=utf-8\", \"content-length\": \"1228\", \"accept-encoding\": \"gzip\", \"x-amzn-trace-id\": \"Root=1-67a80f4d-47e5be7c5e5b8eee6c97cdff\", \"x-forwarded-for\": \"44.206.115.225\", \"x-forwarded-port\": \"443\", \"x-forwarded-proto\": \"https\"}, \"query_string\": \"\", \"request_path\": \"/hooks/active_campaign\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `edit_credit_purchase`

```json
{
  "id": "181ff01d-44fc-482b-b301-6b536bd2bf6e",
  "user_id": "867fe684-ac15-4fcf-ab53-80401bf2a9a2",
  "account_id": "161559b7-2ba8-4f4e-b672-0c5d79be9b41",
  "transaction_id": null,
  "topic": "edit_credit_purchase",
  "data": {
    "user_id": "867fe684-ac15-4fcf-ab53-80401bf2a9a2",
    "pack_slug": "edit_payg",
    "account_id": "161559b7-2ba8-4f4e-b672-0c5d79be9b41",
    "credit_amount": 132,
    "credit_balance": 250
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-20 19:17:09.534207",
  "source": null,
  "inserted_at": "2025-02-20 19:17:21",
  "updated_at": "2025-02-20 19:17:21",
  "updated_date": "2025-02-20",
  "resource_id": null,
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `asset_location_created`

```json
{
  "id": "ab29ca68-f961-480e-93d4-128d21a29e7a",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "asset_location_created",
  "data": {
    "changes": [
      "id",
      "path",
      "should_observe",
      "should_recurse",
      "source_id",
      "status"
    ],
    "resource": {
      "id": "f44fa773-cc1d-4f3e-bdae-7ce5fa4be1d7",
      "path": "Edit Upload Project",
      "type": "asset_locations",
      "status": "available",
      "source_id": "8bda3ee5-8cdb-42e5-8a41-c40d1522a74b",
      "updated_at": {
        "day": 9,
        "hour": 2,
        "year": 2025,
        "month": 2,
        "minute": 0,
        "second": 4,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 9,
        "hour": 2,
        "year": 2025,
        "month": 2,
        "minute": 0,
        "second": 4,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "should_observe": true,
      "should_recurse": true
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-09 02:00:04.923974",
  "source": null,
  "inserted_at": "2025-02-09 02:00:17",
  "updated_at": "2025-02-09 02:00:17",
  "updated_date": "2025-02-09",
  "resource_id": "f44fa773-cc1d-4f3e-bdae-7ce5fa4be1d7",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `asset_preview_updated`

```json
{
  "id": "85ffe48f-380b-4660-8d18-5c3bc3b012dd",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "asset_preview_updated",
  "data": {
    "changes": ["status"],
    "resource": {
      "id": "13d4ddcf-5009-4413-8a96-601292325fe4",
      "hash": null,
      "name": "HollySandroWedding-143.jpg",
      "type": "asset_previews",
      "width": null,
      "height": null,
      "status": "preparing",
      "asset_id": "886733f9-fe7e-4be7-9858-767c35fd1143",
      "keywords": [],
      "mimetype": "jpg"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-01-31 12:56:59",
  "source": "",
  "inserted_at": "2023-01-31 12:57:10",
  "updated_at": "2023-01-31 12:57:10",
  "updated_date": null,
  "resource_id": "13d4ddcf-5009-4413-8a96-601292325fe4",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `edit_training_completed`

```json
{
  "id": "564a0b6e-250a-4f66-b655-c6a959b6fb1d",
  "user_id": "f72f292a-1513-4865-b5db-df82f6ca7d18",
  "account_id": "2ea01075-43b0-4cf0-a093-10a1b46aa8de",
  "transaction_id": null,
  "topic": "edit_training_completed",
  "data": {
    "id": "8b1e8fa4-ca71-47ac-9166-5257410c46a6",
    "kind": "style",
    "type": "share_links",
    "status": "active",
    "user_id": "f72f292a-1513-4865-b5db-df82f6ca7d18",
    "permalink": "fetch.getnarrativeapp.com/share/style/597fd554-e679-4d68-a93b-e41178f069fc",
    "account_id": "2ea01075-43b0-4cf0-a093-10a1b46aa8de",
    "cluster_id": "a802fec5-ff2e-4579-8993-067f11144ad9",
    "project_id": "597fd554-e679-4d68-a93b-e41178f069fc",
    "updated_at": {
      "day": 16,
      "hour": 23,
      "year": 2025,
      "month": 2,
      "minute": 52,
      "second": 27,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 16,
      "hour": 23,
      "year": 2025,
      "month": 2,
      "minute": 33,
      "second": 26,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "project_version_id": "e68346ba-485a-4744-9a84-8d78127f3b66"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-02-16 23:52:27.368832",
  "source": null,
  "inserted_at": "2025-02-16 23:52:39",
  "updated_at": "2025-02-16 23:52:39",
  "updated_date": "2025-02-16",
  "resource_id": "8b1e8fa4-ca71-47ac-9166-5257410c46a6",
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `asset_preview_created`

```json
{
  "id": "177bfff0-ee52-4c63-985b-5cdf8b51acdd",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "asset_preview_created",
  "data": {
    "id": "829bb770-625b-48d4-ad76-6460333ae991",
    "hash": null,
    "type": "asset_previews",
    "width": null,
    "height": null,
    "status": "required",
    "asset_id": "9ecee26a-3eca-4817-9dd7-7a5718403155",
    "mimetype": "jpg"
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-05-01 23:52:14",
  "source": null,
  "inserted_at": "2023-05-01 23:52:15",
  "updated_at": "2023-05-01 23:52:15",
  "updated_date": null,
  "resource_id": "829bb770-625b-48d4-ad76-6460333ae991",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `affiliate_scheme_updated`

```json
{
  "id": "5db6d2ab-61b0-4a8f-880f-fb7b8ff0f10b",
  "user_id": "e70abaf3-2c22-43cf-a2b7-6b954fa0c0fe",
  "account_id": "83dacdfe-0e3d-44d4-8c6c-88948469e596",
  "transaction_id": "",
  "topic": "affiliate_scheme_updated",
  "data": {
    "changes": ["affiliate_code"],
    "resource": {
      "id": "b868b309-e54b-4426-8e3a-6101620bfe1b",
      "type": "affiliate_schemes",
      "user_id": "e70abaf3-2c22-43cf-a2b7-6b954fa0c0fe",
      "account_id": "83dacdfe-0e3d-44d4-8c6c-88948469e596",
      "updated_at": {
        "day": 20,
        "hour": 19,
        "year": 2021,
        "month": 12,
        "minute": 11,
        "second": 49,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 20,
        "hour": 19,
        "year": 2021,
        "month": 12,
        "minute": 10,
        "second": 20,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "affiliate_code": "ericronald10",
      "tapfiliate_ref_id": "ericronald1",
      "tapfiliate_temporary_password": "f270a4ce17d6cc6a7"
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-12-20 19:11:49",
  "source": "",
  "inserted_at": "2021-12-20 19:11:57",
  "updated_at": "2021-12-20 19:11:57",
  "updated_date": null,
  "resource_id": "b868b309-e54b-4426-8e3a-6101620bfe1b",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `product_deleted`

```json
{
  "id": "0f875574-43e8-4b47-b0f0-cbd0c0f968ca",
  "user_id": "",
  "account_id": "9d0dfe59-1dc5-41ce-8aab-6daec70bb34d",
  "transaction_id": "",
  "topic": "product_deleted",
  "data": {
    "id": "92984911-65c5-4abd-b9a1-a528b4ff26cf",
    "name": "Select",
    "type": "products",
    "interval": "month",
    "account_id": "9d0dfe59-1dc5-41ce-8aab-6daec70bb34d",
    "updated_at": "2020-11-25T17:09:07Z",
    "inserted_at": "2020-11-25T17:05:19Z",
    "billing_status": "pending_deletion",
    "activation_date": "2020-12-25T17:09:07Z"
  },
  "initialized_at": "2021-01-02 00:00:14",
  "occurred_at": "2021-01-02 00:00:14",
  "source": "",
  "inserted_at": "2021-01-02 00:00:14",
  "updated_at": "2021-01-02 00:00:14",
  "updated_date": null,
  "resource_id": "92984911-65c5-4abd-b9a1-a528b4ff26cf",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `coupon_created`

```json
{
  "id": "c5d07efe-f259-47c9-afc8-9b67a75319c7",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "coupon_created",
  "data": {
    "changes": ["code"],
    "resource": {
      "id": "8390b89a-2c2c-4e19-826f-dbacf130c791",
      "code": "thomas2864",
      "e_date": null,
      "available": true,
      "updated_at": "2021-04-27T13:10:15Z",
      "inserted_at": "2021-04-27T13:10:15Z"
    }
  },
  "initialized_at": "2021-04-27 13:10:15",
  "occurred_at": "2021-04-27 13:10:15",
  "source": "",
  "inserted_at": "2021-04-27 13:10:15",
  "updated_at": "2021-04-27 13:10:15",
  "updated_date": null,
  "resource_id": "8390b89a-2c2c-4e19-826f-dbacf130c791",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `account_deleted`

```json
{
  "id": "97cac0a2-3e61-48dd-b5ba-7857194b9467",
  "user_id": null,
  "account_id": null,
  "transaction_id": null,
  "topic": "account_deleted",
  "data": {
    "id": "bc36366d-b23f-4506-9f56-b0b72e4f59ea",
    "name": null,
    "type": "accounts",
    "active": true,
    "status": null,
    "updated_at": {
      "day": 11,
      "hour": 14,
      "year": 2023,
      "month": 2,
      "minute": 55,
      "second": 31,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "inserted_at": {
      "day": 24,
      "hour": 21,
      "year": 2022,
      "month": 3,
      "minute": 9,
      "second": 30,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    },
    "usage_status": "pending_deletion",
    "account_owner": "contact@liannegrayphotography.com",
    "status_action_date": {
      "day": 13,
      "hour": 14,
      "year": 2023,
      "month": 3,
      "minute": 55,
      "second": 31,
      "calendar": "Elixir.Calendar.ISO",
      "time_zone": "Etc/UTC",
      "zone_abbr": "UTC",
      "std_offset": 0,
      "utc_offset": 0,
      "microsecond": [0, 0]
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2023-03-14 00:00:04",
  "source": null,
  "inserted_at": "2023-03-14 00:00:16",
  "updated_at": "2023-03-14 00:00:16",
  "updated_date": null,
  "resource_id": "bc36366d-b23f-4506-9f56-b0b72e4f59ea",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `installer_install_started`

```json
{
  "id": "fb66a02c-c040-4043-97ac-1c85e88a8176",
  "user_id": "",
  "account_id": "",
  "transaction_id": "b6804e74-f88b-49d7-893b-9454cfe91718",
  "topic": "installer_install_started",
  "data": {},
  "initialized_at": "NaT",
  "occurred_at": "1970-01-19 20:35:43",
  "source": "",
  "inserted_at": "2021-08-19 03:30:13",
  "updated_at": "2021-08-19 03:30:13",
  "updated_date": null,
  "resource_id": "",
  "meta": "{\"os\":\"macos\",\"app\":\"select\",\"location\":{\"region\":\"New York\",\"country\":\"United States\",\"continent\":\"North America\"},\"install_id\":\"DFD3C1CA-1E8C-4129-AC6C-00689EA29F56\",\"os_version\":\"10.14.6\",\"serial_number\":\"D25Q40VLF8J8\",\"installer_version\":\"1.0\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `installer_installer_terminated`

```json
{
  "id": "cbd6b767-02ba-40a4-a116-a5a99145353a",
  "user_id": "",
  "account_id": "",
  "transaction_id": "9a317a4c-3530-41d4-937c-5f682ea41308",
  "topic": "installer_installer_terminated",
  "data": {},
  "initialized_at": "NaT",
  "occurred_at": "1970-01-19 20:35:44",
  "source": "",
  "inserted_at": "2021-08-19 03:44:53",
  "updated_at": "2021-08-19 03:44:53",
  "updated_date": null,
  "resource_id": "",
  "meta": "{\"os\":\"macos\",\"app\":\"select\",\"location\":{\"region\":\"California\",\"country\":\"United States\",\"continent\":\"North America\"},\"install_id\":\"C53DE6F2-4799-4781-B8DC-92E015544940\",\"os_version\":\"11.5.1\",\"serial_number\":\"C02C70VVM6KJ\",\"installer_version\":\"1.0\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `installer_install_succeeded`

```json
{
  "id": "00c1e86f-ed45-4fe3-a8f1-2853c3da1d13",
  "user_id": "",
  "account_id": "",
  "transaction_id": "d3888da8-a49b-45cf-bb1b-5348cabaeafa",
  "topic": "installer_install_succeeded",
  "data": {},
  "initialized_at": "NaT",
  "occurred_at": "1970-01-19 20:35:47",
  "source": "",
  "inserted_at": "2021-08-19 04:36:12",
  "updated_at": "2021-08-19 04:36:12",
  "updated_date": null,
  "resource_id": "",
  "meta": "{\"os\":\"macos\",\"app\":\"select\",\"location\":{\"region\":\"Victoria\",\"country\":\"Australia\",\"continent\":\"Oceania\"},\"install_id\":\"39638AC7-849D-441C-BDCE-81655A34D7AB\",\"os_version\":\"10.14.6\",\"serial_number\":\"C02ZM047JV40\",\"installer_version\":\"1.0\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `plan_created`

```json
{
  "id": "302b530b-f237-4b31-9e6a-df1d10655ee3",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "plan_created",
  "data": {
    "changes": [
      "default_free",
      "monthly_plan_id",
      "name",
      "status",
      "stripe_product_id",
      "yearly_plan_id"
    ],
    "resource": {
      "id": "80b9c577-689a-4a31-b8bc-8a232178d255",
      "name": "Select Open Beta",
      "type": "plans",
      "status": 0,
      "features": [],
      "updated_at": "2020-11-04T01:13:29Z",
      "inserted_at": "2020-11-04T01:13:29Z",
      "default_free": true,
      "product_name": "Select",
      "status_label": "draft",
      "yearly_price": 0,
      "yearly_trial": 30,
      "monthly_price": 0,
      "monthly_trial": 30
    }
  },
  "initialized_at": "2020-11-04 01:13:29",
  "occurred_at": "2020-11-04 01:13:29",
  "source": "",
  "inserted_at": "2020-11-04 01:13:29",
  "updated_at": "2020-11-04 01:13:29",
  "updated_date": null,
  "resource_id": "80b9c577-689a-4a31-b8bc-8a232178d255",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `installer_download_complete`

```json
{
  "id": "6a6df675-a77f-4ccf-bca2-939b0f83bd68",
  "user_id": "",
  "account_id": "",
  "transaction_id": "af671240-7e99-4cd6-b9e2-3429b05339a6",
  "topic": "installer_download_complete",
  "data": {
    "duration_ms": 15931.658747,
    "download_bytes": 94838036
  },
  "initialized_at": "NaT",
  "occurred_at": "1970-01-19 20:35:30",
  "source": "",
  "inserted_at": "2021-08-18 23:52:23",
  "updated_at": "2021-08-18 23:52:23",
  "updated_date": null,
  "resource_id": "",
  "meta": "{}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `coupon_deleted`

```json
{
  "id": "e0885a54-17c3-4aee-a29b-eb1c75f6b497",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "coupon_deleted",
  "data": {
    "id": "f364ebc8-5836-4f46-aea5-213d4aecaaaa",
    "code": "corrie7055",
    "e_date": null,
    "plan_id": null,
    "available": true,
    "updated_at": "2021-04-06T02:05:03Z",
    "inserted_at": "2021-04-06T02:05:03Z",
    "reward_scheme_id": "b4667da5-24d4-483e-9f60-b9f83fa65422"
  },
  "initialized_at": "NaT",
  "occurred_at": "2021-05-10 00:00:01",
  "source": "",
  "inserted_at": "2021-05-10 00:00:02",
  "updated_at": "2021-05-10 00:00:02",
  "updated_date": null,
  "resource_id": "f364ebc8-5836-4f46-aea5-213d4aecaaaa",
  "meta": null,
  "vsn": 2,
  "_rescued_data": null
}
```

#### Event Type: `installer_download_started`

```json
{
  "id": "93e92adf-18a2-44e5-a979-170c30ac0c37",
  "user_id": "",
  "account_id": "",
  "transaction_id": "b6804e74-f88b-49d7-893b-9454cfe91718",
  "topic": "installer_download_started",
  "data": {},
  "initialized_at": "NaT",
  "occurred_at": "1970-01-19 20:35:43",
  "source": "",
  "inserted_at": "2021-08-19 03:30:13",
  "updated_at": "2021-08-19 03:30:13",
  "updated_date": null,
  "resource_id": "",
  "meta": "{\"os\":\"macos\",\"app\":\"select\",\"location\":{\"region\":\"New York\",\"country\":\"United States\",\"continent\":\"North America\"},\"install_id\":\"DFD3C1CA-1E8C-4129-AC6C-00689EA29F56\",\"os_version\":\"10.14.6\",\"serial_number\":\"D25Q40VLF8J8\",\"installer_version\":\"1.0\"}",
  "vsn": 1,
  "_rescued_data": null
}
```

#### Event Type: `plan_updated`

```json
{
  "id": "43b91714-3865-48bf-b1ce-cacfe26cbfb9",
  "user_id": "",
  "account_id": "",
  "transaction_id": "",
  "topic": "plan_updated",
  "data": {
    "changes": ["status"],
    "resource": {
      "id": "2fe5aaf8-f2c7-45a7-9043-343de345c0df",
      "name": "Select Pro",
      "slug": "select-pro",
      "type": "plans",
      "status": 2,
      "features": [],
      "updated_at": {
        "day": 8,
        "hour": 20,
        "year": 2022,
        "month": 11,
        "minute": 30,
        "second": 59,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "inserted_at": {
        "day": 6,
        "hour": 2,
        "year": 2021,
        "month": 4,
        "minute": 35,
        "second": 42,
        "calendar": "Elixir.Calendar.ISO",
        "time_zone": "Etc/UTC",
        "zone_abbr": "UTC",
        "std_offset": 0,
        "utc_offset": 0,
        "microsecond": [0, 0]
      },
      "default_free": false,
      "product_name": "Select",
      "status_label": "grandfathered",
      "yearly_price": 15000,
      "yearly_trial": 0,
      "monthly_price": 1800,
      "monthly_trial": 0
    }
  },
  "initialized_at": "NaT",
  "occurred_at": "2022-11-08 20:30:59",
  "source": "",
  "inserted_at": "2022-11-08 20:31:11",
  "updated_at": "2022-11-08 20:31:11",
  "updated_date": null,
  "resource_id": "2fe5aaf8-f2c7-45a7-9043-343de345c0df",
  "meta": "{}",
  "vsn": 2,
  "_rescued_data": null
}
```

---

## narrative.default.web_events

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| id                            | `StringType()`    | True     |
| user_id                       | `StringType()`    | True     |
| account_id                    | `StringType()`    | True     |
| transaction_id                | `StringType()`    | True     |
| topic                         | `StringType()`    | True     |
| data                          | `StringType()`    | True     |
| initialized_at                | `TimestampType()` | True     |
| occurred_at                   | `TimestampType()` | True     |
| source                        | `StringType()`    | True     |
| inserted_at                   | `TimestampType()` | True     |
| updated_at                    | `TimestampType()` | True     |
| updated_date                  | `StringType()`    | True     |
| resource_id                   | `StringType()`    | True     |
| vsn                           | `IntegerType()`   | True     |
| meta_utm_term                 | `StringType()`    | True     |
| meta_utm_medium               | `StringType()`    | True     |
| meta_utm_source               | `StringType()`    | True     |
| meta_utm_content              | `StringType()`    | True     |
| meta_utm_campaign             | `StringType()`    | True     |
| meta_browser_os               | `StringType()`    | True     |
| meta_browser_name             | `StringType()`    | True     |
| meta_browser_locale           | `StringType()`    | True     |
| meta_browser_version          | `StringType()`    | True     |
| meta_browser_timezone         | `DoubleType()`    | True     |
| meta_browser_os_version       | `StringType()`    | True     |
| meta_browser_user_agent       | `StringType()`    | True     |
| meta_browser_device_type      | `StringType()`    | True     |
| meta_browser_version_array    | `StringType()`    | True     |
| meta_browser_os_version_array | `StringType()`    | True     |
| meta_location_region          | `StringType()`    | True     |
| meta_location_country         | `StringType()`    | True     |
| meta_location_continent       | `StringType()`    | True     |
| meta_referral_ref             | `StringType()`    | True     |
| meta_referral_fp_ref          | `StringType()`    | True     |
| meta_referral_referral        | `StringType()`    | True     |
| meta_referral_affiliate       | `StringType()`    | True     |
| meta_viewport_width           | `DoubleType()`    | True     |
| meta_viewport_height          | `DoubleType()`    | True     |
| meta_viewport_offset_x        | `DoubleType()`    | True     |
| meta_viewport_offset_y        | `DoubleType()`    | True     |
| data_session_id               | `StringType()`    | True     |
| \_rescued_data                | `StringType()`    | True     |

### Event Samples

#### Event Type: `web_page_load_start`

```json
{
  "id": "59a4933d-c1fb-449b-8b4f-3955172201ab",
  "user_id": null,
  "account_id": null,
  "transaction_id": "57040b49-04fb-407b-8fd4-c1601ff3d20e",
  "topic": "web_page_load_start",
  "data": {
    "path": "/",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": null,
    "path_array": [],
    "session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "fe75a7af-8600-4a84-a7a8-0397ccd41297",
    "website_locale": "en-US",
    "ms_since_page_load": 0
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:00:06.772000",
  "source": null,
  "inserted_at": "2025-01-28 20:00:08",
  "updated_at": "2025-01-28 20:00:08",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "firefox",
  "meta_browser_locale": "de-de",
  "meta_browser_version": "134.0",
  "meta_browser_timezone": -60.0,
  "meta_browser_os_version": "10.15",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[134, 0]",
  "meta_browser_os_version_array": "[10, 15]",
  "meta_location_region": "Baden-W\u00fcrttemberg",
  "meta_location_country": "Germany",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1512.0,
  "meta_viewport_height": 865.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
  "_rescued_data": null
}
```

#### Event Type: `web_page_scroll`

```json
{
  "id": "32130f29-1eb1-4b20-8714-029bd92dcd9e",
  "user_id": null,
  "account_id": null,
  "transaction_id": "57040b49-04fb-407b-8fd4-c1601ff3d20e",
  "topic": "web_page_scroll",
  "data": {
    "path": "/select",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": null,
    "path_array": ["select"],
    "session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "ab8616cf-4bac-41c5-aafb-96d51b1c39b0",
    "website_locale": "en-US",
    "ms_since_page_load": 5258
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:00:13.542000",
  "source": null,
  "inserted_at": "2025-01-28 20:00:15",
  "updated_at": "2025-01-28 20:00:15",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "firefox",
  "meta_browser_locale": "de-de",
  "meta_browser_version": "134.0",
  "meta_browser_timezone": -60.0,
  "meta_browser_os_version": "10.15",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[134, 0]",
  "meta_browser_os_version_array": "[10, 15]",
  "meta_location_region": "Baden-W\u00fcrttemberg",
  "meta_location_country": "Germany",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1512.0,
  "meta_viewport_height": 865.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
  "_rescued_data": null
}
```

#### Event Type: `web_download_started_manually`

```json
{
  "id": "3acfe9d6-7a59-4a30-869c-32cbd3279536",
  "user_id": "13ad4a04-4d2e-4f09-aa71-22714d8186dd",
  "account_id": null,
  "transaction_id": "e4f91ced-5a54-415a-9b6f-defbbb6d7716",
  "topic": "web_download_started_manually",
  "data": {
    "app": "select",
    "path": "/",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "path_array": [],
    "session_id": "65513d35-343b-4b5b-8255-30736130ace4",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "706ef5e7-f2e6-4b0b-bed8-fd36aa50c38c",
    "website_locale": "en-US",
    "ms_since_page_load": 7070
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:27:53.631000",
  "source": null,
  "inserted_at": "2025-01-28 20:27:55",
  "updated_at": "2025-01-28 20:27:55",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "es-419",
  "meta_browser_version": "18.3",
  "meta_browser_timezone": 300.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[18, 3]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Jalisco",
  "meta_location_country": "Mexico",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1324.0,
  "meta_viewport_height": 749.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "65513d35-343b-4b5b-8255-30736130ace4",
  "_rescued_data": null
}
```

#### Event Type: `web_page_load_finish`

```json
{
  "id": "b70560b1-a26d-4fc9-8dc1-da2e4243815f",
  "user_id": null,
  "account_id": null,
  "transaction_id": "57040b49-04fb-407b-8fd4-c1601ff3d20e",
  "topic": "web_page_load_finish",
  "data": {
    "path": "/",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": null,
    "path_array": [],
    "session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "fe75a7af-8600-4a84-a7a8-0397ccd41297",
    "website_locale": "en-US",
    "ms_since_page_load": 282
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:00:07.054000",
  "source": null,
  "inserted_at": "2025-01-28 20:00:08",
  "updated_at": "2025-01-28 20:00:08",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "firefox",
  "meta_browser_locale": "de-de",
  "meta_browser_version": "134.0",
  "meta_browser_timezone": -60.0,
  "meta_browser_os_version": "10.15",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[134, 0]",
  "meta_browser_os_version_array": "[10, 15]",
  "meta_location_region": "Baden-W\u00fcrttemberg",
  "meta_location_country": "Germany",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1512.0,
  "meta_viewport_height": 865.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
  "_rescued_data": null
}
```

#### Event Type: `web_download_started_automatically`

```json
{
  "id": "cac277bd-ddcd-4e77-a9f8-504e49387cc0",
  "user_id": "fb447e60-5824-434e-bf1f-020e519f44a8",
  "account_id": null,
  "transaction_id": "33695009-56a4-4b7a-b4bf-25be7a4430c8",
  "topic": "web_download_started_automatically",
  "data": {
    "app": "select",
    "path": "/select/download",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "path_array": ["select", "download"],
    "session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "58e28833-4287-491b-8da3-c769f9a64695",
    "website_locale": "en-US",
    "ms_since_page_load": 3232
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:15:43",
  "source": null,
  "inserted_at": "2025-01-28 20:15:43",
  "updated_at": "2025-01-28 20:15:43",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 0.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "England",
  "meta_location_country": "United Kingdom",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1920.0,
  "meta_viewport_height": 959.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
  "_rescued_data": null
}
```

#### Event Type: `web_lead_email_captured`

```json
{
  "id": "4042beb1-1c75-4b6a-8a82-944027a09fce",
  "user_id": null,
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_lead_email_captured",
  "data": {
    "app": "select",
    "path": "/get-started/select",
    "email": "taylor.snider@yahoo.com",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "select"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "d685943b-e866-481a-b64e-c67431b82741",
    "website_locale": "en-US",
    "ms_since_page_load": 4025
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:05:48.954000",
  "source": null,
  "inserted_at": "2025-01-28 20:05:49",
  "updated_at": "2025-01-28 20:05:49",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_page_navigate_away`

```json
{
  "id": "f3e972af-060f-4b59-9661-b85ea541fca9",
  "user_id": null,
  "account_id": null,
  "transaction_id": "84b23b6e-fe31-40b6-b840-d55d64444cea",
  "topic": "web_page_navigate_away",
  "data": {
    "path": "/blog/dslr-vs-mirrorless-which-is-best-for-professional-photography",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": "https://www.google.com/",
    "path_array": [
      "blog",
      "dslr-vs-mirrorless-which-is-best-for-professional-photography"
    ],
    "session_id": "cbcb2d4c-1ddf-42d4-88cb-dfbccb5b68a0",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "fe8b63fb-6028-4c13-a07a-6e7aa5c4d966",
    "website_locale": "en-US",
    "ms_since_page_load": 207046
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:01:09.580000",
  "source": null,
  "inserted_at": "2025-01-28 20:01:11",
  "updated_at": "2025-01-28 20:01:11",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "firefox",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "134.0",
  "meta_browser_timezone": 300.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:134.0) Gecko/20100101 Firefox/134.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[134, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "New York",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1920.0,
  "meta_viewport_height": 955.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 9690.0,
  "data_session_id": "cbcb2d4c-1ddf-42d4-88cb-dfbccb5b68a0",
  "_rescued_data": null
}
```

#### Event Type: `web_google_sign_in_window_open`

```json
{
  "id": "b17be6c1-f945-40c6-a617-70eb038c29ca",
  "user_id": null,
  "account_id": null,
  "transaction_id": "33695009-56a4-4b7a-b4bf-25be7a4430c8",
  "topic": "web_google_sign_in_window_open",
  "data": {
    "path": "/get-started/select",
    "branch": "master",
    "domain": "account.narrative.so",
    "context": "select_signup",
    "referrer": "https://narrative.so/",
    "path_array": ["get-started", "select"],
    "session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "4646a81d-cf92-4084-8970-bab6babee7f5",
    "website_locale": "en-US",
    "ms_since_page_load": 2049
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:15:24",
  "source": null,
  "inserted_at": "2025-01-28 20:15:24",
  "updated_at": "2025-01-28 20:15:24",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 0.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "England",
  "meta_location_country": "United Kingdom",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1920.0,
  "meta_viewport_height": 959.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_up_failed`

```json
{
  "id": "48094314-6521-4a5f-a6d5-3982c4b71e35",
  "user_id": null,
  "account_id": null,
  "transaction_id": "56fc340b-43e7-4d5e-a57d-1380b16800ec",
  "topic": "web_sign_up_failed",
  "data": {
    "path": "/get-started/select",
    "branch": "master",
    "domain": "account.narrative.so",
    "reason": "status_code_401",
    "referrer": "https://narrative.so/",
    "path_array": ["get-started", "select"],
    "session_id": "4e1d8749-ec83-4aa6-81d3-5c8ddcd0b4d4",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "953fc649-59fa-4d22-8a4e-13fe6190499a",
    "website_locale": "en-US",
    "ms_since_page_load": 25060
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 22:44:51.756000",
  "source": null,
  "inserted_at": "2025-01-28 22:44:53",
  "updated_at": "2025-01-28 22:44:53",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "132.0.0.0",
  "meta_browser_timezone": -600.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[132, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Queensland",
  "meta_location_country": "Australia",
  "meta_location_continent": "Oceania",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 684.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 130.0,
  "data_session_id": "4e1d8749-ec83-4aa6-81d3-5c8ddcd0b4d4",
  "_rescued_data": null
}
```

#### Event Type: `web_finish_select_sign_in`

```json
{
  "id": "1e43f6ca-e09b-4172-bd78-a5a110f32167",
  "user_id": "4df0f47b-e109-474b-bad9-2c96f1a131f4",
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_finish_select_sign_in",
  "data": {
    "path": "/select/auth",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["select", "auth"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "5c32f254-8834-4597-a1c8-d3913b73249b",
    "website_locale": "en-US",
    "select_install_id": "13DA18E3-FCA1-470B-B6CD-B7183F2E8671",
    "ms_since_page_load": 1505
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:06:53.237000",
  "source": null,
  "inserted_at": "2025-01-28 20:06:54",
  "updated_at": "2025-01-28 20:06:54",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_lead_sign_up_started`

```json
{
  "id": "38413df2-ac35-4b62-b3c9-730548441cba",
  "user_id": null,
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_lead_sign_up_started",
  "data": {
    "app": "select",
    "path": "/get-started/select",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "select"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "d685943b-e866-481a-b64e-c67431b82741",
    "sign_up_method": "email",
    "website_locale": "en-US",
    "ms_since_page_load": 4025
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:05:48.955000",
  "source": null,
  "inserted_at": "2025-01-28 20:05:49",
  "updated_at": "2025-01-28 20:05:49",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_page_resized`

```json
{
  "id": "ad82bd77-1966-4366-b516-a1e7a589e713",
  "user_id": null,
  "account_id": null,
  "transaction_id": "57040b49-04fb-407b-8fd4-c1601ff3d20e",
  "topic": "web_page_resized",
  "data": {
    "path": "/select",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": null,
    "path_array": ["select"],
    "session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "ab8616cf-4bac-41c5-aafb-96d51b1c39b0",
    "website_locale": "en-US",
    "ms_since_page_load": 40733
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:00:49.009000",
  "source": null,
  "inserted_at": "2025-01-28 20:00:50",
  "updated_at": "2025-01-28 20:00:50",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "firefox",
  "meta_browser_locale": "de-de",
  "meta_browser_version": "134.0",
  "meta_browser_timezone": -60.0,
  "meta_browser_os_version": "10.15",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[134, 0]",
  "meta_browser_os_version_array": "[10, 15]",
  "meta_location_region": "Baden-W\u00fcrttemberg",
  "meta_location_country": "Germany",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 756.0,
  "meta_viewport_height": 865.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "5759e843-0ae7-40e0-b6ba-39e913a5f14e",
  "_rescued_data": null
}
```

#### Event Type: `web_affiliate_referral`

```json
{
  "id": "ccf4659b-1b20-4656-bfcb-3983ec8ea566",
  "user_id": null,
  "account_id": null,
  "transaction_id": "b8e6093d-a51d-4a4f-a6d0-ec5cfadbae83",
  "topic": "web_affiliate_referral",
  "data": {
    "path": "/select",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": "https://www.youtube.com/",
    "path_array": ["select"],
    "session_id": "83348a86-c728-43d1-b493-4be1360cd2d5",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "coupon_code": "narrative53251",
    "landing_page": "https://narrative.so/select?affiliate=narrative53251",
    "page_load_id": "427ce265-d8a0-42be-8644-d02d3ccc7c65",
    "website_locale": "en-US",
    "ms_since_page_load": 25
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:01:29.067000",
  "source": null,
  "inserted_at": "2025-01-28 20:01:30",
  "updated_at": "2025-01-28 20:01:30",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "es-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Jalisco",
  "meta_location_country": "Mexico",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": "narrative53251",
  "meta_viewport_width": 1396.0,
  "meta_viewport_height": 804.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "83348a86-c728-43d1-b493-4be1360cd2d5",
  "_rescued_data": null
}
```

#### Event Type: `web_support_chat_closed`

```json
{
  "id": "6c6c7d9d-58b5-4a53-a4ff-d5b7d894f616",
  "user_id": "1108c4bc-ac7d-4516-a391-6249aaeffbf2",
  "account_id": null,
  "transaction_id": "d50e6705-f85f-4593-917c-3efa1f0ca9dd",
  "topic": "web_support_chat_closed",
  "data": {
    "path": "/subscriptions",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "path_array": ["subscriptions"],
    "session_id": "d5a7b938-3abc-4b00-947d-4c0eee9b9a79",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "8d041f13-6568-49e2-a20e-47320bcbffb2",
    "website_locale": "en-US",
    "ms_since_page_load": 15569
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 14:44:58.733000",
  "source": null,
  "inserted_at": "2025-01-29 14:44:59",
  "updated_at": "2025-01-29 14:44:59",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "f3690b7c-b806-478e-b599-1b8fc9cb6f9f",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "132.0.0.0",
  "meta_browser_timezone": 420.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[132, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Arizona",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1181.0,
  "meta_viewport_height": 754.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d5a7b938-3abc-4b00-947d-4c0eee9b9a79",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_up_selected_signup_source`

```json
{
  "id": "bf3a22f5-b779-4abb-b02d-041ef626989f",
  "user_id": null,
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_sign_up_selected_signup_source",
  "data": {
    "path": "/get-started/select",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "select"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "d685943b-e866-481a-b64e-c67431b82741",
    "website_locale": "en-US",
    "ms_since_page_load": 37024,
    "personal_sign_up_source": ["Ad on Facebook or Instagram"]
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:06:21.954000",
  "source": null,
  "inserted_at": "2025-01-28 20:06:23",
  "updated_at": "2025-01-28 20:06:23",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_support_chat_opened`

```json
{
  "id": "0f73f767-e4e4-4d50-8643-ec0b1492fbfd",
  "user_id": "6c7bff1b-26d3-4899-8ea4-4184428028a3",
  "account_id": null,
  "transaction_id": "9eaedeb9-5c81-40cc-9e9f-18b262493981",
  "topic": "web_support_chat_opened",
  "data": {
    "path": "/subscriptions",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "path_array": ["subscriptions"],
    "session_id": "480783c1-d6c4-450d-8be1-a8930c09fc9f",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "5144223f-ef0a-4339-8585-8380289ca929",
    "website_locale": "en-US",
    "ms_since_page_load": 12580
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 08:13:58.003000",
  "source": null,
  "inserted_at": "2025-01-29 08:14:00",
  "updated_at": "2025-01-29 08:14:00",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "iOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "17.5",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "17.5.1",
  "meta_browser_user_agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1",
  "meta_browser_device_type": "mobile",
  "meta_browser_version_array": "[17, 5]",
  "meta_browser_os_version_array": "[17, 5, 1]",
  "meta_location_region": "Minnesota",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 393.0,
  "meta_viewport_height": 741.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "480783c1-d6c4-450d-8be1-a8930c09fc9f",
  "_rescued_data": null
}
```

#### Event Type: `web_start_publish_sign_in`

```json
{
  "id": "a28ecfe0-f05f-4305-9577-12e310cc37c2",
  "user_id": "c879dc51-cbe0-4940-8d75-f7492917d8ae",
  "account_id": null,
  "transaction_id": "ba595ecf-a16f-4201-aff6-fa06304c7084",
  "topic": "web_start_publish_sign_in",
  "data": {
    "path": "/publish/auth",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["publish", "auth"],
    "session_id": "6ed033d3-0f85-4b4a-98a8-40414170827b",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "19d7ec13-013f-42d5-b00e-87f1c435953b",
    "website_locale": "en-US",
    "force_new_sign_in": false,
    "ms_since_page_load": 18,
    "publish_install_id": "6b0efb60-a4d5-4a46-bb29-60c48868700f"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 00:58:44.729000",
  "source": null,
  "inserted_at": "2025-01-29 00:58:47",
  "updated_at": "2025-01-29 00:58:47",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-au",
  "meta_browser_version": "18.2",
  "meta_browser_timezone": -600.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[18, 2]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Queensland",
  "meta_location_country": "Australia",
  "meta_location_continent": "Oceania",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 2560.0,
  "meta_viewport_height": 1237.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "6ed033d3-0f85-4b4a-98a8-40414170827b",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_up_selected_os`

```json
{
  "id": "f52744c0-d05a-4f2c-9769-172a46b5c39d",
  "user_id": null,
  "account_id": null,
  "transaction_id": "cab3bf52-c135-4ca2-ae76-93fc9a7bff69",
  "topic": "web_sign_up_selected_os",
  "data": {
    "os": "mac",
    "app": "publish",
    "path": "/get-started/publish",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "publish"],
    "session_id": "ab416ec6-269d-4cd0-9661-9f1d9d8c0a6c",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "11cc43fb-d231-4c78-a080-ebfb788dc4ce",
    "website_locale": "en-US",
    "ms_since_page_load": 23599
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 01:33:40.750000",
  "source": null,
  "inserted_at": "2025-01-29 01:33:43",
  "updated_at": "2025-01-29 01:33:43",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "132.0.0.0",
  "meta_browser_timezone": 300.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[132, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Pennsylvania",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1715.0,
  "meta_viewport_height": 868.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 172.0,
  "data_session_id": "ab416ec6-269d-4cd0-9661-9f1d9d8c0a6c",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_up_succeeded`

```json
{
  "id": "d7f2aab3-41df-4e4d-bb9c-6ea29ba26a01",
  "user_id": "4df0f47b-e109-474b-bad9-2c96f1a131f4",
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_sign_up_succeeded",
  "data": {
    "app": "select",
    "path": "/get-started/select",
    "genre": "Weddings, engagements and/or elopements",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "select"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "genre_array": ["Weddings, engagements and/or elopements"],
    "genre_other": null,
    "page_load_id": "d685943b-e866-481a-b64e-c67431b82741",
    "sign_up_method": "email",
    "website_locale": "en-US",
    "coupon_code_used": null,
    "linux_sign_up_os": null,
    "mobile_sign_up_os": null,
    "tablet_sign_up_os": null,
    "ms_since_page_load": 66693,
    "windows_sign_up_os": null,
    "chromeos_sign_up_os": null,
    "scheme_of_coupon_used": null,
    "personal_sign_up_source": ["Ad on Facebook or Instagram"],
    "personal_sign_up_source_other": null
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:06:51.623000",
  "source": null,
  "inserted_at": "2025-01-28 20:06:52",
  "updated_at": "2025-01-28 20:06:52",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 3,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_in_succeeded`

```json
{
  "id": "d4365207-e8fd-4eef-acd1-868756eeda2d",
  "user_id": "7ea4cbb6-e96d-4fe5-b719-d227782481b4",
  "account_id": null,
  "transaction_id": "7d20d466-7c0b-4c51-8abb-ab9efd92122f",
  "topic": "web_sign_in_succeeded",
  "data": {
    "path": "/login",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["login"],
    "session_id": "33ea5a1a-fe8c-44ed-bdb4-2cc360b38062",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "27a05a03-868c-416e-92ec-3d601c6cc835",
    "website_locale": "en-US",
    "ms_since_page_load": 29274
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:08:58",
  "source": null,
  "inserted_at": "2025-01-28 20:08:58",
  "updated_at": "2025-01-28 20:08:58",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "f4c705f0-6bae-4e48-8dbb-4aad394be213",
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "microsoft edge",
  "meta_browser_locale": "es-419",
  "meta_browser_version": "132.0.0.0",
  "meta_browser_timezone": 240.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[132, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "La Paz",
  "meta_location_country": "Bolivia",
  "meta_location_continent": "South America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1358.0,
  "meta_viewport_height": 650.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 300.0,
  "data_session_id": "33ea5a1a-fe8c-44ed-bdb4-2cc360b38062",
  "_rescued_data": null
}
```

#### Event Type: `web_page_visibility_change_visible`

```json
{
  "id": "83ccc1c4-6347-4a49-a8e5-c1d7b19bd130",
  "user_id": null,
  "account_id": null,
  "transaction_id": "b8e6093d-a51d-4a4f-a6d0-ec5cfadbae83",
  "topic": "web_page_visibility_change_visible",
  "data": {
    "path": "/select",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": "https://www.youtube.com/",
    "path_array": ["select"],
    "session_id": "83348a86-c728-43d1-b493-4be1360cd2d5",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "427ce265-d8a0-42be-8644-d02d3ccc7c65",
    "website_locale": "en-US",
    "ms_since_page_load": 41923
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:02:10.965000",
  "source": null,
  "inserted_at": "2025-01-28 20:02:12",
  "updated_at": "2025-01-28 20:02:12",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "es-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Jalisco",
  "meta_location_country": "Mexico",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": "narrative53251",
  "meta_viewport_width": 1396.0,
  "meta_viewport_height": 804.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "83348a86-c728-43d1-b493-4be1360cd2d5",
  "_rescued_data": null
}
```

#### Event Type: `web_start_select_sign_in`

```json
{
  "id": "cc0831e6-a8e7-4446-b185-f46b9b3be878",
  "user_id": "4df0f47b-e109-474b-bad9-2c96f1a131f4",
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_start_select_sign_in",
  "data": {
    "path": "/select/auth",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["select", "auth"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "5c32f254-8834-4597-a1c8-d3913b73249b",
    "website_locale": "en-US",
    "force_new_sign_in": false,
    "select_install_id": "13DA18E3-FCA1-470B-B6CD-B7183F2E8671",
    "ms_since_page_load": 332
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:06:52",
  "source": null,
  "inserted_at": "2025-01-28 20:06:52",
  "updated_at": "2025-01-28 20:06:52",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_page_visibility_change_hidden`

```json
{
  "id": "ce443916-9140-49af-a38e-e1a91124395b",
  "user_id": "ec01551b-42cd-46db-aba9-80fbd2622a88",
  "account_id": null,
  "transaction_id": "8c19a83e-6dd6-420a-bafa-e3ea163ebd85",
  "topic": "web_page_visibility_change_hidden",
  "data": {
    "path": "/",
    "branch": "main",
    "domain": "narrative.so",
    "referrer": null,
    "path_array": [],
    "session_id": "2227ec82-f189-4f9a-8fb9-3e0c5c5ad0b1",
    "commit_hash": "d5f82dc5af73c170f4fc42f7243f49f71d2af747",
    "page_load_id": "aa926b1e-db1b-49d5-a7fc-356340e7b6e3",
    "website_locale": "en-US",
    "ms_since_page_load": 4999
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:00:46.977000",
  "source": null,
  "inserted_at": "2025-01-28 20:00:48",
  "updated_at": "2025-01-28 20:00:48",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "17.4",
  "meta_browser_timezone": 300.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[17, 4]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Washington",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1324.0,
  "meta_viewport_height": 797.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "2227ec82-f189-4f9a-8fb9-3e0c5c5ad0b1",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_in_failed`

```json
{
  "id": "f1459a5b-76f9-4f56-b5e6-755937d6e5a8",
  "user_id": null,
  "account_id": null,
  "transaction_id": "5a1060c9-b068-4601-8a24-f3bad37a3e43",
  "topic": "web_sign_in_failed",
  "data": {
    "path": "/login",
    "branch": "master",
    "domain": "account.narrative.so",
    "reason": "status_code_401",
    "referrer": null,
    "path_array": ["login"],
    "session_id": "e0f68350-51e3-4188-9716-3de1a8e10c20",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "b6ba12e9-afe9-46ca-9c72-8d8ff725dabe",
    "website_locale": "en-US",
    "ms_since_page_load": 17759
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 21:15:39.589000",
  "source": null,
  "inserted_at": "2025-01-28 21:15:40",
  "updated_at": "2025-01-28 21:15:40",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "bd44754a-25e9-4baa-8ddd-84bfde7ac6aa",
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "microsoft edge",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": -330.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "Gujarat",
  "meta_location_country": "India",
  "meta_location_continent": "Asia",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 922.0,
  "meta_viewport_height": 760.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "e0f68350-51e3-4188-9716-3de1a8e10c20",
  "_rescued_data": null
}
```

#### Event Type: `web_sign_up_selected_genre`

```json
{
  "id": "b02f74d0-9787-4bf4-a80d-9ceb136bd762",
  "user_id": null,
  "account_id": null,
  "transaction_id": "87e4690a-e314-4357-a14d-c5ab6c2f1812",
  "topic": "web_sign_up_selected_genre",
  "data": {
    "app": "select",
    "path": "/get-started/select",
    "genre": "Weddings, engagements and/or elopements",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["get-started", "select"],
    "session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "d685943b-e866-481a-b64e-c67431b82741",
    "website_locale": "en-US",
    "ms_since_page_load": 30177
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:06:15.107000",
  "source": null,
  "inserted_at": "2025-01-28 20:06:16",
  "updated_at": "2025-01-28 20:06:16",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "ee4411e9-cae0-4877-b595-517c6e14448c",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Mississippi",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 778.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "d8b71d3d-1b65-405f-80a6-0b64cd75bf5d",
  "_rescued_data": null
}
```

#### Event Type: `web_product_created`

```json
{
  "id": "2b91a45d-0193-4695-bd22-90822c280a22",
  "user_id": "2fb4420f-59b2-46fb-a1cf-d7896e8f6886",
  "account_id": null,
  "transaction_id": "f79e6afa-e4b7-4603-8e24-cd63a23ec82a",
  "topic": "web_product_created",
  "data": {
    "app": "publish",
    "path": "/subscriptions",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["subscriptions"],
    "session_id": "16a672eb-fbf6-4989-a46a-8e089e98cb75",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "89b39219-f662-48de-b0c0-2cfed36c984a",
    "website_locale": "en-US",
    "ms_since_page_load": 8445
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 02:32:36.228000",
  "source": null,
  "inserted_at": "2025-01-29 02:32:38",
  "updated_at": "2025-01-29 02:32:38",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 360.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "Illinois",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1536.0,
  "meta_viewport_height": 730.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "16a672eb-fbf6-4989-a46a-8e089e98cb75",
  "_rescued_data": null
}
```

#### Event Type: `web_referral_share`

```json
{
  "id": "8b17ea24-f95f-4dc7-8560-e665ca837d9b",
  "user_id": "98912191-3911-4a77-8c93-63283941eee9",
  "account_id": null,
  "transaction_id": "b8cc993f-aff4-4cb0-a807-1e1044434813",
  "topic": "web_referral_share",
  "data": {
    "path": "/ambassadors",
    "type": "affiliate",
    "action": "click",
    "branch": "master",
    "domain": "account.narrative.so",
    "product": "select",
    "referrer": null,
    "path_array": ["ambassadors"],
    "session_id": "50af5aa2-1fc8-4f2d-b97f-6224741c4367",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "d30b9e85-be69-44d0-9e19-50412c4934df",
    "referral_code": "phil273",
    "website_locale": "en-US",
    "ms_since_page_load": 3111,
    "invite_option_interacted": "copy_link"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 22:02:27.690000",
  "source": null,
  "inserted_at": "2025-01-28 22:02:29",
  "updated_at": "2025-01-28 22:02:29",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "c9f5c313-e48a-4a7b-afea-1d9a84449eff",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-au",
  "meta_browser_version": "17.6",
  "meta_browser_timezone": -660.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[17, 6]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "New South Wales",
  "meta_location_country": "Australia",
  "meta_location_continent": "Oceania",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1551.0,
  "meta_viewport_height": 826.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "50af5aa2-1fc8-4f2d-b97f-6224741c4367",
  "_rescued_data": null
}
```

#### Event Type: `web_referral_invite_modal`

```json
{
  "id": "515dd68e-d200-408b-beb9-2734577694f1",
  "user_id": "1f8dd731-c119-48fb-8979-a7d5c18896a0",
  "account_id": null,
  "transaction_id": "cd893e92-c20e-492a-bc7e-eafb6163b02a",
  "topic": "web_referral_invite_modal",
  "data": {
    "code": "itsjimman8093",
    "path": "/referrals",
    "action": "add_email",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "path_array": ["referrals"],
    "session_id": "30092a92-673f-45c1-8820-38691186995c",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "8a033797-9e65-4a03-9878-0beb678c2afc",
    "website_locale": "en-US",
    "numReferreeEmails": 1,
    "ms_since_page_load": 56583
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 03:00:33.295000",
  "source": null,
  "inserted_at": "2025-01-29 03:00:35",
  "updated_at": "2025-01-29 03:00:35",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-gb",
  "meta_browser_version": "132.0.0.0",
  "meta_browser_timezone": -420.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[132, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "West Java",
  "meta_location_country": "Indonesia",
  "meta_location_continent": "Asia",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1404.0,
  "meta_viewport_height": 866.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "30092a92-673f-45c1-8820-38691186995c",
  "_rescued_data": null
}
```

#### Event Type: `web_finish_publish_sign_in`

```json
{
  "id": "11446180-81ab-4cc1-97e4-a466bbe087ae",
  "user_id": "c879dc51-cbe0-4940-8d75-f7492917d8ae",
  "account_id": null,
  "transaction_id": "ba595ecf-a16f-4201-aff6-fa06304c7084",
  "topic": "web_finish_publish_sign_in",
  "data": {
    "path": "/publish/auth",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["publish", "auth"],
    "session_id": "6ed033d3-0f85-4b4a-98a8-40414170827b",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "19d7ec13-013f-42d5-b00e-87f1c435953b",
    "website_locale": "en-US",
    "ms_since_page_load": 2135,
    "publish_install_id": "6b0efb60-a4d5-4a46-bb29-60c48868700f"
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-29 00:58:46.846000",
  "source": null,
  "inserted_at": "2025-01-29 00:58:47",
  "updated_at": "2025-01-29 00:58:47",
  "updated_date": "2025-01-29",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-au",
  "meta_browser_version": "18.2",
  "meta_browser_timezone": -600.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[18, 2]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Queensland",
  "meta_location_country": "Australia",
  "meta_location_continent": "Oceania",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 2560.0,
  "meta_viewport_height": 1237.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "6ed033d3-0f85-4b4a-98a8-40414170827b",
  "_rescued_data": null
}
```

#### Event Type: `web_google_sign_in_outcome`

```json
{
  "id": "1c617449-6ca4-40a8-897f-242a878b2366",
  "user_id": "fb447e60-5824-434e-bf1f-020e519f44a8",
  "account_id": null,
  "transaction_id": "33695009-56a4-4b7a-b4bf-25be7a4430c8",
  "topic": "web_google_sign_in_outcome",
  "data": {
    "path": "/get-started/select",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": "https://narrative.so/",
    "succeeded": true,
    "path_array": ["get-started", "select"],
    "session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
    "commit_hash": "ee57c0cff2e74661a5a7851b93352e8d33c1d8ad",
    "page_load_id": "4646a81d-cf92-4084-8970-bab6babee7f5",
    "website_locale": "en-US",
    "ms_since_page_load": 8774
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-01-28 20:15:31.654000",
  "source": null,
  "inserted_at": "2025-01-28 20:15:32",
  "updated_at": "2025-01-28 20:15:32",
  "updated_date": "2025-01-28",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "Windows",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "131.0.0.0",
  "meta_browser_timezone": 0.0,
  "meta_browser_os_version": "NT 10.0",
  "meta_browser_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[131, 0, 0, 0]",
  "meta_browser_os_version_array": "[null, 0]",
  "meta_location_region": "England",
  "meta_location_country": "United Kingdom",
  "meta_location_continent": "Europe",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1920.0,
  "meta_viewport_height": 959.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "04b85371-5bfc-43bc-9a62-f01340a0c6b6",
  "_rescued_data": null
}
```

#### Event Type: `web_partnership_form_failed`

```json
{
  "id": "af21f900-67f8-48d0-8e7d-091883bc1315",
  "user_id": null,
  "account_id": null,
  "transaction_id": "b1efc4bc-741a-468f-b5b7-c200a396ccbb",
  "topic": "web_partnership_form_failed",
  "data": {
    "form": "ambassador",
    "path": "/partnerships/become-a-narrative-ambassador",
    "error": {
      "code": "ERR_BAD_REQUEST",
      "name": "AxiosError",
      "config": {
        "env": {
          "FormData": null
        },
        "url": "/api/ac-form",
        "data": "{\"url\":\"https://narrative.activehosted.com/proc.php?u=12&f=12&s=&c=0&m=0&act=sub&v=2&fullname=Kendra+McClaine&email=kendramcclainephotography%40gmail.com&field%5B46%5D=https%3A%2F%2Fkendramcclainephotography97.mypixieset.com%2F&field%5B47%5D=KendraMcClainePhotography&field%5B48%5D=&field%5B49%5D=KendraMcClainePhoto&field%5B50%5D=KendraMcClainePhotography.com&field%5B51%5D=Narrative+Select+only&field%5B52%5D=1+1%2F2+year+as+an+LLC%2C+but+photographing+for+5%2B&field%5B55%5D=I+spoke+for+young+kids+getting+started+in+photography%21+I+just+taught+them+the+basics+and+what+to+do.+&field%5B54%5D=I+became+apart+of+PPA.+My+most+proud+moment+though+was+being+invited+to+work+in+Nashville+Tennessee.+I+ended+up+declining+the+offer+but+I%E2%80%99ll+always+remember+that+moment.+&field%5B67%5D=I+LOVE+posting+on+socials.+I%E2%80%99m+working+on+growing+my+tik+tok+currently.+I+think+I+can+influence+newer+photographers+into+checking+you+out%21+&field%5B68%5D=Tik+tok%2C+Instagram%2C+Facebook%21%21+&field%5B65%5D=I+am+not+currently%21%21+&jsonp=true\"}",
        "method": "post",
        "headers": {
          "Accept": "application/json, text/plain, */*",
          "Content-Type": "application/json"
        },
        "timeout": 0,
        "transitional": {
          "forcedJSONParsing": true,
          "silentJSONParsing": true,
          "clarifyTimeoutError": false
        },
        "maxBodyLength": -1,
        "xsrfCookieName": "XSRF-TOKEN",
        "xsrfHeaderName": "X-XSRF-TOKEN",
        "maxContentLength": -1,
        "transformRequest": [null],
        "transformResponse": [null]
      },
      "status": 405,
      "message": "Request failed with status code 405"
    },
    "branch": "main",
    "domain": "narrative.so",
    "values": {
      "apps": "Narrative Select only",
      "name": "Kendra McClaine",
      "email": "kendramcclainephotography@gmail.com",
      "other": "I am not currently!! ",
      "share": "Tik tok, Instagram, Facebook!! ",
      "awards": "I became apart of PPA. My most proud moment though was being invited to work in Nashville Tennessee. I ended up declining the offer but I\u2019ll always remember that moment. ",
      "tiktok": "KendraMcClainePhoto",
      "website": "https://kendramcclainephotography97.mypixieset.com/",
      "youtube": "",
      "facebook": "KendraMcClainePhotography.com",
      "instagram": "KendraMcClainePhotography",
      "workshops": "I spoke for young kids getting started in photography! I just taught them the basics and what to do. ",
      "ambassador": "I LOVE posting on socials. I\u2019m working on growing my tik tok currently. I think I can influence newer photographers into checking you out! ",
      "business-duration": "1 1/2 year as an LLC, but photographing for 5+"
    },
    "referrer": "https://linkin.bio/",
    "path_array": ["partnerships", "become-a-narrative-ambassador"],
    "session_id": "973a158d-bd82-4262-a8da-12c34ce2495f",
    "commit_hash": "a7a93ee43d2eb9b8bf8ece83b4f770a931f46cf4",
    "page_load_id": "a1161401-1b21-444f-8259-e068fa21eda6",
    "website_locale": "en-US",
    "ms_since_page_load": 252308
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-04-14 20:00:03.461000",
  "source": null,
  "inserted_at": "2025-04-14 20:00:05",
  "updated_at": "2025-04-14 20:00:05",
  "updated_date": "2025-04-14",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": "referral",
  "meta_utm_source": "later-linkinbio",
  "meta_utm_content": null,
  "meta_utm_campaign": "button_list_Partnerwithus",
  "meta_browser_os": "iOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-us",
  "meta_browser_version": null,
  "meta_browser_timezone": 240.0,
  "meta_browser_os_version": "18.3.2",
  "meta_browser_user_agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/22D82 Instagram 375.2.0.33.77 (iPhone15,3; iOS 18_3_2; en_US; en; scale=3.00; 1290x2796; 719346134; IABMV/1)",
  "meta_browser_device_type": "mobile",
  "meta_browser_version_array": "null",
  "meta_browser_os_version_array": "[18, 3, 2]",
  "meta_location_region": "Michigan",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 430.0,
  "meta_viewport_height": 853.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 3010.0,
  "data_session_id": "973a158d-bd82-4262-a8da-12c34ce2495f",
  "_rescued_data": "{\"meta_referral_referral\":null,\"_file_path\":\"s3://narrative-databricks-lake/events/web_events/2025-04-14-20-00-00/3451d642-880f-4a53-ad99-84caae5ce1e2.parquet\"}"
}
```

#### Event Type: `web_user_entered_checkout`

```json
{
  "id": "0bd67872-7248-4eef-b06e-4f1d44ecac4e",
  "user_id": "51aa6a05-8a38-4745-bb30-95fe450705a8",
  "account_id": null,
  "transaction_id": "916fa12e-c426-47cb-a810-da937bc4590b",
  "topic": "web_user_entered_checkout",
  "data": {
    "path": "/checkout",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["checkout"],
    "session_id": "a4c59979-9c5e-484d-b03c-e8562ecc6607",
    "commit_hash": "17639cf0c72394520871d90b34bab0abd879e9b4",
    "page_load_id": "67135175-2b11-4f10-ba50-c6c828fd4eb0",
    "new_plan_slug": "narrative-standard",
    "website_locale": "en-US",
    "ms_since_page_load": 175
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-06-25 02:17:23.314000",
  "source": null,
  "inserted_at": "2025-06-25 02:17:25",
  "updated_at": "2025-06-25 02:17:25",
  "updated_date": "2025-06-25",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": "select_app",
  "meta_utm_content": "33835e9f-5425-481d-be47-0716829ec42e",
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "safari",
  "meta_browser_locale": "en-ca",
  "meta_browser_version": "18.4",
  "meta_browser_timezone": 420.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[18, 4]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "British Columbia",
  "meta_location_country": "Canada",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1688.0,
  "meta_viewport_height": 970.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "a4c59979-9c5e-484d-b03c-e8562ecc6607",
  "_rescued_data": "{\"meta_referral_referral\":null,\"_file_path\":\"s3://narrative-databricks-lake/events/web_events/2025-06-25-02-00-00/eba8258c-dfc9-41c2-9c5a-bf49dcdfa270.parquet\"}"
}
```

#### Event Type: `web_checkout_user_redirected_from_purchasing_pro`

```json
{
  "id": "0a3defa8-79db-43e2-8db8-07ff8dc2bc6c",
  "user_id": "590645db-6fc2-4d17-b29a-959d1e1da49a",
  "account_id": null,
  "transaction_id": "d46a8558-3e56-4a5a-be99-5600016c6e26",
  "topic": "web_checkout_user_redirected_from_purchasing_pro",
  "data": {
    "path": "/checkout",
    "action": "redirect=update-prompt&change-select-plan=true",
    "branch": "master",
    "domain": "account.narrative.so",
    "referrer": null,
    "path_array": ["checkout"],
    "session_id": "85c64bb0-682a-4e94-8665-e7ece834f815",
    "commit_hash": "17639cf0c72394520871d90b34bab0abd879e9b4",
    "page_load_id": "a3a53b82-201f-468c-aa91-197c1894cca1",
    "website_locale": "en-US",
    "ms_since_page_load": 684
  },
  "initialized_at": "NaT",
  "occurred_at": "2025-06-25 02:20:08.306000",
  "source": null,
  "inserted_at": "2025-06-25 02:20:09",
  "updated_at": "2025-06-25 02:20:09",
  "updated_date": "2025-06-25",
  "resource_id": null,
  "vsn": 2,
  "meta_utm_term": null,
  "meta_utm_medium": null,
  "meta_utm_source": null,
  "meta_utm_content": null,
  "meta_utm_campaign": null,
  "meta_browser_os": "macOS",
  "meta_browser_name": "chrome",
  "meta_browser_locale": "en-us",
  "meta_browser_version": "136.0.0.0",
  "meta_browser_timezone": 240.0,
  "meta_browser_os_version": "10.15.7",
  "meta_browser_user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36",
  "meta_browser_device_type": "desktop",
  "meta_browser_version_array": "[136, 0, 0, 0]",
  "meta_browser_os_version_array": "[10, 15, 7]",
  "meta_location_region": "Virginia",
  "meta_location_country": "United States",
  "meta_location_continent": "North America",
  "meta_referral_ref": null,
  "meta_referral_fp_ref": null,
  "meta_referral_referral": null,
  "meta_referral_affiliate": null,
  "meta_viewport_width": 1440.0,
  "meta_viewport_height": 788.0,
  "meta_viewport_offset_x": 0.0,
  "meta_viewport_offset_y": 0.0,
  "data_session_id": "85c64bb0-682a-4e94-8665-e7ece834f815",
  "_rescued_data": "{\"meta_referral_referral\":null,\"_file_path\":\"s3://narrative-databricks-lake/events/web_events/2025-06-25-02-00-00/eba8258c-dfc9-41c2-9c5a-bf49dcdfa270.parquet\"}"
}
```

---

## narrative.default.web_events_optimise

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| id                            | `StringType()`    | True     |
| user_id                       | `StringType()`    | True     |
| account_id                    | `StringType()`    | True     |
| transaction_id                | `StringType()`    | True     |
| topic                         | `StringType()`    | True     |
| data                          | `StringType()`    | True     |
| initialized_at                | `TimestampType()` | True     |
| occurred_at                   | `TimestampType()` | True     |
| source                        | `StringType()`    | True     |
| inserted_at                   | `TimestampType()` | True     |
| updated_at                    | `TimestampType()` | True     |
| updated_date                  | `StringType()`    | True     |
| resource_id                   | `StringType()`    | True     |
| vsn                           | `IntegerType()`   | True     |
| meta_utm_term                 | `StringType()`    | True     |
| meta_utm_medium               | `StringType()`    | True     |
| meta_utm_source               | `StringType()`    | True     |
| meta_utm_content              | `StringType()`    | True     |
| meta_utm_campaign             | `StringType()`    | True     |
| meta_browser_os               | `StringType()`    | True     |
| meta_browser_name             | `StringType()`    | True     |
| meta_browser_locale           | `StringType()`    | True     |
| meta_browser_version          | `StringType()`    | True     |
| meta_browser_timezone         | `DoubleType()`    | True     |
| meta_browser_os_version       | `StringType()`    | True     |
| meta_browser_user_agent       | `StringType()`    | True     |
| meta_browser_device_type      | `StringType()`    | True     |
| meta_browser_version_array    | `StringType()`    | True     |
| meta_browser_os_version_array | `StringType()`    | True     |
| meta_location_region          | `StringType()`    | True     |
| meta_location_country         | `StringType()`    | True     |
| meta_location_continent       | `StringType()`    | True     |
| meta_referral_ref             | `StringType()`    | True     |
| meta_referral_fp_ref          | `StringType()`    | True     |
| meta_referral_referral        | `StringType()`    | True     |
| meta_referral_affiliate       | `StringType()`    | True     |
| meta_viewport_width           | `DoubleType()`    | True     |
| meta_viewport_height          | `DoubleType()`    | True     |
| meta_viewport_offset_x        | `DoubleType()`    | True     |
| meta_viewport_offset_y        | `DoubleType()`    | True     |
| data_session_id               | `StringType()`    | True     |
| \_rescued_data                | `StringType()`    | True     |

### Sample Row

```json
No sample data available
```