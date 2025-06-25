# Web Analytics Tables

This file contains documentation for 1 Databricks warehouse tables related to web analytics.
These tables track web-specific events, sessions, and user behavior on the web platform.

---

## narrative.default.web_first_sessions

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| session_id     | `StringType()`    | True     |
| first_event_id | `StringType()`    | True     |
| first_visit_at | `TimestampType()` | True     |

### Sample Row

```json
{
  "session_id": "061c28ba-0ea4-4396-9467-2b5119584bfd",
  "first_event_id": "195beafd-121a-487d-9c91-f552a2e940ca",
  "first_visit_at": "2025-06-19 22:44:20.466000"
}
```