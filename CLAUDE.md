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

- This is a documentation-only repository with no executable code
- The documentation appears to be auto-generated from a Databricks warehouse
- No build, test, or development commands are applicable to this repository
