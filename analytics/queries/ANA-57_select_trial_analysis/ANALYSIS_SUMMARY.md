# ANA-57 Select Trial Analysis - Complete Summary

**Linear Issue:** [ANA-57: Analyze Select Plan Trial Users and Conversion Rates](https://linear.app/narrative/issue/ANA-57)  
**Analysis Period:** May 1 - June 29, 2025  
**Completion Date:** June 29, 2025

## Analysis Components Completed

### 1. **Trial User Analysis**
- **Main Report:** `2025-06-26_ana-57_select_trial_analysis.md`
- **Key Finding:** 8.68% paid conversion rate from trial users, 84.90% overall conversion
- **Data Sources:** 9 SQL queries analyzing trial patterns, conversion rates, and ARPU

### 2. **Paywall Conversion Analysis**
- **Stripe-based conversion:** `2025-06-29_paywall_conversion_simplified.sql` + `2025-06-29_paywall_conversion_report.md`
- **Event-based conversion:** `2025-06-29_paywall_upgrade_modal_conversion.sql` + `2025-06-29_paywall_upgrade_modal_report.md`
- **New trial users only:** `2025-06-29_paywall_new_trials_conversion.sql` + `2025-06-29_paywall_new_trials_report.md`

### 3. **ARPU Analysis**
- **Comprehensive ARPU:** `2025-06-26_select_comprehensive_arpu.sql` 
- **Product-specific ARPU:** `2025-06-26_select_product_arpu_analysis.sql`
- **Trial-specific ARPU:** `2025-06-26_select_trial_arpu_proper.sql`

### 4. **User Model Table**
- **Location:** `/analytics/queries/models/select_users_summary_table.sql`
- **Purpose:** Reusable user summary table with subscription, trial, and engagement data
- **Key Fields:** user_id, subscription details, trial status, user categorization

## Key Findings Summary

### **Trial Conversion (Original Analysis)**
- **8.68% paid conversion** rate from trial to paid plans
- **84.90% overall conversion** including free plans  
- **Yearly plans 23x higher** paid conversion (50.98% vs 2.19%)

### **Paywall Performance (New Analysis)**
- **15.79% conversion** from paywall to upgrade modal opening
- **Former customers convert best:** Canceled (26.85%) and Incomplete Expired (46.67%)
- **Product status strongly predicts** conversion likelihood
- **Average 175.8 hours** (7.3 days) consideration time

### **ARPU Insights**
- **$25.75 current Select ARPU** (monthly-normalized, June 2025)
- **2,036 monthly revenue-generating customers** vs 18,618 total paid customers
- **Yearly plans normalized to monthly** for accurate comparison

## File Organization

### **Core Analysis Files**
```
2025-06-26_ana-57_select_trial_analysis.md     # Main comprehensive report
2025-06-29_paywall_upgrade_modal_report.md     # Primary paywall analysis
2025-06-29_paywall_conversion_report.md        # Secondary paywall analysis  
2025-06-29_paywall_new_trials_report.md        # New trial users only
```

### **SQL Queries by Category**

**Trial Analysis (9 queries):**
- `2025-06-26_select_trial_duration_distribution.sql`
- `2025-06-26_select_trial_conversion_rate.sql`
- `2025-06-26_select_trial_duration_by_cohort.sql`
- `2025-06-26_select_trial_cohort_summary.sql`
- `2025-06-26_select_trial_conversion_by_cohort.sql`
- `2025-06-26_select_paid_upgrade_rate_by_cohort.sql`
- `2025-06-26_select_trial_upgrades_by_cohort.sql`
- `2025-06-26_select_trial_upgrade_details.sql`

**Paywall Analysis (4 queries):**
- `2025-06-29_paywall_upgrade_modal_conversion.sql` ⭐ **Primary - Event-based conversion**
- `2025-06-29_paywall_conversion_simplified.sql` - Stripe-based conversion
- `2025-06-29_paywall_new_trials_conversion.sql` - New trial users only
- `2025-06-29_paywall_conversion_analysis.sql` - Initial exploration

**ARPU Analysis (4 queries):**
- `2025-06-26_select_comprehensive_arpu.sql` ⭐ **Primary - Full ARPU analysis**
- `2025-06-26_select_product_arpu_analysis.sql`
- `2025-06-26_select_trial_arpu_proper.sql`
- `2025-06-26_select_trial_arpu_analysis.sql`

### **Supporting Files**
- `README.md` - Original analysis structure
- `example-of-apru.sql` - ARPU calculation reference
- `Report so far.png` - Visual dashboard export

## Technical Learnings

### **Event Analysis Patterns**
- **Table:** `select_events` (not `narrative.events.base`)
- **Join Path:** `select_events → core.users → stripe.customers → stripe.subscriptions`
- **Product Status:** Extract using `data:product_status::string`
- **Event-based conversion** more accurate than Stripe subscription timing

### **Trial Status Logic**
```sql
CASE 
    WHEN s.trial_start IS NULL THEN 'No Trial'
    WHEN s.status = 'trialing' THEN 'Active Trial'
    WHEN s.trial_end IS NOT NULL AND s.trial_end < CURRENT_DATE THEN 'Trial Finished'
    WHEN s.trial_start IS NOT NULL AND s.trial_end IS NULL AND s.trial_start + INTERVAL '30 days' < CURRENT_DATE THEN 'Trial Finished'
    ELSE 'Trial Active'
END
```

### **ARPU Normalization**
- **Yearly to Monthly:** `(amount / 100.0) / 12` for yearly plans
- **Invoice-based calculation** more accurate than subscription amounts
- **Product filtering:** `prod_HE50j3A0xeeU2J` for Select product

## Strategic Recommendations

1. **Optimize paywall for former customers** (canceled/expired users show 27-47% conversion)
2. **Promote yearly plans** during trials (23x higher paid conversion)
3. **Focus on days 21-23** of trial experience (critical decision period)
4. **Leverage event-based conversion tracking** for real-time optimization
5. **Use user summary table** for ongoing cohort analysis and segmentation

## Deliverables Completed

✅ **Linear Issue Analysis:** Complete trial user and conversion rate analysis  
✅ **Paywall Performance:** Multi-faceted conversion analysis with product status insights  
✅ **ARPU Calculation:** Comprehensive revenue analysis with normalization  
✅ **Data Model:** Reusable user summary table for future analysis  
✅ **Documentation:** Technical patterns and learnings captured in CLAUDE.md  
✅ **Repository:** All queries organized and tested, temporary files cleaned up