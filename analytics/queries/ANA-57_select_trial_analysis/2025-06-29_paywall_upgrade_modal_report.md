# Paywall to Upgrade Modal Conversion Analysis

**Date:** June 29, 2025  
**Analysis Period:** May 1 - June 29, 2025  
**Focus:** Users who saw paywall and subsequently opened upgrade modal

## Executive Summary

Analysis of **209 users who saw the paywall** shows **15.79% conversion rate to opening the upgrade modal**, with significant variation by product status. Users with **incomplete_expired** and **paused** statuses show the highest conversion rates (33.33%), while **active users** show lowest engagement with upgrade modal (12.50%).

## Key Findings

### Overall Paywall to Upgrade Modal Metrics
- **Total users who saw paywall:** 209 users  
- **Paywall to upgrade modal conversion:** 15.79% (33 users)
- **Users who had opened modal before paywall:** 48.80% (102 users)
- **No upgrade modal interaction:** 43.54% (91 users)
- **Average time to upgrade modal:** 175.8 hours (~7.3 days)
- **Total upgrade modal opens post-paywall:** 40 events

### Conversion by Product Status

| Product Status | Users | % of Total | Upgrade Modal Conversion | Pre-Modal Users | No Modal Interaction |
|----------------|-------|------------|-------------------------|-----------------|---------------------|
| **Canceled** | 108 | 51.7% | **8.33%** | 57.41% | 38.89% |
| **Null/Unknown** | 59 | 28.2% | **25.42%** | 62.71% | 30.51% |
| **Active** | 24 | 11.5% | **12.50%** | 12.50% | 79.17% |
| **Incomplete Expired** | 15 | 7.2% | **33.33%** | 0.00% | 66.67% |
| **Paused** | 3 | 1.4% | **33.33%** | 0.00% | 66.67% |
| **TOTAL** | **209** | **100%** | **15.79%** | **48.80%** | **43.54%** |

### Time to Upgrade Modal by Status

| Product Status | Avg Hours to Upgrade Modal | Avg Days |
|----------------|---------------------------|----------|
| **Active** | 0.0 hours | Same day |
| **Canceled** | 43.5 hours | ~1.8 days |
| **Null/Unknown** | 90.3 hours | ~3.8 days |
| **Paused** | 316.0 hours | ~13.2 days |
| **Incomplete Expired** | 429.0 hours | ~17.9 days |

## Key Insights

### 1. **Product Status Drives Conversion Behavior**
- **Incomplete Expired & Paused (33.33%)**: Highest upgrade modal conversion - users with failed/paused subscriptions most motivated
- **Null/Unknown (25.42%)**: Second highest conversion - likely new or untracked users exploring options
- **Active (12.50%)**: Moderate conversion despite having active subscriptions
- **Canceled (8.33%)**: Lowest conversion despite being largest group

### 2. **Pre-Paywall Modal Experience**
- **48.80% had opened upgrade modal before** seeing paywall
- **Canceled users most experienced**: 57.41% had prior modal experience
- **Incomplete/Paused users are new**: 0% prior modal experience

### 3. **Conversion Timing Patterns**
- **Active users convert immediately**: 0 hours (same session)
- **Canceled users quick decision**: 1.8 days average
- **Failed subscription users deliberate**: 13-18 days consideration

### 4. **Engagement Levels**
- **Incomplete expired highest engagement**: 9.4 paywall views per user
- **Active users lowest engagement**: 1.9 paywall views per user
- **Overall average**: 3.8 paywall views per user

## Strategic Implications

### 1. **Paywall Effectiveness Varies by User Type**
- **Most effective for incomplete/paused users** (33.33% conversion)
- **Moderately effective for unknown status** (25.42% conversion)  
- **Less effective for canceled users** despite high volume (8.33% conversion)
- **Limited effectiveness for active users** (12.50% conversion)

### 2. **User Journey Patterns**
- **Nearly half users** have prior upgrade modal experience before hitting paywall
- **Different consideration periods** based on subscription status
- **Immediate vs delayed decision making** varies significantly

### 3. **Conversion Quality Indicators**
- **Higher engagement** (more paywall views) correlates with conversion
- **Failed payment users most motivated** to resolve subscription issues
- **Active users convert quickly** when they do engage

### 4. **Opportunity Areas**
- **43.54% never interact with upgrade modal** - potential optimization target
- **Canceled users low conversion** despite high volume - messaging opportunity
- **Long consideration periods** for some segments suggest nurture campaigns

## Recommendations

### 1. **Status-Specific Paywall Strategy**
- **Incomplete/Paused users**: Emphasize resolving payment issues, highlight ease of reactivation
- **Null/Unknown users**: Focus on plan benefits and trial-to-paid messaging
- **Canceled users**: Improve win-back messaging given low 8.33% conversion despite high volume
- **Active users**: Investigate why they see paywall - may indicate targeting issues

### 2. **Timing and Follow-up**
- **Active users**: Optimize for immediate conversion (same-session experience)
- **Canceled users**: Follow up within 2-3 days of paywall view
- **Failed payment users**: Allow for 14-21 day consideration period with nurture sequence

### 3. **Experience Optimization**
- **Reduce "no interaction" rate** of 43.54% through improved paywall design
- **Leverage prior modal experience** - 48.80% have seen upgrade modal before
- **Test different paywall persistence** based on engagement levels

### 4. **Further Analysis Needed**
- **Track upgrade modal to actual subscription** conversion rates
- **Analyze why active users see paywall** - potential targeting bug
- **Segment "null/unknown" users** to understand their characteristics
- **Study long-term outcomes** for users who don't convert immediately

## Funnel Analysis Summary

```
Paywall Viewers: 209 users (100%)
    ↓
Never Open Upgrade Modal: 91 users (43.54%)
Had Opened Modal Before: 102 users (48.80%)
Open Modal After Paywall: 33 users (15.79%)
    ↓
[Next: Modal to Subscription Conversion - needs analysis]
```

## Data Sources

**Query:** `2025-06-29_paywall_upgrade_modal_conversion.sql`  
**Events Tracked:**
- `select_paywall_locked_no_active_plan` - Paywall views
- `select_post_upgrade_modal_opened` - Upgrade modal opens

**Key Metrics:**
- Paywall to upgrade modal conversion rate
- Time between paywall and modal opening  
- Product status at paywall time
- Prior upgrade modal experience

**Tables:** `select_events` with event-based conversion tracking