# Edit Product Tables

This file contains documentation for 15 Databricks warehouse tables related to the Edit product functionality.
These tables track image editing operations, edited images, and editing-related events.

---

## narrative.core.credit_transactions

### Schema

| Column         | Type              | Nullable |
| -------------- | ----------------- | -------- |
| Op             | `StringType()`    | True     |
| id             | `StringType()`    | True     |
| account_id     | `StringType()`    | True     |
| entry_type     | `StringType()`    | True     |
| entry_id       | `StringType()`    | True     |
| credits        | `IntegerType()`   | True     |
| credit_balance | `IntegerType()`   | True     |
| inserted_at    | `TimestampType()` | True     |
| description    | `StringType()`    | True     |
| \_rescued_data | `StringType()`    | True     |

### Sample Row

```json
{
  "Op": "I",
  "id": "3891186c-891a-4717-b3c3-900183a213ba",
  "account_id": "2b3cab29-933b-4b15-a706-1c617140c24d",
  "entry_type": "manual_adjustments",
  "entry_id": null,
  "credits": 1000,
  "credit_balance": 1000,
  "inserted_at": "2025-06-25 02:59:41.892454",
  "description": "Narrative Edit - Trial Credits",
  "_rescued_data": null
}
```

---

## narrative.default.edit_activation

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| user_id                  | `StringType()`    | True     |
| first_edit_interaction   | `TimestampType()` | True     |
| activated_at             | `TimestampType()` | True     |
| time_to_activate         | `LongType()`      | True     |
| activated_within_1_day   | `BooleanType()`   | True     |
| activated_within_14_days | `BooleanType()`   | True     |
| activated                | `BooleanType()`   | True     |

### Sample Row

```json
{
  "user_id": "0a4d4092-8e78-4e65-94d2-65fa06544f53",
  "first_edit_interaction": "2024-07-07 12:16:56",
  "activated_at": "2025-05-28 09:34:47",
  "time_to_activate": 28070271,
  "activated_within_1_day": false,
  "activated_within_14_days": false,
  "activated": true
}
```

---

## narrative.default.edit_first_interaction

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| user_id                | `StringType()`    | True     |
| first_edit_interaction | `TimestampType()` | True     |

### Sample Row

```json
{
  "user_id": "0a4d4092-8e78-4e65-94d2-65fa06544f53",
  "first_edit_interaction": "2024-07-07 12:16:56"
}
```

---

## narrative.default.edit_projects_edited

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| user_id         | `StringType()`    | True     |
| project_id      | `StringType()`    | True     |
| first_edited_at | `TimestampType()` | True     |

### Sample Row

```json
{
  "user_id": "142d3249-8b12-4e62-88e0-e08b93a8e0bb",
  "project_id": "fcad73efa63740cf848f9e2dda6657f4",
  "first_edited_at": "2025-03-27 17:19:34"
}
```

---

## narrative.default.edit_projects_edited_ranked

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| user_id                  | `StringType()`    | True     |
| project_id               | `StringType()`    | True     |
| first_edited_at          | `TimestampType()` | True     |
| project_edited_at_ranked | `IntegerType()`   | True     |

### Sample Row

```json
{
  "user_id": null,
  "project_id": "1023dd41ea9e4935a88150276de70b21",
  "first_edited_at": "2025-03-14 17:35:23",
  "project_edited_at_ranked": 1
}
```

---

## narrative.default.edit_projects_second_edited

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| user_id                  | `StringType()`    | True     |
| project_id               | `StringType()`    | True     |
| first_edited_at          | `TimestampType()` | True     |
| project_edited_at_ranked | `IntegerType()`   | True     |

### Sample Row

```json
{
  "user_id": "0010ef96-8cc0-4812-aa8b-fc486799c6e1",
  "project_id": "1488b2c1f0a345e5b1728e452066bb8c",
  "first_edited_at": "2024-10-05 08:53:55",
  "project_edited_at_ranked": 2
}
```

---

