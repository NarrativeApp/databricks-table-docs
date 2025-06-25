# Stripe Billing Tables

This file contains documentation for 71 Databricks warehouse tables from the narrative.stripe schema.
These tables contain billing, payment, subscription, and financial transaction data from Stripe.

---

## narrative.stripe.accounts

### Schema

| Column                                          | Type              | Nullable |
| ----------------------------------------------- | ----------------- | -------- |
| batch_timestamp                                 | `TimestampType()` | True     |
| business_name                                   | `StringType()`    | True     |
| business_profile_mcc                            | `StringType()`    | True     |
| business_url                                    | `StringType()`    | True     |
| capabilities_acss_debit_payments                | `StringType()`    | True     |
| capabilities_affirm_payments                    | `StringType()`    | True     |
| capabilities_afterpay_clearpay_payments         | `StringType()`    | True     |
| capabilities_amazon_pay_payments                | `StringType()`    | True     |
| capabilities_au_becs_debit_payments             | `StringType()`    | True     |
| capabilities_bacs_debit_payments                | `StringType()`    | True     |
| capabilities_bancontact_payments                | `StringType()`    | True     |
| capabilities_bank_transfer_payments             | `StringType()`    | True     |
| capabilities_blik_payments                      | `StringType()`    | True     |
| capabilities_boleto_payments                    | `StringType()`    | True     |
| capabilities_card_issuing                       | `StringType()`    | True     |
| capabilities_card_payments                      | `StringType()`    | True     |
| capabilities_cartes_bancaires_payments          | `StringType()`    | True     |
| capabilities_cashapp_payments                   | `StringType()`    | True     |
| capabilities_eps_payments                       | `StringType()`    | True     |
| capabilities_fpx_payments                       | `StringType()`    | True     |
| capabilities_giropay_payments                   | `StringType()`    | True     |
| capabilities_grabpay_payments                   | `StringType()`    | True     |
| capabilities_ideal_payments                     | `StringType()`    | True     |
| capabilities_india_international_payments       | `StringType()`    | True     |
| capabilities_jcb_payments                       | `StringType()`    | True     |
| capabilities_klarna_payments                    | `StringType()`    | True     |
| capabilities_konbini_payments                   | `StringType()`    | True     |
| capabilities_legacy_payments                    | `StringType()`    | True     |
| capabilities_link_payments                      | `StringType()`    | True     |
| capabilities_mobilepay_payments                 | `StringType()`    | True     |
| capabilities_multibanco_payments                | `StringType()`    | True     |
| capabilities_oxxo_payments                      | `StringType()`    | True     |
| capabilities_p24_payments                       | `StringType()`    | True     |
| capabilities_paynow_payments                    | `StringType()`    | True     |
| capabilities_promptpay_payments                 | `StringType()`    | True     |
| capabilities_revolut_pay_payments               | `StringType()`    | True     |
| capabilities_sepa_debit_payments                | `StringType()`    | True     |
| capabilities_sofort_payments                    | `StringType()`    | True     |
| capabilities_swish_payments                     | `StringType()`    | True     |
| capabilities_tax_reporting_us_1099_k            | `StringType()`    | True     |
| capabilities_tax_reporting_us_1099_misc         | `StringType()`    | True     |
| capabilities_transfers                          | `StringType()`    | True     |
| capabilities_twint_payments                     | `StringType()`    | True     |
| capabilities_us_bank_account_ach_payments       | `StringType()`    | True     |
| capabilities_zip_payments                       | `StringType()`    | True     |
| charges_enabled                                 | `BooleanType()`   | True     |
| controller_fees_payer                           | `StringType()`    | True     |
| controller_losses_payments                      | `StringType()`    | True     |
| controller_requirement_collection               | `StringType()`    | True     |
| controller_stripe_dashboard_type                | `StringType()`    | True     |
| country                                         | `StringType()`    | True     |
| created                                         | `TimestampType()` | True     |
| debit_negative_balances                         | `BooleanType()`   | True     |
| decline_charge_on_avs_failure                   | `BooleanType()`   | True     |
| decline_charge_on_cvc_failure                   | `BooleanType()`   | True     |
| default_currency                                | `StringType()`    | True     |
| details_submitted                               | `BooleanType()`   | True     |
| display_name                                    | `StringType()`    | True     |
| email                                           | `StringType()`    | True     |
| future_requirements_current_deadline            | `TimestampType()` | True     |
| future_requirements_currently_due               | `StringType()`    | True     |
| future_requirements_eventually_due              | `StringType()`    | True     |
| future_requirements_past_due                    | `StringType()`    | True     |
| id                                              | `StringType()`    | True     |
| legal_entity_address_city                       | `StringType()`    | True     |
| legal_entity_address_country                    | `StringType()`    | True     |
| legal_entity_address_kana_city                  | `StringType()`    | True     |
| legal_entity_address_kana_country               | `StringType()`    | True     |
| legal_entity_address_kana_line1                 | `StringType()`    | True     |
| legal_entity_address_kana_line2                 | `StringType()`    | True     |
| legal_entity_address_kana_postal_code           | `StringType()`    | True     |
| legal_entity_address_kana_state                 | `StringType()`    | True     |
| legal_entity_address_kanji_city                 | `StringType()`    | True     |
| legal_entity_address_kanji_country              | `StringType()`    | True     |
| legal_entity_address_kanji_line1                | `StringType()`    | True     |
| legal_entity_address_kanji_line2                | `StringType()`    | True     |
| legal_entity_address_kanji_postal_code          | `StringType()`    | True     |
| legal_entity_address_kanji_state                | `StringType()`    | True     |
| legal_entity_address_line1                      | `StringType()`    | True     |
| legal_entity_address_line2                      | `StringType()`    | True     |
| legal_entity_address_postal_code                | `StringType()`    | True     |
| legal_entity_address_state                      | `StringType()`    | True     |
| legal_entity_business_name                      | `StringType()`    | True     |
| legal_entity_business_name_kana                 | `StringType()`    | True     |
| legal_entity_business_name_kanji                | `StringType()`    | True     |
| legal_entity_business_tax_id_provided           | `BooleanType()`   | True     |
| legal_entity_business_vat_id_provided           | `BooleanType()`   | True     |
| legal_entity_dob_day                            | `LongType()`      | True     |
| legal_entity_dob_month                          | `LongType()`      | True     |
| legal_entity_dob_year                           | `LongType()`      | True     |
| legal_entity_first_name                         | `StringType()`    | True     |
| legal_entity_first_name_kana                    | `StringType()`    | True     |
| legal_entity_first_name_kanji                   | `StringType()`    | True     |
| legal_entity_gender                             | `StringType()`    | True     |
| legal_entity_last_name                          | `StringType()`    | True     |
| legal_entity_last_name_kana                     | `StringType()`    | True     |
| legal_entity_last_name_kanji                    | `StringType()`    | True     |
| legal_entity_maiden_name                        | `StringType()`    | True     |
| legal_entity_personal_address_city              | `StringType()`    | True     |
| legal_entity_personal_address_country           | `StringType()`    | True     |
| legal_entity_personal_address_kana_city         | `StringType()`    | True     |
| legal_entity_personal_address_kana_country      | `StringType()`    | True     |
| legal_entity_personal_address_kana_line1        | `StringType()`    | True     |
| legal_entity_personal_address_kana_line2        | `StringType()`    | True     |
| legal_entity_personal_address_kana_postal_code  | `StringType()`    | True     |
| legal_entity_personal_address_kana_state        | `StringType()`    | True     |
| legal_entity_personal_address_kanji_city        | `StringType()`    | True     |
| legal_entity_personal_address_kanji_country     | `StringType()`    | True     |
| legal_entity_personal_address_kanji_line1       | `StringType()`    | True     |
| legal_entity_personal_address_kanji_line2       | `StringType()`    | True     |
| legal_entity_personal_address_kanji_postal_code | `StringType()`    | True     |
| legal_entity_personal_address_kanji_state       | `StringType()`    | True     |
| legal_entity_personal_address_line1             | `StringType()`    | True     |
| legal_entity_personal_address_line2             | `StringType()`    | True     |
| legal_entity_personal_address_postal_code       | `StringType()`    | True     |
| legal_entity_personal_address_state             | `StringType()`    | True     |
| legal_entity_personal_id_number_provided        | `BooleanType()`   | True     |
| legal_entity_phone_number                       | `StringType()`    | True     |
| legal_entity_ssn_last_4_provided                | `BooleanType()`   | True     |
| legal_entity_tax_id_registrar                   | `StringType()`    | True     |
| legal_entity_type                               | `StringType()`    | True     |
| legal_entity_verification_details               | `StringType()`    | True     |
| legal_entity_verification_details_code          | `StringType()`    | True     |
| legal_entity_verification_document_id           | `StringType()`    | True     |
| legal_entity_verification_status                | `StringType()`    | True     |
| merchant_id                                     | `StringType()`    | True     |
| payout_schedule_delay_days                      | `LongType()`      | True     |
| payout_schedule_interval                        | `StringType()`    | True     |
| payout_schedule_monthly_anchor                  | `LongType()`      | True     |
| payout_schedule_weekly_anchor                   | `StringType()`    | True     |
| payout_statement_descriptor                     | `StringType()`    | True     |
| payouts_enabled                                 | `BooleanType()`   | True     |
| product_description                             | `StringType()`    | True     |
| requirements_current_deadline                   | `TimestampType()` | True     |
| requirements_currently_due                      | `StringType()`    | True     |
| requirements_eventually_due                     | `StringType()`    | True     |
| requirements_past_due                           | `StringType()`    | True     |
| statement_descriptor                            | `StringType()`    | True     |
| support_email                                   | `StringType()`    | True     |
| support_phone                                   | `StringType()`    | True     |
| timezone                                        | `StringType()`    | True     |
| tos_acceptance_date                             | `TimestampType()` | True     |
| tos_acceptance_ip                               | `StringType()`    | True     |
| tos_acceptance_user_agent                       | `StringType()`    | True     |
| type                                            | `StringType()`    | True     |
| verification_disabled_reason                    | `StringType()`    | True     |
| verification_due_by                             | `TimestampType()` | True     |
| verification_fields_needed                      | `StringType()`    | True     |
| hour                                            | `StringType()`    | True     |
| table_name                                      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-25 00:00:00",
  "business_name": "Narrative",
  "business_profile_mcc": "5734",
  "business_url": "https://narrative.so",
  "capabilities_acss_debit_payments": null,
  "capabilities_affirm_payments": null,
  "capabilities_afterpay_clearpay_payments": "active",
  "capabilities_amazon_pay_payments": null,
  "capabilities_au_becs_debit_payments": null,
  "capabilities_bacs_debit_payments": null,
  "capabilities_bancontact_payments": "active",
  "capabilities_bank_transfer_payments": null,
  "capabilities_blik_payments": null,
  "capabilities_boleto_payments": null,
  "capabilities_card_issuing": null,
  "capabilities_card_payments": "active",
  "capabilities_cartes_bancaires_payments": null,
  "capabilities_cashapp_payments": null,
  "capabilities_eps_payments": "active",
  "capabilities_fpx_payments": null,
  "capabilities_giropay_payments": "active",
  "capabilities_grabpay_payments": null,
  "capabilities_ideal_payments": "active",
  "capabilities_india_international_payments": null,
  "capabilities_jcb_payments": null,
  "capabilities_klarna_payments": "active",
  "capabilities_konbini_payments": null,
  "capabilities_legacy_payments": null,
  "capabilities_link_payments": "active",
  "capabilities_mobilepay_payments": null,
  "capabilities_multibanco_payments": null,
  "capabilities_oxxo_payments": null,
  "capabilities_p24_payments": "active",
  "capabilities_paynow_payments": null,
  "capabilities_promptpay_payments": null,
  "capabilities_revolut_pay_payments": null,
  "capabilities_sepa_debit_payments": "active",
  "capabilities_sofort_payments": "active",
  "capabilities_swish_payments": null,
  "capabilities_tax_reporting_us_1099_k": null,
  "capabilities_tax_reporting_us_1099_misc": null,
  "capabilities_transfers": "active",
  "capabilities_twint_payments": null,
  "capabilities_us_bank_account_ach_payments": null,
  "capabilities_zip_payments": null,
  "charges_enabled": true,
  "controller_fees_payer": null,
  "controller_losses_payments": null,
  "controller_requirement_collection": null,
  "controller_stripe_dashboard_type": null,
  "country": "NZ",
  "created": "NaT",
  "debit_negative_balances": null,
  "decline_charge_on_avs_failure": null,
  "decline_charge_on_cvc_failure": null,
  "default_currency": "nzd",
  "details_submitted": true,
  "display_name": "Narrative",
  "email": "james@narrative.so",
  "future_requirements_current_deadline": "NaT",
  "future_requirements_currently_due": null,
  "future_requirements_eventually_due": null,
  "future_requirements_past_due": null,
  "id": "acct_1BGFUcGyxyMEWHoz",
  "legal_entity_address_city": null,
  "legal_entity_address_country": null,
  "legal_entity_address_kana_city": null,
  "legal_entity_address_kana_country": null,
  "legal_entity_address_kana_line1": null,
  "legal_entity_address_kana_line2": null,
  "legal_entity_address_kana_postal_code": null,
  "legal_entity_address_kana_state": null,
  "legal_entity_address_kanji_city": null,
  "legal_entity_address_kanji_country": null,
  "legal_entity_address_kanji_line1": null,
  "legal_entity_address_kanji_line2": null,
  "legal_entity_address_kanji_postal_code": null,
  "legal_entity_address_kanji_state": null,
  "legal_entity_address_line1": null,
  "legal_entity_address_line2": null,
  "legal_entity_address_postal_code": null,
  "legal_entity_address_state": null,
  "legal_entity_business_name": null,
  "legal_entity_business_name_kana": null,
  "legal_entity_business_name_kanji": null,
  "legal_entity_business_tax_id_provided": null,
  "legal_entity_business_vat_id_provided": null,
  "legal_entity_dob_day": NaN,
  "legal_entity_dob_month": NaN,
  "legal_entity_dob_year": NaN,
  "legal_entity_first_name": null,
  "legal_entity_first_name_kana": null,
  "legal_entity_first_name_kanji": null,
  "legal_entity_gender": null,
  "legal_entity_last_name": null,
  "legal_entity_last_name_kana": null,
  "legal_entity_last_name_kanji": null,
  "legal_entity_maiden_name": null,
  "legal_entity_personal_address_city": null,
  "legal_entity_personal_address_country": null,
  "legal_entity_personal_address_kana_city": null,
  "legal_entity_personal_address_kana_country": null,
  "legal_entity_personal_address_kana_line1": null,
  "legal_entity_personal_address_kana_line2": null,
  "legal_entity_personal_address_kana_postal_code": null,
  "legal_entity_personal_address_kana_state": null,
  "legal_entity_personal_address_kanji_city": null,
  "legal_entity_personal_address_kanji_country": null,
  "legal_entity_personal_address_kanji_line1": null,
  "legal_entity_personal_address_kanji_line2": null,
  "legal_entity_personal_address_kanji_postal_code": null,
  "legal_entity_personal_address_kanji_state": null,
  "legal_entity_personal_address_line1": null,
  "legal_entity_personal_address_line2": null,
  "legal_entity_personal_address_postal_code": null,
  "legal_entity_personal_address_state": null,
  "legal_entity_personal_id_number_provided": null,
  "legal_entity_phone_number": null,
  "legal_entity_ssn_last_4_provided": null,
  "legal_entity_tax_id_registrar": null,
  "legal_entity_type": null,
  "legal_entity_verification_details": null,
  "legal_entity_verification_details_code": null,
  "legal_entity_verification_document_id": null,
  "legal_entity_verification_status": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "payout_schedule_delay_days": NaN,
  "payout_schedule_interval": null,
  "payout_schedule_monthly_anchor": NaN,
  "payout_schedule_weekly_anchor": null,
  "payout_statement_descriptor": null,
  "payouts_enabled": true,
  "product_description": null,
  "requirements_current_deadline": "NaT",
  "requirements_currently_due": null,
  "requirements_eventually_due": null,
  "requirements_past_due": null,
  "statement_descriptor": "NARRATIVE",
  "support_email": "support@narrative.so",
  "support_phone": "+640412345678",
  "timezone": "Pacific/Auckland",
  "tos_acceptance_date": "NaT",
  "tos_acceptance_ip": null,
  "tos_acceptance_user_agent": null,
  "type": "standard",
  "verification_disabled_reason": null,
  "verification_due_by": "NaT",
  "verification_fields_needed": null,
  "hour": "2025062500",
  "table_name": "accounts"
}
```

---

## narrative.stripe.aggregate_optimization_detail

### Schema

| Column              | Type           | Nullable |
| ------------------- | -------------- | -------- |
| card_updates        | `LongType()`   | True     |
| day                 | `DoubleType()` | True     |
| dynamic_validations | `LongType()`   | True     |
| merchant_id         | `StringType()` | True     |
| hour                | `StringType()` | True     |
| table_name          | `StringType()` | True     |

### Sample Row

```json
{
  "card_updates": 2,
  "day": 1588896000.0,
  "dynamic_validations": 0,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025031700",
  "table_name": "aggregate_optimization_detail"
}
```

---

## narrative.stripe.aggregate_optimization_details

### Schema

| Column              | Type           | Nullable |
| ------------------- | -------------- | -------- |
| card_updates        | `LongType()`   | True     |
| day                 | `DoubleType()` | True     |
| dynamic_validations | `LongType()`   | True     |
| merchant_id         | `StringType()` | True     |
| hour                | `StringType()` | True     |
| table_name          | `StringType()` | True     |

### Sample Row

```json
{
  "card_updates": 2,
  "day": 1588896000.0,
  "dynamic_validations": 0,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025031700",
  "table_name": "aggregate_optimization_details"
}
```

---

## narrative.stripe.bal

### Schema

| Column                | Type              | Nullable |
| --------------------- | ----------------- | -------- |
| amount                | `LongType()`      | True     |
| automatic_transfer_id | `StringType()`    | True     |
| available_on          | `TimestampType()` | True     |
| balance_type          | `StringType()`    | True     |
| batch_timestamp       | `TimestampType()` | True     |
| created               | `TimestampType()` | True     |
| currency              | `StringType()`    | True     |
| description           | `StringType()`    | True     |
| fee                   | `LongType()`      | True     |
| id                    | `StringType()`    | True     |
| merchant_id           | `StringType()`    | True     |
| net                   | `LongType()`      | True     |
| reporting_category    | `StringType()`    | True     |
| source_id             | `StringType()`    | True     |
| status                | `StringType()`    | True     |
| type                  | `StringType()`    | True     |
| hour                  | `StringType()`    | True     |
| table_name            | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 2731,
  "automatic_transfer_id": "po_1C9TXRGyxyMEWHoznSaoE7v7",
  "available_on": "2018-03-28 00:00:00",
  "balance_type": null,
  "batch_timestamp": "2022-11-24 06:00:00",
  "created": "2018-03-21 07:13:47",
  "currency": "nzd",
  "description": null,
  "fee": 109,
  "id": "txn_1C818rGyxyMEWHozNevpfFIt",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "net": 2622,
  "reporting_category": "charge",
  "source_id": "ch_1C818pGyxyMEWHoz9U8bfywA",
  "status": "available",
  "type": "charge",
  "hour": "2025031700",
  "table_name": "bal"
}
```

---

## narrative.stripe.balance_transaction_fee_detail

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| amount                 | `LongType()`      | True     |
| application            | `StringType()`    | True     |
| balance_transaction_id | `StringType()`    | True     |
| batch_timestamp        | `TimestampType()` | True     |
| currency               | `StringType()`    | True     |
| description            | `StringType()`    | True     |
| id                     | `StringType()`    | True     |
| merchant_id            | `StringType()`    | True     |
| type                   | `StringType()`    | True     |
| hour                   | `StringType()`    | True     |
| table_name             | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 156,
  "application": null,
  "balance_transaction_id": "txn_3R3QNQGyxyMEWHoz1W8Rybiy",
  "batch_timestamp": "2025-03-17 00:00:00",
  "currency": "nzd",
  "description": "Stripe processing fees",
  "id": "fee_1R3QNSGyxyMEWHoz3O2YenBL",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "type": "stripe_fee",
  "hour": "2025031700",
  "table_name": "balance_transaction_fee_detail"
}
```

---

## narrative.stripe.balance_transaction_fee_details

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| amount                 | `LongType()`      | True     |
| application            | `StringType()`    | True     |
| balance_transaction_id | `StringType()`    | True     |
| batch_timestamp        | `TimestampType()` | True     |
| currency               | `StringType()`    | True     |
| description            | `StringType()`    | True     |
| id                     | `StringType()`    | True     |
| merchant_id            | `StringType()`    | True     |
| type                   | `StringType()`    | True     |
| hour                   | `StringType()`    | True     |
| table_name             | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 151,
  "application": null,
  "balance_transaction_id": "txn_3Rdfp0GyxyMEWHoz1dWqs07s",
  "batch_timestamp": "2025-06-25 00:00:00",
  "currency": "nzd",
  "description": "Stripe processing fees",
  "id": "fee_1Rdfp2GyxyMEWHozkADWOxCK",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "type": "stripe_fee",
  "hour": "2025062500",
  "table_name": "balance_transaction_fee_details"
}
```

