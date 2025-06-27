# ANA-57: Narrative Select Trial Users and Conversion Analysis

**Date:** June 26, 2025  
**Analysis Period:** All completed trials through current date  
**Linear Issue:** [ANA-57](https://linear.app/narrative/issue/ANA-57/analyze-select-plan-trial-users-and-conversion-rates)

## Executive Summary

Analysis of Narrative Select product trials shows **8.68% paid conversion rate** from trial users, with **84.90% overall conversion** when including free plan conversions. Currently **25,964 users** are actively in trial periods.

## Key Findings

### Trial-to-Paid Conversion Rate
- **8.68%** of trial users convert to paid subscriptions
- **84.90%** overall conversion rate (including free plans)
- **15,717** total completed trials analyzed

### Conversion Breakdown
| Outcome | Count | Percentage |
|---------|-------|------------|
| Converted to Paid | 1,364 | 8.68% |
| Converted to Free | 11,980 | 76.22% |
| Canceled/Churned | 2,370 | 15.08% |
| **Total Completed Trials** | **15,717** | **100%** |

### Conversion by Billing Frequency
- **Monthly plans:** 2.19% paid conversion rate
- **Yearly plans:** 50.98% paid conversion rate

### Current Trial Distribution
Active trial users show concentrated activity around trial end dates:
- Days 1-20: ~100-150 users per day (steady trial start pattern)
- **Days 21-23: 23,038 users** (major spike - likely trial end clustering)
- Days 24-31: ~80-150 users per day (tail distribution)

### Trial Behavior by Customer Creation Cohort
Recent cohorts show evolving trial patterns:

| Customer Creation Month | Active Trials | % Paid Tier | % Yearly Plans | Avg Days in Trial |
|-------------------------|---------------|-------------|----------------|-------------------|
| 2025-06 | 2,809 | 64.19% | 6.19% | 13.7 |
| 2025-05 | 2,923 | 88.64% | 46.80% | 22.7 |
| 2025-04 | 2,775 | 92.29% | 46.45% | 21.9 |
| 2025-03 | 2,061 | 91.99% | 48.42% | 21.9 |
| 2025-02 | 753 | 83.53% | 48.61% | 22.2 |

**Key Cohort Insights:**
- **June 2025 customers:** Early in trial cycle (13.7 avg days), lower paid tier adoption (64%)
- **April-May 2025 customers:** High paid tier adoption (88-92%), strong yearly plan uptake (47-48%)
- **Consistent yearly plan preference:** ~47-49% across mature customer cohorts vs 6% for newest

### Trial Conversion Rates by Customer Cohort
Overall conversion from completed trials to any plan (free or paid):

| Customer Creation Month | Completed Trials | Overall Conversion | Paid Conversion | Free Conversion | Failure Rate |
|-------------------------|------------------|--------------------|-----------------|-----------------|--------------|
| 2025-06 | 38 | 89.47% | 76.32% | 13.16% | 10.53% |
| 2025-05 | 12 | 91.67% | 91.67% | 0.00% | 8.33% |
| 2025-04 | 5 | 100.00% | 80.00% | 20.00% | 0.00% |
| 2024-11 | 6 | 66.67% | 66.67% | 0.00% | 0.00% |
| 2022-01 | 966 | 94.72% | 6.31% | 88.41% | 5.38% |

**Conversion Insights:**
- **Strong overall conversion:** Recent cohorts show 89-100% conversion from trial to any plan
- **Paid conversion improvement:** Newer cohorts (2025) show dramatically higher paid conversion (76-92% vs 6% in 2022)
- **Quick decisions:** Recent cohorts convert very quickly (0.2-7.8 avg trial days)
- **Evolution pattern:** Clear shift from free-dominant (2022: 88% free) to paid-dominant (2025: 76-92% paid)

### Paid Upgrade Rates by Customer Cohort
Simplified view of paid plan adoption after trial completion:

| Customer Creation Month | Completed Trials | Paid Upgrades | **Paid Upgrade Rate** | Avg Upgrade Price |
|-------------------------|------------------|---------------|----------------------|-------------------|
| 2025-06 | 42 | 31 | **73.81%** | $305.74 |
| 2025-05 | 11 | 11 | **100.00%** | $142.82 |
| 2025-04 | 5 | 4 | **80.00%** | $134.50 |
| 2022-01 | 915 | 61 | **6.67%** | $192.05 |

**Paid Upgrade Insights:**
- **Dramatic improvement:** 2025 cohorts show 74-100% paid upgrade rates vs 7% in 2022
- **Premium pricing:** Recent cohorts pay higher average prices ($143-306 vs $192)
- **Quick adoption:** New customers convert to paid very fast (0.1-7.8 avg trial days)

## Data Sources

**Queries:**
- `2025-06-26_select_trial_duration_distribution.sql` - Overall trial day distribution
- `2025-06-26_select_trial_conversion_rate.sql` - Conversion rate analysis
- `2025-06-26_select_trial_duration_by_cohort.sql` - Trial patterns by creation month
- `2025-06-26_select_trial_cohort_summary.sql` - Monthly cohort summary metrics
- `2025-06-26_select_trial_conversion_by_cohort.sql` - Overall conversion rates by customer cohort
- `2025-06-26_select_paid_upgrade_rate_by_cohort.sql` - Simplified paid upgrade rates by cohort
- `2025-06-26_select_trial_upgrades_by_cohort.sql` - Upgrade analysis by customer cohort
- `2025-06-26_select_trial_upgrade_details.sql` - Detailed upgrade plan breakdown

**Tables:**
- `narrative.stripe.subscriptions` - Trial periods and status
- `narrative.stripe.subscription_items` - Subscription line items  
- `narrative.stripe.prices` - Pricing tier details
- **Product Filter:** `prod_HE50j3A0xeeU2J` (Narrative Select)

## Strategic Implications

1. **Strong Free Conversion:** 84.9% trial users convert to some form of subscription
2. **Paid Conversion Opportunity:** Only 8.68% convert to paid - significant revenue upside
3. **Annual vs Monthly:** Yearly plans show 23x higher paid conversion (50.98% vs 2.19%)
4. **Trial Clustering:** Days 21-23 represent critical decision points for users
5. **Cohort Evolution:** Newer cohorts (June 2025) start with lower paid tier adoption but show similar progression patterns

## Recommendations

1. **Focus on yearly plan promotion** during trial period given higher conversion rates
2. **Optimize day 21-23 user experience** when most decisions are made
3. **Investigate free-to-paid conversion paths** for the 76% who initially choose free plans