# ANA-27: Sign-up Completion Rate Analysis - Google vs Email

**Analysis Date**: 2025-06-25  
**Data Period**: Last 365 days  
**Hypothesis**: Users who sign up with email + password are less likely to complete sign up compared to Google OAuth users

## Key Findings

### Completion Rate Comparison

| Sign-up Method | Total Starts | Completions | Completion Rate | Avg Time to Complete |
|---------------|--------------|-------------|----------------|-------------------|
| **Email** | 25,494 | 19,707 | **77.30%** | 5.3 minutes |
| **Google** | 30,983 | 22,929 | **74.01%** | 3.0 minutes |

### Key Insights

1. **Hypothesis DISPROVEN**: Email sign-ups actually have a **higher completion rate** (77.30%) than Google sign-ups (74.01%)
   - Difference: +3.29 percentage points in favor of email
   
2. **Volume**: Google sign-ups are more popular, accounting for 54.9% of total sign-up attempts

3. **Speed**: Google users complete sign-up faster (3.0 vs 5.3 minutes average), but this speed doesn't translate to higher completion rates

4. **Recent Trend (Last 30 days)**: 
   - Email: 73.18% completion rate
   - Google: 65.50% completion rate
   - The gap has actually widened in recent weeks

## Possible Explanations

1. **Commitment Effect**: Users choosing email sign-up may be more committed to the platform
2. **Technical Issues**: Google OAuth flow might have more technical friction points
3. **User Intent**: Google users might be "browsing" more casually due to lower friction to start
4. **Account Conflicts**: Existing Google account issues may cause more abandonment

## Recommendations

1. **Investigate Google OAuth Flow**: Review for technical issues or UX friction that might be causing higher abandonment
2. **A/B Test Improvements**: Test modifications to the Google sign-up flow to match email completion rates
3. **Follow-up Analysis**: Examine post-signup engagement to see if higher completion rates translate to better long-term user value
4. **Qualitative Research**: Survey users who abandoned Google sign-up to understand root causes

## Data Quality Notes

- Analysis uses session_id to track user journeys (transaction_id was null in source data)
- 24-hour window used to match sign-up starts with completions
- Data includes all sign-up events from web_events table
- Both queries validated and returning consistent results

## Supporting Queries

1. **signup_completion_analysis.sql** - Main completion rate analysis
2. **signup_method_proportions.sql** - Daily trends and proportions
3. **Sample data files** - CSV exports for validation

**Analyst**: Claude Code  
**Review Status**: Ready for stakeholder review