---

## narrative.stripe.balance_transactions

### Schema

| Column                | Type              | Nullable |
| --------------------- | ----------------- | -------- |
| amount                | `LongType()`      | True     |
| automatic_transfer_id | `StringType()`    | True     |
| available_on          | `TimestampType()` | True     |
| balance_type          | `StringType()`    | True     |
| batch_timestamp       | `TimestampType()` | True     |
| created               | `TimestampType()` | True     |
| currency              | `StringType()`    | True     |
| description           | `StringType()`    | True     |
| fee                   | `LongType()`      | True     |
| id                    | `StringType()`    | True     |
| merchant_id           | `StringType()`    | True     |
| net                   | `LongType()`      | True     |
| reporting_category    | `StringType()`    | True     |
| source_id             | `StringType()`    | True     |
| status                | `StringType()`    | True     |
| type                  | `StringType()`    | True     |
| hour                  | `StringType()`    | True     |
| table_name            | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 2731,
  "automatic_transfer_id": "po_1C9TXRGyxyMEWHoznSaoE7v7",
  "available_on": "2018-03-28 00:00:00",
  "balance_type": null,
  "batch_timestamp": "2022-11-24 06:00:00",
  "created": "2018-03-21 07:13:47",
  "currency": "nzd",
  "description": null,
  "fee": 109,
  "id": "txn_1C818rGyxyMEWHozNevpfFIt",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "net": 2622,
  "reporting_category": "charge",
  "source_id": "ch_1C818pGyxyMEWHoz9U8bfywA",
  "status": "available",
  "type": "charge",
  "hour": "2025062500",
  "table_name": "balance_transactions"
}
```

---

## narrative.stripe.charge_groups

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| amount_in_usd   | `LongType()`      | True     |
| charge_id       | `StringType()`    | True     |
| created         | `TimestampType()` | True     |
| final_charge_id | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "amount_in_usd": 2000,
  "charge_id": "ch_3QjSTlGyxyMEWHoz0f4YRDLd",
  "created": "2025-01-20 21:25:54",
  "final_charge_id": "ch_3QjSTlGyxyMEWHoz0f4YRDLd",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025031700",
  "table_name": "charge_groups"
}
```

---

## narrative.stripe.charges

### Schema

| Column                          | Type              | Nullable |
| ------------------------------- | ----------------- | -------- |
| amount                          | `LongType()`      | True     |
| amount_refunded                 | `LongType()`      | True     |
| application_fee_id              | `StringType()`    | True     |
| application_id                  | `StringType()`    | True     |
| balance_transaction_id          | `StringType()`    | True     |
| batch_timestamp                 | `TimestampType()` | True     |
| calculated_statement_descriptor | `StringType()`    | True     |
| captured                        | `BooleanType()`   | True     |
| captured_at                     | `TimestampType()` | True     |
| card_address_city               | `StringType()`    | True     |
| card_address_country            | `StringType()`    | True     |
| card_address_line1              | `StringType()`    | True     |
| card_address_line1_check        | `StringType()`    | True     |
| card_address_line2              | `StringType()`    | True     |
| card_address_state              | `StringType()`    | True     |
| card_address_zip                | `StringType()`    | True     |
| card_address_zip_check          | `StringType()`    | True     |
| card_brand                      | `StringType()`    | True     |
| card_country                    | `StringType()`    | True     |
| card_currency                   | `StringType()`    | True     |
| card_customer_id                | `StringType()`    | True     |
| card_cvc_check                  | `StringType()`    | True     |
| card_default_for_currency       | `BooleanType()`   | True     |
| card_dynamic_last4              | `StringType()`    | True     |
| card_exp_month                  | `LongType()`      | True     |
| card_exp_year                   | `LongType()`      | True     |
| card_fingerprint                | `StringType()`    | True     |
| card_funding                    | `StringType()`    | True     |
| card_id                         | `StringType()`    | True     |
| card_iin                        | `StringType()`    | True     |
| card_last4                      | `StringType()`    | True     |
| card_name                       | `StringType()`    | True     |
| card_network                    | `StringType()`    | True     |
| card_recipient_id               | `StringType()`    | True     |
| card_token_type                 | `StringType()`    | True     |
| card_tokenization_method        | `StringType()`    | True     |
| created                         | `TimestampType()` | True     |
| currency                        | `StringType()`    | True     |
| customer_id                     | `StringType()`    | True     |
| description                     | `StringType()`    | True     |
| destination_id                  | `StringType()`    | True     |
| dispute_id                      | `StringType()`    | True     |
| failure_code                    | `StringType()`    | True     |
| failure_message                 | `StringType()`    | True     |
| id                              | `StringType()`    | True     |
| invoice_id                      | `StringType()`    | True     |
| merchant_id                     | `StringType()`    | True     |
| on_behalf_of_id                 | `StringType()`    | True     |
| order_id                        | `StringType()`    | True     |
| outcome_advice_code             | `StringType()`    | True     |
| outcome_network_advice_code     | `StringType()`    | True     |
| outcome_network_decline_code    | `StringType()`    | True     |
| outcome_network_status          | `StringType()`    | True     |
| outcome_reason                  | `StringType()`    | True     |
| outcome_risk_level              | `StringType()`    | True     |
| outcome_risk_score              | `LongType()`      | True     |
| outcome_rule_id                 | `StringType()`    | True     |
| outcome_seller_message          | `StringType()`    | True     |
| outcome_type                    | `StringType()`    | True     |
| paid                            | `BooleanType()`   | True     |
| payment_intent                  | `StringType()`    | True     |
| payment_method_id               | `StringType()`    | True     |
| payment_method_type             | `StringType()`    | True     |
| receipt_email                   | `StringType()`    | True     |
| receipt_number                  | `StringType()`    | True     |
| refunded                        | `BooleanType()`   | True     |
| shipping_address_city           | `StringType()`    | True     |
| shipping_address_country        | `StringType()`    | True     |
| shipping_address_line1          | `StringType()`    | True     |
| shipping_address_line2          | `StringType()`    | True     |
| shipping_address_postal_code    | `StringType()`    | True     |
| shipping_address_state          | `StringType()`    | True     |
| source_id                       | `StringType()`    | True     |
| source_transfer_id              | `StringType()`    | True     |
| statement_descriptor            | `StringType()`    | True     |
| statement_descriptor_suffix     | `StringType()`    | True     |
| status                          | `StringType()`    | True     |
| transfer_group                  | `StringType()`    | True     |
| transfer_id                     | `StringType()`    | True     |
| hour                            | `StringType()`    | True     |
| table_name                      | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 18000,
  "amount_refunded": 0,
  "application_fee_id": null,
  "application_id": null,
  "balance_transaction_id": "txn_3PjkzTGyxyMEWHoz0Av8w0SY",
  "batch_timestamp": "2025-06-25 00:00:00",
  "calculated_statement_descriptor": "NARRATIVE",
  "captured": true,
  "captured_at": "2024-08-03 16:39:35",
  "card_address_city": null,
  "card_address_country": null,
  "card_address_line1": null,
  "card_address_line1_check": null,
  "card_address_line2": null,
  "card_address_state": null,
  "card_address_zip": "55346",
  "card_address_zip_check": "pass",
  "card_brand": "Visa",
  "card_country": "US",
  "card_currency": "usd",
  "card_customer_id": "cus_QawediHu4OQ8kU",
  "card_cvc_check": "pass",
  "card_default_for_currency": null,
  "card_dynamic_last4": null,
  "card_exp_month": 9,
  "card_exp_year": 2027,
  "card_fingerprint": "op7CQ0eWmZgT7HOw",
  "card_funding": "debit",
  "card_id": "card_1PjkpBGyxyMEWHozuczhm2Mh",
  "card_iin": "419002",
  "card_last4": "0514",
  "card_name": null,
  "card_network": "visa",
  "card_recipient_id": null,
  "card_token_type": null,
  "card_tokenization_method": null,
  "created": "2024-08-03 16:39:35",
  "currency": "usd",
  "customer_id": "cus_QawediHu4OQ8kU",
  "description": "Subscription update",
  "destination_id": null,
  "dispute_id": "du_1Prf9aGyxyMEWHozxRujPi7t",
  "failure_code": null,
  "failure_message": null,
  "id": "ch_3PjkzTGyxyMEWHoz0mvr4YyK",
  "invoice_id": "in_1PjkzSGyxyMEWHoztk9xaxU9",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "on_behalf_of_id": null,
  "order_id": null,
  "outcome_advice_code": null,
  "outcome_network_advice_code": null,
  "outcome_network_decline_code": null,
  "outcome_network_status": "approved_by_network",
  "outcome_reason": null,
  "outcome_risk_level": "normal",
  "outcome_risk_score": 1,
  "outcome_rule_id": null,
  "outcome_seller_message": "Payment complete.",
  "outcome_type": "authorized",
  "paid": true,
  "payment_intent": "pi_3PjkzTGyxyMEWHoz0o8UUewo",
  "payment_method_id": "card_1PjkpBGyxyMEWHozuczhm2Mh",
  "payment_method_type": "card",
  "receipt_email": "katelynchristinephotography@outlook.com",
  "receipt_number": "2250-7758",
  "refunded": false,
  "shipping_address_city": null,
  "shipping_address_country": null,
  "shipping_address_line1": null,
  "shipping_address_line2": null,
  "shipping_address_postal_code": null,
  "shipping_address_state": null,
  "source_id": null,
  "source_transfer_id": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "transfer_group": null,
  "transfer_id": null,
  "hour": "2025062500",
  "table_name": "charges"
}
```

---

## narrative.stripe.checkout_custom_field

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| batch_timestamp     | `TimestampType()` | True     |
| checkout_session_id | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| key                 | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| optional            | `BooleanType()`   | True     |
| type                | `StringType()`    | True     |
| value               | `StringType()`    | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-02-11 21:00:00",
  "checkout_session_id": "cs_live_a1A3Vpt6RBvKRdd60sKaUDEFTV8bBrhKUwE3r9T8qig8QWeSxzD4F9ClsP",
  "id": "cstm_fld_RkYM7PXNs3ZMVy",
  "key": "websiteorsocialmediaurl",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "optional": true,
  "type": "text",
  "value": null,
  "hour": "2025031700",
  "table_name": "checkout_custom_field"
}
```

---

## narrative.stripe.checkout_custom_fields

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| batch_timestamp     | `TimestampType()` | True     |
| checkout_session_id | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| key                 | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| optional            | `BooleanType()`   | True     |
| type                | `StringType()`    | True     |
| value               | `StringType()`    | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-02-11 21:00:00",
  "checkout_session_id": "cs_live_a1A3Vpt6RBvKRdd60sKaUDEFTV8bBrhKUwE3r9T8qig8QWeSxzD4F9ClsP",
  "id": "cstm_fld_RkYM7PXNs3ZMVy",
  "key": "websiteorsocialmediaurl",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "optional": true,
  "type": "text",
  "value": null,
  "hour": "2025062500",
  "table_name": "checkout_custom_fields"
}
```

---

## narrative.stripe.checkout_l

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| batch_timestamp     | `TimestampType()` | True     |
| checkout_session_id | `StringType()`    | True     |
| created             | `TimestampType()` | True     |
| description         | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| price_id            | `StringType()`    | True     |
| product_id          | `StringType()`    | True     |
| quantity            | `LongType()`      | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-03-16 00:00:00",
  "checkout_session_id": "cs_live_a1xpng2U56BotTROuVj8RfohJCLpiiiWMgYInDCmpdkBhXp6drPBjgK8lY",
  "created": "2025-03-14 22:13:36",
  "description": "LA networking event",
  "id": "li_1R2gU0GyxyMEWHozWs0ZLbQ8",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "price_id": "price_1Qr3KLGyxyMEWHozvJsFh4DM",
  "product_id": "prod_RkYRyuFIaJZrYW",
  "quantity": 1,
  "hour": "2025031700",
  "table_name": "checkout_l"
}
```

---

## narrative.stripe.checkout_line_items

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| batch_timestamp     | `TimestampType()` | True     |
| checkout_session_id | `StringType()`    | True     |
| created             | `TimestampType()` | True     |
| description         | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| price_id            | `StringType()`    | True     |
| product_id          | `StringType()`    | True     |
| quantity            | `LongType()`      | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-04-05 06:00:00",
  "checkout_session_id": "cs_live_a1WVKSkUzSrDpspYkPGjf3slJJnG4qnmyLhPdSnCuc6oWWqPX8wZ8TKJjH",
  "created": "2022-07-25 04:27:11",
  "description": "2022 Narrative International Photography Awards",
  "id": "li_1LPIstGyxyMEWHozY2rX0k40",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "price_id": "price_1LPGmJGyxyMEWHozPGoBhpVa",
  "product_id": "prod_M7VnPKOYPCPL40",
  "quantity": 1,
  "hour": "2025062500",
  "table_name": "checkout_line_items"
}
```

---

## narrative.stripe.checkout_sessions

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| batch_timestamp          | `TimestampType()` | True     |
| client_reference_id      | `StringType()`    | True     |
| consent_promotions       | `StringType()`    | True     |
| consent_terms_of_service | `StringType()`    | True     |
| created                  | `TimestampType()` | True     |
| currency                 | `StringType()`    | True     |
| customer_id              | `StringType()`    | True     |
| id                       | `StringType()`    | True     |
| invoice_id               | `StringType()`    | True     |
| merchant_id              | `StringType()`    | True     |
| mode                     | `StringType()`    | True     |
| payment_intent_id        | `StringType()`    | True     |
| payment_link_id          | `StringType()`    | True     |
| status                   | `StringType()`    | True     |
| subscription_id          | `StringType()`    | True     |
| hour                     | `StringType()`    | True     |
| table_name               | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-04-04 00:00:00",
  "client_reference_id": null,
  "consent_promotions": null,
  "consent_terms_of_service": null,
  "created": "2022-07-25 04:27:11",
  "currency": "usd",
  "customer_id": null,
  "id": "cs_live_a1WVKSkUzSrDpspYkPGjf3slJJnG4qnmyLhPdSnCuc6oWWqPX8wZ8TKJjH",
  "invoice_id": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "mode": "payment",
  "payment_intent_id": null,
  "payment_link_id": "plink_1LPGpUGyxyMEWHozkZFNeBo6",
  "status": "expired",
  "subscription_id": null,
  "hour": "2025062500",
  "table_name": "checkout_sessions"
}
```

---

## narrative.stripe.coupons

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| amount_off          | `LongType()`      | True     |
| applies_to_products | `StringType()`    | True     |
| batch_timestamp     | `TimestampType()` | True     |
| created             | `TimestampType()` | True     |
| currency            | `StringType()`    | True     |
| duration            | `StringType()`    | True     |
| duration_in_months  | `LongType()`      | True     |
| id                  | `StringType()`    | True     |
| max_redemptions     | `LongType()`      | True     |
| merchant_id         | `StringType()`    | True     |
| name                | `StringType()`    | True     |
| percent_off         | `DoubleType()`    | True     |
| redeem_by           | `TimestampType()` | True     |
| times_redeemed      | `LongType()`      | True     |
| valid               | `BooleanType()`   | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "amount_off": NaN,
  "applies_to_products": null,
  "batch_timestamp": "2024-03-19 06:00:00",
  "created": "2018-03-21 00:29:41",
  "currency": null,
  "duration": "forever",
  "duration_in_months": NaN,
  "id": "Narrative_Wonderland",
  "max_redemptions": NaN,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "name": null,
  "percent_off": 100.0,
  "redeem_by": "NaT",
  "times_redeemed": 34,
  "valid": true,
  "hour": "2025062500",
  "table_name": "coupons"
}
```

---

## narrative.stripe.coupons_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| coupon_id       | `StringType()`    | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-03-15 18:00:00",
  "coupon_id": "ana11",
  "key": "fp_ref_id",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "value": "ana11",
  "hour": "2025062500",
  "table_name": "coupons_metadata"
}
```

---

## narrative.stripe.customer_balance_transactions

### Schema

| Column                         | Type              | Nullable |
| ------------------------------ | ----------------- | -------- |
| account_id                     | `StringType()`    | True     |
| amount                         | `LongType()`      | True     |
| batch_timestamp                | `TimestampType()` | True     |
| created                        | `TimestampType()` | True     |
| credit_note_id                 | `StringType()`    | True     |
| currency                       | `StringType()`    | True     |
| customer_id                    | `StringType()`    | True     |
| description                    | `StringType()`    | True     |
| ending_balance                 | `LongType()`      | True     |
| id                             | `StringType()`    | True     |
| invoice_id                     | `StringType()`    | True     |
| merchant_balance_adjustment_id | `StringType()`    | True     |
| merchant_id                    | `StringType()`    | True     |
| previous                       | `StringType()`    | True     |
| source_id                      | `StringType()`    | True     |
| type                           | `StringType()`    | True     |
| hour                           | `StringType()`    | True     |
| table_name                     | `StringType()`    | True     |

### Sample Row

```json
{
  "account_id": "cba_1RaPmxGyxyMEWHoz4zUfEoP9",
  "amount": 3590,
  "batch_timestamp": "2025-06-25 00:00:00",
  "created": "2025-06-24 23:18:42",
  "credit_note_id": null,
  "currency": "usd",
  "customer_id": "cus_Iv1Bo6h0Lo2hDA",
  "description": null,
  "ending_balance": -41281,
  "id": "cbtxn_1Rdg6wGyxyMEWHozskQ88DoV",
  "invoice_id": "in_1Rdg6wGyxyMEWHozpo98sPXL",
  "merchant_balance_adjustment_id": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "previous": "cbtxn_1RaPmxGyxyMEWHozMxVARR9m",
  "source_id": null,
  "type": "applied_to_invoice",
  "hour": "2025062500",
  "table_name": "customer_balance_transactions"
}
```

---

## narrative.stripe.customer_balance_transactions_metadata

### Schema

| Column                          | Type              | Nullable |
| ------------------------------- | ----------------- | -------- |
| batch_timestamp                 | `TimestampType()` | True     |
| customer_balance_transaction_id | `StringType()`    | True     |
| key                             | `StringType()`    | True     |
| merchant_id                     | `StringType()`    | True     |
| value                           | `StringType()`    | True     |
| hour                            | `StringType()`    | True     |
| table_name                      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2022-11-24 06:00:00",
  "customer_balance_transaction_id": "cbtxn_1Gl3uGGyxyMEWHozEgQSQ9nB",
  "key": "reversed_transaction",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "value": "cbtxn_1GiaeLGyxyMEWHozlBFu271M",
  "hour": "2025062500",
  "table_name": "customer_balance_transactions_metadata"
}
```

---

## narrative.stripe.customer_tax_ids

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| batch_timestamp               | `TimestampType()` | True     |
| country                       | `StringType()`    | True     |
| created                       | `TimestampType()` | True     |
| customer                      | `StringType()`    | True     |
| id                            | `StringType()`    | True     |
| merchant_id                   | `StringType()`    | True     |
| type                          | `StringType()`    | True     |
| value                         | `StringType()`    | True     |
| verification_status           | `StringType()`    | True     |
| verification_verified_address | `StringType()`    | True     |
| verification_verified_name    | `StringType()`    | True     |
| hour                          | `StringType()`    | True     |
| table_name                    | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2023-11-16 06:00:00",
  "country": "IT",
  "created": "2019-05-23 23:14:06",
  "customer": "cus_CZPcuNNwnZAPRG",
  "id": "txi_1EdQ6sGyxyMEWHozZEuE0loW",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "type": "eu_vat",
  "value": "IT02444030908",
  "verification_status": "verified",
  "verification_verified_address": "VIA CIVITAVECCHIA 18 \n07100 SASSARI SS",
  "verification_verified_name": "MAMELI VALERIA",
  "hour": "2025062500",
  "table_name": "customer_tax_ids"
}
```

---

## narrative.stripe.customers

### Schema

