# ANA-27: Sign-up Completion Analysis - Google vs Email

## Executive Summary

**CRITICAL DISCOVERY**: Google OAuth completion rates have **declined from 75-77% to 65%** over the past 1.5 years, while email sign-up rates remained stable at ~73%. Google used to outperform email but now underperforms by 8 percentage points.

## Key Files

### 📊 **Main Analysis Queries**
1. **`signup_completion_analysis.sql`** - Current snapshot comparison
2. **`signup_completion_analysis_rolling_28d.sql`** - Full historical trend (1,578 windows)
3. **`signup_method_proportions.sql`** - Daily proportions over time

### 📈 **Results & Data**
- **`full_historical_trends.csv`** - Complete 1,578-row dataset (Apr 2023 - Jun 2025)
- **`results_fixed.csv`** - Current period summary
- **`sample_signup_data.csv`** - Sample event data for validation

### 📋 **Analysis Reports**
- **`ANA-27_full_historical_analysis.md`** - **PRIMARY FINDINGS** (trend reversal)
- **`ANA-27_signup_analysis_report.md`** - Initial analysis report
- **`ANA-27_rolling_trends_analysis.md`** - Time series insights

## Key Findings for Manual Testing

### 🔍 **Focus Areas for Manual Testing**

1. **Google OAuth Flow Changes**
   - Compare current Google sign-up flow vs. early 2023
   - Test for any UI/UX friction points
   - Check for browser console errors or warnings

2. **Timeline of Changes**
   - **Early 2023**: Google 75-77%, Email 74-76% (Google winning)
   - **Current 2025**: Google 65%, Email 73% (Email winning)
   - **Gradual decline** over 1.5 years (not a sudden break)

3. **Speed vs Completion Paradox**
   - Google users complete in **0.8 minutes** (very fast)
   - Email users take **6-14 minutes** (much slower)
   - **Faster flow has worse completion rates** (suggests intent/commitment difference)

### 📊 **Current Numbers (Last 28 Days)**
- **Email**: 1,881 starts → 1,369 completions = **72.78%**
- **Google**: 2,136 starts → 1,385 completions = **64.84%**
- **Gap**: 7.94 percentage points in favor of email

### 💰 **Business Impact**
- **Annual opportunity**: +2,640 users if Google returned to 2023 performance
- **Google volume**: 55% of all sign-up attempts
- **Monthly impact**: +220 completions per month at 2023 rates

## Technical Notes

### 🔧 **Query Development Process**
- ✅ Fixed table naming (`web_events` vs `narrative.events.base`)
- ✅ Resolved data structure (use `session_id` not `transaction_id`)
- ✅ Added error handling (`TRY_DIVIDE` for divide-by-zero)
- ✅ Extended to full historical range (2023-2025)

### 📋 **Event Structure**
```sql
-- Sign-up start events
FROM web_events
WHERE topic = 'web_lead_sign_up_started'
  AND data:sign_up_method IN ('email', 'google')
  AND data:session_id IS NOT NULL

-- Completion events  
FROM web_events
WHERE topic = 'web_sign_up_succeeded'
```

### 🎯 **Join Logic**
- Join on `session_id` (not `transaction_id` - that field is null)
- 24-hour completion window
- Track completion times in minutes

## Next Steps for Investigation

1. **Manual Testing Focus**
   - Test Google OAuth flow for friction points
   - Compare user experience with email sign-up
   - Check for technical issues (console errors, timeouts)

2. **Historical Investigation**
   - Review code changes between 2023-2025
   - Check Google API/policy updates
   - Analyze what else changed when rates declined

3. **User Research**
   - Interview Google sign-up abandoners
   - A/B test flow improvements
   - Consider reverting to earlier implementation

---
**Analysis completed**: 2025-06-25  
**Total analysis time**: Full historical coverage (April 2023 - June 2025)  
**Data quality**: ✅ Validated against live Databricks warehouse