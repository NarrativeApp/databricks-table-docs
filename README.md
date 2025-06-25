# Databricks Table Documentation

This repository contains comprehensive documentation for Narrative's Databricks warehouse tables, organized by product and functional area for easier navigation and query development.

## Overview

Narrative uses Databricks as its primary data warehouse, containing tables across three main schemas:
- `narrative.default` - Primary operational tables
- `narrative.core` - Core business entities and logic
- `narrative.stripe` - Stripe integration for billing and payments

## Repository Structure

```
.
├── databricks-docs/          # Organized table documentation
│   ├── products/            # Product-specific tables
│   ├── business/            # Business logic and operations
│   ├── analytics/           # Event tracking and analytics
│   └── infrastructure/      # System and ML operations
├── query_context.md         # Original monolithic documentation (3.3MB)
├── CLAUDE.md               # Instructions for Claude AI assistant
└── README.md               # This file
```

## Quick Start

### Finding Tables by Product

- **Narrative Select** (AI culling app): [`databricks-docs/products/select_tables.md`](databricks-docs/products/select_tables.md)
- **Narrative Publish** (blogging tool): [`databricks-docs/products/publish_tables.md`](databricks-docs/products/publish_tables.md)
- **Edit Features**: [`databricks-docs/products/edit_tables.md`](databricks-docs/products/edit_tables.md)

### Finding Tables by Function

- **User Management**: [`databricks-docs/business/users_accounts.md`](databricks-docs/business/users_accounts.md)
- **Billing & Payments**: [`databricks-docs/business/billing_stripe.md`](databricks-docs/business/billing_stripe.md)
- **Event Tracking**: [`databricks-docs/analytics/events_tracking.md`](databricks-docs/analytics/events_tracking.md)
- **ML/AI Systems**: [`databricks-docs/infrastructure/ml_inference.md`](databricks-docs/infrastructure/ml_inference.md)

## Table Statistics

| Category | File Count | Table Count | Key Areas |
|----------|------------|-------------|-----------|
| Products | 3 | 66 | Select (47), Publish (4), Edit (15) |
| Business | 3 | 97 | Stripe (71), Core (20), Users (6) |
| Analytics | 2 | 9 | Events (8), Web (1) |
| Infrastructure | 3 | 24 | Assets (5), ML (3), Operations (16) |
| **Total** | **11** | **196** | |

## Usage Examples

### For Product Managers
```sql
-- Find Select activation metrics
-- See: databricks-docs/products/select_tables.md
SELECT * FROM narrative.default.select_activation
WHERE created_at >= CURRENT_DATE - INTERVAL 30 DAYS;
```

### For Data Analysts
```sql
-- Analyze user engagement across products
-- See: databricks-docs/analytics/events_tracking.md
SELECT event_type, COUNT(*) as event_count
FROM narrative.default.select_events
GROUP BY event_type
ORDER BY event_count DESC;
```

### For Engineers
```sql
-- Check ML inference performance
-- See: databricks-docs/infrastructure/ml_inference.md
SELECT * FROM narrative.default.cloud_xmp_inference_params_staging
WHERE sync_status = 'pending';
```

## Navigation Guide

Detailed navigation and usage instructions are available in [`databricks-docs/README.md`](databricks-docs/README.md).

## About Narrative

Narrative is an Auckland-based startup (founded 2017) building AI-powered desktop software that helps photographers streamline their post-shoot workflow. Our main products are:

- **Narrative Select** - AI culling app for rapid photo selection
- **Narrative Publish** - Fast blogging tool for photographers

## Contributing

This documentation is auto-generated from our Databricks warehouse. To update:
1. Re-export table documentation from Databricks
2. Run the splitting script to reorganize into categories
3. Submit a pull request with the changes

## License

This documentation is for internal use by Narrative team members and authorized partners.