## narrative.default.edited_images_and_corrected_images_joined_to_database

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| user_id                | `StringType()`    | True     |
| account_id             | `StringType()`    | True     |
| style_id               | `StringType()`    | True     |
| share_link_id_used     | `StringType()`    | True     |
| time_saved_score_used  | `IntegerType()`   | True     |
| training_approach_used | `StringType()`    | True     |
| style_type             | `StringType()`    | True     |
| narrative_image_id     | `StringType()`    | True     |
| correction             | `StringType()`    | True     |
| develop_settings       | `StringType()`    | True     |
| project_id             | `StringType()`    | True     |
| edited_at              | `TimestampType()` | True     |
| temperature            | `StringType()`    | True     |
| tint                   | `StringType()`    | True     |
| exposure               | `FloatType()`     | True     |
| contrast               | `FloatType()`     | True     |
| whites                 | `FloatType()`     | True     |
| blacks                 | `FloatType()`     | True     |
| shadows                | `FloatType()`     | True     |
| highlights             | `FloatType()`     | True     |
| inserted_at            | `TimestampType()` | True     |
| asset_id               | `StringType()`    | True     |
| asset_preview_id       | `StringType()`    | True     |

### Sample Row

```json
{
  "user_id": "17a21c08-2d1f-4852-b04b-589f425783d6",
  "account_id": "06681fdd-23fe-4a8a-9450-611bf78a3045",
  "style_id": "8fe9b7fd-215f-4d38-951d-ec47adbf0ff2",
  "share_link_id_used": "e60311c9-89cb-41f9-99da-415c27375b3e",
  "time_saved_score_used": NaN,
  "training_approach_used": "learning-without-forgetting",
  "style_type": "personal",
  "narrative_image_id": "c54de2a5-8d8e-44b6-b26f-2f9eef61a580",
  "correction": "true",
  "develop_settings": "{\"Look\":{\"Name\":\"Adobe Color\",\"UUID\":\"B952C231111CD8E0ECCF14B86BAA7077\",\"Group\":{\"x-default\":\"Profiles\"},\"Amount\":1,\"Parameters\":{\"Version\":\"17.1\",\"LookTable\":\"E1095149FDB39D7A057BAB208837E2E1\",\"CameraProfile\":\"Adobe Standard\",\"ProcessVersion\":\"15.4\",\"ToneCurvePV2012\":[0,0,22,16,40,35,127,127,224,230,240,246,255,255],\"ToneCurveName2012\":\"\",\"ConvertToGrayscale\":false,\"ToneCurvePV2012Red\":[0,0,255,255],\"ToneCurvePV2012Blue\":[0,0,255,255],\"ToneCurvePV2012Green\":[0,0,255,255]},\"SupportsAmount\":false,\"SupportsMonochrome\":false,\"SupportsOutputReferred\":false},\"Tint\":6,\"BlueHue\":-2,\"Shadows\":5,\"Version\":\"17.1\",\"Contrast\":25,\"Exposure\":0,\"LensBlur\":{},\"SDRBlend\":0,\"Vibrance\":0,\"GrainSeed\":391372069,\"GrainSize\":40,\"SDRWhites\":0,\"Sharpness\":30,\"Blacks2012\":60,\"Brightness\":50,\"RedEyeInfo\":{},\"SDRClarity\":0,\"SDRShadows\":0,\"Saturation\":-16,\"ShadowTint\":-10,\"Whites2012\":40,\"Clarity2012\":-14,\"GrainAmount\":40,\"HDREditMode\":0,\"HDRMaxValue\":4,\"PointColors\":{},\"SDRContrast\":0,\"Shadows2012\":-30,\"Temperature\":6004,\"Contrast2012\":-40,\"Exposure2012\":-1.19,\"PerspectiveX\":0,\"PerspectiveY\":0,\"WhiteBalance\":\"Custom\",\"AutoLateralCA\":0,\"CameraProfile\":\"Adobe Standard v2\",\"RedSaturation\":-15,\"SDRBrightness\":0,\"SDRHighlights\":0,\"SharpenDetail\":25,\"SharpenRadius\":1,\"Highlights2012\":-28,\"ProcessVersion\":\"15.4\",\"UprightPreview\":false,\"UprightVersion\":151388160,\"LensProfileName\":\"Adobe (SIGMA 50mm F1.4 DG HSM A014, Canon)\",\"ToneCurvePV2012\":[0,11,49,37,79,71,135,139,207,210,255,246],\"HueAdjustmentRed\":2,\"LensProfileSetup\":\"LensDefaults\",\"PerspectiveScale\":100,\"UprightFocalMode\":0,\"HueAdjustmentAqua\":5,\"HueAdjustmentBlue\":-11,\"LensProfileDigest\":\"D27AAB58AA0D6BE632853B936ED87D9F\",\"LensProfileEnable\":1,\"PerspectiveRotate\":0,\"ToneCurveName2012\":\"Custom\",\"UprightCenterMode\":0,\"ColorGradeBlending\":100,\"ConvertToGrayscale\":false,\"DefringeGreenHueHi\":60,\"DefringeGreenHueLo\":40,\"SharpenEdgeMasking\":0,\"SplitToningBalance\":11,\"ToneCurvePV2012Red\":[0,0,51,40,123,129,190,205,255,255],\"UprightCenterNormX\":0.5,\"UprightCenterNormY\":0.5,\"CameraProfileDigest\":\"7A993C99FC910601CFD0AFC30E527EA6\",\"ColorGradeGlobalHue\":0,\"ColorGradeGlobalLum\":0,\"ColorGradeGlobalSat\":0,\"ColorGradeShadowLum\":15,\"ColorNoiseReduction\":19,\"DefringeGreenAmount\":0,\"DefringePurpleHueHi\":70,\"DefringePurpleHueLo\":30,\"HueAdjustmentOrange\":-8,\"HueAdjustmentPurple\":10,\"HueAdjustmentYellow\":-29,\"LensProfileFilename\":\"Canon (SIGMA 50mm F1.4 DG HSM A014) - RAW.lcp\",\"PerspectiveVertical\":0,\"ToneCurvePV2012Blue\":[0,0,57,40,123,129,190,205,255,255],\"ColorGradeMidtoneHue\":58,\"ColorGradeMidtoneLum\":0,\"ColorGradeMidtoneSat\":5,\"DefringePurpleAmount\":0,\"HueAdjustmentMagenta\":10,\"OverrideLookVignette\":false,\"SplitToningShadowHue\":33,\"ToneCurvePV2012Green\":[0,0,51,40,123,129,190,205,255,255],\"CurveRefineSaturation\":100,\"LensProfileIsEmbedded\":false,\"PerspectiveHorizontal\":0,\"UprightTransformCount\":6,\"ColorGradeHighlightLum\":-20,\"LuminanceAdjustmentRed\":2,\"UprightFocalLength35mm\":35,\"LuminanceAdjustmentBlue\":-10,\"SaturationAdjustmentRed\":47,\"SplitToningHighlightHue\":150,\"LuminanceAdjustmentGreen\":-50,\"SaturationAdjustmentAqua\":-37,\"SaturationAdjustmentBlue\":-1,\"UprightFourSegmentsCount\":0,\"LuminanceAdjustmentOrange\":-13,\"LuminanceAdjustmentPurple\":10,\"LuminanceAdjustmentYellow\":-33,\"LensManualDistortionAmount\":0,\"LensProfileDistortionScale\":100,\"LensProfileVignettingScale\":100,\"LuminanceAdjustmentMagenta\":10,\"SaturationAdjustmentOrange\":29,\"SaturationAdjustmentPurple\":-12,\"SaturationAdjustmentYellow\":-10,\"SplitToningShadowSaturation\":10,\"SplitToningHighlightSaturation\":2,\"LuminanceNoiseReductionContrast\":0}",
  "project_id": "6bdae0fe480b49dfbe853c8a46c09acf",
  "edited_at": "2025-02-08 23:19:49",
  "temperature": "5486",
  "tint": "0",
  "exposure": -1.0,
  "contrast": -40.0,
  "whites": 40.0,
  "blacks": 80.0,
  "shadows": -30.0,
  "highlights": 0.0,
  "inserted_at": "2025-02-19 11:29:02",
  "asset_id": "c54de2a5-8d8e-44b6-b26f-2f9eef61a580",
  "asset_preview_id": "342dd3cb-c6f8-4bcb-977e-69929284f2f1"
}
```

