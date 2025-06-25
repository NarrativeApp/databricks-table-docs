# ML and Inference Tables

This file contains documentation for 3 Databricks warehouse tables related to machine learning and inference.
These tables track ML model inference operations, XMP data, and model-related information.

---

## narrative.default.cloud_xmp_inference_params_staging

### Schema

| Column             | Type           | Nullable |
| ------------------ | -------------- | -------- |
| id                 | `StringType()` | False    |
| project_id         | `StringType()` | True     |
| project_version_id | `StringType()` | True     |
| account_id         | `StringType()` | True     |
| user_id            | `StringType()` | True     |
| share_link_id      | `StringType()` | True     |

### Sample Row

```json
No sample data available
```

---

## narrative.default.common_xmp

### Schema

| Column                                     | Type                            | Nullable |
| ------------------------------------------ | ------------------------------- | -------- |
| crs_Amount                                 | `StringType()`                  | True     |
| crs_AutoLateralCA                          | `StringType()`                  | True     |
| crs_Blacks2012                             | `StringType()`                  | True     |
| crs_BlueHue                                | `StringType()`                  | True     |
| crs_BlueSaturation                         | `StringType()`                  | True     |
| crs_Brightness                             | `StringType()`                  | True     |
| crs_CameraProfile                          | `StringType()`                  | True     |
| crs_CameraProfileDigest                    | `StringType()`                  | True     |
| crs_Cluster                                | `StringType()`                  | True     |
| crs_ColorGradeBlending                     | `StringType()`                  | True     |
| crs_ColorGradeGlobalHue                    | `StringType()`                  | True     |
| crs_ColorGradeGlobalLum                    | `StringType()`                  | True     |
| crs_ColorGradeGlobalSat                    | `StringType()`                  | True     |
| crs_ColorGradeHighlightLum                 | `StringType()`                  | True     |
| crs_ColorGradeMidtoneHue                   | `StringType()`                  | True     |
| crs_ColorGradeMidtoneLum                   | `StringType()`                  | True     |
| crs_ColorGradeMidtoneSat                   | `StringType()`                  | True     |
| crs_ColorGradeShadowLum                    | `StringType()`                  | True     |
| crs_ColorNoiseReduction                    | `StringType()`                  | True     |
| crs_Contrast2012                           | `StringType()`                  | True     |
| crs_ConvertToGrayscale                     | `StringType()`                  | True     |
| crs_DefringeGreenAmount                    | `StringType()`                  | True     |
| crs_DefringeGreenHueHi                     | `StringType()`                  | True     |
| crs_DefringeGreenHueLo                     | `StringType()`                  | True     |
| crs_DefringePurpleAmount                   | `StringType()`                  | True     |
| crs_DefringePurpleHueHi                    | `StringType()`                  | True     |
| crs_DefringePurpleHueLo                    | `StringType()`                  | True     |
| crs_Dehaze                                 | `StringType()`                  | True     |
| crs_GrainAmount                            | `StringType()`                  | True     |
| crs_GrainSeed                              | `StringType()`                  | True     |
| crs_GrainSize                              | `StringType()`                  | True     |
| crs_GreenHue                               | `StringType()`                  | True     |
| crs_GreenSaturation                        | `StringType()`                  | True     |
| crs_Highlights2012                         | `StringType()`                  | True     |
| crs_HueAdjustmentOrange                    | `StringType()`                  | True     |
| crs_HueAdjustmentRed                       | `StringType()`                  | True     |
| crs_LensProfileEnable                      | `StringType()`                  | True     |
| crs_LuminanceAdjustmentGreen               | `StringType()`                  | True     |
| crs_LuminanceAdjustmentOrange              | `StringType()`                  | True     |
| crs_LuminanceAdjustmentRed                 | `StringType()`                  | True     |
| crs_LuminanceAdjustmentYellow              | `StringType()`                  | True     |
| crs_LuminanceNoiseReductionContrast        | `StringType()`                  | True     |
| crs_LuminanceSmoothing                     | `StringType()`                  | True     |
| crs_Name                                   | `StringType()`                  | True     |
| crs_OverrideLookVignette                   | `StringType()`                  | True     |
| crs_ParametricDarks                        | `StringType()`                  | True     |
| crs_ParametricHighlightSplit               | `StringType()`                  | True     |
| crs_ParametricHighlights                   | `StringType()`                  | True     |
| crs_ParametricLights                       | `StringType()`                  | True     |
| crs_ParametricMidtoneSplit                 | `StringType()`                  | True     |
| crs_ParametricShadowSplit                  | `StringType()`                  | True     |
| crs_ParametricShadows                      | `StringType()`                  | True     |
| crs_ProcessVersion                         | `StringType()`                  | True     |
| crs_RedHue                                 | `StringType()`                  | True     |
| crs_RedSaturation                          | `StringType()`                  | True     |
| crs_Saturation                             | `StringType()`                  | True     |
| crs_SaturationAdjustmentAqua               | `StringType()`                  | True     |
| crs_SaturationAdjustmentBlue               | `StringType()`                  | True     |
| crs_SaturationAdjustmentGreen              | `StringType()`                  | True     |
| crs_SaturationAdjustmentMagenta            | `StringType()`                  | True     |
| crs_SaturationAdjustmentOrange             | `StringType()`                  | True     |
| crs_SaturationAdjustmentPurple             | `StringType()`                  | True     |
| crs_SaturationAdjustmentRed                | `StringType()`                  | True     |
| crs_ShadowTint                             | `StringType()`                  | True     |
| crs_SharpenDetail                          | `StringType()`                  | True     |
| crs_SharpenEdgeMasking                     | `StringType()`                  | True     |
| crs_SharpenRadius                          | `StringType()`                  | True     |
| crs_Sharpness                              | `StringType()`                  | True     |
| crs_SplitToningHighlightHue                | `StringType()`                  | True     |
| crs_SplitToningHighlightSaturation         | `StringType()`                  | True     |
| crs_SplitToningShadowHue                   | `StringType()`                  | True     |
| crs_SplitToningShadowSaturation            | `StringType()`                  | True     |
| crs_Temperature                            | `StringType()`                  | True     |
| crs_Texture                                | `StringType()`                  | True     |
| crs_Tint                                   | `StringType()`                  | True     |
| crs_ToneCurveName2012                      | `StringType()`                  | True     |
| crs_ToneCurvePV2012                        | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurvePV2012Blue                    | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurvePV2012Green                   | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurvePV2012Red                     | `ArrayType(StringType(), True)` | True     |
| crs_UUID                                   | `StringType()`                  | True     |
| crs_Version                                | `StringType()`                  | True     |
| crs_Vibrance                               | `StringType()`                  | True     |
| crs_WhiteBalance                           | `StringType()`                  | True     |
| crs_Whites2012                             | `StringType()`                  | True     |
| id                                         | `StringType()`                  | True     |
| crs_Clarity2012                            | `StringType()`                  | True     |
| crs_HueAdjustmentBlue                      | `StringType()`                  | True     |
| crs_HueAdjustmentGreen                     | `StringType()`                  | True     |
| crs_HueAdjustmentMagenta                   | `StringType()`                  | True     |
| crs_HueAdjustmentPurple                    | `StringType()`                  | True     |
| crs_LuminanceAdjustmentAqua                | `StringType()`                  | True     |
| crs_LuminanceAdjustmentBlue                | `StringType()`                  | True     |
| crs_SaturationAdjustmentYellow             | `StringType()`                  | True     |
| crs_SplitToningBalance                     | `StringType()`                  | True     |
| crs_PostCropVignetteAmount                 | `StringType()`                  | True     |
| crs_HueAdjustmentAqua                      | `StringType()`                  | True     |
| crs_HueAdjustmentYellow                    | `StringType()`                  | True     |
| crs_LuminanceAdjustmentMagenta             | `StringType()`                  | True     |
| crs_LuminanceAdjustmentPurple              | `StringType()`                  | True     |
| crs_GrainFrequency                         | `StringType()`                  | True     |
| crs_SupportsAmount                         | `StringType()`                  | True     |
| crs_LookTable                              | `StringType()`                  | True     |
| crs_SupportsMonochrome                     | `StringType()`                  | True     |
| crs_SupportsOutputReferred                 | `StringType()`                  | True     |
| crs_EnableCalibration                      | `StringType()`                  | True     |
| crs_EnableColorAdjustments                 | `StringType()`                  | True     |
| crs_EnableDetail                           | `StringType()`                  | True     |
| crs_EnableEffects                          | `StringType()`                  | True     |
| crs_EnableGrayscaleMix                     | `StringType()`                  | True     |
| crs_EnableLensCorrections                  | `StringType()`                  | True     |
| crs_EnableMaskGroupBasedCorrections        | `StringType()`                  | True     |
| crs_EnableRedEye                           | `StringType()`                  | True     |
| crs_EnableRetouch                          | `StringType()`                  | True     |
| crs_EnableSplitToning                      | `StringType()`                  | True     |
| crs_EnableToneCurve                        | `StringType()`                  | True     |
| crs_EnableTransform                        | `StringType()`                  | True     |
| crs_Shadows2012                            | `StringType()`                  | True     |
| crs_ColorNoiseReductionSmoothness          | `StringType()`                  | True     |
| crs_LuminanceNoiseReductionDetail          | `StringType()`                  | True     |
| crs_RGBTable                               | `StringType()`                  | True     |
| crs_Table_BACAEFECE7EEA02DBB08E7452C80B37F | `StringType()`                  | True     |
| crs_Copyright                              | `StringType()`                  | True     |
| crs_Table_EB05360A8EF2E9346BD6680B7E8B6A2E | `StringType()`                  | True     |
| crs_Table_00932476724CFBC45173CE8A40992AE5 | `StringType()`                  | True     |
| crs_PostCropVignetteMidpoint               | `StringType()`                  | True     |
| crs_RGBTableAmount                         | `StringType()`                  | True     |
| crs_Table_8EEC448C5E9ED2AEBB2993DC14D4CB2E | `StringType()`                  | True     |
| crs_Exposure2012                           | `StringType()`                  | True     |
| crs_Table_356B3CA9DE02DDA62685E7FB69E702E0 | `StringType()`                  | True     |
| crs_ToneCurve                              | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurveBlue                          | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurveGreen                         | `ArrayType(StringType(), True)` | True     |
| crs_ToneCurveRed                           | `ArrayType(StringType(), True)` | True     |
| crs_ColorNoiseReductionDetail              | `StringType()`                  | True     |
| crs_Table_BDFB7ECCC706CB1ABA12161E2F2E80F4 | `StringType()`                  | True     |
| crs_PostCropVignetteFeather                | `StringType()`                  | True     |
| crs_Table_ADA20C7376694AAFF1CB59302B4EE76C | `StringType()`                  | True     |
| crs_Table_4F57A4A17C37A6F67644C1D7AD68D5B8 | `StringType()`                  | True     |
| crs_Table_E05513858A5AF28251E8EE3330EF3EAE | `StringType()`                  | True     |
| crs_PostCropVignetteRoundness              | `StringType()`                  | True     |
| crs_Table_D01C4E6BE74200A54BA1FEC90017F010 | `StringType()`                  | True     |
| crs_Table_33E7B7CB189C38FED387D4EB028BF18C | `StringType()`                  | True     |
| crs_Table_9D684190FB6F3E1F46E0A7FCA3277D3D | `StringType()`                  | True     |
| crs_LookTableAmount                        | `StringType()`                  | True     |
| crs_Table_BCF1BBD2D014495345685B5B23DC7A04 | `StringType()`                  | True     |
| crs_ToneMapStrength                        | `StringType()`                  | True     |
| crs_PostCropVignetteHighlightContrast      | `StringType()`                  | True     |
| crs_CurveRefineSaturation                  | `StringType()`                  | True     |
| crs_Table_D5ADD8466DA66CAA963B7BE851C435D4 | `StringType()`                  | True     |
| crs_CameraModelRestriction                 | `StringType()`                  | True     |
| crs_Table_42F665ECEA2F89B100787F1459719B9D | `StringType()`                  | True     |
| crs_Table_01DD31D77B930D709C9B59A16C711EB6 | `StringType()`                  | True     |
| crs_Table_ABD75B0BC36E8760ECF82A07A5185429 | `StringType()`                  | True     |
| crs_Table_811932D092486CCA71D44D63F0140283 | `StringType()`                  | True     |
| crs_Table_E4406A4BBEB9DC0C4368E0532C40BB79 | `StringType()`                  | True     |
| crs_Table_C45DE850C410724A6F68FD62575D7793 | `StringType()`                  | True     |
| crs_Table_2B6CC8397C6EF2E255D49AAEE8A16522 | `StringType()`                  | True     |
| crs_Table_909498D22392E9169E84D50DFC2C0C92 | `StringType()`                  | True     |
| crs_Table_1E60C71CD5A7F6B2B2D6D9609333CD22 | `StringType()`                  | True     |
| crs_Table_28E63D17B46549DCE4CD73EBBE6057E2 | `StringType()`                  | True     |
| crs_Table_4BD6CBBCB2820215DCF5B3CBCBF8CF6F | `StringType()`                  | True     |
| crs_CompatibleVersion                      | `StringType()`                  | True     |
| crs_CorrectionActive                       | `StringType()`                  | True     |
| crs_CorrectionAmount                       | `StringType()`                  | True     |
| crs_CorrectionID                           | `StringType()`                  | True     |
| crs_CorrectionName                         | `StringType()`                  | True     |
| crs_CorrectionReferenceX                   | `StringType()`                  | True     |
| crs_CorrectionReferenceY                   | `StringType()`                  | True     |
| crs_CorrectionSyncID                       | `StringType()`                  | True     |
| crs_LocalBlacks2012                        | `StringType()`                  | True     |
| crs_LocalBrightness                        | `StringType()`                  | True     |
| crs_LocalClarity                           | `StringType()`                  | True     |
| crs_LocalClarity2012                       | `StringType()`                  | True     |
| crs_LocalContrast                          | `StringType()`                  | True     |
| crs_LocalContrast2012                      | `StringType()`                  | True     |
| crs_LocalCurveRefineSaturation             | `StringType()`                  | True     |
| crs_LocalDefringe                          | `StringType()`                  | True     |
| crs_LocalDehaze                            | `StringType()`                  | True     |
| crs_LocalExposure                          | `StringType()`                  | True     |
| crs_LocalExposure2012                      | `StringType()`                  | True     |
| crs_LocalHighlights2012                    | `StringType()`                  | True     |
| crs_LocalHue                               | `StringType()`                  | True     |
| crs_LocalLuminanceNoise                    | `StringType()`                  | True     |
| crs_LocalMoire                             | `StringType()`                  | True     |
| crs_LocalSaturation                        | `StringType()`                  | True     |
| crs_LocalShadows2012                       | `StringType()`                  | True     |
| crs_LocalSharpness                         | `StringType()`                  | True     |
| crs_LocalTemperature                       | `StringType()`                  | True     |
| crs_LocalTexture                           | `StringType()`                  | True     |
| crs_LocalTint                              | `StringType()`                  | True     |
| crs_LocalToningHue                         | `StringType()`                  | True     |
| crs_LocalToningSaturation                  | `StringType()`                  | True     |
| crs_LocalWhites2012                        | `StringType()`                  | True     |
| crs_What                                   | `StringType()`                  | True     |
| crs_Table_EAD92337F0417C97DA1FDFB274D02CCB | `StringType()`                  | True     |
| crs_Table_D81255F49F36C08E8AE2193EAC812BC0 | `StringType()`                  | True     |
| crs_Table_918437E4298900D82BFECFC06ACC8F9C | `StringType()`                  | True     |
| crs_Table_865EEADDBB94F16797300263E3DF9F17 | `StringType()`                  | True     |
| crs_Table_B6AFAAE7282F2B3CEC2D0BC61F491D48 | `StringType()`                  | True     |
| crs_Table_31373D9BA9280799D5E1636B93397283 | `StringType()`                  | True     |
| crs_Table_42138F59A9C415DAE5B378D2B534EF95 | `StringType()`                  | True     |
| crs_Table_EB684B10613160B33204271875A9A1B6 | `StringType()`                  | True     |
| crs_Table_E2B307E85DFCF4DC4003FCC98929A4AF | `StringType()`                  | True     |
| crs_LocalGrain                             | `StringType()`                  | True     |
| crs_MaskActive                             | `StringType()`                  | True     |
| crs_MaskBlendMode                          | `StringType()`                  | True     |
| crs_MaskID                                 | `StringType()`                  | True     |
| crs_MaskInverted                           | `StringType()`                  | True     |
| crs_MaskName                               | `StringType()`                  | True     |
| crs_MaskSyncID                             | `StringType()`                  | True     |
| crs_MaskValue                              | `StringType()`                  | True     |
| crs_Table_566BC39190A14E805418024E2FBE00A4 | `StringType()`                  | True     |
| crs_Table_F323E0DABB8C9D0025D5492794545830 | `StringType()`                  | True     |
| crs_Table_D735209058A9223AFB2F56D240F641A2 | `StringType()`                  | True     |
| crs_Table_76A5EEFD47268583853A03CE8A0B7AC7 | `StringType()`                  | True     |
| crs_Table_7BE7B3EFB4D6EDFBCF3D468E43F7CF52 | `StringType()`                  | True     |
| crs_IncrementalTemperature                 | `StringType()`                  | True     |
| crs_IncrementalTint                        | `StringType()`                  | True     |
| crs_Table_3547D59A9D0924878AF372CFDC4E3A5A | `StringType()`                  | True     |
| crs_EnableCircularGradientBasedCorrections | `StringType()`                  | True     |
| crs_EnableGradientBasedCorrections         | `StringType()`                  | True     |
| crs_EnablePaintBasedCorrections            | `StringType()`                  | True     |
| crs_Table_B9078D6A682AEA853BE6C43990BAC649 | `StringType()`                  | True     |
| crs_Table_CFB9B3E2D9377EB1E9F110D27C7ABAD0 | `StringType()`                  | True     |
| crs_Table_8F090D76D9BD1FA95AB2755F289F39B9 | `StringType()`                  | True     |
| crs_Table_45BD90CCCF964AD5379BD921D282D00A | `StringType()`                  | True     |
| crs_Table_0DC9AABFC89FC315022CAEB3FC2EC6C6 | `StringType()`                  | True     |
| crs_HueShift                               | `StringType()`                  | True     |
| crs_LumScale                               | `StringType()`                  | True     |
| crs_RangeAmount                            | `StringType()`                  | True     |
| crs_SatScale                               | `StringType()`                  | True     |
| crs_SrcHue                                 | `StringType()`                  | True     |
| crs_SrcLum                                 | `StringType()`                  | True     |
| crs_SrcSat                                 | `StringType()`                  | True     |
| crs_Table_1509C8550BB7D0430EDB3F1AA3D80DC5 | `StringType()`                  | True     |
| crs_Table_827DEECF6341B7EB7DD9880F26AB18CA | `StringType()`                  | True     |
| crs_Table_3713D727EAC3AB7C9AF31E1A922BB161 | `StringType()`                  | True     |
| crs_Table_B043D64C69E707D814031C5BA89DD037 | `StringType()`                  | True     |
| crs_Table_EAB377BE22A8239302FBC29B0B2B82B8 | `StringType()`                  | True     |
| crs_Table_6ADE1C0692258623DF8E559E5F6395F8 | `StringType()`                  | True     |
| crs_Table_A5EB3CD6FCBCDBD31DF13FDB42B4C7A5 | `StringType()`                  | True     |
| crs_Table_EABC356CAA5E7CC41B51536BEA96274F | `StringType()`                  | True     |
| crs_Table_DB7477260596E17D1BC906C947D3385A | `StringType()`                  | True     |
| crs_Table_1F5C33472C7B7CAFEC9012676DC9E8CB | `StringType()`                  | True     |
| crs_Table_1DDDE3E0A639B0E712C8E5A87709A449 | `StringType()`                  | True     |
| crs_Table_20C8E3CB79AACF2A241451BA4B047517 | `StringType()`                  | True     |
| crs_Table_1505BC7F0678E57AB27C3C665078EE28 | `StringType()`                  | True     |
| crs_Table_C8D46020CB81C4CEDA0F7FB108C92EFB | `StringType()`                  | True     |
| crs_Table_3F6650CBF008F7F033F4A4534F149E21 | `StringType()`                  | True     |
| crs_Table_93AE8B8D4BE6B044D85E0F97B30CB027 | `StringType()`                  | True     |
| crs_Table_17B53C6386C7F69D9E815ADBFE4B59D3 | `StringType()`                  | True     |
| crs_Table_CA175A97087401B4233FC59471245427 | `StringType()`                  | True     |
| crs_Table_093C5F39226B5C964B4E037D5995C3EE | `StringType()`                  | True     |
| crs_Table_70DD1F9C23CB654D532A5C3FC18BA87F | `StringType()`                  | True     |
| crs_Table_A58884D4998531C6E6AC50EFEBCE81A6 | `StringType()`                  | True     |
| crs_Table_6967CA04F3D440238DDABE089A827864 | `StringType()`                  | True     |
| crs_Table_86436DB84E10755019C3F549731C5200 | `StringType()`                  | True     |
| crs_Table_BC1918B36EC237F6DDF38D0EF4A8D548 | `StringType()`                  | True     |
| crs_Table_51F9318496E6761333C33BE8D80A468B | `StringType()`                  | True     |
| crs_Table_C5851975E4CA70626309B6C612CE87B2 | `StringType()`                  | True     |
| crs_Table_21477FCA707A0B424182FCB345BC3D6F | `StringType()`                  | True     |
| crs_Table_3D6BDEEDEB0693E8F65EB8F0B6A7C625 | `StringType()`                  | True     |
| crs_Table_B036C23210263C2E1E03DF592AD59606 | `StringType()`                  | True     |
| crs_PostCropVignetteStyle                  | `StringType()`                  | True     |
| crs_Table_6A185490DAD90A1CAB4DFEB1FC2A394E | `StringType()`                  | True     |
| crs_Table_0B553426D2278E2DB417A89B5BB20B4A | `StringType()`                  | True     |
| crs_Table_5AB0D6BDC9AF9B439FC146CFC2A48A9C | `StringType()`                  | True     |
| crs_Table_B46F4EE9FB4250E0CFFFE3D58E386AEA | `StringType()`                  | True     |
| crs_Table_61F97751469D3787B3B4D6BC4AC1216F | `StringType()`                  | True     |
| crs_Table_2DDFAC81D38C17F5B3155000FF6B8916 | `StringType()`                  | True     |
| crs_Table_30E25B321CAC0889B10A703B1CE96182 | `StringType()`                  | True     |
| crs_Table_32DBFCAF51A20A30CBE43EEB916235D7 | `StringType()`                  | True     |
| crs_Table_A63D6C780B5B3B94EE4C8379EED5DFF7 | `StringType()`                  | True     |
| crs_Table_1214FCB5527B8281549879A1F63D06F0 | `StringType()`                  | True     |
| crs_Table_9CAB24D614B67D63F0A2899E78B77A5B | `StringType()`                  | True     |
| crs_Table_8681AD8ED9D30E4622BDBC8BFBDBB8B7 | `StringType()`                  | True     |
| crs_Table_547893592CC94E1C2DCCF000F3A1D7DF | `StringType()`                  | True     |
| crs_Table_026F358A853005A63C722ED20EB38F86 | `StringType()`                  | True     |
| crs_Table_DBCFCA86CF7DB43E3F2FD5B8D3FEA350 | `StringType()`                  | True     |
| crs_Table_CD059601477A730D8A8DE65928143814 | `StringType()`                  | True     |
| crs_Table_DC5243C63999D9A9D6312674D403C1BF | `StringType()`                  | True     |
| crs_Table_412A29E0EE43C7ACA2AFA706AE79E60A | `StringType()`                  | True     |
| crs_Table_CF10E32378963C5F876364EE47F8A0FD | `StringType()`                  | True     |
| crs_LocalCorrectedDepth                    | `StringType()`                  | True     |
| crs_Table_4A8B0C685915E0F72629EC732CA6CB16 | `StringType()`                  | True     |
| crs_Table_949B1015F3DB74B70C7C07A5BFA9C747 | `StringType()`                  | True     |
| crs_Table_3CFF98905DE005F2452BA47E43CD9C0E | `StringType()`                  | True     |
| crs_Table_9343771F4BF4B62F9D696B3C3961FF86 | `StringType()`                  | True     |
| crs_Table_D6EB78AAAEFDA1D362AE4BAD0D760A3B | `StringType()`                  | True     |
| crs_Table_C9BFB7573E8B65A0482B1FD1A1F06AED | `StringType()`                  | True     |
| crs_Table_618D484405B5B7648BD90C5143D3C296 | `StringType()`                  | True     |
| crs_Table_FCCBDB757452D9759ABAF0662E78A02A | `StringType()`                  | True     |
| crs_Table_AC0FD77059E9C37CB67B7FFCA444C36E | `StringType()`                  | True     |
| crs_Table_604C4EE882ED2FC790F702D41471E10B | `StringType()`                  | True     |
| crs_Table_D9545CE09C5BBD2091239A8E2ED7B3C9 | `StringType()`                  | True     |
| crs_Table_F7685A4793BB5B511B7ED19418A1CD3F | `StringType()`                  | True     |
| crs_Table_85CA39879BC7FE088038A0753302F95C | `StringType()`                  | True     |
| crs_Table_161A027404C8E32340044B67E722BA83 | `StringType()`                  | True     |
| crs_Table_016E4D1CF2211C1817CA030B43660F2E | `StringType()`                  | True     |
| crs_Table_5EC27441BDC832636B338D4DCEDE03C3 | `StringType()`                  | True     |
| crs_Table_45556D9947F22056918595E4680AD306 | `StringType()`                  | True     |
| crs_Table_CFDA251C176F0912405786B07BB84C76 | `StringType()`                  | True     |
| crs_Table_B5393543E93747615E97FA00C300AC36 | `StringType()`                  | True     |
| crs_Table_F7B60FDCFA08BC60E5968ADB77C4C5D4 | `StringType()`                  | True     |
| crs_Table_E4624B9092538A8E1895554BA3CECA72 | `StringType()`                  | True     |
| crs_Table_6C8B33A8DEA399548707279618F3FFE0 | `StringType()`                  | True     |
| crs_Table_F38655AD3B473E8740A53922BA19E258 | `StringType()`                  | True     |
| crs_Table_59BDD28474C4B3E940265CA758A23D6D | `StringType()`                  | True     |
| crs_Table_D5B722FF4505483800C82EEC9B94961E | `StringType()`                  | True     |
| crs_Table_F327A2B3E7BC2A80BA4CD0F199880D15 | `StringType()`                  | True     |
| crs_Table_DDB35EC2F73DC96DAC6D73A771A83002 | `StringType()`                  | True     |
| crs_Table_1395B9163CCD46B67145532AFB1538FF | `StringType()`                  | True     |
| crs_Table_FE1BB1CBA6478C20729CCBECA907A80C | `StringType()`                  | True     |
| crs_Table_C07FCFBB96FF87533678716E9E433E82 | `StringType()`                  | True     |
| crs_Table_BDD73D8142748C0342558637C6D6FFAB | `StringType()`                  | True     |
| crs_Table_D550A8299ED3C438B12AB09F72498997 | `StringType()`                  | True     |
| crs_Table_115C02543A6BD94B4EDC8199F5C9C203 | `StringType()`                  | True     |
| crs_Table_DF91A888E1A91F94AC13E12E1C88368B | `StringType()`                  | True     |
| crs_Table_20A09A7C0E2F9AE9C7E515339B65D36D | `StringType()`                  | True     |
| crs_Table_7C528E96F427185998A50916B2651939 | `StringType()`                  | True     |
| crs_Table_C3E573EA50E8CD85D081F3884C4CEF14 | `StringType()`                  | True     |
| crs_Table_D569E868715512E8ADB3942DA0DB8938 | `StringType()`                  | True     |
| crs_Table_E1095149FDB39D7A057BAB208837E2E1 | `StringType()`                  | True     |
| crs_Table_BF4EE3B387CB4BFE5D34F70DB7B9B5CF | `StringType()`                  | True     |
| crs_Table_0AD85DE4777D94E517FE33D2DA0151A3 | `StringType()`                  | True     |
| crs_Table_C5B2B0ABCD816180E870AA32FA50FC8B | `StringType()`                  | True     |
| crs_Table_B855777A9102D9447088533DF8BFF5E4 | `StringType()`                  | True     |
| crs_Table_B6CC23309D42577CA118EB508E8B19F3 | `StringType()`                  | True     |
| crs_Table_AC9185BE00E7FBAC83842364BA1E19A0 | `StringType()`                  | True     |
| crs_Table_6660D56588866938C4C76746E5E8CDAF | `StringType()`                  | True     |
| crs_Table_D0279C6DB0636975FAB7234458596577 | `StringType()`                  | True     |
| crs_Table_EECE927BFDDE8E131D6F3CD837091EC9 | `StringType()`                  | True     |
| crs_Table_DD52783A1801B391BAE4B994D62A5901 | `StringType()`                  | True     |
| crs_Table_1067F7CADE73B0F447B30F04C246BBB0 | `StringType()`                  | True     |
| crs_Table_E992A22CFEAAF99AFCC4FCF61572B7AE | `StringType()`                  | True     |
| crs_Table_A59BBA95C0FF0B449CAFE8A678F6E80D | `StringType()`                  | True     |
| crs_Table_6BBCE0EAE0FFB10277E04F5128FCB9C2 | `StringType()`                  | True     |
| crs_Table_B35793CA68DF42D8E5592F03DC01696A | `StringType()`                  | True     |
| crs_Table_9A236BFCD1474C16E49759F7F8FD2461 | `StringType()`                  | True     |
| crs_Table_05AD0EEF19C4E7BE4E89DAC7DAA08518 | `StringType()`                  | True     |
| crs_Table_C4B59708FF0A5BD923562DD5DAF5D481 | `StringType()`                  | True     |
| crs_Table_FEB0F04AC0A8B5E1436BC5CD5BB1FE36 | `StringType()`                  | True     |
| crs_Table_678A182F84689F61A73ED4025296DA4A | `StringType()`                  | True     |
| crs_Table_9AC57619C34C900CCC04583DF2BB5023 | `StringType()`                  | True     |
| crs_Table_181393592EC0D5FE627AD901A8751DDC | `StringType()`                  | True     |
| crs_Table_DF3F7ED05D83310286B1BCB8C7A0084E | `StringType()`                  | True     |
| crs_Table_845BE2500294461A937E8089863599C5 | `StringType()`                  | True     |
| crs_Table_5594C159028FED44B403C33105A8B5AD | `StringType()`                  | True     |
| crs_Table_FEE1B35BF74C1A40FE1E8963EE1DB461 | `StringType()`                  | True     |
| crs_Table_DC5F85332D12815A701F4DF2B01E9DF7 | `StringType()`                  | True     |
| crs_Table_7DE1BF1A581D39B6414971BD4B8BC7FA | `StringType()`                  | True     |
| crs_Table_DB26520CCFC92CE98C42C9A570519933 | `StringType()`                  | True     |
| crs_Table_1F34F29526FC99E2C8F1404DDB9736EF | `StringType()`                  | True     |

