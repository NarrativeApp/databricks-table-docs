# Manual Testing Guide for Google OAuth Sign-up Issue

## 🎯 **Testing Focus**

Based on the data analysis showing Google OAuth completion rates declined from **75-77% to 65%** over 1.5 years, focus your manual testing on these areas:

### 1. **Google OAuth Flow Comparison**
- **Test both flows side-by-side** (Google vs Email)
- **Time each step** - Google should be ~1 minute, Email ~6-14 minutes
- **Note any friction points** in the Google flow

### 2. **Technical Issues to Check**
```javascript
// Check browser console during Google OAuth
// Look for:
- JavaScript errors
- Network timeouts  
- OAuth API errors
- Third-party cookie issues
- CORS errors
```

### 3. **User Experience Friction Points**
- **Redirect loops** or unexpected redirects
- **Permission requests** that feel invasive
- **Loading states** that are confusing
- **Error messages** that aren't helpful
- **Mobile vs desktop** experience differences

### 4. **Historical Comparison**
Since Google used to perform BETTER than email in early 2023:
- **Compare with Wayback Machine** if possible
- **Check for recent UI changes** to Google sign-up
- **Review Google Developer Console** for policy changes

## 📊 **Current Baseline Numbers**
```
Recent 28-day window (May 28 - June 24, 2025):
- Email:  1,881 starts → 1,369 completions = 72.78%
- Google: 2,136 starts → 1,385 completions = 64.84%
- Gap: 7.94 percentage points

Historical comparison (April 2023):
- Email:  672 starts → 499 completions = 74.26%  
- Google: 525 starts → 394 completions = 75.05%
- Gap: +0.79 percentage points (Google was winning!)
```

## 🔍 **Specific Test Scenarios**

### Scenario A: Google OAuth Happy Path
1. Click "Sign up with Google"
2. Select Google account
3. Grant permissions
4. Complete profile setup
5. **TIME THIS PROCESS** (should be ~1 minute)

### Scenario B: Google OAuth Edge Cases
1. User with multiple Google accounts
2. User who denies permissions
3. User who starts but doesn't finish
4. User on different browsers/devices

### Scenario C: Email Sign-up Comparison
1. Complete email sign-up process
2. **TIME THIS PROCESS** (should be ~6-14 minutes)
3. Note where users might drop off

## 🚨 **Red Flags to Watch For**

### Technical Red Flags
- Console errors mentioning Google APIs
- OAuth redirect failures
- Session/cookie issues
- GDPR/privacy banner conflicts

### UX Red Flags  
- Too many permission requests
- Confusing post-OAuth steps
- Unclear error messages
- Mobile responsiveness issues

### Performance Red Flags
- Slow Google API responses
- JavaScript blocking
- Third-party script failures

## 📋 **Testing Checklist**

### Pre-Testing Setup
- [ ] Test in incognito/private mode
- [ ] Test on multiple browsers (Chrome, Safari, Firefox)
- [ ] Test on mobile and desktop
- [ ] Have developer tools open to monitor console

### During Testing
- [ ] Record screen/video of the flow
- [ ] Note exact timestamp of any issues
- [ ] Screenshot error messages
- [ ] Check network tab for failed requests

### Post-Testing Analysis
- [ ] Compare Google vs Email completion times
- [ ] Document specific friction points
- [ ] Identify potential technical fixes
- [ ] Prioritize issues by impact

## 💡 **Key Questions to Answer**

1. **What's different about Google OAuth now vs 2023?**
2. **Where specifically do users drop off in the Google flow?**
3. **Are there technical errors users encounter?**
4. **Is the Google flow asking for too much/too little?**
5. **How does mobile vs desktop experience differ?**

## 📞 **Next Steps After Testing**

1. **Document findings** with specific examples
2. **Prioritize fixes** by estimated impact
3. **A/B test improvements** if possible
4. **Consider rolling back** to earlier Google OAuth implementation
5. **Monitor metrics** after any changes

---

**Target Outcome**: Restore Google OAuth completion rates to 2023 levels (75%+) which would add **+2,640 users annually**.