---

## narrative.default.edited_images_joined_to_corrections

### Schema

| Column                 | Type              | Nullable |
| ---------------------- | ----------------- | -------- |
| user_id                | `StringType()`    | True     |
| account_id             | `StringType()`    | True     |
| style_id               | `StringType()`    | True     |
| share_link_id_used     | `StringType()`    | True     |
| time_saved_score_used  | `IntegerType()`   | True     |
| training_approach_used | `StringType()`    | True     |
| style_type             | `StringType()`    | True     |
| narrative_image_id     | `StringType()`    | True     |
| correction             | `StringType()`    | True     |
| develop_settings       | `StringType()`    | True     |
| project_id             | `StringType()`    | True     |
| edited_at              | `TimestampType()` | True     |
| temperature            | `StringType()`    | True     |
| tint                   | `StringType()`    | True     |
| exposure               | `FloatType()`     | True     |
| contrast               | `FloatType()`     | True     |
| whites                 | `FloatType()`     | True     |
| blacks                 | `FloatType()`     | True     |
| shadows                | `FloatType()`     | True     |
| highlights             | `FloatType()`     | True     |
| inserted_at            | `TimestampType()` | True     |

### Sample Row

```json
{
  "user_id": "050b3381-cef0-4652-88f4-dea100142e19",
  "account_id": "9b7ce348-3a82-441f-a47d-1255e4ef18c4",
  "style_id": "75881bd8-8e33-4c85-9c8a-a6761436c32d",
  "share_link_id_used": "e7990b68-0c02-4b22-8680-ebbeeea27515",
  "time_saved_score_used": NaN,
  "training_approach_used": "learning-without-forgetting",
  "style_type": "personal",
  "narrative_image_id": "19046cb4-26df-43bb-ad3a-9bd2c4c078f0",
  "correction": "false",
  "develop_settings": "{\"Look\":{\"Name\":\"Adobe Color\",\"UUID\":\"B952C231111CD8E0ECCF14B86BAA7077\",\"Group\":{\"x-default\":\"Profiles\"},\"Amount\":1,\"Parameters\":{\"Version\":\"17.3\",\"LookTable\":\"E1095149FDB39D7A057BAB208837E2E1\",\"FilterList\":{},\"CameraProfile\":\"Adobe Standard\",\"ProcessVersion\":\"15.4\",\"ToneCurvePV2012\":[0,0,22,16,40,35,127,127,224,230,240,246,255,255],\"ToneCurveName2012\":\"\",\"ConvertToGrayscale\":false,\"ToneCurvePV2012Red\":[0,0,255,255],\"ToneCurvePV2012Blue\":[0,0,255,255],\"ToneCurvePV2012Green\":[0,0,255,255]},\"SupportsAmount\":false,\"SupportsMonochrome\":false,\"SupportsOutputReferred\":false},\"Tint\":25,\"CropTop\":0.111515,\"Shadows\":5,\"Version\":\"17.3\",\"Contrast\":25,\"CropLeft\":0.170444,\"Exposure\":0,\"LensBlur\":{},\"SDRBlend\":0,\"Vibrance\":2,\"CropAngle\":0.36,\"CropRight\":0.870362,\"GrainSize\":25,\"SDRWhites\":0,\"Sharpness\":40,\"Blacks2012\":40,\"Brightness\":50,\"CropBottom\":0.821001,\"FilterList\":{},\"RedEyeInfo\":{},\"SDRClarity\":0,\"SDRShadows\":0,\"Saturation\":-6,\"Whites2012\":10,\"HDREditMode\":0,\"HDRMaxValue\":4,\"PointColors\":{},\"SDRContrast\":0,\"Shadows2012\":20,\"Temperature\":5562,\"Contrast2012\":40,\"Exposure2012\":1.15,\"PerspectiveX\":0,\"PerspectiveY\":0,\"WhiteBalance\":\"Custom\",\"AutoLateralCA\":0,\"CameraProfile\":\"Adobe Standard\",\"SDRBrightness\":0,\"SDRHighlights\":0,\"SharpenDetail\":25,\"SharpenRadius\":1,\"Highlights2012\":-30,\"ProcessVersion\":\"15.4\",\"UprightPreview\":false,\"UprightVersion\":151388160,\"ToneCurvePV2012\":[0,0,29,35,95,116,191,195,255,255],\"LensProfileSetup\":\"LensDefaults\",\"PerspectiveScale\":100,\"UprightFocalMode\":0,\"HueAdjustmentAqua\":-7,\"HueAdjustmentBlue\":-8,\"LensProfileEnable\":0,\"ParametricShadows\":-19,\"PerspectiveRotate\":0,\"ToneCurveName2012\":\"Custom\",\"UprightCenterMode\":0,\"ColorGradeBlending\":100,\"ConvertToGrayscale\":false,\"DefringeGreenHueHi\":60,\"DefringeGreenHueLo\":40,\"HueAdjustmentGreen\":-2,\"SharpenEdgeMasking\":0,\"ToneCurvePV2012Red\":[0,0,58,59,138,134,255,255],\"UprightCenterNormX\":0.5,\"UprightCenterNormY\":0.5,\"CameraProfileDigest\":\"661433344C8532AFA5A1E9091401E43C\",\"ColorGradeGlobalHue\":0,\"ColorGradeGlobalLum\":0,\"ColorGradeGlobalSat\":0,\"ColorGradeShadowLum\":0,\"DefringeGreenAmount\":0,\"DefringePurpleHueHi\":70,\"DefringePurpleHueLo\":30,\"PerspectiveVertical\":0,\"ToneCurvePV2012Blue\":[0,0,44,44,117,117,177,185,255,255],\"ColorGradeMidtoneHue\":0,\"ColorGradeMidtoneLum\":0,\"ColorGradeMidtoneSat\":0,\"DefringePurpleAmount\":0,\"OverrideLookVignette\":false,\"SplitToningShadowHue\":15,\"ToneCurvePV2012Green\":[0,0,71,74,193,196,255,255],\"CurveRefineSaturation\":100,\"PerspectiveHorizontal\":0,\"UprightTransformCount\":6,\"ColorGradeHighlightLum\":0,\"UprightFocalLength35mm\":35,\"SplitToningHighlightHue\":176,\"SaturationAdjustmentAqua\":3,\"SaturationAdjustmentBlue\":4,\"UprightFourSegmentsCount\":0,\"SaturationAdjustmentGreen\":-9,\"LensManualDistortionAmount\":0,\"SaturationAdjustmentOrange\":-5,\"SaturationAdjustmentPurple\":-19,\"SaturationAdjustmentYellow\":-4,\"SplitToningShadowSaturation\":3,\"LuminanceNoiseReductionContrast\":0}",
  "project_id": "cb51b3b50aca41d98cbb7d0a8cca1b66",
  "edited_at": "2025-04-27 14:35:05",
  "temperature": "5562",
  "tint": "25",
  "exposure": 0.44999998807907104,
  "contrast": 40.0,
  "whites": 10.0,
  "blacks": 40.0,
  "shadows": 20.0,
  "highlights": -30.0,
  "inserted_at": "2025-04-27 20:05:01"
}
```