### Sample Row

```json
{
  "crs_Amount": "1",
  "crs_AutoLateralCA": "0",
  "crs_Blacks2012": null,
  "crs_BlueHue": null,
  "crs_BlueSaturation": null,
  "crs_Brightness": "50",
  "crs_CameraProfile": null,
  "crs_CameraProfileDigest": "441F68BD6BC3369B59256B103CE2CD5C",
  "crs_Cluster": null,
  "crs_ColorGradeBlending": "50",
  "crs_ColorGradeGlobalHue": "45",
  "crs_ColorGradeGlobalLum": "0",
  "crs_ColorGradeGlobalSat": "0",
  "crs_ColorGradeHighlightLum": "0",
  "crs_ColorGradeMidtoneHue": "45",
  "crs_ColorGradeMidtoneLum": "-10",
  "crs_ColorGradeMidtoneSat": "4",
  "crs_ColorGradeShadowLum": "-10",
  "crs_ColorNoiseReduction": "40",
  "crs_Contrast2012": null,
  "crs_ConvertToGrayscale": "False",
  "crs_DefringeGreenAmount": "0",
  "crs_DefringeGreenHueHi": "60",
  "crs_DefringeGreenHueLo": "40",
  "crs_DefringePurpleAmount": "0",
  "crs_DefringePurpleHueHi": "70",
  "crs_DefringePurpleHueLo": "30",
  "crs_Dehaze": null,
  "crs_GrainAmount": "30",
  "crs_GrainSeed": "624837720",
  "crs_GrainSize": "20",
  "crs_GreenHue": null,
  "crs_GreenSaturation": null,
  "crs_Highlights2012": null,
  "crs_HueAdjustmentOrange": "-6",
  "crs_HueAdjustmentRed": null,
  "crs_LensProfileEnable": "1",
  "crs_LuminanceAdjustmentGreen": "-10",
  "crs_LuminanceAdjustmentOrange": "-10",
  "crs_LuminanceAdjustmentRed": null,
  "crs_LuminanceAdjustmentYellow": "-10",
  "crs_LuminanceNoiseReductionContrast": "0",
  "crs_LuminanceSmoothing": "10",
  "crs_Name": "G x Beba Pack 03 Profile",
  "crs_OverrideLookVignette": "False",
  "crs_ParametricDarks": null,
  "crs_ParametricHighlightSplit": null,
  "crs_ParametricHighlights": null,
  "crs_ParametricLights": null,
  "crs_ParametricMidtoneSplit": null,
  "crs_ParametricShadowSplit": null,
  "crs_ParametricShadows": null,
  "crs_ProcessVersion": "15.4",
  "crs_RedHue": null,
  "crs_RedSaturation": null,
  "crs_Saturation": "0",
  "crs_SaturationAdjustmentAqua": "-10",
  "crs_SaturationAdjustmentBlue": "-10",
  "crs_SaturationAdjustmentGreen": "-10",
  "crs_SaturationAdjustmentMagenta": "-20",
  "crs_SaturationAdjustmentOrange": "-12",
  "crs_SaturationAdjustmentPurple": "-20",
  "crs_SaturationAdjustmentRed": null,
  "crs_ShadowTint": null,
  "crs_SharpenDetail": "35",
  "crs_SharpenEdgeMasking": "0",
  "crs_SharpenRadius": "1.200000",
  "crs_Sharpness": "50",
  "crs_SplitToningHighlightHue": "45",
  "crs_SplitToningHighlightSaturation": "2",
  "crs_SplitToningShadowHue": "45",
  "crs_SplitToningShadowSaturation": "10",
  "crs_Temperature": "5500",
  "crs_Texture": null,
  "crs_Tint": "10",
  "crs_ToneCurveName2012": null,
  "crs_ToneCurvePV2012": "['0, 17' '24, 31' '43, 45' '115, 121' '183, 188' '255, 250']",
  "crs_ToneCurvePV2012Blue": "['0, 0' '30, 15' '72, 57' '143, 152' '194, 202' '255, 255']",
  "crs_ToneCurvePV2012Green": "['0, 0' '30, 15' '72, 57' '144, 153' '194, 202' '255, 255']",
  "crs_ToneCurvePV2012Red": "['0, 0' '30, 15' '72, 57' '142, 149' '199, 207' '255, 255']",
  "crs_UUID": "B25D7E43803D4D67A23795B7B7B6A16E",
  "crs_Version": "16.5",
  "crs_Vibrance": "-5",
  "crs_WhiteBalance": "Custom",
  "crs_Whites2012": null,
  "id": "53e2d8b6-a2af-4d3f-87c1-be3a923ff3b4/style/b6fa9551-8821-4882-bd2d-99f9ed475d18.common.xmp",
  "crs_Clarity2012": "-5",
  "crs_HueAdjustmentBlue": null,
  "crs_HueAdjustmentGreen": null,
  "crs_HueAdjustmentMagenta": "-20",
  "crs_HueAdjustmentPurple": "-20",
  "crs_LuminanceAdjustmentAqua": null,
  "crs_LuminanceAdjustmentBlue": null,
  "crs_SaturationAdjustmentYellow": "-20",
  "crs_SplitToningBalance": null,
  "crs_PostCropVignetteAmount": null,
  "crs_HueAdjustmentAqua": "-5",
  "crs_HueAdjustmentYellow": null,
  "crs_LuminanceAdjustmentMagenta": null,
  "crs_LuminanceAdjustmentPurple": null,
  "crs_GrainFrequency": "35",
  "crs_SupportsAmount": null,
  "crs_LookTable": null,
  "crs_SupportsMonochrome": null,
  "crs_SupportsOutputReferred": null,
  "crs_EnableCalibration": null,
  "crs_EnableColorAdjustments": null,
  "crs_EnableDetail": null,
  "crs_EnableEffects": null,
  "crs_EnableGrayscaleMix": null,
  "crs_EnableLensCorrections": null,
  "crs_EnableMaskGroupBasedCorrections": null,
  "crs_EnableRedEye": null,
  "crs_EnableRetouch": null,
  "crs_EnableSplitToning": null,
  "crs_EnableToneCurve": null,
  "crs_EnableTransform": null,
  "crs_Shadows2012": null,
  "crs_ColorNoiseReductionSmoothness": null,
  "crs_LuminanceNoiseReductionDetail": null,
  "crs_RGBTable": null,
  "crs_Table_BACAEFECE7EEA02DBB08E7452C80B37F": null,
  "crs_Copyright": null,
  "crs_Table_EB05360A8EF2E9346BD6680B7E8B6A2E": null,
  "crs_Table_00932476724CFBC45173CE8A40992AE5": null,
  "crs_PostCropVignetteMidpoint": null,
  "crs_RGBTableAmount": null,
  "crs_Table_8EEC448C5E9ED2AEBB2993DC14D4CB2E": null,
  "crs_Exposure2012": null,
  "crs_Table_356B3CA9DE02DDA62685E7FB69E702E0": null,
  "crs_ToneCurve": null,
  "crs_ToneCurveBlue": null,
  "crs_ToneCurveGreen": null,
  "crs_ToneCurveRed": null,
  "crs_ColorNoiseReductionDetail": null,
  "crs_Table_BDFB7ECCC706CB1ABA12161E2F2E80F4": null,
  "crs_PostCropVignetteFeather": null,
  "crs_Table_ADA20C7376694AAFF1CB59302B4EE76C": null,
  "crs_Table_4F57A4A17C37A6F67644C1D7AD68D5B8": null,
  "crs_Table_E05513858A5AF28251E8EE3330EF3EAE": null,
  "crs_PostCropVignetteRoundness": null,
  "crs_Table_D01C4E6BE74200A54BA1FEC90017F010": null,
  "crs_Table_33E7B7CB189C38FED387D4EB028BF18C": null,
  "crs_Table_9D684190FB6F3E1F46E0A7FCA3277D3D": null,
  "crs_LookTableAmount": null,
  "crs_Table_BCF1BBD2D014495345685B5B23DC7A04": null,
  "crs_ToneMapStrength": null,
  "crs_PostCropVignetteHighlightContrast": null,
  "crs_CurveRefineSaturation": null,
  "crs_Table_D5ADD8466DA66CAA963B7BE851C435D4": null,
  "crs_CameraModelRestriction": null,
  "crs_Table_42F665ECEA2F89B100787F1459719B9D": null,
  "crs_Table_01DD31D77B930D709C9B59A16C711EB6": null,
  "crs_Table_ABD75B0BC36E8760ECF82A07A5185429": null,
  "crs_Table_811932D092486CCA71D44D63F0140283": null,
  "crs_Table_E4406A4BBEB9DC0C4368E0532C40BB79": null,
  "crs_Table_C45DE850C410724A6F68FD62575D7793": null,
  "crs_Table_2B6CC8397C6EF2E255D49AAEE8A16522": null,
  "crs_Table_909498D22392E9169E84D50DFC2C0C92": null,
  "crs_Table_1E60C71CD5A7F6B2B2D6D9609333CD22": null,
  "crs_Table_28E63D17B46549DCE4CD73EBBE6057E2": null,
  "crs_Table_4BD6CBBCB2820215DCF5B3CBCBF8CF6F": null,
  "crs_CompatibleVersion": null,
  "crs_CorrectionActive": null,
  "crs_CorrectionAmount": null,
  "crs_CorrectionID": null,
  "crs_CorrectionName": null,
  "crs_CorrectionReferenceX": null,
  "crs_CorrectionReferenceY": null,
  "crs_CorrectionSyncID": null,
  "crs_LocalBlacks2012": null,
  "crs_LocalBrightness": null,
  "crs_LocalClarity": null,
  "crs_LocalClarity2012": null,
  "crs_LocalContrast": null,
  "crs_LocalContrast2012": null,
  "crs_LocalCurveRefineSaturation": null,
  "crs_LocalDefringe": null,
  "crs_LocalDehaze": null,
  "crs_LocalExposure": null,
  "crs_LocalExposure2012": null,
  "crs_LocalHighlights2012": null,
  "crs_LocalHue": null,
  "crs_LocalLuminanceNoise": null,
  "crs_LocalMoire": null,
  "crs_LocalSaturation": null,
  "crs_LocalShadows2012": null,
  "crs_LocalSharpness": null,
  "crs_LocalTemperature": null,
  "crs_LocalTexture": null,
  "crs_LocalTint": null,
  "crs_LocalToningHue": null,
  "crs_LocalToningSaturation": null,
  "crs_LocalWhites2012": null,
  "crs_What": null,
  "crs_Table_EAD92337F0417C97DA1FDFB274D02CCB": null,
  "crs_Table_D81255F49F36C08E8AE2193EAC812BC0": null,
  "crs_Table_918437E4298900D82BFECFC06ACC8F9C": null,
  "crs_Table_865EEADDBB94F16797300263E3DF9F17": null,
  "crs_Table_B6AFAAE7282F2B3CEC2D0BC61F491D48": null,
  "crs_Table_31373D9BA9280799D5E1636B93397283": null,
  "crs_Table_42138F59A9C415DAE5B378D2B534EF95": null,
  "crs_Table_EB684B10613160B33204271875A9A1B6": null,
  "crs_Table_E2B307E85DFCF4DC4003FCC98929A4AF": null,
  "crs_LocalGrain": null,
  "crs_MaskActive": null,
  "crs_MaskBlendMode": null,
  "crs_MaskID": null,
  "crs_MaskInverted": null,
  "crs_MaskName": null,
  "crs_MaskSyncID": null,
  "crs_MaskValue": null,
  "crs_Table_566BC39190A14E805418024E2FBE00A4": null,
  "crs_Table_F323E0DABB8C9D0025D5492794545830": null,
  "crs_Table_D735209058A9223AFB2F56D240F641A2": null,
  "crs_Table_76A5EEFD47268583853A03CE8A0B7AC7": null,
  "crs_Table_7BE7B3EFB4D6EDFBCF3D468E43F7CF52": null,
  "crs_IncrementalTemperature": null,
  "crs_IncrementalTint": null,
  "crs_Table_3547D59A9D0924878AF372CFDC4E3A5A": null,
  "crs_EnableCircularGradientBasedCorrections": null,
  "crs_EnableGradientBasedCorrections": null,
  "crs_EnablePaintBasedCorrections": null,
  "crs_Table_B9078D6A682AEA853BE6C43990BAC649": null,
  "crs_Table_CFB9B3E2D9377EB1E9F110D27C7ABAD0": null,
  "crs_Table_8F090D76D9BD1FA95AB2755F289F39B9": null,
  "crs_Table_45BD90CCCF964AD5379BD921D282D00A": null,
  "crs_Table_0DC9AABFC89FC315022CAEB3FC2EC6C6": null,
  "crs_HueShift": null,
  "crs_LumScale": null,
  "crs_RangeAmount": null,
  "crs_SatScale": null,
  "crs_SrcHue": null,
  "crs_SrcLum": null,
  "crs_SrcSat": null,
  "crs_Table_1509C8550BB7D0430EDB3F1AA3D80DC5": null,
  "crs_Table_827DEECF6341B7EB7DD9880F26AB18CA": null,
  "crs_Table_3713D727EAC3AB7C9AF31E1A922BB161": null,
  "crs_Table_B043D64C69E707D814031C5BA89DD037": null,
  "crs_Table_EAB377BE22A8239302FBC29B0B2B82B8": null,
  "crs_Table_6ADE1C0692258623DF8E559E5F6395F8": null,
  "crs_Table_A5EB3CD6FCBCDBD31DF13FDB42B4C7A5": null,
  "crs_Table_EABC356CAA5E7CC41B51536BEA96274F": null,
  "crs_Table_DB7477260596E17D1BC906C947D3385A": null,
  "crs_Table_1F5C33472C7B7CAFEC9012676DC9E8CB": null,
  "crs_Table_1DDDE3E0A639B0E712C8E5A87709A449": null,
  "crs_Table_20C8E3CB79AACF2A241451BA4B047517": null,
  "crs_Table_1505BC7F0678E57AB27C3C665078EE28": null,
  "crs_Table_C8D46020CB81C4CEDA0F7FB108C92EFB": null,
  "crs_Table_3F6650CBF008F7F033F4A4534F149E21": null,
  "crs_Table_93AE8B8D4BE6B044D85E0F97B30CB027": null,
  "crs_Table_17B53C6386C7F69D9E815ADBFE4B59D3": null,
  "crs_Table_CA175A97087401B4233FC59471245427": null,
  "crs_Table_093C5F39226B5C964B4E037D5995C3EE": null,
  "crs_Table_70DD1F9C23CB654D532A5C3FC18BA87F": null,
  "crs_Table_A58884D4998531C6E6AC50EFEBCE81A6": null,
  "crs_Table_6967CA04F3D440238DDABE089A827864": null,
  "crs_Table_86436DB84E10755019C3F549731C5200": null,
  "crs_Table_BC1918B36EC237F6DDF38D0EF4A8D548": null,
  "crs_Table_51F9318496E6761333C33BE8D80A468B": null,
  "crs_Table_C5851975E4CA70626309B6C612CE87B2": null,
  "crs_Table_21477FCA707A0B424182FCB345BC3D6F": null,
  "crs_Table_3D6BDEEDEB0693E8F65EB8F0B6A7C625": null,
  "crs_Table_B036C23210263C2E1E03DF592AD59606": null,
  "crs_PostCropVignetteStyle": null,
  "crs_Table_6A185490DAD90A1CAB4DFEB1FC2A394E": null,
  "crs_Table_0B553426D2278E2DB417A89B5BB20B4A": null,
  "crs_Table_5AB0D6BDC9AF9B439FC146CFC2A48A9C": null,
  "crs_Table_B46F4EE9FB4250E0CFFFE3D58E386AEA": null,
  "crs_Table_61F97751469D3787B3B4D6BC4AC1216F": null,
  "crs_Table_2DDFAC81D38C17F5B3155000FF6B8916": null,
  "crs_Table_30E25B321CAC0889B10A703B1CE96182": null,
  "crs_Table_32DBFCAF51A20A30CBE43EEB916235D7": null,
  "crs_Table_A63D6C780B5B3B94EE4C8379EED5DFF7": null,
  "crs_Table_1214FCB5527B8281549879A1F63D06F0": null,
  "crs_Table_9CAB24D614B67D63F0A2899E78B77A5B": null,
  "crs_Table_8681AD8ED9D30E4622BDBC8BFBDBB8B7": null,
  "crs_Table_547893592CC94E1C2DCCF000F3A1D7DF": null,
  "crs_Table_026F358A853005A63C722ED20EB38F86": null,
  "crs_Table_DBCFCA86CF7DB43E3F2FD5B8D3FEA350": null,
  "crs_Table_CD059601477A730D8A8DE65928143814": null,
  "crs_Table_DC5243C63999D9A9D6312674D403C1BF": null,
  "crs_Table_412A29E0EE43C7ACA2AFA706AE79E60A": null,
  "crs_Table_CF10E32378963C5F876364EE47F8A0FD": null,
  "crs_LocalCorrectedDepth": null,
  "crs_Table_4A8B0C685915E0F72629EC732CA6CB16": null,
  "crs_Table_949B1015F3DB74B70C7C07A5BFA9C747": null,
  "crs_Table_3CFF98905DE005F2452BA47E43CD9C0E": null,
  "crs_Table_9343771F4BF4B62F9D696B3C3961FF86": null,
  "crs_Table_D6EB78AAAEFDA1D362AE4BAD0D760A3B": null,
  "crs_Table_C9BFB7573E8B65A0482B1FD1A1F06AED": null,
  "crs_Table_618D484405B5B7648BD90C5143D3C296": null,
  "crs_Table_FCCBDB757452D9759ABAF0662E78A02A": null,
  "crs_Table_AC0FD77059E9C37CB67B7FFCA444C36E": null,
  "crs_Table_604C4EE882ED2FC790F702D41471E10B": null,
  "crs_Table_D9545CE09C5BBD2091239A8E2ED7B3C9": null,
  "crs_Table_F7685A4793BB5B511B7ED19418A1CD3F": null,
  "crs_Table_85CA39879BC7FE088038A0753302F95C": null,
  "crs_Table_161A027404C8E32340044B67E722BA83": null,
  "crs_Table_016E4D1CF2211C1817CA030B43660F2E": null,
  "crs_Table_5EC27441BDC832636B338D4DCEDE03C3": null,
  "crs_Table_45556D9947F22056918595E4680AD306": null,
  "crs_Table_CFDA251C176F0912405786B07BB84C76": null,
  "crs_Table_B5393543E93747615E97FA00C300AC36": null,
  "crs_Table_F7B60FDCFA08BC60E5968ADB77C4C5D4": null,
  "crs_Table_E4624B9092538A8E1895554BA3CECA72": null,
  "crs_Table_6C8B33A8DEA399548707279618F3FFE0": null,
  "crs_Table_F38655AD3B473E8740A53922BA19E258": null,
  "crs_Table_59BDD28474C4B3E940265CA758A23D6D": null,
  "crs_Table_D5B722FF4505483800C82EEC9B94961E": null,
  "crs_Table_F327A2B3E7BC2A80BA4CD0F199880D15": null,
  "crs_Table_DDB35EC2F73DC96DAC6D73A771A83002": null,
  "crs_Table_1395B9163CCD46B67145532AFB1538FF": null,
  "crs_Table_FE1BB1CBA6478C20729CCBECA907A80C": null,
  "crs_Table_C07FCFBB96FF87533678716E9E433E82": null,
  "crs_Table_BDD73D8142748C0342558637C6D6FFAB": null,
  "crs_Table_D550A8299ED3C438B12AB09F72498997": null,
  "crs_Table_115C02543A6BD94B4EDC8199F5C9C203": null,
  "crs_Table_DF91A888E1A91F94AC13E12E1C88368B": null,
  "crs_Table_20A09A7C0E2F9AE9C7E515339B65D36D": null,
  "crs_Table_7C528E96F427185998A50916B2651939": null,
  "crs_Table_C3E573EA50E8CD85D081F3884C4CEF14": null,
  "crs_Table_D569E868715512E8ADB3942DA0DB8938": null,
  "crs_Table_E1095149FDB39D7A057BAB208837E2E1": null,
  "crs_Table_BF4EE3B387CB4BFE5D34F70DB7B9B5CF": null,
  "crs_Table_0AD85DE4777D94E517FE33D2DA0151A3": null,
  "crs_Table_C5B2B0ABCD816180E870AA32FA50FC8B": null,
  "crs_Table_B855777A9102D9447088533DF8BFF5E4": null,
  "crs_Table_B6CC23309D42577CA118EB508E8B19F3": null,
  "crs_Table_AC9185BE00E7FBAC83842364BA1E19A0": null,
  "crs_Table_6660D56588866938C4C76746E5E8CDAF": null,
  "crs_Table_D0279C6DB0636975FAB7234458596577": null,
  "crs_Table_EECE927BFDDE8E131D6F3CD837091EC9": null,
  "crs_Table_DD52783A1801B391BAE4B994D62A5901": null,
  "crs_Table_1067F7CADE73B0F447B30F04C246BBB0": null,
  "crs_Table_E992A22CFEAAF99AFCC4FCF61572B7AE": null,
  "crs_Table_A59BBA95C0FF0B449CAFE8A678F6E80D": null,
  "crs_Table_6BBCE0EAE0FFB10277E04F5128FCB9C2": null,
  "crs_Table_B35793CA68DF42D8E5592F03DC01696A": null,
  "crs_Table_9A236BFCD1474C16E49759F7F8FD2461": null,
  "crs_Table_05AD0EEF19C4E7BE4E89DAC7DAA08518": null,
  "crs_Table_C4B59708FF0A5BD923562DD5DAF5D481": null,
  "crs_Table_FEB0F04AC0A8B5E1436BC5CD5BB1FE36": null,
  "crs_Table_678A182F84689F61A73ED4025296DA4A": null,
  "crs_Table_9AC57619C34C900CCC04583DF2BB5023": null,
  "crs_Table_181393592EC0D5FE627AD901A8751DDC": null,
  "crs_Table_DF3F7ED05D83310286B1BCB8C7A0084E": null,
  "crs_Table_845BE2500294461A937E8089863599C5": null,
  "crs_Table_5594C159028FED44B403C33105A8B5AD": null,
  "crs_Table_FEE1B35BF74C1A40FE1E8963EE1DB461": null,
  "crs_Table_DC5F85332D12815A701F4DF2B01E9DF7": null,
  "crs_Table_7DE1BF1A581D39B6414971BD4B8BC7FA": null,
  "crs_Table_DB26520CCFC92CE98C42C9A570519933": null,
  "crs_Table_1F34F29526FC99E2C8F1404DDB9736EF": null
}
```

---

## narrative.default.sync_progress_cloud_xmp_inference_params_staging

### Schema

| Column      | Type              | Nullable |
| ----------- | ----------------- | -------- |
| id          | `StringType()`    | False    |
| last_synced | `TimestampType()` | True     |

### Sample Row

```json
No sample data available
```