# Databricks Warehouse Table Documentation

This directory contains organized documentation for Narrative's Databricks warehouse tables, split by product and functional area for easier navigation and query development.

## Directory Structure

### Products
Documentation for tables related to Narrative's core products:

- **[select_tables.md](products/select_tables.md)** (47 tables) - Narrative Select AI culling app
  - Event tracking, activation metrics, user engagement
  - Feature usage: ratings, shipping, tab interactions
  - Monthly active user (CMAU) metrics

- **[publish_tables.md](products/publish_tables.md)** (4 tables) - Narrative Publish blogging tool
  - Publishing events and workflows
  - Content creation metrics

- **[edit_tables.md](products/edit_tables.md)** (15 tables) - Edit features
  - Image editing and corrections
  - Project editing workflows
  - Style management

### Business
Core business logic and operations:

- **[billing_stripe.md](business/billing_stripe.md)** (71 tables) - Stripe integration
  - Subscriptions, payments, invoices
  - Customer billing data
  - Financial transactions

- **[users_accounts.md](business/users_accounts.md)** (6 tables) - User management
  - User accounts and permissions
  - Customer data

- **[core_business.md](business/core_business.md)** (20 tables) - Core business entities
  - Products, plans, features
  - Business logic tables

### Analytics
Event tracking and analytics:

- **[events_tracking.md](analytics/events_tracking.md)** (8 tables) - Event data
  - Installer events
  - Service events
  - General event tracking

- **[web_analytics.md](analytics/web_analytics.md)** (1 table) - Web analytics
  - Website event tracking

### Infrastructure
System infrastructure and operations:

- **[assets_storage.md](infrastructure/assets_storage.md)** (5 tables) - Asset management
  - S3 inventory
  - Storage systems

- **[ml_inference.md](infrastructure/ml_inference.md)** (3 tables) - ML/AI systems
  - Inference parameters
  - Model data
  - XMP metadata

- **[system_operations.md](infrastructure/system_operations.md)** (16 tables) - System operations
  - Operational tables
  - System state tracking

## Usage Guide

### For Product Managers
- Start with the relevant product file (select_tables.md or publish_tables.md)
- Review core_business.md for business logic
- Check events_tracking.md for user behavior data

### For Data Analysts
- Use this structure to find tables for specific analyses
- Cross-reference between products and analytics directories
- Check billing_stripe.md for revenue-related queries

### For Engineers
- Infrastructure directory contains system-level tables
- Products directory has feature-specific tables
- Use grep to search across files for specific column names

## Table Count Summary
- Total tables: 196
- Narrative Select: 47 tables
- Narrative Publish: 4 tables
- Edit Features: 15 tables
- Stripe/Billing: 71 tables
- Other categories: 59 tables

## Original Source
This documentation was generated from the monolithic `query_context.md` file and split for better organization and accessibility.