---

## narrative.default.edited_images_with_model_information

### Schema

| Column                         | Type              | Nullable |
| ------------------------------ | ----------------- | -------- |
| account_id                     | `StringType()`    | True     |
| share_link_id_used             | `StringType()`    | True     |
| time_saved_score_used          | `IntegerType()`   | True     |
| user_id                        | `StringType()`    | True     |
| narrative_forever_image_id     | `StringType()`    | True     |
| style_id                       | `StringType()`    | True     |
| project_id                     | `StringType()`    | True     |
| image_id                       | `StringType()`    | True     |
| data                           | `StringType()`    | True     |
| edited_at                      | `TimestampType()` | True     |
| success                        | `BooleanType()`   | True     |
| initial_temperature            | `StringType()`    | True     |
| temperature                    | `StringType()`    | True     |
| initial_tint                   | `StringType()`    | True     |
| tint                           | `StringType()`    | True     |
| intital_exposure               | `FloatType()`     | True     |
| exposure                       | `FloatType()`     | True     |
| intital_contrast               | `FloatType()`     | True     |
| contrast                       | `FloatType()`     | True     |
| initial_whites                 | `FloatType()`     | True     |
| whites                         | `FloatType()`     | True     |
| initial_blacks                 | `FloatType()`     | True     |
| blacks                         | `FloatType()`     | True     |
| intial_highlights              | `FloatType()`     | True     |
| highlights                     | `FloatType()`     | True     |
| intial_shadows                 | `FloatType()`     | True     |
| shadows                        | `FloatType()`     | True     |
| auto_level_apply               | `BooleanType()`   | True     |
| auto_level_value               | `FloatType()`     | True     |
| cluster_index                  | `IntegerType()`   | True     |
| share_link_id                  | `StringType()`    | True     |
| next_share_link_id_inserted_at | `TimestampType()` | True     |
| training_approach_used         | `StringType()`    | True     |

