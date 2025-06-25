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

### Query Building Guidelines

When building queries, follow these principles to ensure maintainability and portability:

1. **Simplicity First**: Write queries that are as simple as possible while getting the job done. Avoid over-engineering.

2. **Use CTEs (Common Table Expressions)**: Structure queries with CTEs to aid debugging and readability. This also helps when porting code to Count.co or other platforms.

3. **Validate Against dbt**: Always validate queries against dbt patterns and test that they run successfully. Reference existing models in `/exmaple models/` for table definition patterns.

4. **Table References**: Check how tables are referenced in example models - use the appropriate syntax (e.g., `{{ ref('table_name') }}` for dbt models).

5. **Testing**: Every query must be tested to ensure it runs without errors. Include sample output when documenting queries.

6. **Conciseness**: Keep queries concise and focused on the specific analytical need. Avoid including unnecessary columns or joins.

Example structure from existing models:
```sql
WITH base_data AS (
    SELECT 
        user_id,
        event_timestamp,
        event_type
    FROM {{ ref('source_table') }}
    WHERE condition = true
),
aggregated AS (
    SELECT 
        user_id,
        COUNT(*) as event_count
    FROM base_data
    GROUP BY user_id
)
SELECT * FROM aggregated
```

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

### Databricks Infrastructure
- `analytics/notebooks/` - Python notebooks for interactive analysis and testing
- `utils.py` - Common functions for data quality, visualization, and statistical analysis
- Notebooks include automated validation, visualization, and export capabilities
- Upload `.py` files to Databricks workspace for interactive development
- Recommended cluster: 12.2 LTS runtime with Standard_DS3_v2 nodes

## Query Testing Framework

A simple Python-based testing framework is available for iterating and validating Databricks queries:

### Setup

1. **Install dependencies**:
   ```bash
   pip install databricks-sql-connector pandas
   ```

2. **Configure credentials** (choose one method):
   - Environment variables:
     ```bash
     export DATABRICKS_SERVER_HOSTNAME="your-workspace.cloud.databricks.com"
     export DATABRICKS_HTTP_PATH="/sql/1.0/warehouses/your-warehouse-id"
     export DATABRICKS_TOKEN="your-access-token"
     ```
   - Config file: Copy `.databricks_config_template.json` to `.databricks_config.json` and fill in your details

### Usage

**Test a query file**:
```bash
python databricks_query_tester.py path/to/query.sql --limit 20
```

**Quick test with minimal output**:
```bash
python test_query.py path/to/query.sql
```

**Interactive mode**:
```bash
python databricks_query_tester.py
```

**Validate syntax only**:
```bash
python databricks_query_tester.py "SELECT * FROM table" --validate-only
```

**Save results to CSV**:
```bash
python databricks_query_tester.py query.sql --output results.csv
```

### Key Features

- **Automatic dbt ref handling**: The tester strips `{{ ref('table_name') }}` syntax for direct execution
- **Query validation**: Test syntax without full execution using `--validate-only`
- **Limit results**: Default limit of 10 rows to prevent large data transfers during testing
- **Interactive REPL**: Run queries interactively for quick iteration
- **File or direct query**: Test from .sql files or provide queries directly

### Testing Workflow

1. Write query following the query building guidelines
2. Test with small limit: `python test_query.py my_query.sql`
3. Validate full results if needed: `python databricks_query_tester.py my_query.sql --limit 1000`
4. Save sample output: `python databricks_query_tester.py my_query.sql --output sample_results.csv`
5. Include validation results in documentation/reports

This testing framework enables rapid iteration on queries while ensuring they run correctly against the actual Databricks warehouse.
