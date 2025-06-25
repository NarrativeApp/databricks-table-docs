# Analytics Workflow Guide

This directory contains the standardized folder structure and templates for all analytics work at Narrative.

## Directory Structure

```
analytics/
├── queries/                    # SQL queries organized by domain
│   ├── select/                # Narrative Select product queries
│   ├── publish/               # Narrative Publish product queries
│   ├── edit/                  # Edit feature queries
│   ├── user-behavior/         # User engagement and behavior
│   ├── revenue/               # Revenue and billing analysis
│   ├── growth/                # Growth metrics and funnel analysis
│   ├── infrastructure/        # System performance and ML queries
│   └── query_template.sql     # Standard query template
├── reports/                   # Analysis reports and insights
│   ├── weekly/                # Weekly business reviews
│   ├── monthly/               # Monthly deep dives
│   ├── quarterly/             # Quarterly OKR reviews
│   ├── okr-tracking/          # OKR progress tracking
│   └── report_template.md     # Standard report template
├── dashboards/                # Dashboard specs and documentation
├── experiments/               # A/B tests and feature experiments
│   ├── a-b-tests/             # Standard A/B test documentation
│   ├── feature-flags/         # Feature flag experiment tracking
│   ├── cohort-analysis/       # Cohort-based experiments
│   └── experiment_template.md # Standard experiment template
├── ad-hoc/                    # One-off analysis and investigations
└── documentation/             # Workflow guides and standards
```

## Naming Conventions

### Queries
- Format: `YYYY-MM-DD_product_purpose.sql`
- Examples:
  - `2024-06-25_select_activation_analysis.sql`
  - `2024-06-25_revenue_cohort_retention.sql`

### Reports
- Format: `YYYY-MM-DD_report_type_title.md`
- Examples:
  - `2024-06-25_weekly_select_performance.md`
  - `2024-06-25_monthly_growth_review.md`

### Experiments
- Format: `experiment_name_YYYY-MM-DD.md`
- Examples:
  - `select_onboarding_improvement_2024-06-25.md`
  - `publish_pricing_test_2024-06-25.md`

## Workflow Standards

### 1. Query Development
1. Use the query template for all new queries
2. Include proper documentation and context
3. Add validation queries where appropriate
4. Reference relevant table documentation from `/databricks-docs/`

### 2. Report Creation
1. Start with the report template
2. Link to supporting queries in the queries folder
3. Include executive summary for stakeholder consumption
4. Provide actionable recommendations

### 3. Experiment Design
1. Use experiment template for all tests
2. Define clear success metrics before starting
3. Document statistical approach and sample size calculations
4. Track experiments in Linear for project management

## Data Sources

### Primary Tables by Use Case
- **Select Product:** `databricks-docs/products/select_tables.md`
- **Publish Product:** `databricks-docs/products/publish_tables.md`
- **User Behavior:** `databricks-docs/analytics/events_tracking.md`
- **Revenue:** `databricks-docs/business/billing_stripe.md`
- **Core Business:** `databricks-docs/business/core_business.md`

### Key Metrics Definitions
- **Select Activation:** First successful cull completion
- **CMAU:** Count of Monthly Active Users (Select)
- **ARPU:** Average Revenue Per User (monthly)
- **Retention:** 28-day rolling retention rate

## Tools Integration

### Databricks
- Use cluster: [cluster_name]
- Save queries to personal workspace, copy final versions here
- Use `narrative` database for all queries

### Amplitude
- Cross-reference event data with Databricks tables
- Use Amplitude for quick user journey analysis

### Linear
- Link analytics tasks to relevant issues
- Tag experiments with `experiment` label
- Use project boards for OKR tracking

## Best Practices

1. **Performance:** Always include date filters to limit data scanned
2. **Reproducibility:** Include all assumptions and context in documentation
3. **Collaboration:** Share work in progress for feedback
4. **Version Control:** Commit all final analysis to this repository
5. **Privacy:** Never include PII in queries or reports committed to git