### Sample Row

```json
{
  "account_id": "45546cc1-a3e4-4399-8be3-1d5dfc0b1306",
  "share_link_id_used": "dfbf1ca5-7131-40b5-95f9-2fb07cafb697",
  "time_saved_score_used": NaN,
  "user_id": "cd35a61f-4d4a-48ff-9001-9a3f631773e4",
  "narrative_forever_image_id": "42b99414-8476-4496-a934-e921eabf6492",
  "style_id": "c172676f-b324-49b1-aac1-58536c932546",
  "project_id": "b376d28939aa4dfc92fb3c0a46ed290d",
  "image_id": "da849cb970934bcdb23f7d9b962f2898",
  "data": "{\"tint\": 15, \"blacks\": 0, \"run_id\": \"c907ae1a-2cec-48ef-9d09-e69e7e6fdb94\", \"whites\": 0, \"shadows\": 40, \"success\": true, \"contrast\": 0, \"exposure\": 1.399999976158142, \"image_id\": \"da849cb970934bcdb23f7d9b962f2898\", \"modal_id\": \"3c143d27-c774-4d26-a2c8-9074394e7ccb\", \"style_id\": \"c172676f-b324-49b1-aac1-58536c932546\", \"highlights\": -40, \"install_id\": \"8CDABBEA-417A-44A2-8AA3-B8D6F0531FEB\", \"project_id\": \"b376d28939aa4dfc92fb3c0a46ed290d\", \"temperature\": 6000, \"log_sequence\": 6468, \"current_route\": \"/project/scenes\", \"auto_level_apply\": false, \"auto_level_value\": 5, \"machine_datetime\": \"2025-02-16T00:08:46.458Z\", \"app_version_number\": \"2.0.37\", \"ms_since_app_start\": 6303785, \"narrative_forever_image_id\": \"42b99414-8476-4496-a934-e921eabf6492\"}",
  "edited_at": "2025-02-16 00:08:50",
  "success": true,
  "initial_temperature": "6000",
  "temperature": "6000",
  "initial_tint": "15",
  "tint": "15",
  "intital_exposure": 1.399999976158142,
  "exposure": 1.399999976158142,
  "intital_contrast": 0.0,
  "contrast": 0.0,
  "initial_whites": 0.0,
  "whites": 0.0,
  "initial_blacks": 0.0,
  "blacks": 0.0,
  "intial_highlights": -40.0,
  "highlights": -40.0,
  "intial_shadows": 40.0,
  "shadows": 40.0,
  "auto_level_apply": false,
  "auto_level_value": 5.0,
  "cluster_index": 81,
  "share_link_id": "dfbf1ca5-7131-40b5-95f9-2fb07cafb697",
  "next_share_link_id_inserted_at": "NaT",
  "training_approach_used": "standard"
}
```

