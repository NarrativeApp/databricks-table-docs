# Experiment: [Experiment Name]

**Status:** [Planning/Running/Completed/Paused]  
**Owner:** [Your Name]  
**Start Date:** [YYYY-MM-DD]  
**End Date:** [YYYY-MM-DD]  
**Duration:** [X weeks]

## Hypothesis

**We believe that** [change/feature]  
**Will result in** [expected outcome]  
**Because** [reasoning/user insight]

## Success Metrics

### Primary Metric
- **Metric:** [e.g., Select activation rate]
- **Current Baseline:** [X%]
- **Target:** [X%]
- **Minimum Detectable Effect:** [X%]

### Secondary Metrics
- [Metric 1]: [Description]
- [Metric 2]: [Description]
- [Metric 3]: [Description]

### Guardrail Metrics
- [Metric that shouldn't degrade]: [Threshold]

## Experiment Design

### Audience
- **Target Users:** [User segment]
- **Sample Size:** [N users per variant]
- **Traffic Allocation:** [% Control / % Variant]

### Variants
- **Control:** [Current experience]
- **Variant A:** [New experience]

### Randomization
- **Unit:** [User/Session/Account]
- **Assignment Method:** [How users are bucketed]

## Implementation

### Feature Flag
- **Flag Name:** [flag_name]
- **Rollout Strategy:** [Gradual/Immediate]

### Tracking
- **Events to Track:** [List of events]
- **Tables Affected:** [Databricks tables that will capture data]

## Analysis Plan

### Statistical Approach
- **Test Type:** [Two-sample t-test/Chi-square/etc.]
- **Significance Level:** [α = 0.05]
- **Power:** [β = 0.8]

### Query Strategy
- **Daily Monitoring:** [Key metrics to check]
- **Weekly Deep Dive:** [Comprehensive analysis]
- **Segmentation:** [User segments to analyze]

## Results

### Summary
[To be filled during/after experiment]

### Statistical Results
- **Primary Metric:** [Result with confidence interval]
- **Secondary Metrics:** [Results]
- **Guardrail Metrics:** [Results]

### Insights
[Key learnings from the experiment]

## Decision & Next Steps

### Decision
- [ ] Ship to 100%
- [ ] Ship with modifications
- [ ] Don't ship
- [ ] Run follow-up experiment

### Rationale
[Why this decision was made]

### Next Steps
1. [Action item]
2. [Action item]

## Appendix

- **Queries:** [Links to analysis queries]
- **Dashboards:** [Monitoring dashboards]
- **Related Experiments:** [Previous/related tests]