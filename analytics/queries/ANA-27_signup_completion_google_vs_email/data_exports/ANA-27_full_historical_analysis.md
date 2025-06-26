# ANA-27: CRITICAL HISTORICAL DISCOVERY - Sign-up Completion Trend Reversal

**Analysis Date**: 2025-06-25  
**Time Period**: Complete historical data from April 2023 to present (1,578 rolling 28-day windows)  
**🚨 MAJOR FINDING**: **The completion rate advantage has completely FLIPPED over time**

## Executive Summary

**Google used to perform BETTER than email, but now performs WORSE**

### The Great Reversal

| Period | Email Rate | Google Rate | Advantage |
|--------|------------|-------------|-----------|
| **Early 2023** (Apr) | ~74-75% | **~75-77%** | **Google +2-3%** |
| **Recent 2025** (May-Jun) | **~73%** | ~65% | **Email +8%** |

## Timeline of the Reversal

### Phase 1: Google Advantage (April-May 2023)
- **Google**: 75-77% completion rate (HIGHER than email)
- **Email**: 74-76% completion rate  
- Google was the better converting sign-up method

### Phase 2: The Flip (Gradual decline over 2023-2024)
- Google completion rates gradually declined
- Email rates remained relatively stable
- The advantage slowly shifted to email

### Phase 3: Email Dominance (2025)
- **Email**: ~73% (stable)
- **Google**: ~65% (8 percentage point disadvantage)
- The reversal is now complete and persistent

## What This Means

### 1. **NOT a Current Bug - It's a Degradation**
- This isn't a recent technical issue
- Google OAuth performance has **systematically degraded** over 1.5+ years
- Email sign-up has remained relatively stable

### 2. **Something Changed in the Google Flow**
- **Early 2023**: Google OAuth was working well (75-77% completion)
- **2025**: Google OAuth is underperforming (65% completion)
- **10+ percentage point decline** in Google performance

### 3. **Root Cause Investigation Needed**
Potential causes of Google's decline:
- **Google OAuth API changes** or policy updates
- **UI/UX changes** to the Google sign-up flow
- **Browser/security changes** affecting OAuth
- **User behavior shifts** toward more casual browsing
- **Technical debt** accumulation in the OAuth implementation

## Urgent Action Items

### Immediate Investigation (This Week)
1. **Review Google OAuth implementation changes** since early 2023
2. **Check Google API/policy updates** that might affect conversion
3. **A/B test reverting** to earlier Google OAuth flow if possible
4. **User research** - interview recent Google sign-up abandoners

### Data Analysis (Next Week)  
1. **Correlation analysis** - what else changed when Google rates declined?
2. **Cohort analysis** - do different Google user types have different completion rates?
3. **Post-signup metrics** - does the completion rate decline predict user quality decline?

### Strategic Decision (Next Month)
1. **Restore Google performance** to 2023 levels (target: 75%+ completion)
2. **Estimate business impact** - Google volume loss due to poor conversion
3. **Consider temporary measures** while fixing root cause

## Business Impact

### Volume Impact
- Google represents **55% of sign-up attempts** (~2,200 per 28-day window)
- If Google performed at 2023 levels (75% vs current 65%):
  - **+220 additional completions per month**
  - **+2,640 additional users per year**

### Competitive Risk
- Email sign-up is now the "better" experience
- Users may be learning to avoid Google OAuth
- Potential **competitive disadvantage** if Google OAuth is industry standard

## Next Steps

This analysis completely reframes the problem from "why does email perform better?" to **"what broke Google OAuth over the past 1.5 years?"**

**Immediate Priority**: Historical change analysis to identify what shifted between early 2023 (Google winning) and 2025 (Google losing).