---

## narrative.stripe.credit_note_discount_amounts

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| amount          | `LongType()`      | True     |
| batch_timestamp | `TimestampType()` | True     |
| credit_note_id  | `StringType()`    | True     |
| discount        | `StringType()`    | True     |
| id              | `StringType()`    | True     |
| merchant_id     | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 175,
  "batch_timestamp": "2025-06-25 00:00:00",
  "credit_note_id": "cn_1RdfSFGyxyMEWHozqm2LMJiH",
  "discount": "di_1RY18eGyxyMEWHozTtaJGUWc",
  "id": "discam_SYn2KeYGCygAEb",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025062500",
  "table_name": "credit_note_discount_amounts"
}
```

---

## narrative.stripe.credit_note_line_item_discount_amounts

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| amount                   | `LongType()`      | True     |
| batch_timestamp          | `TimestampType()` | True     |
| credit_note_id           | `StringType()`    | True     |
| credit_note_line_item_id | `StringType()`    | True     |
| discount                 | `StringType()`    | True     |
| id                       | `StringType()`    | True     |
| merchant_id              | `StringType()`    | True     |
| hour                     | `StringType()`    | True     |
| table_name               | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 180,
  "batch_timestamp": "2024-04-04 00:00:00",
  "credit_note_id": "cn_1LLsnVGyxyMEWHozZwPC3D9T",
  "credit_note_line_item_id": "cnli_1LLsnVGyxyMEWHozvvghuwwX",
  "discount": "di_1Id5oVGyxyMEWHozdZXKQ2S5",
  "id": "discam_M40p0epCsqn1jd",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "hour": "2025062500",
  "table_name": "credit_note_line_item_discount_amounts"
}
```

