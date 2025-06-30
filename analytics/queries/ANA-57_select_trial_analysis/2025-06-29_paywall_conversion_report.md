# Paywall Conversion Analysis Report

**Date:** June 29, 2025  
**Analysis Period:** May 1 - June 29, 2025  
**Focus:** Users who saw `select_paywall_locked_no_active_plan` and their conversion behavior

## Executive Summary

Analysis of 203 unique users who encountered the new Select paywall shows **conversion rates varying dramatically by product status**, with users having **canceled subscriptions showing the highest conversion rate at 26.85%**, while users with active subscriptions showed 0% conversion.

## Key Findings

### Overall Paywall Metrics
- **Total paywall events:** 635
- **Unique users who saw paywall:** 203 users
- **Average paywall views per user:** 3.1 views
- **Time period:** May 26 - June 29, 2025

### Conversion by Product Status

| Product Status | Users | Conversion Rate | Paid Conversion | Free Conversion | Pre-existing Subs |
|----------------|-------|-----------------|-----------------|-----------------|-------------------|
| **Canceled** | 108 (53.2%) | **26.85%** | 24.07% | 2.78% | 99.07% |
| **Null/Unknown** | 53 (26.1%) | **9.43%** | 5.66% | 3.77% | 92.45% |
| **Incomplete Expired** | 15 (7.4%) | **46.67%** | 40.00% | 6.67% | 100.00% |
| **Active** | 24 (11.8%) | **0.00%** | 0.00% | 0.00% | 95.83% |
| **Paused** | 3 (1.5%) | **33.33%** | 33.33% | 0.00% | 100.00% |

### Key Insights by Product Status

#### 1. Canceled Status (53.2% of paywall users)
- **Highest volume:** 108 users, indicating many former customers encounter paywall
- **Strong conversion:** 26.85% convert to new subscriptions
- **Paid preference:** 89.66% of conversions choose paid plans
- **Quick decision:** 55.1 hours average time to conversion
- **Nearly universal history:** 99.07% have pre-existing subscriptions

#### 2. Incomplete Expired Status (7.4% of paywall users)  
- **Highest conversion rate:** 46.67% convert after seeing paywall
- **Premium focus:** 85.71% of conversions are paid plans
- **High engagement:** 7.5 average paywall views per user
- **Longer consideration:** 166.9 hours average time to conversion
- **All have history:** 100% have pre-existing subscriptions

#### 3. Null/Unknown Status (26.1% of paywall users)
- **Lower conversion:** 9.43% conversion rate
- **Mixed outcomes:** 60% of conversions choose paid plans
- **High engagement:** 4.0 average paywall views per user
- **Longest consideration:** 319.3 hours average time to conversion
- **Most have history:** 92.45% have pre-existing subscriptions

#### 4. Active Status (11.8% of paywall users)
- **No conversion:** 0% conversion rate to new plans
- **Low engagement:** 1.8 average paywall views per user
- **Existing subscribers:** 95.83% already have subscriptions
- **Expected behavior:** Active users shouldn't need to convert

#### 5. Paused Status (1.5% of paywall users)
- **High conversion:** 33.33% conversion rate  
- **All paid:** 100% of conversions choose paid plans
- **Immediate decision:** 0.0 hours average time to conversion
- **All have history:** 100% have pre-existing subscriptions

## Strategic Implications

### 1. **Former Customer Re-engagement**
- **Canceled** and **Incomplete Expired** users show strong conversion potential
- These segments represent **60.6% of paywall users** and **highest conversion rates**
- Indicates paywall is effective at re-engaging lapsed customers

### 2. **Conversion Quality**
- **High paid plan preference:** 85-100% of conversions from expired/canceled users choose paid plans
- **Quick decisions:** Canceled users convert in ~2.3 days on average
- **Deliberate choices:** Incomplete expired users take ~7 days to decide

### 3. **Paywall Effectiveness**
- **Differentiated impact:** Paywall works differently based on user's subscription history
- **Reactivation tool:** Most effective for users with lapsed/problematic subscriptions
- **Limited impact on active:** As expected, active users don't convert to new plans

### 4. **User Journey Insights**
- **Multiple touchpoints:** Users view paywall 1.8-7.5 times before converting
- **Consideration period:** 0-319 hours between paywall and conversion
- **Status matters:** Product status strongly predicts conversion likelihood

## Recommendations

1. **Target Former Customers:** Focus paywall optimization on canceled/expired users who show highest conversion rates

2. **Paid Plan Messaging:** Emphasize paid plan benefits since 60-100% of converters choose paid options

3. **Re-engagement Strategy:** Use paywall as reactivation tool for lapsed subscribers rather than new customer acquisition

4. **Conversion Timing:** Expect 2-13 day consideration periods; design follow-up campaigns accordingly

5. **Status-Specific Messaging:** Customize paywall content based on user's current product status

## Data Sources

**Queries:**
- `2025-06-29_paywall_conversion_simplified.sql` - Main conversion analysis
- **Tables:** `select_events`, `narrative.core.users`, `narrative.stripe.customers`, `narrative.stripe.subscriptions`
- **Product Filter:** `prod_HE50j3A0xeeU2J` (Narrative Select)
- **Event Filter:** `select_paywall_locked_no_active_plan`

## Next Steps

1. **Track long-term retention** of paywall-converted users vs other acquisition channels
2. **A/B test paywall messaging** by product status segments  
3. **Analyze revenue impact** of paywall conversions vs acquisition costs
4. **Monitor paywall effectiveness** as user base and product evolve