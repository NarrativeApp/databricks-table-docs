# Paywall Conversion Analysis: New Trial Users Only

**Date:** June 29, 2025  
**Analysis Period:** May 1 - June 29, 2025  
**Focus:** Users who saw paywall AND started new trials after May 1, 2025

## Executive Summary

Analysis of **61 users who both saw the paywall and started new trials** shows significantly different behavior than the broader paywall audience. **New trial users have a 3.28% overall conversion rate**, with conversions heavily concentrated among users with **canceled subscription status** (6.25% conversion rate).

## Key Findings

### Overall New Trial Paywall Metrics
- **Total new trial users who saw paywall:** 61 users (vs 203 in full analysis)
- **Overall conversion rate:** 3.28% (vs 20.2% in full analysis)
- **All conversions were paid plans:** 100% paid conversion rate
- **Average time to conversion:** 26.0 hours (~1.1 days)
- **Average paywall views:** 1.7 views per user

### Conversion by Product Status (New Trial Users Only)

| Product Status | Users | % of Total | Conversion Rate | Paid Conversion | Pre-existing Subs |
|----------------|-------|------------|-----------------|-----------------|-------------------|
| **Canceled** | 32 | 52.5% | **6.25%** | 6.25% | 96.88% |
| **Active** | 23 | 37.7% | **0.00%** | 0.00% | 95.65% |
| **Null/Unknown** | 6 | 9.8% | **0.00%** | 0.00% | 100.00% |
| **TOTAL** | **61** | **100%** | **3.28%** | **3.28%** | **96.72%** |

## Key Insights

### 1. **New Trial Users vs All Paywall Users**
- **Much smaller cohort**: 61 new trial users vs 203 total paywall users
- **Lower conversion rate**: 3.28% vs 20.2% overall paywall conversion
- **Higher quality conversions**: 100% choose paid plans vs 77% overall
- **Faster decisions**: 26 hours vs 55-319 hours in broader analysis

### 2. **Product Status Distribution**
- **Canceled dominates**: 52.5% of new trial paywall users had canceled subscriptions
- **Active users significant**: 37.7% had active subscriptions but saw paywall anyway
- **Limited unknown status**: Only 9.8% had null/unknown status

### 3. **Conversion Patterns**
- **Only canceled users convert**: 100% of conversions came from canceled status users
- **Active users don't convert**: 0% conversion from users with active subscriptions
- **Premium focus**: All conversions chose paid plans (no free plan conversions)

### 4. **User Journey Characteristics**
- **Quick decisions**: 26-hour average conversion time (1.1 days)
- **Low engagement**: 1.7 average paywall views (vs 3.0 overall)
- **Nearly universal history**: 96.72% have pre-existing subscriptions

## Strategic Implications

### 1. **New Trial Users Are Different**
- New trial users who see paywall represent a **distinct, smaller segment** (30% of total paywall users)
- They have **much lower conversion rates** but **higher conversion quality**
- Most are **reactivating former customers** rather than completely new users

### 2. **Canceled Status = Conversion Opportunity**
- **Only canceled users convert** among new trial cohort
- **6.25% conversion rate** for canceled users in new trials
- Suggests paywall is effective **reactivation tool** for specific user segment

### 3. **Active Users Seeing Paywall = Issue**
- **37.7% of new trial paywall users** had active subscriptions
- **0% conversion rate** suggests these users shouldn't see paywall
- May indicate **technical or UX issue** with paywall targeting

### 4. **Quality Over Quantity**
- Lower volume but **100% paid conversions**
- **Fast decision making** (26 hours)
- **Clear intent** when users do convert

## Recommendations

### 1. **Paywall Targeting Optimization**
- **Investigate why active users see paywall** - may indicate targeting bug
- **Focus paywall on canceled users** since they're the only converters
- **Consider removing paywall** for active subscription holders

### 2. **Conversion Strategy**
- **Emphasize reactivation messaging** for canceled users
- **Highlight paid plan benefits** since 100% choose paid options
- **Optimize for quick decisions** given 26-hour conversion window

### 3. **New Trial Experience**
- **Separate new trial paywall strategy** from general paywall approach
- **Focus on win-back campaigns** for the 52.5% canceled user segment
- **Streamline conversion path** for the few who do convert

### 4. **Further Analysis**
- **Investigate active user paywall triggers** to identify potential issues
- **Track long-term retention** of the 2 users who converted
- **A/B test messaging** specific to canceled users in trials

## Comparison: New Trial vs All Paywall Users

| Metric | New Trial Users | All Paywall Users | Difference |
|--------|-----------------|-------------------|------------|
| **Total Users** | 61 | 203 | -70% smaller cohort |
| **Conversion Rate** | 3.28% | 20.2% | -84% lower conversion |
| **Paid % of Conversions** | 100% | 77% | +30% higher quality |
| **Avg Time to Convert** | 26 hours | 55-319 hours | Much faster decisions |
| **Avg Paywall Views** | 1.7 | 3.0 | Lower engagement |

## Data Sources

**Query:** `2025-06-29_paywall_new_trials_conversion.sql`  
**Filters:** 
- `s.trial_start > '2025-05-01'` - New trials only
- `c.created > '2025-05-01'` - Recent customers only  
- `topic = 'select_paywall_locked_no_active_plan'` - Paywall events
- `product_id = 'prod_HE50j3A0xeeU2J'` - Select product only

**Tables:** `select_events`, `narrative.core.users`, `narrative.stripe.customers`, `narrative.stripe.subscriptions`