---

## narrative.stripe.credit_note_line_item_tax_amounts

### Schema

| Column                   | Type              | Nullable |
| ------------------------ | ----------------- | -------- |
| amount                   | `LongType()`      | True     |
| batch_timestamp          | `TimestampType()` | True     |
| credit_note_line_item_id | `StringType()`    | True     |
| id                       | `StringType()`    | True     |
| inclusive                | `BooleanType()`   | True     |
| merchant_id              | `StringType()`    | True     |
| tax_rate_id              | `StringType()`    | True     |
| hour                     | `StringType()`    | True     |
| table_name               | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 0,
  "batch_timestamp": "2024-03-13 18:00:00",
  "credit_note_line_item_id": "cnli_1HinuYGyxyMEWHozl78cOGWg",
  "id": "ta_IJQmvUu0iJN09e",
  "inclusive": true,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "tax_rate_id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
  "hour": "2025062500",
  "table_name": "credit_note_line_item_tax_amounts"
}
```

---

## narrative.stripe.credit_note_line_items

### Schema

| Column              | Type              | Nullable |
| ------------------- | ----------------- | -------- |
| amount              | `LongType()`      | True     |
| batch_timestamp     | `TimestampType()` | True     |
| credit_note_id      | `StringType()`    | True     |
| description         | `StringType()`    | True     |
| discount_amount     | `LongType()`      | True     |
| id                  | `StringType()`    | True     |
| invoice_line_item   | `StringType()`    | True     |
| merchant_id         | `StringType()`    | True     |
| quantity            | `LongType()`      | True     |
| type                | `StringType()`    | True     |
| unit_amount         | `LongType()`      | True     |
| unit_amount_decimal | `StringType()`    | True     |
| hour                | `StringType()`    | True     |
| table_name          | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 2900,
  "batch_timestamp": "2025-06-25 00:00:00",
  "credit_note_id": "cn_1RdfSFGyxyMEWHozqm2LMJiH",
  "description": "1 \u00d7 Select (at $29.00 / month)",
  "discount_amount": 1118,
  "id": "cnli_1RdfSFGyxyMEWHozQv5jFhcs",
  "invoice_line_item": "sli_19af30GyxyMEWHoz04c13c4a",
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "quantity": 1,
  "type": "invoice_line_item",
  "unit_amount": 2900,
  "unit_amount_decimal": "2900",
  "hour": "2025062500",
  "table_name": "credit_note_line_items"
}
```