| Column                                     | Type              | Nullable |
| ------------------------------------------ | ----------------- | -------- |
| account_balance                            | `LongType()`      | True     |
| address_city                               | `StringType()`    | True     |
| address_country                            | `StringType()`    | True     |
| address_line1                              | `StringType()`    | True     |
| address_line2                              | `StringType()`    | True     |
| address_postal_code                        | `StringType()`    | True     |
| address_state                              | `StringType()`    | True     |
| balance                                    | `LongType()`      | True     |
| batch_timestamp                            | `TimestampType()` | True     |
| business_vat_id                            | `StringType()`    | True     |
| created                                    | `TimestampType()` | True     |
| currency                                   | `StringType()`    | True     |
| default_source_id                          | `StringType()`    | True     |
| deleted                                    | `BooleanType()`   | True     |
| delinquent                                 | `BooleanType()`   | True     |
| description                                | `StringType()`    | True     |
| discount_checkout_session                  | `StringType()`    | True     |
| discount_coupon_id                         | `StringType()`    | True     |
| discount_customer_id                       | `StringType()`    | True     |
| discount_end                               | `TimestampType()` | True     |
| discount_invoice                           | `StringType()`    | True     |
| discount_invoice_item                      | `StringType()`    | True     |
| discount_promotion_code_id                 | `StringType()`    | True     |
| discount_start                             | `TimestampType()` | True     |
| discount_subscription                      | `StringType()`    | True     |
| discount_subscription_item                 | `StringType()`    | True     |
| email                                      | `StringType()`    | True     |
| id                                         | `StringType()`    | True     |
| invoice_credit_balance                     | `StringType()`    | True     |
| invoice_settings_default_payment_method_id | `StringType()`    | True     |
| merchant_id                                | `StringType()`    | True     |
| name                                       | `StringType()`    | True     |
| phone                                      | `StringType()`    | True     |
| preferred_locales                          | `StringType()`    | True     |
| shipping_address_city                      | `StringType()`    | True     |
| shipping_address_country                   | `StringType()`    | True     |
| shipping_address_line1                     | `StringType()`    | True     |
| shipping_address_line2                     | `StringType()`    | True     |
| shipping_address_postal_code               | `StringType()`    | True     |
| shipping_address_state                     | `StringType()`    | True     |
| shipping_name                              | `StringType()`    | True     |
| shipping_phone                             | `StringType()`    | True     |
| sources_data_id                            | `StringType()`    | True     |
| tax_exempt                                 | `StringType()`    | True     |
| tax_info_tax_id                            | `StringType()`    | True     |
| tax_info_type                              | `StringType()`    | True     |
| tax_ip_address                             | `StringType()`    | True     |
| hour                                       | `StringType()`    | True     |
| table_name                                 | `StringType()`    | True     |

### Sample Row

```json
{
  "account_balance": -41281,
  "address_city": "Aiea",
  "address_country": "United States of America",
  "address_line1": "99-585 Kaulainahee Pl",
  "address_line2": "",
  "address_postal_code": "96701",
  "address_state": "HI",
  "balance": -41281,
  "batch_timestamp": "2025-06-25 00:00:00",
  "business_vat_id": null,
  "created": "2021-02-10 05:21:35",
  "currency": "usd",
  "default_source_id": "card_1PvkiwGyxyMEWHozRou8PvlD",
  "deleted": false,
  "delinquent": false,
  "description": null,
  "discount_checkout_session": null,
  "discount_coupon_id": null,
  "discount_customer_id": null,
  "discount_end": "NaT",
  "discount_invoice": null,
  "discount_invoice_item": null,
  "discount_promotion_code_id": null,
  "discount_start": "NaT",
  "discount_subscription": null,
  "discount_subscription_item": null,
  "email": "marisabuhr@gmail.com",
  "id": "cus_Iv1Bo6h0Lo2hDA",
  "invoice_credit_balance": "null",
  "invoice_settings_default_payment_method_id": "card_1PvkiwGyxyMEWHozRou8PvlD",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "name": null,
  "phone": null,
  "preferred_locales": "",
  "shipping_address_city": null,
  "shipping_address_country": null,
  "shipping_address_line1": null,
  "shipping_address_line2": null,
  "shipping_address_postal_code": null,
  "shipping_address_state": null,
  "shipping_name": null,
  "shipping_phone": null,
  "sources_data_id": null,
  "tax_exempt": "none",
  "tax_info_tax_id": null,
  "tax_info_type": null,
  "tax_ip_address": null,
  "hour": "2025062500",
  "table_name": "customers"
}
```

---

## narrative.stripe.customers_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| customer_id     | `StringType()`    | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-25 00:00:00",
  "customer_id": "cus_LouRcpNBfiNko9",
  "key": "select_lifetime_subscriber",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "value": "true",
  "hour": "2025062500",
  "table_name": "customers_metadata"
}
```

---

## narrative.stripe.discounts

### Schema

| Column               | Type              | Nullable |
| -------------------- | ----------------- | -------- |
| batch_timestamp      | `TimestampType()` | True     |
| checkout_session_id  | `StringType()`    | True     |
| coupon_id            | `StringType()`    | True     |
| created              | `TimestampType()` | True     |
| customer_id          | `StringType()`    | True     |
| end                  | `LongType()`      | True     |
| id                   | `StringType()`    | True     |
| invoice_id           | `StringType()`    | True     |
| invoice_item_id      | `StringType()`    | True     |
| merchant_id          | `StringType()`    | True     |
| promotion_code_id    | `StringType()`    | True     |
| subscription_id      | `StringType()`    | True     |
| subscription_item_id | `StringType()`    | True     |
| hour                 | `StringType()`    | True     |
| table_name           | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-25 03:00:00",
  "checkout_session_id": null,
  "coupon_id": "goJ73h5N",
  "created": "2025-06-24 23:53:49",
  "customer_id": "cus_QPOBnvfdiDu8Ml",
  "end": NaN,
  "id": "di_1RdgevGyxyMEWHozyTrRAhyR",
  "invoice_id": null,
  "invoice_item_id": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "promotion_code_id": null,
  "subscription_id": "sub_1PYZPQGyxyMEWHoz4diKd3my",
  "subscription_item_id": null,
  "hour": "2025062500",
  "table_name": "discounts"
}
```

---

## narrative.stripe.disputes

### Schema

| Column                                        | Type              | Nullable |
| --------------------------------------------- | ----------------- | -------- |
| amount                                        | `LongType()`      | True     |
| batch_timestamp                               | `TimestampType()` | True     |
| charge_id                                     | `StringType()`    | True     |
| created                                       | `TimestampType()` | True     |
| currency                                      | `StringType()`    | True     |
| evidence_access_activity_log                  | `StringType()`    | True     |
| evidence_billing_address                      | `StringType()`    | True     |
| evidence_cancellation_policy_disclosure       | `StringType()`    | True     |
| evidence_cancellation_policy_id               | `StringType()`    | True     |
| evidence_cancellation_rebuttal                | `StringType()`    | True     |
| evidence_customer_communication_id            | `StringType()`    | True     |
| evidence_customer_email_address               | `StringType()`    | True     |
| evidence_customer_name                        | `StringType()`    | True     |
| evidence_customer_purchase_ip                 | `StringType()`    | True     |
| evidence_customer_signature_id                | `StringType()`    | True     |
| evidence_details_due_by                       | `TimestampType()` | True     |
| evidence_details_has_evidence                 | `BooleanType()`   | True     |
| evidence_details_past_due                     | `BooleanType()`   | True     |
| evidence_details_submission_count             | `LongType()`      | True     |
| evidence_duplicate_charge_documentation_id    | `StringType()`    | True     |
| evidence_duplicate_charge_id                  | `StringType()`    | True     |
| evidence_product_description                  | `StringType()`    | True     |
| evidence_receipt_id                           | `StringType()`    | True     |
| evidence_refund_policy_disclosure             | `StringType()`    | True     |
| evidence_refund_policy_id                     | `StringType()`    | True     |
| evidence_refund_refusal_explanation           | `StringType()`    | True     |
| evidence_service_date                         | `StringType()`    | True     |
| evidence_service_documentation_id             | `StringType()`    | True     |
| evidence_shipping_address                     | `StringType()`    | True     |
| evidence_shipping_carrier                     | `StringType()`    | True     |
| evidence_shipping_date                        | `StringType()`    | True     |
| evidence_shipping_documentation_id            | `StringType()`    | True     |
| evidence_shipping_tracking_number             | `StringType()`    | True     |
| evidence_uncategorized_file_id                | `StringType()`    | True     |
| evidence_uncategorized_text                   | `StringType()`    | True     |
| id                                            | `StringType()`    | True     |
| is_charge_refundable                          | `BooleanType()`   | True     |
| merchant_id                                   | `StringType()`    | True     |
| network_details_type                          | `StringType()`    | True     |
| network_details_visa_rapid_dispute_resolution | `BooleanType()`   | True     |
| network_reason_code                           | `StringType()`    | True     |
| reason                                        | `StringType()`    | True     |
| status                                        | `StringType()`    | True     |
| hour                                          | `StringType()`    | True     |
| table_name                                    | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 18000,
  "batch_timestamp": "2025-06-25 00:00:00",
  "charge_id": "ch_3PjkzTGyxyMEWHoz0mvr4YyK",
  "created": "2024-08-25 12:02:42",
  "currency": "usd",
  "evidence_access_activity_log": null,
  "evidence_billing_address": "55346",
  "evidence_cancellation_policy_disclosure": null,
  "evidence_cancellation_policy_id": null,
  "evidence_cancellation_rebuttal": null,
  "evidence_customer_communication_id": null,
  "evidence_customer_email_address": "katelynchristinephotography@outlook.com",
  "evidence_customer_name": "Katelyn Lamb",
  "evidence_customer_purchase_ip": "75.247.196.232",
  "evidence_customer_signature_id": null,
  "evidence_details_due_by": "2024-09-20 23:59:59",
  "evidence_details_has_evidence": false,
  "evidence_details_past_due": false,
  "evidence_details_submission_count": 0,
  "evidence_duplicate_charge_documentation_id": null,
  "evidence_duplicate_charge_id": null,
  "evidence_product_description": null,
  "evidence_receipt_id": "file_1Prf9dGyxyMEWHoz43MP7R54",
  "evidence_refund_policy_disclosure": null,
  "evidence_refund_policy_id": null,
  "evidence_refund_refusal_explanation": null,
  "evidence_service_date": null,
  "evidence_service_documentation_id": null,
  "evidence_shipping_address": null,
  "evidence_shipping_carrier": null,
  "evidence_shipping_date": null,
  "evidence_shipping_documentation_id": null,
  "evidence_shipping_tracking_number": null,
  "evidence_uncategorized_file_id": null,
  "evidence_uncategorized_text": null,
  "id": "du_1Prf9aGyxyMEWHozxRujPi7t",
  "is_charge_refundable": false,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "network_details_type": null,
  "network_details_visa_rapid_dispute_resolution": null,
  "network_reason_code": "12.6.1",
  "reason": "duplicate",
  "status": "lost",
  "hour": "2025062500",
  "table_name": "disputes"
}
```

---

## narrative.stripe.disputes_enhanced_eligibility

### Schema

| Column                                      | Type              | Nullable |
| ------------------------------------------- | ----------------- | -------- |
| batch_timestamp                             | `TimestampType()` | True     |
| created                                     | `DoubleType()`    | True     |
| id                                          | `StringType()`    | True     |
| merchant_id                                 | `StringType()`    | True     |
| visa_compelling_evidence_3_required_actions | `StringType()`    | True     |
| visa_compelling_evidence_3_status           | `StringType()`    | True     |
| visa_compliance_status                      | `StringType()`    | True     |
| hour                                        | `StringType()`    | True     |
| table_name                                  | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-16 00:00:00",
  "created": 1701440736.4129202,
  "id": "du_1OIXeuGyxyMEWHozShxoVqf0",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "visa_compelling_evidence_3_required_actions": null,
  "visa_compelling_evidence_3_status": "not_qualified",
  "visa_compliance_status": null,
  "hour": "2025062500",
  "table_name": "disputes_enhanced_eligibility"
}
```

---

## narrative.stripe.early_fraud_warnings

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| actionable      | `BooleanType()`   | True     |
| batch_timestamp | `TimestampType()` | True     |
| charge_id       | `StringType()`    | True     |
| created         | `TimestampType()` | True     |
| fraud_type      | `StringType()`    | True     |
| id              | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "actionable": true,
  "batch_timestamp": "2022-11-24 06:00:00",
  "charge_id": "ch_1FOIVoGyxyMEWHozQgKbBWg6",
  "created": "2019-11-12 15:54:25",
  "fraud_type": "unauthorized_use_of_card",
  "id": "issfr_1Fe1hFGyxyMEWHozc0afQ3ka",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025062500",
  "table_name": "early_fraud_warnings"
}
```

---

## narrative.stripe.exchange_rates_from_usd

### Schema

| Column                      | Type              | Nullable |
| --------------------------- | ----------------- | -------- |
| buy_currency_exchange_rates | `StringType()`    | True     |
| date                        | `TimestampType()` | True     |
| sell_currency               | `StringType()`    | True     |
| hour                        | `StringType()`    | True     |
| table_name                  | `StringType()`    | True     |

### Sample Row

```json
{
  "buy_currency_exchange_rates": "{\"rub\":59.9705,\"sdg\":6.731765,\"fkp\":0.766537,\"cuc\":1.0,\"idr\":13351.314947,\"sll\":7545.0,\"xpd\":0.00113835,\"bhd\":3.77175,\"pyg\":56.089,\"ssp\":125.904008,\"gnf\":89.81,\"zmw\":9.134725,\"cad\":1.26435,\"nok\":7.946457,\"sar\":3.75025,\"jod\":7.08901,\"xaf\":5.56976675,\"cve\":94.0,\"try\":3.532736,\"inr\":63.674548,\"xau\":7.9526E-4,\"bgn\":1.6612,\"myr\":4.278517,\"mzn\":60.994761,\"gel\":2.39078,\"lbp\":1520.65,\"tzs\":2273.901809,\"szl\":13.425,\"gtq\":7.33245,\"omr\":3.85205,\"bbd\":2.0,\"all\":112.495,\"vef\":10.07595,\"cnh\":6.736895,\"clp\":6.502000000000001,\"ugx\":3616.95,\"gbp\":0.766537,\"xpt\":0.00103843,\"qar\":3.66704,\"amd\":484.459839,\"xof\":5.56976675,\"ngn\":366.261895,\"gip\":0.766537,\"srd\":7.438,\"uzs\":4132.15,\"gyd\":208.005254,\"sgd\":1.360878,\"ern\":15.34,\"hkd\":7.818495,\"pln\":3.60421,\"nio\":30.02,\"lsl\":13.4825,\"dop\":47.606089,\"nzd\":1.350302,\"std\":20805.700196,\"vnd\":227.94,\"mro\":363.0,\"cup\":25.5,\"mur\":32.948862,\"pen\":3.26565,\"tjs\":8.776577,\"iqd\":1182.5,\"pkr\":106.2,\"bsd\":1.0,\"uah\":26.047543,\"tmt\":3.499972,\"mwk\":731.255,\"scr\":13.641821,\"rwf\":8.34575,\"tnd\":24.43707,\"lrd\":115.0,\"zwl\":322.387247,\"uyu\":28.377573,\"bdt\":81.66144,\"jmd\":128.8,\"vuv\":1.04093334,\"npr\":102.636424,\"egp\":17.7635,\"awg\":1.795249,\"mxn\":17.866717,\"syp\":214.72147,\"azn\":1.6854,\"lkr\":153.548466,\"thb\":33.29,\"clf\":0.024228,\"ggp\":0.766537,\"gmd\":46.2,\"kzt\":336.226596,\"isk\":105.12,\"ils\":3.63475,\"czk\":22.15761,\"lak\":8285.0,\"htg\":60.9855,\"mdl\":18.047602,\"khr\":4136.85,\"pgk\":3.245069,\"fjd\":1.996842,\"bob\":7.032503,\"wst\":2.4729,\"php\":50.289166,\"shp\":0.766537,\"mga\":29.8573975,\"byn\":1.953,\"djf\":1.7890000000000001,\"kmf\":4.1885,\"kyd\":0.840205,\"aed\":3.67297,\"afn\":68.700527,\"bzd\":2.032307,\"ttd\":6.823425,\"twd\":30.218,\"cop\":2985.73975,\"mop\":8.052432,\"xpf\":1.0132523500000001,\"crc\":575.969261,\"cny\":6.7653,\"lyd\":1.379306,\"dzd\":108.35,\"xcd\":2.70255,\"svc\":8.74939,\"btc\":3.08937266E-4,\"mnt\":2452.833333,\"kgs\":69.369301,\"sos\":583.333167,\"imp\":0.766537,\"aud\":1.261448,\"yer\":250.3,\"mvr\":15.450233,\"ron\":3.884278,\"cdf\":1653.005464,\"jpy\":1.1081677778,\"jep\":0.766537,\"nad\":13.425,\"ang\":1.794648,\"bnd\":1.36758,\"mmk\":1367.58506,\"irr\":32724.5,\"brl\":3.130811,\"ars\":17.652,\"xag\":0.06158015,\"sbd\":7.659534,\"bwp\":10.257187,\"hnl\":23.5985,\"kwd\":3.02135,\"usd\":1.0,\"dkk\":6.316633,\"sek\":8.149299,\"mkd\":52.304059,\"kpw\":900.09,\"xdr\":0.707254,\"top\":2.19365,\"btn\":63.6545,\"chf\":0.972864,\"aoa\":165.9195,\"bam\":1.6612,\"huf\":258.77222,\"bif\":17.524880539999998,\"rsd\":101.626121,\"pab\":1.0,\"hrk\":6.2895,\"eur\":0.849105,\"zar\":13.415635,\"ghs\":4.4312,\"kes\":103.93,\"mad\":9.465498,\"krw\":11.2825,\"bmd\":1.0,\"etb\":23.500212}",
  "date": "2017-08-07 00:00:00",
  "sell_currency": "usd",
  "hour": "2025062200",
  "table_name": "exchange_rates_from_usd"
}
```

---

## narrative.stripe.invoice_custom_fields

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| invoice_id      | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| name            | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-07-02 00:00:00",
  "invoice_id": "in_1EXghjGyxyMEWHozBtbbkQwU",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "name": "GST #",
  "value": "123034368",
  "hour": "2025062500",
  "table_name": "invoice_custom_fields"
}
```

---

## narrative.stripe.invoice_customer_tax_ids

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| invoice_id      | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| type            | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-04-11 00:00:00",
  "invoice_id": "in_1EoKKZGyxyMEWHozZgWvpcWV",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "type": "it_vat",
  "value": "IT02444030908",
  "hour": "2025062500",
  "table_name": "invoice_customer_tax_ids"
}
```

---

## narrative.stripe.invoice_items

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| amount              | `LongType()`      | True     |
| batch_timestamp     | `TimestampType()` | True     |
| currency            | `StringType()`    | True     |
| customer_id         | `StringType()`    | True     |
| date                | `TimestampType()` | True     |
| description         | `StringType()`    | True     |
| discountable        | `BooleanType()`   | True     |
| discounts           | `StringType()`    | True     |
| id                  | `StringType()`    | True     |
| invoice_id          | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| period_end          | `TimestampType()` | True     |
| period_start        | `TimestampType()` | True     |
| plan_id             | `StringType()`    | True     |
| price_id            | `StringType()`    | True     |
| proration           | `BooleanType()`   | True     |
| quantity            | `LongType()`      | True     |
| subscription_id     | `StringType()`    | True     |
| subscription_item   | `StringType()`    | True     |
| unit_amount         | `LongType()`      | True     |
| unit_amount_decimal | `StringType()`    | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 7181,
  "batch_timestamp": "2025-06-25 00:00:00",
  "currency": "usd",
  "customer_id": "cus_Iv1Bo6h0Lo2hDA",
  "date": "2025-06-24 23:18:42",
  "description": "Remaining time on Select (with 25.0% off) after 24 Jun 2025",
  "discountable": false,
  "discounts": "",
  "id": "ii_1Rdg6wGyxyMEWHoz1xmI8pd8",
  "invoice_id": "in_1Rdg6wGyxyMEWHozpo98sPXL",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "period_end": "2025-09-05 18:48:09",
  "period_start": "2025-06-24 23:18:41",
  "plan_id": "price_1RRLEGGyxyMEWHozHifUfD6X",
  "price_id": "price_1RRLEGGyxyMEWHozHifUfD6X",
  "proration": true,
  "quantity": 1,
  "subscription_id": "sub_Iv1B4IKKBkez6m",
  "subscription_item": "si_SSq4eFPiNql82y",
  "unit_amount": 7181,
  "unit_amount_decimal": "7181",
  "hour": "2025062500",
  "table_name": "invoice_items"
}
```

---

## narrative.stripe.invoice_line_item_discount_amounts

### Schema

