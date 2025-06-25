# Sign-up and Authentication Related Tables

This document summarizes all tables related to user sign-ups, authentication methods, and account creation in the Databricks warehouse.

## Core User and Account Tables

### 1. `narrative.core.users`
**Purpose**: Main user table containing user profile and authentication information.

**Key Fields for Sign-up/Auth**:
- `id`: User UUID
- `email`: User email address
- `email_verified`: Boolean indicating email verification status
- `password`: Hashed password (for email sign-ups)
- `oauth_provider`: OAuth provider used (e.g., "google", null for email)
- `oauth_provider_user_id`: User ID from OAuth provider
- `inserted_at`: Account creation timestamp
- `account_id`: Associated account UUID

**Authentication Methods**:
- Email/Password: When `oauth_provider` is null and `password` is set
- Google OAuth: When `oauth_provider` = "google"

### 2. `narrative.core.accounts`
**Purpose**: Account/organization information.

**Key Fields**:
- `id`: Account UUID
- `inserted_at`: Account creation timestamp
- `status`: Account status (0 = active)
- `active`: Boolean account active status
- `stripe_cust_id`: Stripe customer ID (created during sign-up)

### 3. `narrative.core.user_permissions`
**Purpose**: Links users to accounts with permissions.

**Key Fields**:
- `user_id`: User UUID
- `account_id`: Account UUID
- `is_owner`: Boolean indicating if user created the account
- `inserted_at`: When user was added to account

## Sign-up Event Tables

### 4. `narrative.events.base` (filtered by topic)

#### Sign-up Start Events

**Event: `web_lead_sign_up_started`**
- **When**: User initiates sign-up process
- **Key Data**:
  - `sign_up_method`: "email" or "google"
  - `app`: Which product ("select", "publish", etc.)
  - `session_id`: Web session identifier
  - `transaction_id`: Unique identifier for the sign-up flow
  - No `user_id` yet (user not created)

#### Sign-up Completion Events

**Event: `web_sign_up_succeeded`**
- **When**: User successfully completes sign-up
- **Key Data**:
  - `sign_up_method`: "email" or "google"
  - `user_id`: Newly created user UUID
  - `transaction_id`: Links to the started event
  - `genre`: User's selected photography genre
  - `personal_sign_up_source`: How user found the platform
  - Operating system selection fields

**Event: `account_created`**
- **When**: Account entity is created for the user
- **Key Data**:
  - `user_id`: User UUID
  - `account_id`: Newly created account UUID
  - `resource.stripe_cust_id`: Stripe customer ID

#### Sign-up Failure Events

**Event: `web_sign_up_failed`**
- **When**: Sign-up process fails
- **Key Data**:
  - Error information
  - `transaction_id`: Links to the started event

## Affiliate Sign-up Tables

### 5. `narrative.core.affiliate_signups`
**Purpose**: Tracks sign-ups that came through affiliate links.

**Key Fields**:
- `account_id`: Account created through affiliate
- `affiliate_scheme_id`: Which affiliate brought the user
- `is_qualified`: Whether sign-up met affiliate requirements

### 6. `narrative.core.affiliate_clicks`
**Purpose**: Tracks clicks on affiliate links that may lead to sign-ups.

## Useful Queries for Sign-up Analysis

### 1. Count sign-ups by method (last 30 days)
```sql
SELECT 
  data.sign_up_method,
  COUNT(DISTINCT user_id) as sign_up_count
FROM narrative.events.base
WHERE topic = 'web_sign_up_succeeded'
  AND occurred_at >= CURRENT_DATE - INTERVAL 30 DAYS
GROUP BY data.sign_up_method
```

### 2. Sign-up funnel conversion
```sql
WITH funnel AS (
  SELECT
    transaction_id,
    MAX(CASE WHEN topic = 'web_lead_sign_up_started' THEN 1 ELSE 0 END) as started,
    MAX(CASE WHEN topic = 'web_sign_up_succeeded' THEN 1 ELSE 0 END) as completed,
    MAX(CASE WHEN topic = 'web_sign_up_failed' THEN 1 ELSE 0 END) as failed,
    ANY_VALUE(CASE WHEN topic = 'web_lead_sign_up_started' THEN data.sign_up_method END) as method
  FROM narrative.events.base
  WHERE topic IN ('web_lead_sign_up_started', 'web_sign_up_succeeded', 'web_sign_up_failed')
    AND occurred_at >= CURRENT_DATE - INTERVAL 30 DAYS
  GROUP BY transaction_id
)
SELECT
  method,
  COUNT(*) as total_started,
  SUM(completed) as total_completed,
  SUM(failed) as total_failed,
  ROUND(100.0 * SUM(completed) / COUNT(*), 2) as completion_rate
FROM funnel
WHERE started = 1
GROUP BY method
```

### 3. Users by authentication provider
```sql
SELECT
  COALESCE(oauth_provider, 'email') as auth_method,
  COUNT(*) as user_count
FROM narrative.core.users
GROUP BY oauth_provider
```

### 4. Recent sign-ups with full details
```sql
SELECT
  u.id as user_id,
  u.email,
  u.oauth_provider,
  u.inserted_at as user_created_at,
  a.id as account_id,
  a.stripe_cust_id,
  e.data.sign_up_method,
  e.data.genre,
  e.data.personal_sign_up_source
FROM narrative.core.users u
LEFT JOIN narrative.core.accounts a ON u.account_id = a.id
LEFT JOIN narrative.events.base e ON u.id = e.user_id AND e.topic = 'web_sign_up_succeeded'
WHERE u.inserted_at >= CURRENT_DATE - INTERVAL 7 DAYS
ORDER BY u.inserted_at DESC
```