---

## narrative.stripe.credit_note_tax_amounts

### Schema

| Column          | Type              | Nullable |
| --------------- | ----------------- | -------- |
| amount          | `LongType()`      | True     |
| batch_timestamp | `TimestampType()` | True     |
| credit_note_id  | `StringType()`    | True     |
| id              | `StringType()`    | True     |
| inclusive       | `BooleanType()`   | True     |
| merchant_id     | `StringType()`    | True     |
| tax_rate_id     | `StringType()`    | True     |
| hour            | `StringType()`    | True     |
| table_name      | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 0,
  "batch_timestamp": "2025-06-25 00:00:00",
  "credit_note_id": "cn_1RdfSFGyxyMEWHozqm2LMJiH",
  "id": "ta_SYn2OTd40pjXYD",
  "inclusive": true,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "tax_rate_id": "txr_1EXfX3GyxyMEWHozoxcDzEvT",
  "hour": "2025062500",
  "table_name": "credit_note_tax_amounts"
}
```

---

## narrative.stripe.credit_notes

### Schema

| Column                          | Type              | Nullable |
| ------------------------------- | ----------------- | -------- |
| amount                          | `LongType()`      | True     |
| amount_shipping                 | `LongType()`      | True     |
| batch_timestamp                 | `TimestampType()` | True     |
| created                         | `TimestampType()` | True     |
| currency                        | `StringType()`    | True     |
| customer_balance_transaction_id | `StringType()`    | True     |
| customer_id                     | `StringType()`    | True     |
| effective_at                    | `TimestampType()` | True     |
| id                              | `StringType()`    | True     |
| invoice_id                      | `StringType()`    | True     |
| memo                            | `StringType()`    | True     |
| merchant_id                     | `StringType()`    | True     |
| number                          | `StringType()`    | True     |
| out_of_band_amount              | `LongType()`      | True     |
| reason                          | `StringType()`    | True     |
| refund_id                       | `StringType()`    | True     |
| shipping_cost_amount_subtotal   | `LongType()`      | True     |
| shipping_cost_amount_tax        | `LongType()`      | True     |
| shipping_cost_amount_total      | `LongType()`      | True     |
| shipping_cost_shipping_rate_id  | `StringType()`    | True     |
| status                          | `StringType()`    | True     |
| type                            | `StringType()`    | True     |
| voided_at                       | `TimestampType()` | True     |
| hour                            | `StringType()`    | True     |
| table_name                      | `StringType()`    | True     |

### Sample Row

```json
{
  "amount": 10800,
  "amount_shipping": 0,
  "batch_timestamp": "2025-06-25 00:00:00",
  "created": "2025-06-24 23:51:38",
  "currency": "usd",
  "customer_balance_transaction_id": null,
  "customer_id": "cus_INYv6h5VmDwqjf",
  "effective_at": "2025-06-24 23:51:38",
  "id": "cn_1RdgcoGyxyMEWHozhaMEcsKY",
  "invoice_id": "in_1RdHXMGyxyMEWHoze8Hqnpxx",
  "memo": null,
  "merchant_id": "acct_1BGFUcGyxyMEWHoz",
  "number": "3DB97E43-0014-CN-01",
  "out_of_band_amount": NaN,
  "reason": null,
  "refund_id": "re_3RdIUEGyxyMEWHoz0O3pqEdN",
  "shipping_cost_amount_subtotal": NaN,
  "shipping_cost_amount_tax": NaN,
  "shipping_cost_amount_total": NaN,
  "shipping_cost_shipping_rate_id": null,
  "status": "issued",
  "type": "post_payment",
  "voided_at": "NaT",
  "hour": "2025062500",
  "table_name": "credit_notes"
}
```