| Column               | Type              | Nullable |
| -------------------- | ----------------- | -------- |
| amount               | `LongType()`      | True     |
| batch_timestamp      | `TimestampType()` | True     |
| discount             | `StringType()`    | True     |
| id                   | `StringType()`    | True     |
| invoice_id           | `StringType()`    | True     |
| invoice_line_item_id | `StringType()`    | True     |
| merchant_id          | `StringType()`    | True     |
| hour                 | `StringType()`    | True     |
| table_name           | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 725,
  "batch_timestamp": "2025-06-25 00:00:00",
  "discount": "di_1RXxMuGyxyMEWHoz3DSTSvYh",
  "id": "discam_SYnP1G8bXAx4ST",
  "invoice_id": "in_1RdesSGyxyMEWHozhU5Czt28",
  "invoice_line_item_id": "il_1RdesSGyxyMEWHozAv7IJahk",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025062500",
  "table_name": "invoice_line_item_discount_amounts"
}
```

---

## narrative.stripe.invoice_line_item_tax_amounts

### Schema

| Column               | Type              | Nullable |
| -------------------- | ----------------- | -------- |
| amount               | `LongType()`      | True     |
| batch_timestamp      | `TimestampType()` | True     |
| filing_amount        | `LongType()`      | True     |
| id                   | `StringType()`    | True     |
| inclusive            | `BooleanType()`   | True     |
| invoice_id           | `StringType()`    | True     |
| invoice_line_item_id | `StringType()`    | True     |
| merchant_id          | `StringType()`    | True     |
| tax_rate             | `StringType()`    | True     |
| taxable_amount       | `LongType()`      | True     |
| hour                 | `StringType()`    | True     |
| table_name           | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 0,
  "batch_timestamp": "2024-07-02 00:00:00",
  "filing_amount": NaN,
  "id": null,
  "inclusive": true,
  "invoice_id": "in_1EXgn2GyxyMEWHozsjcvGsMX",
  "invoice_line_item_id": "il_1EXgn2GyxyMEWHoz20jw6ED4",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "tax_rate": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
  "taxable_amount": NaN,
  "hour": "2025062500",
  "table_name": "invoice_line_item_tax_amounts"
}
```

---

## narrative.stripe.invoice_line_items

### Schema

| Column                                              | Type              | Nullable |
| --------------------------------------------------- | ----------------- | -------- |
| amount                                              | `LongType()`      | True     |
| batch_timestamp                                     | `TimestampType()` | True     |
| currency                                            | `StringType()`    | True     |
| description                                         | `StringType()`    | True     |
| discountable                                        | `BooleanType()`   | True     |
| id                                                  | `StringType()`    | True     |
| invoice_id                                          | `StringType()`    | True     |
| invoice_item_id                                     | `StringType()`    | True     |
| merchant_id                                         | `StringType()`    | True     |
| period_end                                          | `TimestampType()` | True     |
| period_start                                        | `TimestampType()` | True     |
| plan_id                                             | `StringType()`    | True     |
| price_id                                            | `StringType()`    | True     |
| proration                                           | `BooleanType()`   | True     |
| proration_details_credited_items_invoice            | `StringType()`    | True     |
| proration_details_credited_items_invoice_line_items | `StringType()`    | True     |
| quantity                                            | `LongType()`      | True     |
| source_id                                           | `StringType()`    | True     |
| source_type                                         | `StringType()`    | True     |
| subscription                                        | `StringType()`    | True     |
| subscription_item_id                                | `StringType()`    | True     |
| hour                                                | `StringType()`    | True     |
| table_name                                          | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 0,
  "batch_timestamp": "2025-06-04 15:00:00",
  "currency": "usd",
  "description": "1 \u00d7 Select (at $0.00 / month)",
  "discountable": true,
  "id": "il_1P0Qw9GyxyMEWHozyTyKqWXG",
  "invoice_id": "in_1P0Qw9GyxyMEWHoz7MdiZBhg",
  "invoice_item_id": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "period_end": "2024-04-30 16:08:00",
  "period_start": "2024-03-31 16:08:00",
  "plan_id": "plan_L1gfRtYofQqqhW",
  "price_id": "plan_L1gfRtYofQqqhW",
  "proration": false,
  "proration_details_credited_items_invoice": null,
  "proration_details_credited_items_invoice_line_items": null,
  "quantity": 1,
  "source_id": "sli_1b7168GyxyMEWHozdc4cb543",
  "source_type": "subscription",
  "subscription": "sub_1LRegPGyxyMEWHoz5CHEkdVb",
  "subscription_item_id": "si_M9ydyLTwAUwo8q",
  "hour": "2025062500",
  "table_name": "invoice_line_items"
}
```

---

## narrative.stripe.invoice_payments

### Schema

| Column                         | Type              | Nullable |
| ------------------------------ | ----------------- | -------- |
| amount_overpaid                | `LongType()`      | True     |
| amount_paid                    | `LongType()`      | True     |
| amount_requested               | `LongType()`      | True     |
| batch_timestamp                | `TimestampType()` | True     |
| currency                       | `StringType()`    | True     |
| id                             | `StringType()`    | True     |
| invoice                        | `StringType()`    | True     |
| is_default                     | `BooleanType()`   | True     |
| merchant_id                    | `StringType()`    | True     |
| payment_intent                 | `StringType()`    | True     |
| status                         | `StringType()`    | True     |
| status_transitions_canceled_at | `TimestampType()` | True     |
| status_transitions_paid_at     | `TimestampType()` | True     |
| hour                           | `StringType()`    | True     |
| table_name                     | `StringType()`    | True     |

### Sample Row

```json
{
  "amount_overpaid": 0,
  "amount_paid": 2000,
  "amount_requested": 2000,
  "batch_timestamp": "2025-06-25 00:00:00",
  "currency": "usd",
  "id": "inpay_1Rdfp0GyxyMEWHozSZ7tkeM9",
  "invoice": "in_1RdesSGyxyMEWHozhU5Czt28",
  "is_default": true,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "payment_intent": "pi_3Rdfp0GyxyMEWHoz1jpxH4V5",
  "status": "paid",
  "status_transitions_canceled_at": "NaT",
  "status_transitions_paid_at": "2025-06-24 23:00:11",
  "hour": "2025062500",
  "table_name": "invoice_payments"
}
```

---

## narrative.stripe.invoices

### Schema

| Column                                     | Type              | Nullable |
| ------------------------------------------ | ----------------- | -------- |
| amount_due                                 | `LongType()`      | True     |
| amount_paid                                | `LongType()`      | True     |
| amount_remaining                           | `LongType()`      | True     |
| amount_shipping                            | `LongType()`      | True     |
| application_fee                            | `LongType()`      | True     |
| application_id                             | `StringType()`    | True     |
| attempt_count                              | `LongType()`      | True     |
| attempted                                  | `BooleanType()`   | True     |
| auto_advance                               | `BooleanType()`   | True     |
| automatic_tax_enabled                      | `BooleanType()`   | True     |
| automatic_tax_status                       | `StringType()`    | True     |
| batch_timestamp                            | `TimestampType()` | True     |
| billing_reason                             | `StringType()`    | True     |
| charge_id                                  | `StringType()`    | True     |
| collection_method                          | `StringType()`    | True     |
| currency                                   | `StringType()`    | True     |
| customer_address_city                      | `StringType()`    | True     |
| customer_address_country                   | `StringType()`    | True     |
| customer_address_line1                     | `StringType()`    | True     |
| customer_address_line2                     | `StringType()`    | True     |
| customer_address_postal_code               | `StringType()`    | True     |
| customer_address_state                     | `StringType()`    | True     |
| customer_description                       | `StringType()`    | True     |
| customer_email                             | `StringType()`    | True     |
| customer_id                                | `StringType()`    | True     |
| customer_name                              | `StringType()`    | True     |
| customer_phone                             | `StringType()`    | True     |
| customer_shipping_address_city             | `StringType()`    | True     |
| customer_shipping_address_country          | `StringType()`    | True     |
| customer_shipping_address_line1            | `StringType()`    | True     |
| customer_shipping_address_line2            | `StringType()`    | True     |
| customer_shipping_address_postal_code      | `StringType()`    | True     |
| customer_shipping_address_state            | `StringType()`    | True     |
| customer_shipping_name                     | `StringType()`    | True     |
| customer_shipping_phone                    | `StringType()`    | True     |
| customer_tax_exempt                        | `StringType()`    | True     |
| date                                       | `TimestampType()` | True     |
| default_payment_method_id                  | `StringType()`    | True     |
| description                                | `StringType()`    | True     |
| discount_checkout_session                  | `StringType()`    | True     |
| discount_coupon_id                         | `StringType()`    | True     |
| discount_customer_id                       | `StringType()`    | True     |
| discount_end                               | `TimestampType()` | True     |
| discount_invoice                           | `StringType()`    | True     |
| discount_invoice_item                      | `StringType()`    | True     |
| discount_promotion_code_id                 | `StringType()`    | True     |
| discount_start                             | `TimestampType()` | True     |
| discount_subscription                      | `StringType()`    | True     |
| discount_subscription_item                 | `StringType()`    | True     |
| discounts                                  | `StringType()`    | True     |
| due_date                                   | `TimestampType()` | True     |
| effective_at                               | `TimestampType()` | True     |
| ending_balance                             | `LongType()`      | True     |
| footer                                     | `StringType()`    | True     |
| id                                         | `StringType()`    | True     |
| merchant_id                                | `StringType()`    | True     |
| next_payment_attempt                       | `TimestampType()` | True     |
| number                                     | `StringType()`    | True     |
| on_behalf_of_id                            | `StringType()`    | True     |
| paid                                       | `BooleanType()`   | True     |
| paid_out_of_band                           | `BooleanType()`   | True     |
| period_end                                 | `TimestampType()` | True     |
| period_start                               | `TimestampType()` | True     |
| post_payment_credit_notes_amount           | `LongType()`      | True     |
| pre_payment_credit_notes_amount            | `LongType()`      | True     |
| quote_id                                   | `StringType()`    | True     |
| receipt_number                             | `StringType()`    | True     |
| shipping_cost_amount_subtotal              | `LongType()`      | True     |
| shipping_cost_amount_tax                   | `LongType()`      | True     |
| shipping_cost_amount_total                 | `LongType()`      | True     |
| shipping_cost_shipping_rate_id             | `StringType()`    | True     |
| shipping_details_address_city              | `StringType()`    | True     |
| shipping_details_address_country           | `StringType()`    | True     |
| shipping_details_address_line1             | `StringType()`    | True     |
| shipping_details_address_line2             | `StringType()`    | True     |
| shipping_details_address_postal_code       | `StringType()`    | True     |
| shipping_details_address_state             | `StringType()`    | True     |
| shipping_details_name                      | `StringType()`    | True     |
| shipping_details_phone                     | `StringType()`    | True     |
| starting_balance                           | `LongType()`      | True     |
| statement_descriptor                       | `StringType()`    | True     |
| status                                     | `StringType()`    | True     |
| status_transitions_finalized_at            | `TimestampType()` | True     |
| status_transitions_marked_uncollectible_at | `TimestampType()` | True     |
| status_transitions_paid_at                 | `TimestampType()` | True     |
| status_transitions_voided_at               | `TimestampType()` | True     |
| subscription_id                            | `StringType()`    | True     |
| subscription_proration_date                | `TimestampType()` | True     |
| subtotal                                   | `LongType()`      | True     |
| tax                                        | `LongType()`      | True     |
| tax_percent                                | `DoubleType()`    | True     |
| total                                      | `LongType()`      | True     |
| transfer_data_amount                       | `LongType()`      | True     |
| transfer_data_destination_id               | `StringType()`    | True     |
| webhooks_delivered_at                      | `TimestampType()` | True     |
| hour                                       | `StringType()`    | True     |
| table_name                                 | `StringType()`    | True     |

### Sample Row

```json
{
  "amount_due": 0,
  "amount_paid": 0,
  "amount_remaining": 0,
  "amount_shipping": 0,
  "application_fee": NaN,
  "application_id": null,
  "attempt_count": 0,
  "attempted": true,
  "auto_advance": false,
  "automatic_tax_enabled": false,
  "automatic_tax_status": null,
  "batch_timestamp": "2025-06-13 00:00:00",
  "billing_reason": "subscription_cycle",
  "charge_id": null,
  "collection_method": "charge_automatically",
  "currency": "usd",
  "customer_address_city": null,
  "customer_address_country": null,
  "customer_address_line1": null,
  "customer_address_line2": null,
  "customer_address_postal_code": null,
  "customer_address_state": null,
  "customer_description": null,
  "customer_email": "sixthousandminutesphotography@gmail.com",
  "customer_id": "cus_RCqumyQ0J7Qaum",
  "customer_name": null,
  "customer_phone": null,
  "customer_shipping_address_city": null,
  "customer_shipping_address_country": null,
  "customer_shipping_address_line1": null,
  "customer_shipping_address_line2": null,
  "customer_shipping_address_postal_code": null,
  "customer_shipping_address_state": null,
  "customer_shipping_name": null,
  "customer_shipping_phone": null,
  "customer_tax_exempt": "none",
  "date": "2025-06-12 21:00:34",
  "default_payment_method_id": null,
  "description": null,
  "discount_checkout_session": null,
  "discount_coupon_id": null,
  "discount_customer_id": null,
  "discount_end": "NaT",
  "discount_invoice": null,
  "discount_invoice_item": null,
  "discount_promotion_code_id": null,
  "discount_start": "NaT",
  "discount_subscription": null,
  "discount_subscription_item": null,
  "discounts": "",
  "due_date": "NaT",
  "effective_at": "2025-06-12 22:01:35",
  "ending_balance": 0,
  "footer": "Please note that all dollar amounts are in USD, including any Tax listed.",
  "id": "in_1RZIEgGyxyMEWHozXjOCp5lh",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "next_payment_attempt": "NaT",
  "number": "DB7A7428-0008",
  "on_behalf_of_id": null,
  "paid": true,
  "paid_out_of_band": false,
  "period_end": "2025-06-12 21:00:31",
  "period_start": "2025-05-12 21:00:31",
  "post_payment_credit_notes_amount": 0,
  "pre_payment_credit_notes_amount": 0,
  "quote_id": null,
  "receipt_number": null,
  "shipping_cost_amount_subtotal": NaN,
  "shipping_cost_amount_tax": NaN,
  "shipping_cost_amount_total": NaN,
  "shipping_cost_shipping_rate_id": null,
  "shipping_details_address_city": null,
  "shipping_details_address_country": null,
  "shipping_details_address_line1": null,
  "shipping_details_address_line2": null,
  "shipping_details_address_postal_code": null,
  "shipping_details_address_state": null,
  "shipping_details_name": null,
  "shipping_details_phone": null,
  "starting_balance": 0,
  "statement_descriptor": null,
  "status": "paid",
  "status_transitions_finalized_at": "2025-06-12 22:01:35",
  "status_transitions_marked_uncollectible_at": "NaT",
  "status_transitions_paid_at": "2025-06-12 22:01:35",
  "status_transitions_voided_at": "NaT",
  "subscription_id": "sub_1QKRCNGyxyMEWHoz99HOoIeL",
  "subscription_proration_date": "NaT",
  "subtotal": 0,
  "tax": 0,
  "tax_percent": NaN,
  "total": 0,
  "transfer_data_amount": NaN,
  "transfer_data_destination_id": null,
  "webhooks_delivered_at": "2025-06-12 21:00:36",
  "hour": "2025062500",
  "table_name": "invoices"
}
```

---

## narrative.stripe.itemized_fees

### Schema

| Column                          | Type                 | Nullable |
| ------------------------------- | -------------------- | -------- |
| activity_end_time               | `TimestampType()`    | True     |
| activity_start_time             | `TimestampType()`    | True     |
| amount                          | `DecimalType(38,18)` | True     |
| balance_transaction_created     | `TimestampType()`    | True     |
| balance_transaction_description | `StringType()`       | True     |
| balance_transaction_id          | `StringType()`       | True     |
| connected_account_id            | `StringType()`       | True     |
| currency                        | `StringType()`       | True     |
| fee_category                    | `StringType()`       | True     |
| fee_transaction_created         | `TimestampType()`    | True     |
| fee_transaction_id              | `StringType()`       | True     |
| incurred_at                     | `TimestampType()`    | True     |
| incurred_by                     | `StringType()`       | True     |
| incurred_by_type                | `StringType()`       | True     |
| merchant_id                     | `StringType()`       | True     |
| platform_id                     | `StringType()`       | True     |
| pricing_tier_index              | `LongType()`         | True     |
| product_feature_description     | `StringType()`       | True     |
| tax                             | `DecimalType(38,18)` | True     |
| hour                            | `StringType()`       | True     |
| table_name                      | `StringType()`       | True     |

### Sample Row

```json
{
  "activity_end_time": "NaT",
  "activity_start_time": "NaT",
  "amount": "1.470000000000000000",
  "balance_transaction_created": "2023-12-02 17:30:01",
  "balance_transaction_description": "Invoice D8866F49-0013",
  "balance_transaction_id": "txn_3OIx0uGyxyMEWHoz0FLC3S3e",
  "connected_account_id": null,
  "currency": "nzd",
  "fee_category": "PAYMENT_PROCESSING_FEES",
  "fee_transaction_created": "1970-01-01 00:00:00",
  "fee_transaction_id": "",
  "incurred_at": "2023-12-02 00:00:00",
  "incurred_by": "ch_3OIx0uGyxyMEWHoz0k5vwVtn",
  "incurred_by_type": "charge",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "platform_id": null,
  "pricing_tier_index": NaN,
  "product_feature_description": "Card payments - Stripe fee",
  "tax": "0E-18",
  "hour": "2025031700",
  "table_name": "itemized_fees"
}
```

---

## narrative.stripe.payins_insights_lightning_astro_raw_aggregated_with_attempts_v2

### Schema

| Column                           | Type              | Nullable |
| -------------------------------- | ----------------- | -------- |
| accepted_amount                  | `LongType()`      | True     |
| accepted_amount_in_usd           | `LongType()`      | True     |
| accepted_count                   | `LongType()`      | True     |
| attributable_optimization        | `StringType()`    | True     |
| blocked_reason                   | `StringType()`    | True     |
| card_brand                       | `StringType()`    | True     |
| card_country                     | `StringType()`    | True     |
| card_input_method                | `StringType()`    | True     |
| card_type                        | `StringType()`    | True     |
| cof                              | `BooleanType()`   | True     |
| created_hour                     | `TimestampType()` | True     |
| currency                         | `StringType()`    | True     |
| decline_reason                   | `StringType()`    | True     |
| gateway_conversation_avs_outcome | `StringType()`    | True     |
| gateway_conversation_cvc_outcome | `StringType()`    | True     |
| is_connected_account             | `BooleanType()`   | True     |
| merchant_id                      | `StringType()`    | True     |
| outcome_type                     | `StringType()`    | True     |
| transaction_amount               | `LongType()`      | True     |
| transaction_amount_in_usd        | `LongType()`      | True     |
| transaction_count                | `LongType()`      | True     |
| transaction_initiator            | `StringType()`    | True     |
| used_network_tokens              | `BooleanType()`   | True     |
| hour                             | `StringType()`    | True     |
| table_name                       | `StringType()`    | True     |

### Sample Row

```json
{
  "accepted_amount": 1800,
  "accepted_amount_in_usd": 1800,
  "accepted_count": 1,
  "attributable_optimization": null,
  "blocked_reason": null,
  "card_brand": "visa",
  "card_country": "US",
  "card_input_method": "card_not_present",
  "card_type": "credit",
  "cof": true,
  "created_hour": "2023-06-15 01:00:00",
  "currency": "usd",
  "decline_reason": null,
  "gateway_conversation_avs_outcome": "avs-zip-passed",
  "gateway_conversation_cvc_outcome": "cvc-not-sent",
  "is_connected_account": false,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "outcome_type": "authorized",
  "transaction_amount": 1800,
  "transaction_amount_in_usd": 1800,
  "transaction_count": 1,
  "transaction_initiator": "merchant",
  "used_network_tokens": true,
  "hour": "2025062200",
  "table_name": "payins_insights_lightning_astro_raw_aggregated_with_attempts_v2"
}
```

---

## narrative.stripe.payment_intents

### Schema

| Column                                   | Type              | Nullable |
| ---------------------------------------- | ----------------- | -------- |
| amount                                   | `LongType()`      | True     |
| amount_capturable                        | `LongType()`      | True     |
| amount_details_discount_amount           | `LongType()`      | True     |
| amount_details_shipping_amount           | `LongType()`      | True     |
| amount_details_shipping_from_postal_code | `StringType()`    | True     |
| amount_details_shipping_to_postal_code   | `StringType()`    | True     |
| amount_details_tax_total_tax_amount      | `LongType()`      | True     |
| amount_details_tip_amount                | `LongType()`      | True     |
| application_fee_amount                   | `LongType()`      | True     |
| application_id                           | `StringType()`    | True     |
| batch_timestamp                          | `TimestampType()` | True     |
| canceled_at                              | `TimestampType()` | True     |
| cancellation_reason                      | `StringType()`    | True     |
| capture_method                           | `StringType()`    | True     |
| card_request_three_d_secure              | `StringType()`    | True     |
| confirmation_method                      | `StringType()`    | True     |
| created                                  | `TimestampType()` | True     |
| currency                                 | `StringType()`    | True     |
| customer_id                              | `StringType()`    | True     |
| description                              | `StringType()`    | True     |
| id                                       | `StringType()`    | True     |
| invoice_id                               | `StringType()`    | True     |
| last_payment_error_charge                | `StringType()`    | True     |
| last_payment_error_source                | `StringType()`    | True     |
| last_payment_error_type                  | `StringType()`    | True     |
| merchant_id                              | `StringType()`    | True     |
| on_behalf_of_id                          | `StringType()`    | True     |
| payment_details_customer_reference       | `StringType()`    | True     |
| payment_details_order_reference          | `StringType()`    | True     |
| payment_method_id                        | `StringType()`    | True     |
| payment_method_types                     | `StringType()`    | True     |
| receipt_email                            | `StringType()`    | True     |
| review_id                                | `StringType()`    | True     |
| setup_future_usage                       | `StringType()`    | True     |
| statement_descriptor                     | `StringType()`    | True     |
| statement_descriptor_suffix              | `StringType()`    | True     |
| status                                   | `StringType()`    | True     |
| hour                                     | `StringType()`    | True     |
| table_name                               | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 2000,
  "amount_capturable": 0,
  "amount_details_discount_amount": NaN,
  "amount_details_shipping_amount": NaN,
  "amount_details_shipping_from_postal_code": null,
  "amount_details_shipping_to_postal_code": null,
  "amount_details_tax_total_tax_amount": NaN,
  "amount_details_tip_amount": NaN,
  "application_fee_amount": NaN,
  "application_id": null,
  "batch_timestamp": "2025-06-25 00:00:00",
  "canceled_at": "NaT",
  "cancellation_reason": null,
  "capture_method": "automatic",
  "card_request_three_d_secure": "automatic",
  "confirmation_method": "automatic",
  "created": "2025-06-24 23:00:10",
  "currency": "usd",
  "customer_id": "cus_QKyZxBFgiL7Kx1",
  "description": "Invoice 3A9E5B78-0014",
  "id": "pi_3Rdfp0GyxyMEWHoz1jpxH4V5",
  "invoice_id": "in_1RdesSGyxyMEWHozhU5Czt28",
  "last_payment_error_charge": null,
  "last_payment_error_source": null,
  "last_payment_error_type": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "on_behalf_of_id": null,
  "payment_details_customer_reference": null,
  "payment_details_order_reference": null,
  "payment_method_id": null,
  "payment_method_types": "card, link",
  "receipt_email": "amoody9090@gmail.com",
  "review_id": null,
  "setup_future_usage": null,
  "statement_descriptor": null,
  "statement_descriptor_suffix": null,
  "status": "succeeded",
  "hour": "2025062500",
  "table_name": "payment_intents"
}
```

