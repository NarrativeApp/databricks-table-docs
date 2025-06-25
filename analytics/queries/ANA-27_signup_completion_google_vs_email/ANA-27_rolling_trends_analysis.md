# ANA-27: Rolling 28-Day Sign-up Completion Trends

**Analysis Date**: 2025-06-25  
**Time Period**: Rolling 28-day windows from February 2024 to present  
**New Finding**: Email sign-up advantage has been **consistent over time**

## Key Trend Insights from Rolling 28-Day Analysis

### 1. **Consistent Email Advantage**
- Email completion rates consistently range from **72-75%**
- Google completion rates consistently range from **64-69%**
- Email maintains a **6-8 percentage point advantage** across all time periods

### 2. **Recent Performance (Most Recent 28-Day Window)**
- **Email**: 72.78% completion rate (1,369 completions from 1,881 starts)
- **Google**: 64.84% completion rate (1,385 completions from 2,136 starts)
- **Gap**: 7.94 percentage points in favor of email

### 3. **Temporal Stability**
Looking at recent windows (May-June 2025):
- Email rates: 72.78% → 72.92% → 73.13% → 73.21% (stable ~73%)
- Google rates: 64.84% → 64.69% → 64.94% → 65.48% (stable ~65%)
- **No convergence trend** - the gap remains persistent

### 4. **Volume Trends**
- Google continues to have **higher volume** (~2,100-2,300 starts per 28-day window)
- Email has **lower but stable volume** (~1,900-2,000 starts per 28-day window)
- Google represents roughly **53-55%** of total sign-up attempts

### 5. **Speed vs Completion Trade-off**
- Email users take **6-14 minutes** on average to complete (higher variability)
- Google users take **0.5-3 minutes** on average to complete (very fast, consistent)
- **Speed doesn't correlate with success** - faster Google flow has lower completion rates

## Strategic Implications

### 1. **This is NOT a Recent Problem**
- The Google completion rate gap has persisted for **over a year**
- This suggests a **systematic issue** rather than a temporary technical problem

### 2. **Process vs. Intent**
- The speed difference (0.8 min vs 6-14 min) suggests different user intents
- Google users may be "browsing" while email users are more committed
- Fast OAuth may **lower the barrier too much**, attracting less committed users

### 3. **Opportunity Size**
- If Google completion rates matched email rates (73% vs 65%), we'd gain:
  - **~8% more completions** = ~170 additional users per 28-day window
  - **Annualized impact**: ~2,200 additional sign-ups per year

## Recommendations

### Immediate Actions
1. **Deep-dive into Google OAuth UX** - map the specific drop-off points
2. **User research** - interview Google sign-up abandoners to understand why
3. **A/B test Google flow modifications** to increase commitment/friction slightly

### Strategic Considerations
1. **Quality vs. Quantity** - Determine if email users have better long-term value
2. **Intentional friction** - Consider adding small commitment steps to Google flow
3. **Segmented onboarding** - Different post-signup flows based on sign-up method

## Technical Notes
- Analysis uses `window_28_days` table for proper rolling window calculations
- Session-based tracking ensures accurate funnel measurement
- Minimum sample size of 10 starts per window for statistical validity

**Next Steps**: Validate these findings with post-signup engagement metrics to determine if completion rate differences translate to long-term user value differences.