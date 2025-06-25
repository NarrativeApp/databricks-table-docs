# System Operations Tables

This file contains documentation for 16 Databricks warehouse tables related to system operations.
These tables include various operational data, system states, and other tables not categorized elsewhere.

---

## narrative.default.exported_images_join_to_core

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
  "id": "8b98770c-99ab-4fe0-8aeb-f812f662a322",
  "asset_id": "86aed083-43d4-47ab-b8ad-78e54c900164",
  "asset_version_id": "16b8d317-40f5-4736-a556-88563f10bb44",
  "hash": "637844089996C34F7195709A69AC0A8C6AA0B3E6",
  "status": "available",
  "width": 256,
  "height": 171,
  "inserted_at": "2024-11-11 00:59:34",
  "updated_at": "2024-11-11 01:01:51",
  "mimetype": "image/x-adobe-dng",
  "_rescued_data": null
}
```

---

## narrative.default.qualified_signups

### Schema

| Column          | Type            | Nullable |
| --------------- | --------------- | -------- |
| id              | `StringType()`  | True     |
| user_id         | `StringType()`  | True     |
| session_id      | `StringType()`  | True     |
| day             | `DateType()`    | True     |
| is_mac_user     | `BooleanType()` | True     |
| is_windows_user | `BooleanType()` | True     |
| is_professional | `BooleanType()` | True     |
| is_qualified    | `BooleanType()` | True     |
| is_mobile       | `BooleanType()` | True     |
| app             | `StringType()`  | True     |
| genre_array     | `StringType()`  | True     |
| source          | `StringType()`  | True     |
| solution_wanted | `StringType()`  | True     |
| vertical        | `StringType()`  | True     |

### Sample Row

```json
{
  "id": "00007899-b530-4198-8242-a7e20386facd",
  "user_id": "34b52d32-17a0-45b3-aee1-65c10f501f87",
  "session_id": "534e510e-ca6c-459c-8c8b-802a44834ebf",
  "day": "2025-01-23",
  "is_mac_user": true,
  "is_windows_user": false,
  "is_professional": true,
  "is_qualified": true,
  "is_mobile": false,
  "app": "select",
  "genre_array": "[\"Weddings, engagements and/or elopements\"]",
  "source": "Ad on Google",
  "solution_wanted": null,
  "vertical": "Weddings, engagements and/or elopements"
}
```

---

## narrative.default.rating_2

### Schema

| Column      | Type              | Nullable |
| ----------- | ----------------- | -------- |
| user_id     | `StringType()`    | True     |
| inserted_at | `TimestampType()` | True     |
| project_id  | `StringType()`    | True     |

### Sample Row

```json
{
  "user_id": "24f7e0e4-e09e-4c22-a1e0-54b6524d6341",
  "inserted_at": "2025-01-23 03:30:02",
  "project_id": "def11d335ee54349ae47d307e88e3725"
}
```

---

## narrative.default.second_and_later_projects_2

### Schema

| Column            | Type              | Nullable |
| ----------------- | ----------------- | -------- |
| project_id        | `StringType()`    | True     |
| first_inserted_at | `TimestampType()` | True     |

### Sample Row

```json
{
  "project_id": "4b1ff8e393564c97a2a5090bf24e12e0",
  "first_inserted_at": "2024-03-23 09:08:30"
}
```

---

## narrative.default.ship_command_sent_successfully

### Schema

| Column                                 | Type              | Nullable |
| -------------------------------------- | ----------------- | -------- |
| modal_id                               | `StringType()`    | True     |
| ship_command_sent_successfully_step_at | `TimestampType()` | True     |
| ship_command_sent_successfully         | `StringType()`    | True     |

### Sample Row

```json
{
  "modal_id": "63511c39-639d-44ea-ba12-c0721a81a6e0",
  "ship_command_sent_successfully_step_at": "2025-01-23 03:30:53.991000",
  "ship_command_sent_successfully": "select_ship_command_sent_successfully"
}
```

---

## narrative.default.ship_confirmation_cancelled

### Schema

| Column                              | Type              | Nullable |
| ----------------------------------- | ----------------- | -------- |
| modal_id                            | `StringType()`    | True     |
| reason                              | `StringType()`    | True     |
| ship_confirmation_cancelled_step_at | `TimestampType()` | True     |
| ship_confirmation_cancelled         | `StringType()`    | True     |

### Sample Row

```json
{
  "modal_id": "9b0d132c-cfac-4954-a990-d66fdc18d6f5",
  "reason": "user_shipped_again",
  "ship_confirmation_cancelled_step_at": "2025-01-23 03:38:04.848000",
  "ship_confirmation_cancelled": "select_ship_confirmation_cancelled"
}
```

---

## narrative.default.ship_confirmation_complete

### Schema

| Column                             | Type              | Nullable |
| ---------------------------------- | ----------------- | -------- |
| modal_id                           | `StringType()`    | True     |
| confirmed_count_final              | `StringType()`    | True     |
| top_level_image_final              | `StringType()`    | True     |
| ship_confirmation_complete_step_at | `TimestampType()` | True     |
| ship_confirmation_complete         | `StringType()`    | True     |

### Sample Row

```json
{
  "modal_id": "86a9600c-a6f6-413c-b795-30d4dc88ff44",
  "confirmed_count_final": "34",
  "top_level_image_final": "34",
  "ship_confirmation_complete_step_at": "2025-01-23 03:30:28.637000",
  "ship_confirmation_complete": "select_ship_confirmation_complete"
}
```

---

## narrative.default.ship_confirmation_not_possible

### Schema

| Column                                 | Type              | Nullable |
| -------------------------------------- | ----------------- | -------- |
| modal_id                               | `StringType()`    | True     |
| ship_confirmation_not_possible_step_at | `TimestampType()` | True     |
| ship_confirmation_not_possible         | `StringType()`    | True     |

### Sample Row

```json
{
  "modal_id": "3211d22e-b446-4ded-beed-5a5f43529419",
  "ship_confirmation_not_possible_step_at": "2025-01-23 03:35:54.101000",
  "ship_confirmation_not_possible": "select_ship_confirmation_not_possible"
}
```

---

## narrative.default.ship_confirmation_partial_progress

### Schema

| Column                                     | Type              | Nullable |
| ------------------------------------------ | ----------------- | -------- |
| modal_id                                   | `StringType()`    | True     |
| ship_confirmation_partial_progress         | `StringType()`    | True     |
| confirmed_count_partial                    | `StringType()`    | True     |
| top_level_image_partial                    | `StringType()`    | True     |
| ship_confirmation_partial_progress_step_at | `TimestampType()` | True     |
| progress_updates                           | `LongType()`      | True     |

### Sample Row

```json
{
  "modal_id": "97b4680b-8e55-4d63-80fc-6a53afdd2e80",
  "ship_confirmation_partial_progress": "select_ship_confirmation_partial_progress",
  "confirmed_count_partial": "989",
  "top_level_image_partial": "1152",
  "ship_confirmation_partial_progress_step_at": "2024-03-30 00:16:46",
  "progress_updates": 33
}
```

---

## narrative.default.ship_confirmation_start

### Schema

| Column                          | Type              | Nullable |
| ------------------------------- | ----------------- | -------- |
| modal_id                        | `StringType()`    | True     |
| ship_count                      | `StringType()`    | True     |
| catalog_resolution              | `StringType()`    | True     |
| ship_confirmation_start_step_at | `TimestampType()` | True     |
| ship_confirmation_start         | `StringType()`    | True     |

### Sample Row

```json
{
  "modal_id": "86a9600c-a6f6-413c-b795-30d4dc88ff44",
  "ship_count": "34",
  "catalog_resolution": "current_lr_open_catalog",
  "ship_confirmation_start_step_at": "2025-01-23 03:30:13.538000",
  "ship_confirmation_start": "select_ship_confirmation_start"
}
```

---

## narrative.default.shipping_state_machine_collected_data

### Schema

| Column                                     | Type              | Nullable |
| ------------------------------------------ | ----------------- | -------- |
| user_id                                    | `StringType()`    | True     |
| project_id                                 | `StringType()`    | True     |
| modal_id                                   | `StringType()`    | True     |
| ship_start_at                              | `TimestampType()` | True     |
| select_ship_modal_opened                   | `StringType()`    | True     |
| numeric_version                            | `IntegerType()`   | True     |
| choice                                     | `StringType()`    | True     |
| selected_ship_to                           | `StringType()`    | True     |
| selected_images_to_be_shipped              | `StringType()`    | True     |
| selected_ratings_to_be_shipped             | `StringType()`    | True     |
| selected_ship_image_count_ui               | `StringType()`    | True     |
| select_ship_modal_closed_step_at           | `TimestampType()` | True     |
| select_ship_modal_closed                   | `StringType()`    | True     |
| select_ship_modal_closed_canceled_step_at  | `TimestampType()` | True     |
| select_ship_modal_closed_canceled          | `StringType()`    | True     |
| ship_command_sent_successfully_step_at     | `TimestampType()` | True     |
| ship_command_sent_successfully             | `StringType()`    | True     |
| ship_count                                 | `StringType()`    | True     |
| catalog_resolution                         | `StringType()`    | True     |
| ship_confirmation_start_step_at            | `TimestampType()` | True     |
| ship_confirmation_start                    | `StringType()`    | True     |
| ship_confirmation_not_possible_step_at     | `TimestampType()` | True     |
| ship_confirmation_not_possible             | `StringType()`    | True     |
| confirmed_count_partial                    | `StringType()`    | True     |
| top_level_image_partial                    | `StringType()`    | True     |
| ship_confirmation_partial_progress_step_at | `TimestampType()` | True     |
| ship_confirmation_partial_progress         | `StringType()`    | True     |
| confirmed_count_final                      | `StringType()`    | True     |
| top_level_image_final                      | `StringType()`    | True     |
| reason                                     | `StringType()`    | True     |
| ship_confirmation_cancelled_step_at        | `TimestampType()` | True     |
| ship_confirmation_cancelled                | `StringType()`    | True     |
| ship_confirmation_complete_step_at         | `TimestampType()` | True     |
| ship_confirmation_complete                 | `StringType()`    | True     |

### Sample Row

```json
{
  "user_id": "2118575b-178c-4cf4-94d5-16f64b46342b",
  "project_id": "3e6b305228c246c7a1e6d15c8dd1b263",
  "modal_id": "09ac73a4-4fb4-4e66-92e4-b6bce15bfc78",
  "ship_start_at": "2024-01-18 20:30:32",
  "select_ship_modal_opened": "select_ship_modal_opened",
  "numeric_version": 1005017,
  "choice": "ship_images",
  "selected_ship_to": "lightroom_classic",
  "selected_images_to_be_shipped": "with_rating",
  "selected_ratings_to_be_shipped": "[\"show_by_rating:1\"]",
  "selected_ship_image_count_ui": "29",
  "select_ship_modal_closed_step_at": "2024-01-18 20:30:33",
  "select_ship_modal_closed": "select_ship_modal_closed",
  "select_ship_modal_closed_canceled_step_at": "2024-01-18 20:30:33",
  "select_ship_modal_closed_canceled": "select_ship_modal_closed_canceled",
  "ship_command_sent_successfully_step_at": "2024-01-18 20:30:34",
  "ship_command_sent_successfully": "select_ship_command_sent_successfully",
  "ship_count": "29",
  "catalog_resolution": "current_lr_open_catalog",
  "ship_confirmation_start_step_at": "2024-01-18 20:30:34",
  "ship_confirmation_start": "select_ship_confirmation_start",
  "ship_confirmation_not_possible_step_at": "NaT",
  "ship_confirmation_not_possible": null,
  "confirmed_count_partial": null,
  "top_level_image_partial": null,
  "ship_confirmation_partial_progress_step_at": "NaT",
  "ship_confirmation_partial_progress": null,
  "confirmed_count_final": "29",
  "top_level_image_final": "29",
  "reason": null,
  "ship_confirmation_cancelled_step_at": "NaT",
  "ship_confirmation_cancelled": null,
  "ship_confirmation_complete_step_at": "2024-01-18 20:30:44",
  "ship_confirmation_complete": "select_ship_confirmation_complete"
}
```

---

## narrative.default.shipping_state_machine_master

### Schema

| Column                         | Type                 | Nullable |
| ------------------------------ | -------------------- | -------- |
| user_id                        | `StringType()`       | True     |
| project_id                     | `StringType()`       | True     |
| modal_id                       | `StringType()`       | True     |
| numeric_version                | `IntegerType()`      | True     |
| state                          | `StringType()`       | True     |
| state_step                     | `IntegerType()`      | True     |
| ship_start_at                  | `TimestampType()`    | True     |
| ship_end_at                    | `TimestampType()`    | True     |
| catalog_resolution             | `StringType()`       | True     |
| selected_images_to_be_shipped  | `StringType()`       | True     |
| selected_ratings_to_be_shipped | `StringType()`       | True     |
| selected_ship_image_count_ui   | `StringType()`       | True     |
| ship_count                     | `IntegerType()`      | True     |
| confirmed_count                | `IntegerType()`      | True     |
| top_level_image                | `IntegerType()`      | True     |
| non_zero_ship_count            | `IntegerType()`      | True     |
| percentage_confirmed           | `DecimalType(24,12)` | True     |

### Sample Row

```json
{
  "user_id": "2113b528-9189-4776-9ccd-e9caed848c51",
  "project_id": "e44beb9d176c4eeaa1653cc1754649c7",
  "modal_id": "9f99cc4e-31f4-44bf-80d9-c9bb79501ee9",
  "numeric_version": 1005017,
  "state": "select_ship_modal_closed_canceled",
  "state_step": 3,
  "ship_start_at": "2024-01-20 22:29:40",
  "ship_end_at": "2024-01-20 22:29:40",
  "catalog_resolution": null,
  "selected_images_to_be_shipped": "currently_selected",
  "selected_ratings_to_be_shipped": "[]",
  "selected_ship_image_count_ui": "1",
  "ship_count": NaN,
  "confirmed_count": NaN,
  "top_level_image": NaN,
  "non_zero_ship_count": 1,
  "percentage_confirmed": null
}
```

---

## narrative.default.top_level_table

### Schema

| Column                            | Type                            | Nullable |
| --------------------------------- | ------------------------------- | -------- |
| color_filter                      | `ArrayType(StringType(), True)` | True     |
| format_version                    | `StringType()`                  | True     |
| maxwell_version                   | `StringType()`                  | True     |
| modal_id                          | `StringType()`                  | True     |
| project_id                        | `StringType()`                  | True     |
| rating_filter                     | `ArrayType(StringType(), True)` | True     |
| scenes_selected_percentage_stddev | `DoubleType()`                  | True     |
| select_plan                       | `StringType()`                  | True     |
| select_version                    | `StringType()`                  | True     |
| selected_percentage               | `DoubleType()`                  | True     |
| ship_mode                         | `StringType()`                  | True     |
| shipped_at                        | `LongType()`                    | True     |
| sort_criteria                     | `StringType()`                  | True     |
| sort_order                        | `StringType()`                  | True     |
| user_id                           | `StringType()`                  | True     |
| \_rescued_data                    | `StringType()`                  | True     |

### Sample Row

```json
{
  "color_filter": "['no_filter']",
  "format_version": "0.1.0",
  "maxwell_version": "7.29.0",
  "modal_id": "89fb29be-5719-45b0-a9ff-36e13aa06b0c",
  "project_id": "271e5ce8-6195-448d-8364-f5ba374632d5",
  "rating_filter": "['1_star']",
  "scenes_selected_percentage_stddev": 17.010345435994292,
  "select_plan": "Select Pro",
  "select_version": "1.5.20",
  "selected_percentage": 15.789473684210526,
  "ship_mode": "filters",
  "shipped_at": 1709106631,
  "sort_criteria": "capture_time",
  "sort_order": "asc",
  "user_id": "00170390-99eb-4521-82a1-da3b0566eb8a",
  "_rescued_data": null
}
```

---

## narrative.default.window_28_days

### Schema

| Column              | Type         | Nullable |
| ------------------- | ------------ | -------- |
| start_day_inclusive | `DateType()` | True     |
| end_day_inclusive   | `DateType()` | True     |

### Sample Row

```json
{
  "start_day_inclusive": "2000-01-01",
  "end_day_inclusive": "2000-01-28"
}
```

---

## narrative.default.window_28_days_cte_2

### Schema

| Column              | Type         | Nullable |
| ------------------- | ------------ | -------- |
| start_day_inclusive | `DateType()` | True     |
| end_day_inclusive   | `DateType()` | True     |

### Sample Row

```json
{
  "start_day_inclusive": "2021-01-01",
  "end_day_inclusive": "2021-01-28"
}
```

---

## narrative.default.window_7_days

### Schema

| Column              | Type         | Nullable |
| ------------------- | ------------ | -------- |
| start_day_inclusive | `DateType()` | True     |
| end_day_inclusive   | `DateType()` | True     |

### Sample Row

```json
{
  "start_day_inclusive": "2000-01-01",
  "end_day_inclusive": "2000-01-07"
}
```