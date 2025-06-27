# ANA-57: Narrative Select Trial Analysis

**Linear Issue:** [ANA-57: Analyze Select Plan Trial Users and Conversion Rates](https://linear.app/narrative/issue/ANA-57/analyze-select-plan-trial-users-and-conversion-rates)

## Files in this Analysis

- `2025-06-26_select_trial_duration_distribution.sql` - Shows user count by trial day (1-31)
- `2025-06-26_select_trial_conversion_rate.sql` - Calculates trial-to-paid conversion rates
- `2025-06-26_ana-57_select_trial_analysis.md` - Complete analysis report with findings

## Key Results Summary

- **8.68%** paid conversion rate from trials
- **84.90%** overall conversion rate (including free plans)
- **25,964** users currently in active trials
- **Days 21-23** show major user clustering (trial decision points)

## Usage

Test queries with:
```bash
python test_query.py analytics/queries/ANA-57_select_trial_analysis/[query_file].sql
```

## Data Sources

- `narrative.stripe.subscriptions` (trial periods)
- `narrative.stripe.subscription_items` (line items)
- `narrative.stripe.prices` (pricing tiers)
- **Product Filter:** `prod_HE50j3A0xeeU2J` (Narrative Select)