---

## narrative.stripe.payment_links

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| active          | `BooleanType()`   | True     |
| batch_timestamp | `TimestampType()` | True     |
| created         | `TimestampType()` | True     |
| id              | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "active": true,
  "batch_timestamp": "2024-04-16 00:00:00",
  "created": "2022-07-25 02:13:48",
  "id": "plink_1LPGnoGyxyMEWHozrHfdxRpd",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025062500",
  "table_name": "payment_links"
}
```

---

## narrative.stripe.payment_method_details

### Schema

| Column                                | Type              | Nullable |
| ------------------------------------- | ----------------- | -------- |
| ach_debit_account_holder_type         | `StringType()`    | True     |
| ach_debit_bank_name                   | `StringType()`    | True     |
| ach_debit_country                     | `StringType()`    | True     |
| ach_debit_fingerprint                 | `StringType()`    | True     |
| ach_debit_last4                       | `StringType()`    | True     |
| ach_debit_routing_number              | `StringType()`    | True     |
| acss_debit_fingerprint                | `StringType()`    | True     |
| acss_debit_institution_number         | `StringType()`    | True     |
| acss_debit_last4                      | `StringType()`    | True     |
| acss_debit_mandate_id                 | `StringType()`    | True     |
| acss_debit_transit_number             | `StringType()`    | True     |
| alipay_fingerprint                    | `StringType()`    | True     |
| alipay_transaction_id                 | `StringType()`    | True     |
| au_becs_debit_bsb_number              | `StringType()`    | True     |
| au_becs_debit_fingerprint             | `StringType()`    | True     |
| au_becs_debit_last4                   | `StringType()`    | True     |
| au_becs_debit_mandate_id              | `StringType()`    | True     |
| bacs_debit_fingerprint                | `StringType()`    | True     |
| bacs_debit_last4                      | `StringType()`    | True     |
| bacs_debit_mandate_id                 | `StringType()`    | True     |
| bacs_debit_sort_code                  | `StringType()`    | True     |
| batch_timestamp                       | `TimestampType()` | True     |
| boleto_expires_at                     | `LongType()`      | True     |
| boleto_number                         | `StringType()`    | True     |
| card_3ds_authenticated                | `BooleanType()`   | True     |
| card_3ds_succeeded                    | `BooleanType()`   | True     |
| card_3ds_version                      | `StringType()`    | True     |
| card_address_line1_check              | `StringType()`    | True     |
| card_address_postal_code_check        | `StringType()`    | True     |
| card_amount_authorized                | `LongType()`      | True     |
| card_authorization_code               | `StringType()`    | True     |
| card_brand                            | `StringType()`    | True     |
| card_brand_product                    | `StringType()`    | True     |
| card_country                          | `StringType()`    | True     |
| card_cvc_check                        | `StringType()`    | True     |
| card_exp_month                        | `LongType()`      | True     |
| card_exp_year                         | `LongType()`      | True     |
| card_fingerprint                      | `StringType()`    | True     |
| card_funding                          | `StringType()`    | True     |
| card_generated_card                   | `StringType()`    | True     |
| card_iin                              | `StringType()`    | True     |
| card_installments_plan_count          | `LongType()`      | True     |
| card_installments_plan_interval       | `StringType()`    | True     |
| card_installments_plan_type           | `StringType()`    | True     |
| card_last4                            | `StringType()`    | True     |
| card_mandate                          | `StringType()`    | True     |
| card_moto                             | `BooleanType()`   | True     |
| card_network                          | `StringType()`    | True     |
| card_network_fingerprint              | `StringType()`    | True     |
| card_network_token_used               | `BooleanType()`   | True     |
| card_network_transaction_id           | `StringType()`    | True     |
| card_payment_account_reference        | `StringType()`    | True     |
| card_read_method                      | `StringType()`    | True     |
| card_regulated_status                 | `StringType()`    | True     |
| card_wallet_apple_pay_type            | `StringType()`    | True     |
| card_wallet_type                      | `StringType()`    | True     |
| cashapp_buyer_id                      | `StringType()`    | True     |
| cashapp_cashtag                       | `StringType()`    | True     |
| charge_id                             | `StringType()`    | True     |
| customer_balance_bank_transfer_type   | `StringType()`    | True     |
| customer_balance_funding_type         | `StringType()`    | True     |
| eps_bank                              | `StringType()`    | True     |
| eps_verified_name                     | `StringType()`    | True     |
| fpx_account_holder_type               | `StringType()`    | True     |
| fpx_bank                              | `StringType()`    | True     |
| fpx_transaction_id                    | `StringType()`    | True     |
| giropay_bank_code                     | `StringType()`    | True     |
| giropay_bank_name                     | `StringType()`    | True     |
| giropay_bic                           | `StringType()`    | True     |
| giropay_verified_name                 | `StringType()`    | True     |
| ideal_bank                            | `StringType()`    | True     |
| ideal_bic                             | `StringType()`    | True     |
| ideal_fingerprint                     | `StringType()`    | True     |
| ideal_generated_sepa_debit_id         | `StringType()`    | True     |
| ideal_generated_sepa_debit_mandate_id | `StringType()`    | True     |
| ideal_iban_last4                      | `StringType()`    | True     |
| ideal_verified_name                   | `StringType()`    | True     |
| klarna_fingerprint                    | `StringType()`    | True     |
| klarna_payer_details_address_country  | `StringType()`    | True     |
| klarna_payment_method_category        | `StringType()`    | True     |
| klarna_preferred_locale               | `StringType()`    | True     |
| konbini_store_chain                   | `StringType()`    | True     |
| link_country                          | `StringType()`    | True     |
| merchant_id                           | `StringType()`    | True     |
| multibanco_entity                     | `StringType()`    | True     |
| multibanco_reference                  | `StringType()`    | True     |
| nz_bank_account_account_holder_name   | `StringType()`    | True     |
| nz_bank_account_bank_code             | `StringType()`    | True     |
| nz_bank_account_bank_name             | `StringType()`    | True     |
| nz_bank_account_branch_code           | `StringType()`    | True     |
| nz_bank_account_last4                 | `StringType()`    | True     |
| nz_bank_account_suffix                | `StringType()`    | True     |
| oxxo_number                           | `StringType()`    | True     |
| p24_bank                              | `StringType()`    | True     |
| p24_reference                         | `StringType()`    | True     |
| p24_verified_name                     | `StringType()`    | True     |
| paynow_transaction_id                 | `StringType()`    | True     |
| paypal_payer_id                       | `StringType()`    | True     |
| paypal_shipping_city                  | `StringType()`    | True     |
| paypal_shipping_country               | `StringType()`    | True     |
| paypal_shipping_line1                 | `StringType()`    | True     |
| paypal_shipping_line2                 | `StringType()`    | True     |
| paypal_shipping_postal_code           | `StringType()`    | True     |
| paypal_shipping_state                 | `StringType()`    | True     |
| paypal_transaction_id                 | `StringType()`    | True     |
| paypal_verified_email                 | `StringType()`    | True     |
| paypal_verified_name                  | `StringType()`    | True     |
| promptpay_transaction_id              | `StringType()`    | True     |
| sepa_debit_bank_code                  | `StringType()`    | True     |
| sepa_debit_branch_code                | `StringType()`    | True     |
| sepa_debit_country                    | `StringType()`    | True     |
| sepa_debit_fingerprint                | `StringType()`    | True     |
| sepa_debit_last4                      | `StringType()`    | True     |
| sepa_debit_mandate_id                 | `StringType()`    | True     |
| sofort_bank_code                      | `StringType()`    | True     |
| sofort_bank_name                      | `StringType()`    | True     |
| sofort_bic                            | `StringType()`    | True     |
| sofort_country                        | `StringType()`    | True     |
| sofort_iban_last4                     | `StringType()`    | True     |
| sofort_preferred_language             | `StringType()`    | True     |
| sofort_verified_name                  | `StringType()`    | True     |
| swish_fingerprint                     | `StringType()`    | True     |
| swish_payment_reference               | `StringType()`    | True     |
| swish_verified_phone_last4            | `StringType()`    | True     |
| terminal_location_id                  | `StringType()`    | True     |
| terminal_reader_id                    | `StringType()`    | True     |
| type                                  | `StringType()`    | True     |
| us_bank_account_account_holder_type   | `StringType()`    | True     |
| us_bank_account_account_type          | `StringType()`    | True     |
| us_bank_account_bank_name             | `StringType()`    | True     |
| us_bank_account_fingerprint           | `StringType()`    | True     |
| us_bank_account_last4                 | `StringType()`    | True     |
| us_bank_account_mandate_id            | `StringType()`    | True     |
| us_bank_account_payment_reference     | `StringType()`    | True     |
| us_bank_account_routing_number        | `StringType()`    | True     |
| hour                                  | `StringType()`    | True     |
| table_name                            | `StringType()`    | True     |

### Sample Row

```json
{
  "ach_debit_account_holder_type": null,
  "ach_debit_bank_name": null,
  "ach_debit_country": null,
  "ach_debit_fingerprint": null,
  "ach_debit_last4": null,
  "ach_debit_routing_number": null,
  "acss_debit_fingerprint": null,
  "acss_debit_institution_number": null,
  "acss_debit_last4": null,
  "acss_debit_mandate_id": null,
  "acss_debit_transit_number": null,
  "alipay_fingerprint": null,
  "alipay_transaction_id": null,
  "au_becs_debit_bsb_number": null,
  "au_becs_debit_fingerprint": null,
  "au_becs_debit_last4": null,
  "au_becs_debit_mandate_id": null,
  "bacs_debit_fingerprint": null,
  "bacs_debit_last4": null,
  "bacs_debit_mandate_id": null,
  "bacs_debit_sort_code": null,
  "batch_timestamp": "2025-06-25 00:00:00",
  "boleto_expires_at": NaN,
  "boleto_number": null,
  "card_3ds_authenticated": null,
  "card_3ds_succeeded": null,
  "card_3ds_version": null,
  "card_address_line1_check": null,
  "card_address_postal_code_check": "pass",
  "card_amount_authorized": 10800,
  "card_authorization_code": "265340",
  "card_brand": "amex",
  "card_brand_product": null,
  "card_country": "US",
  "card_cvc_check": null,
  "card_exp_month": 12,
  "card_exp_year": 2027,
  "card_fingerprint": "sRXNNchsTwyeXuSL",
  "card_funding": "credit",
  "card_generated_card": null,
  "card_iin": "376745",
  "card_installments_plan_count": NaN,
  "card_installments_plan_interval": null,
  "card_installments_plan_type": null,
  "card_last4": "1002",
  "card_mandate": null,
  "card_moto": null,
  "card_network": "amex",
  "card_network_fingerprint": null,
  "card_network_token_used": true,
  "card_network_transaction_id": "012810790973323",
  "card_payment_account_reference": null,
  "card_read_method": null,
  "card_regulated_status": "unregulated",
  "card_wallet_apple_pay_type": null,
  "card_wallet_type": null,
  "cashapp_buyer_id": null,
  "cashapp_cashtag": null,
  "charge_id": "ch_3RdIUEGyxyMEWHoz0tQY0sNV",
  "customer_balance_bank_transfer_type": null,
  "customer_balance_funding_type": null,
  "eps_bank": null,
  "eps_verified_name": null,
  "fpx_account_holder_type": null,
  "fpx_bank": null,
  "fpx_transaction_id": null,
  "giropay_bank_code": null,
  "giropay_bank_name": null,
  "giropay_bic": null,
  "giropay_verified_name": null,
  "ideal_bank": null,
  "ideal_bic": null,
  "ideal_fingerprint": null,
  "ideal_generated_sepa_debit_id": null,
  "ideal_generated_sepa_debit_mandate_id": null,
  "ideal_iban_last4": null,
  "ideal_verified_name": null,
  "klarna_fingerprint": null,
  "klarna_payer_details_address_country": null,
  "klarna_payment_method_category": null,
  "klarna_preferred_locale": null,
  "konbini_store_chain": null,
  "link_country": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "multibanco_entity": null,
  "multibanco_reference": null,
  "nz_bank_account_account_holder_name": null,
  "nz_bank_account_bank_code": null,
  "nz_bank_account_bank_name": null,
  "nz_bank_account_branch_code": null,
  "nz_bank_account_last4": null,
  "nz_bank_account_suffix": null,
  "oxxo_number": null,
  "p24_bank": null,
  "p24_reference": null,
  "p24_verified_name": null,
  "paynow_transaction_id": null,
  "paypal_payer_id": null,
  "paypal_shipping_city": null,
  "paypal_shipping_country": null,
  "paypal_shipping_line1": null,
  "paypal_shipping_line2": null,
  "paypal_shipping_postal_code": null,
  "paypal_shipping_state": null,
  "paypal_transaction_id": null,
  "paypal_verified_email": null,
  "paypal_verified_name": null,
  "promptpay_transaction_id": null,
  "sepa_debit_bank_code": null,
  "sepa_debit_branch_code": null,
  "sepa_debit_country": null,
  "sepa_debit_fingerprint": null,
  "sepa_debit_last4": null,
  "sepa_debit_mandate_id": null,
  "sofort_bank_code": null,
  "sofort_bank_name": null,
  "sofort_bic": null,
  "sofort_country": null,
  "sofort_iban_last4": null,
  "sofort_preferred_language": null,
  "sofort_verified_name": null,
  "swish_fingerprint": null,
  "swish_payment_reference": null,
  "swish_verified_phone_last4": null,
  "terminal_location_id": null,
  "terminal_reader_id": null,
  "type": "card",
  "us_bank_account_account_holder_type": null,
  "us_bank_account_account_type": null,
  "us_bank_account_bank_name": null,
  "us_bank_account_fingerprint": null,
  "us_bank_account_last4": null,
  "us_bank_account_mandate_id": null,
  "us_bank_account_payment_reference": null,
  "us_bank_account_routing_number": null,
  "hour": "2025062500",
  "table_name": "payment_method_details"
}
```

---

## narrative.stripe.payment_methods

### Schema

| Column                                     | Type              | Nullable |
| ------------------------------------------ | ----------------- | -------- |
| acss_debit_fingerprint                     | `StringType()`    | True     |
| acss_debit_institution_number              | `StringType()`    | True     |
| acss_debit_last4                           | `StringType()`    | True     |
| acss_debit_transit_number                  | `StringType()`    | True     |
| au_becs_debit_bsb_number                   | `StringType()`    | True     |
| au_becs_debit_fingerprint                  | `StringType()`    | True     |
| au_becs_debit_last4                        | `StringType()`    | True     |
| bacs_debit_fingerprint                     | `StringType()`    | True     |
| bacs_debit_last4                           | `StringType()`    | True     |
| bacs_debit_sort_code                       | `StringType()`    | True     |
| batch_timestamp                            | `TimestampType()` | True     |
| billing_details_address_city               | `StringType()`    | True     |
| billing_details_address_country            | `StringType()`    | True     |
| billing_details_address_line1              | `StringType()`    | True     |
| billing_details_address_line2              | `StringType()`    | True     |
| billing_details_address_postal_code        | `StringType()`    | True     |
| billing_details_address_state              | `StringType()`    | True     |
| billing_details_email                      | `StringType()`    | True     |
| billing_details_name                       | `StringType()`    | True     |
| billing_details_phone                      | `StringType()`    | True     |
| boleto_tax_id                              | `StringType()`    | True     |
| card_address_line1_check                   | `StringType()`    | True     |
| card_address_postal_code_check             | `StringType()`    | True     |
| card_brand                                 | `StringType()`    | True     |
| card_brand_product                         | `StringType()`    | True     |
| card_country                               | `StringType()`    | True     |
| card_cvc_check                             | `StringType()`    | True     |
| card_exp_month                             | `LongType()`      | True     |
| card_exp_year                              | `LongType()`      | True     |
| card_fingerprint                           | `StringType()`    | True     |
| card_funding                               | `StringType()`    | True     |
| card_generated_from_charge_id              | `StringType()`    | True     |
| card_iin                                   | `StringType()`    | True     |
| card_last4                                 | `StringType()`    | True     |
| card_network_fingerprint                   | `StringType()`    | True     |
| card_payment_account_reference             | `StringType()`    | True     |
| card_regulated_status                      | `StringType()`    | True     |
| card_three_d_secure_supported              | `BooleanType()`   | True     |
| card_wallet_apple_pay_type                 | `StringType()`    | True     |
| card_wallet_type                           | `StringType()`    | True     |
| cashapp_buyer_id                           | `StringType()`    | True     |
| cashapp_cashtag                            | `StringType()`    | True     |
| created                                    | `TimestampType()` | True     |
| customer_id                                | `StringType()`    | True     |
| eps_bank                                   | `StringType()`    | True     |
| fpx_account_holder_type                    | `StringType()`    | True     |
| fpx_bank                                   | `StringType()`    | True     |
| id                                         | `StringType()`    | True     |
| ideal_bank                                 | `StringType()`    | True     |
| ideal_bic                                  | `StringType()`    | True     |
| klarna_dob_day                             | `LongType()`      | True     |
| klarna_dob_month                           | `LongType()`      | True     |
| klarna_dob_year                            | `LongType()`      | True     |
| link_email                                 | `StringType()`    | True     |
| merchant_id                                | `StringType()`    | True     |
| nz_bank_account_account_holder_name        | `StringType()`    | True     |
| nz_bank_account_bank_code                  | `StringType()`    | True     |
| nz_bank_account_bank_name                  | `StringType()`    | True     |
| nz_bank_account_branch_code                | `StringType()`    | True     |
| nz_bank_account_last4                      | `StringType()`    | True     |
| nz_bank_account_suffix                     | `StringType()`    | True     |
| p24_bank                                   | `StringType()`    | True     |
| paypal_payer_email                         | `StringType()`    | True     |
| paypal_payer_id                            | `StringType()`    | True     |
| sepa_debit_bank_code                       | `StringType()`    | True     |
| sepa_debit_branch_code                     | `StringType()`    | True     |
| sepa_debit_country                         | `StringType()`    | True     |
| sepa_debit_fingerprint                     | `StringType()`    | True     |
| sepa_debit_generated_from_charge_id        | `StringType()`    | True     |
| sepa_debit_generated_from_setup_attempt_id | `StringType()`    | True     |
| sepa_debit_last4                           | `StringType()`    | True     |
| sofort_country                             | `StringType()`    | True     |
| type                                       | `StringType()`    | True     |
| us_bank_account_account_holder_type        | `StringType()`    | True     |
| us_bank_account_account_type               | `StringType()`    | True     |
| us_bank_account_fingerprint                | `StringType()`    | True     |
| us_bank_account_last4                      | `StringType()`    | True     |
| us_bank_account_linked_account             | `StringType()`    | True     |
| us_bank_account_routing_number             | `StringType()`    | True     |
| hour                                       | `StringType()`    | True     |
| table_name                                 | `StringType()`    | True     |

### Sample Row

```json
{
  "acss_debit_fingerprint": null,
  "acss_debit_institution_number": null,
  "acss_debit_last4": null,
  "acss_debit_transit_number": null,
  "au_becs_debit_bsb_number": null,
  "au_becs_debit_fingerprint": null,
  "au_becs_debit_last4": null,
  "bacs_debit_fingerprint": null,
  "bacs_debit_last4": null,
  "bacs_debit_sort_code": null,
  "batch_timestamp": "2025-06-25 03:00:00",
  "billing_details_address_city": "Silverdale",
  "billing_details_address_country": "US",
  "billing_details_address_line1": "3429 NW Kensington Lane",
  "billing_details_address_line2": "105",
  "billing_details_address_postal_code": "98383",
  "billing_details_address_state": "WA",
  "billing_details_email": null,
  "billing_details_name": "Mason Enfinger",
  "billing_details_phone": null,
  "boleto_tax_id": null,
  "card_address_line1_check": "pass",
  "card_address_postal_code_check": "pass",
  "card_brand": "mastercard",
  "card_brand_product": "MDB",
  "card_country": "US",
  "card_cvc_check": "pass",
  "card_exp_month": 10,
  "card_exp_year": 2023,
  "card_fingerprint": "vmnX5GcJKviNL0FX",
  "card_funding": "debit",
  "card_generated_from_charge_id": null,
  "card_iin": "557231",
  "card_last4": "2005",
  "card_network_fingerprint": null,
  "card_payment_account_reference": null,
  "card_regulated_status": "unregulated",
  "card_three_d_secure_supported": true,
  "card_wallet_apple_pay_type": null,
  "card_wallet_type": null,
  "cashapp_buyer_id": null,
  "cashapp_cashtag": null,
  "created": "2020-06-24 23:54:38",
  "customer_id": "cus_HUTByWzmXz6fZY",
  "eps_bank": null,
  "fpx_account_holder_type": null,
  "fpx_bank": null,
  "id": "card_1GxiQMGyxyMEWHozFzZmuSVT",
  "ideal_bank": null,
  "ideal_bic": null,
  "klarna_dob_day": NaN,
  "klarna_dob_month": NaN,
  "klarna_dob_year": NaN,
  "link_email": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "nz_bank_account_account_holder_name": null,
  "nz_bank_account_bank_code": null,
  "nz_bank_account_bank_name": null,
  "nz_bank_account_branch_code": null,
  "nz_bank_account_last4": null,
  "nz_bank_account_suffix": null,
  "p24_bank": null,
  "paypal_payer_email": null,
  "paypal_payer_id": null,
  "sepa_debit_bank_code": null,
  "sepa_debit_branch_code": null,
  "sepa_debit_country": null,
  "sepa_debit_fingerprint": null,
  "sepa_debit_generated_from_charge_id": null,
  "sepa_debit_generated_from_setup_attempt_id": null,
  "sepa_debit_last4": null,
  "sofort_country": null,
  "type": "card",
  "us_bank_account_account_holder_type": null,
  "us_bank_account_account_type": null,
  "us_bank_account_fingerprint": null,
  "us_bank_account_last4": null,
  "us_bank_account_linked_account": null,
  "us_bank_account_routing_number": null,
  "hour": "2025062500",
  "table_name": "payment_methods"
}
```

---

## narrative.stripe.payment_reviews

### Schema

| Column                        | Type              | Nullable |
| ----------------------------- | ----------------- | -------- |
| batch_timestamp               | `TimestampType()` | True     |
| charge_id                     | `StringType()`    | True     |
| created                       | `TimestampType()` | True     |
| early_fraud_warning_id        | `StringType()`    | True     |
| id                            | `StringType()`    | True     |
| merchant_id                   | `StringType()`    | True     |
| open                          | `BooleanType()`   | True     |
| payment_intent_id             | `StringType()`    | True     |
| reason                        | `StringType()`    | True     |
| recommended_refund_created_at | `TimestampType()` | True     |
| hour                          | `StringType()`    | True     |
| table_name                    | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2022-11-24 06:00:00",
  "charge_id": "ch_1CKbl2GyxyMEWHozLigF2hvr",
  "created": "2018-04-25 00:45:17",
  "early_fraud_warning_id": null,
  "id": "prv_1CKbl3GyxyMEWHoz8YDPsrKX",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "open": false,
  "payment_intent_id": null,
  "reason": "approved",
  "recommended_refund_created_at": "NaT",
  "hour": "2025062500",
  "table_name": "payment_reviews"
}
```

