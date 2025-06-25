# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains documentation for Databricks warehouse tables. The main file is `query_context.md`, which is a large (3.3MB) auto-generated documentation file containing table schemas and metadata.

## Repository Structure

- `query_context.md` - Original auto-generated documentation of Databricks warehouse tables (3.3MB)
- `databricks-docs/` - Organized documentation split by product and function:
  - `products/` - Product-specific tables (Select, Publish, Edit)
  - `business/` - Business logic, users, and billing tables
  - `analytics/` - Event tracking and analytics tables
  - `infrastructure/` - System, ML, and operational tables
  - `README.md` - Navigation guide for the split documentation

## Working with the Documentation

The documentation has been split into manageable files in the `databricks-docs/` directory:

1. **For product-specific queries**: Navigate to `databricks-docs/products/` for Select, Publish, or Edit tables
2. **For business logic**: Check `databricks-docs/business/` for user, account, and billing tables
3. **For analytics**: Use `databricks-docs/analytics/` for event tracking and metrics
4. **For system info**: Browse `databricks-docs/infrastructure/` for ML, storage, and operational tables

The original `query_context.md` file is preserved but the split files are recommended for easier access and better context loading when developing queries.

## Important Notes

- This repository contains both documentation and analytics workflow structure
- The documentation is auto-generated from a Databricks warehouse
- No build, test, or development commands are applicable to this repository

## Analytics Workflow

This repository includes a standardized analytics workflow structure in the `/analytics/` directory:

### Directory Structure
- `analytics/queries/` - SQL queries organized by product domain (select, publish, edit, user-behavior, revenue, growth, infrastructure)
- `analytics/reports/` - Analysis reports organized by cadence (weekly, monthly, quarterly, okr-tracking)
- `analytics/experiments/` - A/B tests and feature experiments (a-b-tests, feature-flags, cohort-analysis)
- `analytics/dashboards/` - Dashboard specifications and documentation
- `analytics/ad-hoc/` - One-off analysis and investigations
- `analytics/documentation/` - Workflow guides and standards

### Templates Available
- `analytics/queries/query_template.sql` - Standard SQL query template with documentation
- `analytics/reports/report_template.md` - Standard analysis report template
- `analytics/experiments/experiment_template.md` - A/B test and experiment documentation template

### Naming Conventions
- **Queries:** `YYYY-MM-DD_product_purpose.sql`
- **Reports:** `YYYY-MM-DD_report_type_title.md`
- **Experiments:** `experiment_name_YYYY-MM-DD.md`

### Analytics Workflow Process
1. **Query Development:** Use templates, reference table docs, include validation
2. **Report Creation:** Link to supporting queries, provide executive summaries
3. **Experiment Design:** Define success metrics, document statistical approach
4. **Documentation:** All final analysis should be committed to this repository

### Key Metrics Definitions
- **Select Activation:** First successful cull completion
- **CMAU:** Count of Monthly Active Users (Select)
- **ARPU:** Average Revenue Per User (monthly)
- **Retention:** 28-day rolling retention rate

### Data Source Integration
- Cross-reference with `/databricks-docs/` for table documentation
- Use Databricks cluster for query execution
- Integrate with Amplitude for user journey analysis
- Link analytics tasks to Linear issues for project management