---

## narrative.stripe.plans

### Schema

| Column                    | Type              | Nullable |
| ------------------------- | ----------------- | -------- |
| aggregate_usage           | `StringType()`    | True     |
| amount                    | `LongType()`      | True     |
| batch_timestamp           | `TimestampType()` | True     |
| billing_scheme            | `StringType()`    | True     |
| created                   | `TimestampType()` | True     |
| currency                  | `StringType()`    | True     |
| id                        | `StringType()`    | True     |
| interval                  | `StringType()`    | True     |
| interval_count            | `LongType()`      | True     |
| merchant_id               | `StringType()`    | True     |
| nickname                  | `StringType()`    | True     |
| product_id                | `StringType()`    | True     |
| tiers_mode                | `StringType()`    | True     |
| transform_usage_divide_by | `LongType()`      | True     |
| transform_usage_round     | `StringType()`    | True     |
| trial_period_days         | `LongType()`      | True     |
| unit_amount_decimal       | `StringType()`    | True     |
| usage_type                | `StringType()`    | True     |
| hour                      | `StringType()`    | True     |
| table_name                | `StringType()`    | True     |

### Sample Row

```json
{
  "aggregate_usage": null,
  "amount": 0,
  "batch_timestamp": "2024-02-21 18:00:00",
  "billing_scheme": "per_unit",
  "created": "2018-03-20 03:40:55",
  "currency": "usd",
  "id": "narrative_free_4",
  "interval": "month",
  "interval_count": 1,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "nickname": null,
  "product_id": "prod_CWeeiT1LDdTDPj",
  "tiers_mode": null,
  "transform_usage_divide_by": NaN,
  "transform_usage_round": null,
  "trial_period_days": NaN,
  "unit_amount_decimal": "0.0",
  "usage_type": "licensed",
  "hour": "2025062500",
  "table_name": "plans"
}
```

---

## narrative.stripe.plans_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| plan_id         | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-02-21 18:00:00",
  "key": "max_posts",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "plan_id": "narrative_free_4",
  "value": "4",
  "hour": "2025062500",
  "table_name": "plans_metadata"
}
```

---

## narrative.stripe.prices

### Schema

| Column                       | Type              | Nullable |
| ---------------------------- | ----------------- | -------- |
| active                       | `BooleanType()`   | True     |
| batch_timestamp              | `TimestampType()` | True     |
| billing_scheme               | `StringType()`    | True     |
| created                      | `TimestampType()` | True     |
| currency                     | `StringType()`    | True     |
| custom_unit_amount_default   | `LongType()`      | True     |
| custom_unit_amount_maximum   | `LongType()`      | True     |
| custom_unit_amount_minimum   | `LongType()`      | True     |
| id                           | `StringType()`    | True     |
| lookup_key                   | `StringType()`    | True     |
| merchant_id                  | `StringType()`    | True     |
| nickname                     | `StringType()`    | True     |
| product_id                   | `StringType()`    | True     |
| recurring_aggregate_usage    | `StringType()`    | True     |
| recurring_interval           | `StringType()`    | True     |
| recurring_interval_count     | `LongType()`      | True     |
| recurring_meter_id           | `StringType()`    | True     |
| recurring_trial_period_days  | `LongType()`      | True     |
| recurring_usage_type         | `StringType()`    | True     |
| tax_behavior                 | `StringType()`    | True     |
| tiers_mode                   | `StringType()`    | True     |
| transform_quantity_divide_by | `LongType()`      | True     |
| transform_quantity_round     | `StringType()`    | True     |
| type                         | `StringType()`    | True     |
| unit_amount                  | `LongType()`      | True     |
| unit_amount_decimal          | `StringType()`    | True     |
| hour                         | `StringType()`    | True     |
| table_name                   | `StringType()`    | True     |

### Sample Row

```json
{
  "active": false,
  "batch_timestamp": "2024-03-11 06:00:00",
  "billing_scheme": "per_unit",
  "created": "2018-03-20 03:40:55",
  "currency": "usd",
  "custom_unit_amount_default": NaN,
  "custom_unit_amount_maximum": NaN,
  "custom_unit_amount_minimum": NaN,
  "id": "narrative_free_4",
  "lookup_key": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "nickname": null,
  "product_id": "prod_CWeeiT1LDdTDPj",
  "recurring_aggregate_usage": null,
  "recurring_interval": "month",
  "recurring_interval_count": 1,
  "recurring_meter_id": null,
  "recurring_trial_period_days": NaN,
  "recurring_usage_type": "licensed",
  "tax_behavior": "unspecified",
  "tiers_mode": null,
  "transform_quantity_divide_by": NaN,
  "transform_quantity_round": null,
  "type": "recurring",
  "unit_amount": 0,
  "unit_amount_decimal": "0.0",
  "hour": "2025062500",
  "table_name": "prices"
}
```

---

## narrative.stripe.prices_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| price_id        | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2024-03-11 06:00:00",
  "key": "max_posts",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "price_id": "narrative_free_4",
  "value": "4",
  "hour": "2025062500",
  "table_name": "prices_metadata"
}
```

---

## narrative.stripe.processed_hours

### Schema

| Column           | Type              | Nullable |
| ---------------- | ----------------- | -------- |
| hour             | `StringType()`    | True     |
| processed_tables | `StringType()`    | True     |
| processed_time   | `TimestampType()` | True     |

### Sample Row

```json
{
  "hour": "2025062221",
  "processed_tables": "[\"accounts\", \"balance_transaction_fee_details\", \"balance_transactions\", \"charges\", \"checkout_custom_fields\", \"checkout_line_items\", \"checkout_sessions\", \"coupons\", \"coupons_metadata\", \"credit_note_discount_amounts\", \"credit_note_line_item_discount_amounts\", \"credit_note_line_item_tax_amounts\", \"credit_note_line_items\", \"credit_note_tax_amounts\", \"credit_notes\", \"customer_balance_transactions\", \"customer_balance_transactions_metadata\", \"customer_tax_ids\", \"customers\", \"customers_metadata\", \"discounts\", \"disputes\", \"disputes_enhanced_eligibility\", \"early_fraud_warnings\", \"invoice_custom_fields\", \"invoice_customer_tax_ids\", \"invoice_items\", \"invoice_line_item_discount_amounts\", \"invoice_line_item_tax_amounts\", \"invoice_line_items\", \"invoice_payments\", \"invoices\", \"payment_intents\", \"payment_links\", \"payment_method_details\", \"payment_methods\", \"payment_reviews\", \"plans\", \"plans_metadata\", \"prices\", \"prices_metadata\", \"products\", \"products_metadata\", \"promotion_codes\", \"refunds\", \"rule_decisions\", \"setup_attempts\", \"setup_intents\", \"sources\", \"subscription_items\", \"subscription_schedule_phase_configuration_items\", \"subscription_schedule_phases\", \"subscription_schedule_phases_metadata\", \"subscription_schedules\", \"subscriptions\", \"subscriptions_metadata\", \"tax_rates\", \"transfers\"]",
  "processed_time": "2025-06-23 00:19:06.828012"
}
```

---

## narrative.stripe.products

### Schema

| Column               | Type              | Nullable |
| -------------------- | ----------------- | -------- |
| active               | `BooleanType()`   | True     |
| batch_timestamp      | `TimestampType()` | True     |
| caption              | `StringType()`    | True     |
| created              | `TimestampType()` | True     |
| deactivate_on        | `StringType()`    | True     |
| description          | `StringType()`    | True     |
| id                   | `StringType()`    | True     |
| merchant_id          | `StringType()`    | True     |
| name                 | `StringType()`    | True     |
| shippable            | `BooleanType()`   | True     |
| statement_descriptor | `StringType()`    | True     |
| type                 | `StringType()`    | True     |
| unit_label           | `StringType()`    | True     |
| url                  | `StringType()`    | True     |
| hour                 | `StringType()`    | True     |
| table_name           | `StringType()`    | True     |

### Sample Row

```json
{
  "active": false,
  "batch_timestamp": "2022-11-24 06:00:00",
  "caption": null,
  "created": "2018-03-20 03:40:55",
  "deactivate_on": null,
  "description": null,
  "id": "prod_CWeeiT1LDdTDPj",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "name": "Free",
  "shippable": null,
  "statement_descriptor": "Narrative Free",
  "type": "service",
  "unit_label": null,
  "url": null,
  "hour": "2025062500",
  "table_name": "products"
}
```

---

## narrative.stripe.products_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| product_id      | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2022-11-24 06:00:00",
  "key": "next_plan_id",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "product_id": "prod_CWeeiT1LDdTDPj",
  "value": "123",
  "hour": "2025062500",
  "table_name": "products_metadata"
}
```

---

## narrative.stripe.promotion_codes

### Schema

| Column                              | Type              | Nullable |
| ----------------------------------- | ----------------- | -------- |
| active                              | `BooleanType()`   | True     |
| batch_timestamp                     | `TimestampType()` | True     |
| code                                | `StringType()`    | True     |
| coupon_id                           | `StringType()`    | True     |
| created                             | `TimestampType()` | True     |
| customer_id                         | `StringType()`    | True     |
| expires_at                          | `LongType()`      | True     |
| id                                  | `StringType()`    | True     |
| max_redemptions                     | `LongType()`      | True     |
| merchant_id                         | `StringType()`    | True     |
| restrictions_first_time_transaction | `BooleanType()`   | True     |
| restrictions_minium_amount          | `LongType()`      | True     |
| restrictions_minium_amount_currency | `StringType()`    | True     |
| times_redeemed                      | `LongType()`      | True     |
| hour                                | `StringType()`    | True     |
| table_name                          | `StringType()`    | True     |

### Sample Row

```json
{
  "active": false,
  "batch_timestamp": "2024-08-22 12:00:00",
  "code": "iwpoty",
  "coupon_id": "co_1Pe52FGyxyMEWHozKP5eihEP",
  "created": "2024-07-19 00:50:59",
  "customer_id": null,
  "expires_at": 32503680000,
  "id": "promo_1Pe52FGyxyMEWHoznp24VOFx",
  "max_redemptions": NaN,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "restrictions_first_time_transaction": true,
  "restrictions_minium_amount": NaN,
  "restrictions_minium_amount_currency": null,
  "times_redeemed": 0,
  "hour": "2025062500",
  "table_name": "promotion_codes"
}
```

---

## narrative.stripe.radar_rules

### Schema

| Column      | Type           | Nullable |
| ----------- | -------------- | -------- |
| action      | `StringType()` | True     |
| merchant_id | `StringType()` | True     |
| predicate   | `StringType()` | True     |
| rule_id     | `StringType()` | True     |
| hour        | `StringType()` | True     |
| table_name  | `StringType()` | True     |

### Sample Row

```json
{
  "action": "block",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "predicate": ":charge_description: in @charge_description_blocklist or :ip_country: in @client_ip_country_blocklist or :card_country: in @card_country_blocklist or :email_domain: in @email_domain_blocklist or :ip_address: in @client_ip_address_blocklist or :card_bin: in @card_bin_blocklist or :email: in @email_blocklist or :card_fingerprint: in @card_fingerprint_blocklist",
  "rule_id": "block_if_in_blocklist",
  "hour": "2025031700",
  "table_name": "radar_rules"
}
```

---

## narrative.stripe.recoveries

### Schema

| Column                         | Type              | Nullable |
| ------------------------------ | ----------------- | -------- |
| amount_due                     | `LongType()`      | True     |
| amount_paid                    | `LongType()`      | True     |
| attempt_count                  | `LongType()`      | True     |
| id                             | `StringType()`    | True     |
| initial_failed_amount          | `LongType()`      | True     |
| initial_payment_decline_reason | `StringType()`    | True     |
| initial_payment_failed_at      | `TimestampType()` | True     |
| merchant_id                    | `StringType()`    | True     |
| next_payment_attempt           | `TimestampType()` | True     |
| on_behalf_of_id                | `StringType()`    | True     |
| paid_at                        | `TimestampType()` | True     |
| recovered_amount               | `LongType()`      | True     |
| recovered_at                   | `TimestampType()` | True     |
| recovery_method                | `StringType()`    | True     |
| reporting_currency             | `StringType()`    | True     |
| retries_exhausted              | `BooleanType()`   | True     |
| retry_attempt_count            | `LongType()`      | True     |
| source_id                      | `StringType()`    | True     |
| source_type                    | `StringType()`    | True     |
| hour                           | `StringType()`    | True     |
| table_name                     | `StringType()`    | True     |

### Sample Row

```json
{
  "amount_due": 3490,
  "amount_paid": 3490,
  "attempt_count": 1,
  "id": "in_1QwQnJGyxyMEWHozkOTwHUQH",
  "initial_failed_amount": NaN,
  "initial_payment_decline_reason": null,
  "initial_payment_failed_at": "NaT",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "next_payment_attempt": "NaT",
  "on_behalf_of_id": null,
  "paid_at": "2025-02-25 17:16:23.992000",
  "recovered_amount": NaN,
  "recovered_at": "NaT",
  "recovery_method": null,
  "reporting_currency": "nzd",
  "retries_exhausted": true,
  "retry_attempt_count": 1,
  "source_id": "in_1QwQnJGyxyMEWHozkOTwHUQH",
  "source_type": "invoice",
  "hour": "2025031700",
  "table_name": "recoveries"
}
```

---

## narrative.stripe.refunds

### Schema

| Column                         | Type              | Nullable |
| ------------------------------ | ----------------- | -------- |
| acquirer_reference_number      | `StringType()`    | True     |
| amount                         | `LongType()`      | True     |
| balance_transaction_id         | `StringType()`    | True     |
| batch_timestamp                | `TimestampType()` | True     |
| charge_id                      | `StringType()`    | True     |
| created                        | `TimestampType()` | True     |
| currency                       | `StringType()`    | True     |
| failure_balance_transaction_id | `StringType()`    | True     |
| failure_reason                 | `StringType()`    | True     |
| id                             | `StringType()`    | True     |
| merchant_id                    | `StringType()`    | True     |
| reason                         | `StringType()`    | True     |
| receipt_number                 | `StringType()`    | True     |
| refund_description             | `StringType()`    | True     |
| refund_payment_intent          | `StringType()`    | True     |
| refund_transfer_reversal_id    | `StringType()`    | True     |
| source_transfer_reversal_id    | `StringType()`    | True     |
| status                         | `StringType()`    | True     |
| hour                           | `StringType()`    | True     |
| table_name                     | `StringType()`    | True     |

### Sample Row

```json
{
  "acquirer_reference_number": null,
  "amount": 10800,
  "balance_transaction_id": "txn_3RdIUEGyxyMEWHoz0j4owe4q",
  "batch_timestamp": "2025-06-25 00:00:00",
  "charge_id": "ch_3RdIUEGyxyMEWHoz0tQY0sNV",
  "created": "2025-06-24 23:51:39",
  "currency": "usd",
  "failure_balance_transaction_id": null,
  "failure_reason": null,
  "id": "re_3RdIUEGyxyMEWHoz0O3pqEdN",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "reason": null,
  "receipt_number": "3854-7852",
  "refund_description": null,
  "refund_payment_intent": "pi_3RdIUEGyxyMEWHoz0CL7DSAH",
  "refund_transfer_reversal_id": null,
  "source_transfer_reversal_id": null,
  "status": "succeeded",
  "hour": "2025062500",
  "table_name": "refunds"
}
```

---

## narrative.stripe.rule_decisions

### Schema

| Column                      | Type              | Nullable |
| --------------------------- | ----------------- | -------- |
| action                      | `StringType()`    | True     |
| batch_timestamp             | `TimestampType()` | True     |
| charge_id                   | `StringType()`    | True     |
| created                     | `TimestampType()` | True     |
| id                          | `StringType()`    | True     |
| merchant_id                 | `StringType()`    | True     |
| payment_intent_id           | `StringType()`    | True     |
| rule_id                     | `StringType()`    | True     |
| rule_override_by_allow_rule | `BooleanType()`   | True     |
| setup_intent_id             | `StringType()`    | True     |
| hour                        | `StringType()`    | True     |
| table_name                  | `StringType()`    | True     |

### Sample Row

```json
{
  "action": "block",
  "batch_timestamp": "2022-11-24 06:00:00",
  "charge_id": "ch_1GzzDaGyxyMEWHozJQMGhbHE",
  "created": "2020-07-01 06:14:51",
  "id": "srd_1GzzDbGyxyMEWHozsxrGFv1Y",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "payment_intent_id": null,
  "rule_id": "block_if_high_risk",
  "rule_override_by_allow_rule": true,
  "setup_intent_id": null,
  "hour": "2025062500",
  "table_name": "rule_decisions"
}
```

---

## narrative.stripe.setup_attempts

### Schema

| Column                           | Type              | Nullable |
| -------------------------------- | ----------------- | -------- |
| application_id                   | `StringType()`    | True     |
| batch_timestamp                  | `TimestampType()` | True     |
| created                          | `TimestampType()` | True     |
| customer_id                      | `StringType()`    | True     |
| flow_directions                  | `StringType()`    | True     |
| id                               | `StringType()`    | True     |
| merchant_id                      | `StringType()`    | True     |
| on_behalf_of_id                  | `StringType()`    | True     |
| outcome_risk_score               | `LongType()`      | True     |
| outcome_rule                     | `StringType()`    | True     |
| outcome_type                     | `StringType()`    | True     |
| payment_method_id                | `StringType()`    | True     |
| setup_error_advice_code          | `StringType()`    | True     |
| setup_error_code                 | `StringType()`    | True     |
| setup_error_decline_code         | `StringType()`    | True     |
| setup_error_doc_url              | `StringType()`    | True     |
| setup_error_message              | `StringType()`    | True     |
| setup_error_network_advice_code  | `StringType()`    | True     |
| setup_error_network_decline_code | `StringType()`    | True     |
| setup_error_param                | `StringType()`    | True     |
| setup_error_payment_method_id    | `StringType()`    | True     |
| setup_error_type                 | `StringType()`    | True     |
| setup_intent_id                  | `StringType()`    | True     |
| status                           | `StringType()`    | True     |
| usage                            | `StringType()`    | True     |
| hour                             | `StringType()`    | True     |
| table_name                       | `StringType()`    | True     |

### Sample Row

```json
{
  "application_id": null,
  "batch_timestamp": "2023-08-25 18:00:00",
  "created": "2020-03-20 17:13:17",
  "customer_id": "cus_GwhobQODkuOUSD",
  "flow_directions": null,
  "id": "setatt_1GOoPJGyxyMEWHozeHpPqlq8",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "on_behalf_of_id": null,
  "outcome_risk_score": NaN,
  "outcome_rule": null,
  "outcome_type": null,
  "payment_method_id": "card_1GOoPGGyxyMEWHoz8FG5YO33",
  "setup_error_advice_code": null,
  "setup_error_code": null,
  "setup_error_decline_code": null,
  "setup_error_doc_url": null,
  "setup_error_message": null,
  "setup_error_network_advice_code": null,
  "setup_error_network_decline_code": null,
  "setup_error_param": null,
  "setup_error_payment_method_id": null,
  "setup_error_type": null,
  "setup_intent_id": "seti_1GOoPJGyxyMEWHozCRTtRmtK",
  "status": "succeeded",
  "usage": "off_session",
  "hour": "2025062500",
  "table_name": "setup_attempts"
}
```

---

## narrative.stripe.setup_intents

### Schema

| Column                                | Type              | Nullable |
| ------------------------------------- | ----------------- | -------- |
| application_id                        | `StringType()`    | True     |
| batch_timestamp                       | `TimestampType()` | True     |
| cancellation_reason                   | `StringType()`    | True     |
| card_request_three_d_secure           | `StringType()`    | True     |
| created                               | `TimestampType()` | True     |
| customer_id                           | `StringType()`    | True     |
| description                           | `StringType()`    | True     |
| flow_directions                       | `StringType()`    | True     |
| id                                    | `StringType()`    | True     |
| last_setup_error_advice_code          | `StringType()`    | True     |
| last_setup_error_code                 | `StringType()`    | True     |
| last_setup_error_decline_code         | `StringType()`    | True     |
| last_setup_error_doc_url              | `StringType()`    | True     |
| last_setup_error_message              | `StringType()`    | True     |
| last_setup_error_network_advice_code  | `StringType()`    | True     |
| last_setup_error_network_decline_code | `StringType()`    | True     |
| last_setup_error_param                | `StringType()`    | True     |
| last_setup_error_payment_method_id    | `StringType()`    | True     |
| last_setup_error_type                 | `StringType()`    | True     |
| latest_attempt_id                     | `StringType()`    | True     |
| mandate_id                            | `StringType()`    | True     |
| merchant_id                           | `StringType()`    | True     |
| on_behalf_of_id                       | `StringType()`    | True     |
| payment_method_id                     | `StringType()`    | True     |
| payment_method_types                  | `StringType()`    | True     |
| single_use_mandate_id                 | `StringType()`    | True     |
| status                                | `StringType()`    | True     |
| usage                                 | `StringType()`    | True     |
| hour                                  | `StringType()`    | True     |
| table_name                            | `StringType()`    | True     |

### Sample Row

```json
{
  "application_id": null,
  "batch_timestamp": "2025-06-25 00:00:00",
  "cancellation_reason": null,
  "card_request_three_d_secure": "automatic",
  "created": "2025-06-24 23:00:01",
  "customer_id": "cus_SYnP8fNc0ULcq2",
  "description": null,
  "flow_directions": null,
  "id": "seti_1RdforGyxyMEWHozceC8HFIR",
  "last_setup_error_advice_code": null,
  "last_setup_error_code": null,
  "last_setup_error_decline_code": null,
  "last_setup_error_doc_url": null,
  "last_setup_error_message": null,
  "last_setup_error_network_advice_code": null,
  "last_setup_error_network_decline_code": null,
  "last_setup_error_param": null,
  "last_setup_error_payment_method_id": null,
  "last_setup_error_type": null,
  "latest_attempt_id": null,
  "mandate_id": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "on_behalf_of_id": null,
  "payment_method_id": null,
  "payment_method_types": "card, link",
  "single_use_mandate_id": null,
  "status": "requires_payment_method",
  "usage": "off_session",
  "hour": "2025062500",
  "table_name": "setup_intents"
}
```

---

## narrative.stripe.sources

### Schema

| Column                               | Type              | Nullable |
| ------------------------------------ | ----------------- | -------- |
| amount                               | `LongType()`      | True     |
| batch_timestamp                      | `TimestampType()` | True     |
| client_secret                        | `StringType()`    | True     |
| code_verification_attempts_remaining | `LongType()`      | True     |
| code_verification_status             | `StringType()`    | True     |
| created                              | `TimestampType()` | True     |
| currency                             | `StringType()`    | True     |
| flow                                 | `StringType()`    | True     |
| id                                   | `StringType()`    | True     |
| merchant_id                          | `StringType()`    | True     |
| owner_address_city                   | `StringType()`    | True     |
| owner_address_country                | `StringType()`    | True     |
| owner_address_line1                  | `StringType()`    | True     |
| owner_address_line2                  | `StringType()`    | True     |
| owner_address_postal_code            | `StringType()`    | True     |
| owner_address_state                  | `StringType()`    | True     |
| owner_email                          | `StringType()`    | True     |
| owner_name                           | `StringType()`    | True     |
| owner_phone                          | `StringType()`    | True     |
| owner_verified_address_city          | `StringType()`    | True     |
| owner_verified_address_country       | `StringType()`    | True     |
| owner_verified_address_line1         | `StringType()`    | True     |
| owner_verified_address_line2         | `StringType()`    | True     |
| owner_verified_address_postal_code   | `StringType()`    | True     |
| owner_verified_address_state         | `StringType()`    | True     |
| owner_verified_email                 | `StringType()`    | True     |
| owner_verified_name                  | `StringType()`    | True     |
| owner_verified_phone                 | `StringType()`    | True     |
| receiver_address                     | `StringType()`    | True     |
| receiver_amount_charged              | `LongType()`      | True     |
| receiver_amount_received             | `LongType()`      | True     |
| receiver_amount_returned             | `LongType()`      | True     |
| redirect_failure_reason              | `StringType()`    | True     |
| redirect_return_url                  | `StringType()`    | True     |
| redirect_status                      | `StringType()`    | True     |
| redirect_url                         | `StringType()`    | True     |
| status                               | `StringType()`    | True     |
| type                                 | `StringType()`    | True     |
| usage                                | `StringType()`    | True     |
| hour                                 | `StringType()`    | True     |
| table_name                           | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": NaN,
  "batch_timestamp": "2025-04-05 09:00:00",
  "client_secret": "src_client_secret_NexS02qovh2pXnH1f8XqHh0m",
  "code_verification_attempts_remaining": NaN,
  "code_verification_status": null,
  "created": "2021-01-19 08:59:12",
  "currency": null,
  "flow": "none",
  "id": "src_1IBG3QGyxyMEWHozRzlwvs8P",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "owner_address_city": null,
  "owner_address_country": null,
  "owner_address_line1": null,
  "owner_address_line2": null,
  "owner_address_postal_code": null,
  "owner_address_state": null,
  "owner_email": null,
  "owner_name": null,
  "owner_phone": null,
  "owner_verified_address_city": null,
  "owner_verified_address_country": null,
  "owner_verified_address_line1": null,
  "owner_verified_address_line2": null,
  "owner_verified_address_postal_code": null,
  "owner_verified_address_state": null,
  "owner_verified_email": null,
  "owner_verified_name": null,
  "owner_verified_phone": null,
  "receiver_address": null,
  "receiver_amount_charged": NaN,
  "receiver_amount_received": NaN,
  "receiver_amount_returned": NaN,
  "redirect_failure_reason": null,
  "redirect_return_url": null,
  "redirect_status": null,
  "redirect_url": null,
  "status": "chargeable",
  "type": "card",
  "usage": "reusable",
  "hour": "2025062500",
  "table_name": "sources"
}
```

---

## narrative.stripe.subscription_item_change_events

### Schema

| Column                | Type              | Nullable |
| --------------------- | ----------------- | -------- |
| currency              | `StringType()`    | True     |
| customer_id           | `StringType()`    | True     |
| event_timestamp       | `TimestampType()` | True     |
| event_type            | `StringType()`    | True     |
| local_event_timestamp | `TimestampType()` | True     |
| merchant_id           | `StringType()`    | True     |
| mrr_change            | `LongType()`      | True     |
| price_id              | `StringType()`    | True     |
| product_id            | `StringType()`    | True     |
| quantity_change       | `LongType()`      | True     |
| subscription_id       | `StringType()`    | True     |
| subscription_item_id  | `StringType()`    | True     |
| hour                  | `StringType()`    | True     |
| table_name            | `StringType()`    | True     |

### Sample Row

```json
{
  "currency": "usd",
  "customer_id": "cus_PcWOgcuBL3vZEp",
  "event_timestamp": "2024-02-24 09:17:04.917000",
  "event_type": "ACTIVE_START",
  "local_event_timestamp": "2024-02-24 22:17:04",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "mrr_change": 0,
  "price_id": "plan_L1gfRtYofQqqhW",
  "product_id": "prod_HE50j3A0xeeU2J",
  "quantity_change": 1,
  "subscription_id": "sub_1OnHLwGyxyMEWHozTCMHqJki",
  "subscription_item_id": "si_PcWOg1pULzjDNM",
  "hour": "2025062400",
  "table_name": "subscription_item_change_events"
}
```

---

## narrative.stripe.subscription_items

### Schema

| Column                            | Type              | Nullable |
| --------------------------------- | ----------------- | -------- |
| batch_timestamp                   | `TimestampType()` | True     |
| billing_thresholds_usage_gte      | `LongType()`      | True     |
| created                           | `LongType()`      | True     |
| discounts                         | `StringType()`    | True     |
| id                                | `StringType()`    | True     |
| merchant_id                       | `StringType()`    | True     |
| plan_amount                       | `LongType()`      | True     |
| plan_created                      | `TimestampType()` | True     |
| plan_currency                     | `StringType()`    | True     |
| plan_id                           | `StringType()`    | True     |
| plan_interval                     | `StringType()`    | True     |
| plan_interval_count               | `LongType()`      | True     |
| plan_nickname                     | `StringType()`    | True     |
| plan_product_id                   | `StringType()`    | True     |
| plan_trial_period_days            | `LongType()`      | True     |
| price_created                     | `TimestampType()` | True     |
| price_currency                    | `StringType()`    | True     |
| price_id                          | `StringType()`    | True     |
| price_nickname                    | `StringType()`    | True     |
| price_product_id                  | `StringType()`    | True     |
| price_recurring_interval          | `StringType()`    | True     |
| price_recurring_interval_count    | `LongType()`      | True     |
| price_recurring_trial_period_days | `LongType()`      | True     |
| price_unit_amount                 | `LongType()`      | True     |
| quantity                          | `LongType()`      | True     |
| subscription                      | `StringType()`    | True     |
| subscription_id                   | `StringType()`    | True     |
| hour                              | `StringType()`    | True     |
| table_name                        | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-25 00:00:00",
  "billing_thresholds_usage_gte": NaN,
  "created": 1749432063,
  "discounts": "",
  "id": "si_SSq4eFPiNql82y",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "plan_amount": 48000,
  "plan_created": "2025-05-21 22:35:16",
  "plan_currency": "usd",
  "plan_id": "price_1RRLEGGyxyMEWHozHifUfD6X",
  "plan_interval": "year",
  "plan_interval_count": 1,
  "plan_nickname": "Narrative Premium-Year",
  "plan_product_id": "prod_HE50j3A0xeeU2J",
  "plan_trial_period_days": NaN,
  "price_created": "2025-05-21 22:35:16",
  "price_currency": "usd",
  "price_id": "price_1RRLEGGyxyMEWHozHifUfD6X",
  "price_nickname": "Narrative Premium-Year",
  "price_product_id": "prod_HE50j3A0xeeU2J",
  "price_recurring_interval": "year",
  "price_recurring_interval_count": 1,
  "price_recurring_trial_period_days": NaN,
  "price_unit_amount": 48000,
  "quantity": 1,
  "subscription": "sub_Iv1B4IKKBkez6m",
  "subscription_id": "sub_Iv1B4IKKBkez6m",
  "hour": "2025062500",
  "table_name": "subscription_items"
}
```

---

## narrative.stripe.subscription_schedule_phase_configuration_items

### Schema

| Column                       | Type              | Nullable |
| ---------------------------- | ----------------- | -------- |
| batch_timestamp              | `TimestampType()` | True     |
| billing_thresholds_usage_gte | `LongType()`      | True     |
| merchant_id                  | `StringType()`    | True     |
| phase_id                     | `StringType()`    | True     |
| price                        | `StringType()`    | True     |
| quantity                     | `LongType()`      | True     |
| schedule_id                  | `StringType()`    | True     |
| hour                         | `StringType()`    | True     |
| table_name                   | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-05-06 18:00:00",
  "billing_thresholds_usage_gte": NaN,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "phase_id": "sub_sched_phase_LXVE4x3fPy0tU3",
  "price": "plan_JFZvAhr5gpxocr",
  "quantity": 1,
  "schedule_id": "sub_sched_1KqQEWGyxyMEWHoz4oJlPXlz",
  "hour": "2025062500",
  "table_name": "subscription_schedule_phase_configuration_items"
}
```

---

## narrative.stripe.subscription_schedule_phases

### Schema

| Column                                        | Type              | Nullable |
| --------------------------------------------- | ----------------- | -------- |
| application_fee_percent                       | `DoubleType()`    | True     |
| automatic_tax_enabled                         | `BooleanType()`   | True     |
| batch_timestamp                               | `TimestampType()` | True     |
| billing_cycle_anchor                          | `StringType()`    | True     |
| billing_thresholds_amount_gte                 | `LongType()`      | True     |
| billing_thresholds_reset_billing_cycle_anchor | `BooleanType()`   | True     |
| collection_method                             | `StringType()`    | True     |
| coupon_id                                     | `StringType()`    | True     |
| currency                                      | `StringType()`    | True     |
| default_payment_method                        | `StringType()`    | True     |
| description                                   | `StringType()`    | True     |
| end_date                                      | `TimestampType()` | True     |
| id                                            | `StringType()`    | True     |
| invoice_settings_days_until_due               | `DoubleType()`    | True     |
| merchant_id                                   | `StringType()`    | True     |
| on_behalf_of                                  | `StringType()`    | True     |
| proration_behavior                            | `StringType()`    | True     |
| schedule_id                                   | `StringType()`    | True     |
| start_date                                    | `TimestampType()` | True     |
| transfer_data_amount_percent                  | `DoubleType()`    | True     |
| transfer_data_destination                     | `StringType()`    | True     |
| trial_end                                     | `LongType()`      | True     |
| hour                                          | `StringType()`    | True     |
| table_name                                    | `StringType()`    | True     |

### Sample Row

```json
{
  "application_fee_percent": NaN,
  "automatic_tax_enabled": null,
  "batch_timestamp": "2025-05-06 18:00:00",
  "billing_cycle_anchor": null,
  "billing_thresholds_amount_gte": NaN,
  "billing_thresholds_reset_billing_cycle_anchor": null,
  "collection_method": "charge_automatically",
  "coupon_id": null,
  "currency": "usd",
  "default_payment_method": null,
  "description": null,
  "end_date": "2024-03-28 11:00:00",
  "id": "sub_sched_phase_LXVE4x3fPy0tU3",
  "invoice_settings_days_until_due": NaN,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "on_behalf_of": null,
  "proration_behavior": "create_prorations",
  "schedule_id": "sub_sched_1KqQEWGyxyMEWHoz4oJlPXlz",
  "start_date": "2023-03-28 11:00:00",
  "transfer_data_amount_percent": NaN,
  "transfer_data_destination": null,
  "trial_end": NaN,
  "hour": "2025062500",
  "table_name": "subscription_schedule_phases"
}
```

---

## narrative.stripe.subscription_schedule_phases_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| phase_id        | `StringType()`    | True     |
| schedule_id     | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-13 00:00:00",
  "key": "discount_expires_at",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "phase_id": "sub_sched_phase_SBd1EuQJucUdst",
  "schedule_id": "sub_sched_1RHFlaGyxyMEWHoztv4KGt48",
  "value": "1691093415",
  "hour": "2025062500",
  "table_name": "subscription_schedule_phases_metadata"
}
```

---

## narrative.stripe.subscription_schedules

### Schema

| Column                                           | Type              | Nullable |
| ------------------------------------------------ | ----------------- | -------- |
| application_id                                   | `StringType()`    | True     |
| batch_timestamp                                  | `TimestampType()` | True     |
| canceled_at                                      | `TimestampType()` | True     |
| completed_at                                     | `TimestampType()` | True     |
| created                                          | `TimestampType()` | True     |
| customer                                         | `StringType()`    | True     |
| default_settings_application_fee_percent         | `DoubleType()`    | True     |
| default_settings_automatic_tax_enabled           | `BooleanType()`   | True     |
| default_settings_billing_cycle_anchor            | `StringType()`    | True     |
| default_settings_collection_method               | `StringType()`    | True     |
| default_settings_default_payment_method          | `StringType()`    | True     |
| default_settings_default_source                  | `StringType()`    | True     |
| default_settings_description                     | `StringType()`    | True     |
| default_settings_invoice_settings_days_until_due | `DoubleType()`    | True     |
| default_settings_on_behalf_of                    | `StringType()`    | True     |
| default_settings_transfer_data_amount_percent    | `DoubleType()`    | True     |
| default_settings_transfer_data_destination       | `StringType()`    | True     |
| end_behavior                                     | `StringType()`    | True     |
| id                                               | `StringType()`    | True     |
| merchant_id                                      | `StringType()`    | True     |
| released_at                                      | `TimestampType()` | True     |
| released_subscription                            | `StringType()`    | True     |
| renewal_interval                                 | `StringType()`    | True     |
| renewal_interval_length                          | `LongType()`      | True     |
| subscription                                     | `StringType()`    | True     |
| hour                                             | `StringType()`    | True     |
| table_name                                       | `StringType()`    | True     |

### Sample Row

```json
{
  "application_id": null,
  "batch_timestamp": "2025-05-06 18:00:00",
  "canceled_at": "2022-04-19 23:13:55",
  "completed_at": "NaT",
  "created": "2022-04-19 23:13:20",
  "customer": "cus_IT67dyY9wPAtaS",
  "default_settings_application_fee_percent": NaN,
  "default_settings_automatic_tax_enabled": false,
  "default_settings_billing_cycle_anchor": "automatic",
  "default_settings_collection_method": "charge_automatically",
  "default_settings_default_payment_method": null,
  "default_settings_default_source": null,
  "default_settings_description": null,
  "default_settings_invoice_settings_days_until_due": NaN,
  "default_settings_on_behalf_of": null,
  "default_settings_transfer_data_amount_percent": NaN,
  "default_settings_transfer_data_destination": null,
  "end_behavior": "release",
  "id": "sub_sched_1KqQEWGyxyMEWHoz4oJlPXlz",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "released_at": "NaT",
  "released_subscription": null,
  "renewal_interval": null,
  "renewal_interval_length": NaN,
  "subscription": null,
  "hour": "2025062500",
  "table_name": "subscription_schedules"
}
```

---

## narrative.stripe.subscriptions

### Schema

| Column                                                                                          | Type              | Nullable |
| ----------------------------------------------------------------------------------------------- | ----------------- | -------- |
| application_fee_percent                                                                         | `DoubleType()`    | True     |
| application_id                                                                                  | `StringType()`    | True     |
| automatic_tax_enabled                                                                           | `BooleanType()`   | True     |
| batch_timestamp                                                                                 | `TimestampType()` | True     |
| billing                                                                                         | `StringType()`    | True     |
| billing_cycle_anchor                                                                            | `TimestampType()` | True     |
| billing_thresholds_amount_gte                                                                   | `LongType()`      | True     |
| billing_thresholds_reset_billing_cycle_anchor                                                   | `BooleanType()`   | True     |
| cancel_at                                                                                       | `TimestampType()` | True     |
| cancel_at_period_end                                                                            | `BooleanType()`   | True     |
| canceled_at                                                                                     | `TimestampType()` | True     |
| cancellation_details_comment                                                                    | `StringType()`    | True     |
| cancellation_details_feedback                                                                   | `StringType()`    | True     |
| cancellation_details_reason                                                                     | `StringType()`    | True     |
| cancellation_reason                                                                             | `StringType()`    | True     |
| cancellation_reason_text                                                                        | `StringType()`    | True     |
| created                                                                                         | `TimestampType()` | True     |
| current_period_end                                                                              | `TimestampType()` | True     |
| current_period_start                                                                            | `TimestampType()` | True     |
| customer_id                                                                                     | `StringType()`    | True     |
| days_until_due                                                                                  | `LongType()`      | True     |
| default_payment_method_id                                                                       | `StringType()`    | True     |
| default_source_id                                                                               | `StringType()`    | True     |
| description                                                                                     | `StringType()`    | True     |
| discount_checkout_session                                                                       | `StringType()`    | True     |
| discount_coupon_id                                                                              | `StringType()`    | True     |
| discount_customer_id                                                                            | `StringType()`    | True     |
| discount_end                                                                                    | `TimestampType()` | True     |
| discount_invoice                                                                                | `StringType()`    | True     |
| discount_invoice_item                                                                           | `StringType()`    | True     |
| discount_promotion_code_id                                                                      | `StringType()`    | True     |
| discount_start                                                                                  | `TimestampType()` | True     |
| discount_subscription                                                                           | `StringType()`    | True     |
| discount_subscription_item                                                                      | `StringType()`    | True     |
| discounts                                                                                       | `StringType()`    | True     |
| ended_at                                                                                        | `TimestampType()` | True     |
| id                                                                                              | `StringType()`    | True     |
| latest_invoice_id                                                                               | `StringType()`    | True     |
| merchant_id                                                                                     | `StringType()`    | True     |
| next_pending_invoice_item_invoice                                                               | `TimestampType()` | True     |
| on_behalf_of_id                                                                                 | `StringType()`    | True     |
| pause_collection_behavior                                                                       | `StringType()`    | True     |
| pause_collection_resumes_at                                                                     | `TimestampType()` | True     |
| payment_settings_payment_method_options_acss_debit_mandate_options_transaction_type             | `StringType()`    | True     |
| payment_settings_payment_method_options_acss_debit_verification_method                          | `StringType()`    | True     |
| payment_settings_payment_method_options_bancontact_preferred_language                           | `StringType()`    | True     |
| payment_settings_payment_method_options_card_mandate_options_amount                             | `LongType()`      | True     |
| payment_settings_payment_method_options_card_mandate_options_amount_type                        | `StringType()`    | True     |
| payment_settings_payment_method_options_card_mandate_options_description                        | `StringType()`    | True     |
| payment_settings_payment_method_options_card_network                                            | `StringType()`    | True     |
| payment_settings_payment_method_options_card_request_three_d_secure                             | `StringType()`    | True     |
| payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer_country | `StringType()`    | True     |
| payment_settings_payment_method_options_customer_balance_bank_transfer_id_bank_transfer_bank    | `StringType()`    | True     |
| payment_settings_payment_method_options_customer_balance_bank_transfer_type                     | `StringType()`    | True     |
| payment_settings_payment_method_options_customer_balance_funding_type                           | `StringType()`    | True     |
| payment_settings_payment_method_options_us_bank_account_verification_method                     | `StringType()`    | True     |
| payment_settings_save_default_payment_method                                                    | `StringType()`    | True     |
| pending_invoice_item_interval                                                                   | `StringType()`    | True     |
| pending_invoice_item_interval_count                                                             | `LongType()`      | True     |
| pending_setup_intent_id                                                                         | `StringType()`    | True     |
| pending_update_billing_cycle_anchor                                                             | `TimestampType()` | True     |
| pending_update_expires_at                                                                       | `TimestampType()` | True     |
| pending_update_trial_end                                                                        | `TimestampType()` | True     |
| pending_update_trial_from_plan                                                                  | `BooleanType()`   | True     |
| plan_id                                                                                         | `StringType()`    | True     |
| price_id                                                                                        | `StringType()`    | True     |
| quantity                                                                                        | `LongType()`      | True     |
| schedule_id                                                                                     | `StringType()`    | True     |
| start                                                                                           | `TimestampType()` | True     |
| start_date                                                                                      | `TimestampType()` | True     |
| status                                                                                          | `StringType()`    | True     |
| tax_percent                                                                                     | `DoubleType()`    | True     |
| transfer_data_amount_percent                                                                    | `DoubleType()`    | True     |
| transfer_data_destination_id                                                                    | `StringType()`    | True     |
| trial_end                                                                                       | `TimestampType()` | True     |
| trial_settings_end_behavior_missing_payment_method                                              | `StringType()`    | True     |
| trial_start                                                                                     | `TimestampType()` | True     |
| hour                                                                                            | `StringType()`    | True     |
| table_name                                                                                      | `StringType()`    | True     |

### Sample Row

```json
{
  "application_fee_percent": NaN,
  "application_id": null,
  "automatic_tax_enabled": false,
  "batch_timestamp": "2025-06-25 00:00:00",
  "billing": "charge_automatically",
  "billing_cycle_anchor": "2021-12-01 21:37:37",
  "billing_thresholds_amount_gte": NaN,
  "billing_thresholds_reset_billing_cycle_anchor": null,
  "cancel_at": "NaT",
  "cancel_at_period_end": false,
  "canceled_at": "NaT",
  "cancellation_details_comment": null,
  "cancellation_details_feedback": null,
  "cancellation_details_reason": null,
  "cancellation_reason": null,
  "cancellation_reason_text": null,
  "created": "2020-12-01 18:09:06",
  "current_period_end": "2025-07-01 21:37:37",
  "current_period_start": "2025-06-01 21:37:37",
  "customer_id": "cus_IUcWKFi7bhWGj8",
  "days_until_due": NaN,
  "default_payment_method_id": null,
  "default_source_id": null,
  "description": null,
  "discount_checkout_session": null,
  "discount_coupon_id": null,
  "discount_customer_id": null,
  "discount_end": "NaT",
  "discount_invoice": null,
  "discount_invoice_item": null,
  "discount_promotion_code_id": null,
  "discount_start": "NaT",
  "discount_subscription": null,
  "discount_subscription_item": null,
  "discounts": "",
  "ended_at": "NaT",
  "id": "sub_IUcW2nIWFqt5u3",
  "latest_invoice_id": "in_1RVJa3GyxyMEWHoztWMyeQKK",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "next_pending_invoice_item_invoice": "NaT",
  "on_behalf_of_id": null,
  "pause_collection_behavior": null,
  "pause_collection_resumes_at": "NaT",
  "payment_settings_payment_method_options_acss_debit_mandate_options_transaction_type": null,
  "payment_settings_payment_method_options_acss_debit_verification_method": null,
  "payment_settings_payment_method_options_bancontact_preferred_language": null,
  "payment_settings_payment_method_options_card_mandate_options_amount": NaN,
  "payment_settings_payment_method_options_card_mandate_options_amount_type": null,
  "payment_settings_payment_method_options_card_mandate_options_description": null,
  "payment_settings_payment_method_options_card_network": null,
  "payment_settings_payment_method_options_card_request_three_d_secure": null,
  "payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer_country": null,
  "payment_settings_payment_method_options_customer_balance_bank_transfer_id_bank_transfer_bank": null,
  "payment_settings_payment_method_options_customer_balance_bank_transfer_type": null,
  "payment_settings_payment_method_options_customer_balance_funding_type": null,
  "payment_settings_payment_method_options_us_bank_account_verification_method": null,
  "payment_settings_save_default_payment_method": null,
  "pending_invoice_item_interval": null,
  "pending_invoice_item_interval_count": NaN,
  "pending_setup_intent_id": null,
  "pending_update_billing_cycle_anchor": "NaT",
  "pending_update_expires_at": "NaT",
  "pending_update_trial_end": "NaT",
  "pending_update_trial_from_plan": null,
  "plan_id": "pending_deletion",
  "price_id": "pending_deletion",
  "quantity": 1,
  "schedule_id": null,
  "start": "2021-12-01 21:37:37",
  "start_date": "2020-12-01 18:09:06",
  "status": "active",
  "tax_percent": NaN,
  "transfer_data_amount_percent": NaN,
  "transfer_data_destination_id": null,
  "trial_end": "NaT",
  "trial_settings_end_behavior_missing_payment_method": "create_invoice",
  "trial_start": "NaT",
  "hour": "2025062500",
  "table_name": "subscriptions"
}
```

---

## narrative.stripe.subscriptions_metadata

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| batch_timestamp | `TimestampType()` | True     |
| key             | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| subscription_id | `StringType()`    | True     |
| value           | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "batch_timestamp": "2025-06-04 03:00:00",
  "key": "migrated_at",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "subscription_id": "sub_HE78HkMLWqFTu4",
  "value": "1643226207",
  "hour": "2025062500",
  "table_name": "subscriptions_metadata"
}
```

---

## narrative.stripe.summarized_balance_transactions

### Schema

| Column                                  | Type              | Nullable |
| --------------------------------------- | ----------------- | -------- |
| activity_at_time_bucket                 | `TimestampType()` | True     |
| auto_payout_effective_at_interval_start | `TimestampType()` | True     |
| auto_payout_id                          | `StringType()`    | True     |
| bt_count                                | `LongType()`      | True     |
| bt_effective_at_interval_start          | `TimestampType()` | True     |
| currency                                | `StringType()`    | True     |
| fee                                     | `DoubleType()`    | True     |
| gross                                   | `DoubleType()`    | True     |
| merchant_id                             | `StringType()`    | True     |
| net                                     | `DoubleType()`    | True     |
| payout_is_auto                          | `BooleanType()`   | True     |
| reporting_category                      | `StringType()`    | True     |
| hour                                    | `StringType()`    | True     |
| table_name                              | `StringType()`    | True     |

### Sample Row

```json
{
  "activity_at_time_bucket": "2020-09-14 12:45:00",
  "auto_payout_effective_at_interval_start": "2020-09-16 00:00:00",
  "auto_payout_id": "po_1HRSx9GyxyMEWHozQTWNNWKn",
  "bt_count": 1,
  "bt_effective_at_interval_start": "2020-09-14 12:45:00",
  "currency": "nzd",
  "fee": 81.0,
  "gross": 1757.0,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "net": 1676.0,
  "payout_is_auto": false,
  "reporting_category": "charge",
  "hour": "2025062200",
  "table_name": "summarized_balance_transactions"
}
```

---

## narrative.stripe.tax_rates

### Schema

| Column               | Type              | Nullable |
| -------------------- | ----------------- | -------- |
| active               | `BooleanType()`   | True     |
| batch_timestamp      | `TimestampType()` | True     |
| country              | `StringType()`    | True     |
| created              | `TimestampType()` | True     |
| description          | `StringType()`    | True     |
| display_name         | `StringType()`    | True     |
| effective_percentage | `DoubleType()`    | True     |
| id                   | `StringType()`    | True     |
| inclusive            | `BooleanType()`   | True     |
| jurisdiction         | `StringType()`    | True     |
| jurisdiction_level   | `StringType()`    | True     |
| merchant_id          | `StringType()`    | True     |
| percentage           | `DoubleType()`    | True     |
| state                | `StringType()`    | True     |
| tax_type             | `StringType()`    | True     |
| hour                 | `StringType()`    | True     |
| table_name           | `StringType()`    | True     |

### Sample Row

```json
{
  "active": false,
  "batch_timestamp": "2024-10-27 12:00:00",
  "country": null,
  "created": "2019-04-22 23:50:30",
  "description": null,
  "display_name": "Tax",
  "effective_percentage": NaN,
  "id": "txr_1ESBu6GyxyMEWHozGwPf9DMY",
  "inclusive": false,
  "jurisdiction": null,
  "jurisdiction_level": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "percentage": 0.0,
  "state": null,
  "tax_type": null,
  "hour": "2025062500",
  "table_name": "tax_rates"
}
```

---

## narrative.stripe.terminal_locations

### Schema

| Column              | Type            | Nullable |
| ------------------- | --------------- | -------- |
| address_city        | `StringType()`  | True     |
| address_country     | `StringType()`  | True     |
| address_line1       | `StringType()`  | True     |
| address_line2       | `StringType()`  | True     |
| address_postal_code | `StringType()`  | True     |
| address_state       | `StringType()`  | True     |
| id                  | `StringType()`  | True     |
| livemode            | `BooleanType()` | True     |
| merchant_id         | `StringType()`  | True     |
| metadata            | `StringType()`  | True     |
| name                | `StringType()`  | True     |
| zone_id             | `StringType()`  | True     |
| hour                | `StringType()`  | True     |
| table_name          | `StringType()`  | True     |

### Sample Row

```json
{
  "address_city": "Auckland",
  "address_country": "NZ",
  "address_line1": "321 Karangahape Road",
  "address_line2": "Central Auckland",
  "address_postal_code": "1010",
  "address_state": "",
  "id": "tml_F2An4wSPnKHkfi",
  "livemode": true,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "metadata": "[]",
  "name": "Business Address",
  "zone_id": "",
  "hour": "2025062500",
  "table_name": "terminal_locations"
}
```

---

## narrative.stripe.terminal_locations_v2

### Schema

| Column              | Type            | Nullable |
| ------------------- | --------------- | -------- |
| address_city        | `StringType()`  | True     |
| address_country     | `StringType()`  | True     |
| address_line1       | `StringType()`  | True     |
| address_line2       | `StringType()`  | True     |
| address_postal_code | `StringType()`  | True     |
| address_state       | `StringType()`  | True     |
| id                  | `StringType()`  | True     |
| livemode            | `BooleanType()` | True     |
| merchant_id         | `StringType()`  | True     |
| metadata            | `StringType()`  | True     |
| name                | `StringType()`  | True     |
| zone_id             | `StringType()`  | True     |
| hour                | `StringType()`  | True     |
| table_name          | `StringType()`  | True     |

### Sample Row

```json
{
  "address_city": "Auckland",
  "address_country": "NZ",
  "address_line1": "321 Karangahape Road",
  "address_line2": "Central Auckland",
  "address_postal_code": "1010",
  "address_state": "",
  "id": "tml_F2An4wSPnKHkfi",
  "livemode": true,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "metadata": "[]",
  "name": "Business Address",
  "zone_id": "",
  "hour": "2025040300",
  "table_name": "terminal_locations_v2"
}
```

---

## narrative.stripe.terminal_readers

### Schema

| Column        | Type            | Nullable |
| ------------- | --------------- | -------- |
| device_type   | `StringType()`  | True     |
| id            | `StringType()`  | True     |
| label         | `StringType()`  | True     |
| livemode      | `BooleanType()` | True     |
| location_id   | `StringType()`  | True     |
| merchant_id   | `StringType()`  | True     |
| metadata      | `StringType()`  | True     |
| serial_number | `StringType()`  | True     |
| hour          | `StringType()`  | True     |
| table_name    | `StringType()`  | True     |

### Sample Row

```json
{
  "device_type": "mobile_phone_reader",
  "id": "tmr_F2An5QIo2DcTgC",
  "label": "Livemode Reader",
  "livemode": true,
  "location_id": "tml_F2An4wSPnKHkfi",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "metadata": "[]",
  "serial_number": "a2536062b530d8c176c6c1a68abd0557d919b8ef0b90ca7e728b10493661d8cc",
  "hour": "2025062500",
  "table_name": "terminal_readers"
}
```

---

## narrative.stripe.terminal_readers_v2

### Schema

| Column        | Type            | Nullable |
| ------------- | --------------- | -------- |
| device_type   | `StringType()`  | True     |
| id            | `StringType()`  | True     |
| label         | `StringType()`  | True     |
| livemode      | `BooleanType()` | True     |
| location_id   | `StringType()`  | True     |
| merchant_id   | `StringType()`  | True     |
| metadata      | `StringType()`  | True     |
| serial_number | `StringType()`  | True     |
| hour          | `StringType()`  | True     |
| table_name    | `StringType()`  | True     |

### Sample Row

```json
{
  "device_type": "mobile_phone_reader",
  "id": "tmr_F2An5QIo2DcTgC",
  "label": "Livemode Reader",
  "livemode": true,
  "location_id": "tml_F2An4wSPnKHkfi",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "metadata": "[]",
  "serial_number": "a2536062b530d8c176c6c1a68abd0557d919b8ef0b90ca7e728b10493661d8cc",
  "hour": "2025040200",
  "table_name": "terminal_readers_v2"
}
```

---

## narrative.stripe.transfers

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| amount                 | `LongType()`      | True     |
| amount_reversed        | `LongType()`      | True     |
| application_fee_amount | `LongType()`      | True     |
| application_fee_id     | `StringType()`    | True     |
| automatic              | `BooleanType()`   | True     |
| balance_transaction_id | `StringType()`    | True     |
| batch_timestamp        | `TimestampType()` | True     |
| created                | `TimestampType()` | True     |
| currency               | `StringType()`    | True     |
| date                   | `TimestampType()` | True     |
| description            | `StringType()`    | True     |
| destination_id         | `StringType()`    | True     |
| destination_payment_id | `StringType()`    | True     |
| failure_code           | `StringType()`    | True     |
| failure_message        | `StringType()`    | True     |
| id                     | `StringType()`    | True     |
| kind                   | `StringType()`    | True     |
| merchant_id            | `StringType()`    | True     |
| reference              | `StringType()`    | True     |
| reversed               | `BooleanType()`   | True     |
| source_transaction_id  | `StringType()`    | True     |
| source_type            | `StringType()`    | True     |
| statement_descriptor   | `StringType()`    | True     |
| status                 | `StringType()`    | True     |
| trace_id               | `StringType()`    | True     |
| trace_id_status        | `StringType()`    | True     |
| transfer_group         | `StringType()`    | True     |
| transfer_instruction   | `StringType()`    | True     |
| type                   | `StringType()`    | True     |
| hour                   | `StringType()`    | True     |
| table_name             | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 15707,
  "amount_reversed": 0,
  "application_fee_amount": NaN,
  "application_fee_id": null,
  "automatic": true,
  "balance_transaction_id": "txn_1C9TXRGyxyMEWHozbdDRIDm1",
  "batch_timestamp": "2023-06-30 18:00:00",
  "created": "2018-03-25 07:45:13",
  "currency": "nzd",
  "date": "2018-03-28 00:00:00",
  "description": "STRIPE PAYOUT",
  "destination_id": "ba_1C7b7AGyxyMEWHozbV3B40lA",
  "destination_payment_id": null,
  "failure_code": null,
  "failure_message": null,
  "id": "po_1C9TXRGyxyMEWHoznSaoE7v7",
  "kind": "payout",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "reference": null,
  "reversed": false,
  "source_transaction_id": null,
  "source_type": "card",
  "statement_descriptor": null,
  "status": "paid",
  "trace_id": null,
  "trace_id_status": null,
  "transfer_group": null,
  "transfer_instruction": "standard",
  "type": "bank_account",
  "hour": "2025062500",
  "table_name": "transfers"
}
```