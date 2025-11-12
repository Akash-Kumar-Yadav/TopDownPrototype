Shader "Polytope Studio/URP/PT_Armors_PBR_URP"
{
    Properties
    {
        [HDR]_SKINCOLOR("SKIN COLOR", Color) = (2.02193,1.0081,0.6199315,0)
        _SKINSMOOTHNESS("SKIN SMOOTHNESS", Range(0,1)) = 0.3
        [HDR]_EYESCOLOR("EYES COLOR", Color) = (0.0734529,0.1320755,0.05046281,1)
        _EYESSMOOTHNESS("EYES SMOOTHNESS", Range(0,1)) = 0.7
        [HDR]_HAIRCOLOR("HAIR COLOR", Color) = (0.5943396,0.3518379,0.1093361,0)
        _HAIRSMOOTHNESS("HAIR SMOOTHNESS", Range(0,1)) = 0.1
        [HDR]_SCLERACOLOR("SCLERA COLOR", Color) = (0.9056604,0.8159487,0.8159487,0)
        _SCLERASMOOTHNESS("SCLERA SMOOTHNESS", Range(0,1)) = 0.5
        [HDR]_LIPSCOLOR("LIPS COLOR", Color) = (0.8301887,0.3185886,0.2780349,0)
        _LIPSSMOOTHNESS("LIPS SMOOTHNESS", Range(0,1)) = 0.4
        [HDR]_SCARSCOLOR("SCARS COLOR", Color) = (0.8490566,0.5037117,0.3884835,0)
        _SCARSSMOOTHNESS("SCARS SMOOTHNESS", Range(0,1)) = 0.3
        [HDR]_METAL1COLOR("METAL 1 COLOR", Color) = (2,0.682353,0.1960784,0)
        _METAL1METALLIC("METAL 1 METALLIC", Range(0,1)) = 0.65
        _METAL1SMOOTHNESS("METAL 1 SMOOTHNESS", Range(0,1)) = 0.7
        [HDR]_METAL2COLOR("METAL 2 COLOR", Color) = (0.4674706,0.4677705,0.5188679,0)
        _METAL2METALLIC("METAL 2 METALLIC", Range(0,1)) = 0.65
        _METAL2SMOOTHNESS("METAL 2 SMOOTHNESS", Range(0,1)) = 0.7
        [HDR]_METAL3COLOR("METAL 3 COLOR", Color) = (0.4383232,0.4383232,0.4716981,0)
        _METAL3METALLIC("METAL 3 METALLIC", Range(0,1)) = 0.65
        _METAL3SMOOTHNESS("METAL 3 SMOOTHNESS", Range(0,1)) = 0.7
        [HDR]_LEATHER1COLOR("LEATHER 1 COLOR", Color) = (0.4811321,0.2041155,0.08851016,1)
        _LEATHER1SMOOTHNESS("LEATHER 1 SMOOTHNESS", Range(0,1)) = 0.3
        [HDR]_LEATHER2COLOR("LEATHER 2 COLOR", Color) = (0.4245283,0.190437,0.09011215,1)
        _LEATHER2SMOOTHNESS("LEATHER 2 SMOOTHNESS", Range(0,1)) = 0.3
        [HDR]_LEATHER3COLOR("LEATHER 3 COLOR", Color) = (0.1698113,0.04637412,0.02963688,1)
        _LEATHER3SMOOTHNESS("LEATHER 3 SMOOTHNESS", Range(0,1)) = 0.3
        [HDR]_CLOTH1COLOR("CLOTH 1 COLOR", Color) = (0.1465379,0.282117,0.3490566,0)
        [HDR]_CLOTH2COLOR("CLOTH 2 COLOR", Color) = (1,0,0,0)
        [HDR]_CLOTH3COLOR("CLOTH 3 COLOR", Color) = (0.8773585,0.6337318,0.3434941,0)
        [HDR]_GEMS1COLOR("GEMS 1 COLOR", Color) = (0.3773585,0,0.06650025,0)
        _GEMS1SMOOTHNESS("GEMS 1 SMOOTHNESS", Range(0,1)) = 1
        [HDR]_GEMS2COLOR("GEMS 2 COLOR", Color) = (0.2023368,0,0.4339623,0)
        _GEMS2SMOOTHNESS("GEMS 2 SMOOTHNESS", Range(0,1)) = 0
        [HDR]_GEMS3COLOR("GEMS 3 COLOR", Color) = (0,0.1132075,0.01206957,0)
        _GEMS3SMOOTHNESS("GEMS 3 SMOOTHNESS", Range(0,1)) = 0
        [HDR]_FEATHERS1COLOR("FEATHERS 1 COLOR", Color) = (0.7735849,0.492613,0.492613,0)
        [HDR]_FEATHERS2COLOR("FEATHERS 2 COLOR", Color) = (0.6792453,0,0,0)
        [HDR]_FEATHERS3COLOR("FEATHERS 3 COLOR", Color) = (0,0.1793142,0.7264151,0)

        [HideInInspector]_Texture0("Texture 0", 2D) = "white" {}
        [HideInInspector]_Texture1("Texture 1", 2D) = "white" {}
        [HideInInspector][HDR]_Texture2("Texture 2", 2D) = "white" {}
        [HideInInspector]_Texture3("Texture 3", 2D) = "white" {}
        [HideInInspector]_Texture4("Texture 4", 2D) = "white" {}
        [HideInInspector]_Texture5("Texture 5", 2D) = "white" {}
        [HideInInspector]_Texture6("Texture 6", 2D) = "white" {}
        [HideInInspector]_Texture7("Texture 7", 2D) = "white" {}

        [HDR]_COATOFARMSCOLOR("COAT OF ARMS COLOR", Color) = (1,0,0,0)
        [NoScaleOffset]_COATOFARMSMASK("COAT OF ARMS MASK", 2D) = "black" {}
        _OCCLUSION("OCCLUSION", Range(0,1)) = 0.5
        [Toggle]_MetalicOn("Metalic On", Float) = 1
        [Toggle]_SmoothnessOn("Smoothness On", Float) = 1
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderPipeline"="UniversalRenderPipeline" "Queue"="Geometry" }
        LOD 300
        ZWrite On
        Blend One Zero
        Cull Back

        Pass
        {
            Name "UniversalForward"
            Tags { "LightMode" = "UniversalForward" }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
                float2 uv : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
            };

            struct Varyings
            {
                float4 positionH : SV_POSITION;
                float3 positionWS : TEXCOORD0;
                float3 normalWS : TEXCOORD1;
                float2 uv : TEXCOORD2;
                float2 uv2 : TEXCOORD3;
            };

            // textures
            TEXTURE2D(_Texture0); SAMPLER(sampler_Texture0);
            TEXTURE2D(_Texture1); SAMPLER(sampler_Texture1);
            TEXTURE2D(_Texture2); SAMPLER(sampler_Texture2);
            TEXTURE2D(_Texture3); SAMPLER(sampler_Texture3);
            TEXTURE2D(_Texture4); SAMPLER(sampler_Texture4);
            TEXTURE2D(_Texture5); SAMPLER(sampler_Texture5);
            TEXTURE2D(_Texture6); SAMPLER(sampler_Texture6);
            TEXTURE2D(_Texture7); SAMPLER(sampler_Texture7);
            TEXTURE2D(_COATOFARMSMASK); SAMPLER(sampler_COATOFARMSMASK);

            // properties
            half4 _SKINCOLOR;
            half _SKINSMOOTHNESS;
            half4 _EYESCOLOR;
            half _EYESSMOOTHNESS;
            half4 _HAIRCOLOR;
            half _HAIRSMOOTHNESS;
            half4 _SCLERACOLOR;
            half _SCLERASMOOTHNESS;
            half4 _LIPSCOLOR;
            half _LIPSSMOOTHNESS;
            half4 _SCARSCOLOR;
            half _SCARSSMOOTHNESS;

            half4 _METAL1COLOR; half _METAL1METALLIC; half _METAL1SMOOTHNESS;
            half4 _METAL2COLOR; half _METAL2METALLIC; half _METAL2SMOOTHNESS;
            half4 _METAL3COLOR; half _METAL3METALLIC; half _METAL3SMOOTHNESS;

            half4 _LEATHER1COLOR; half _LEATHER1SMOOTHNESS;
            half4 _LEATHER2COLOR; half _LEATHER2SMOOTHNESS;
            half4 _LEATHER3COLOR; half _LEATHER3SMOOTHNESS;

            half4 _CLOTH1COLOR; half4 _CLOTH2COLOR; half4 _CLOTH3COLOR;
            half4 _GEMS1COLOR; half _GEMS1SMOOTHNESS;
            half4 _GEMS2COLOR; half _GEMS2SMOOTHNESS;
            half4 _GEMS3COLOR; half _GEMS3SMOOTHNESS;
            half4 _FEATHERS1COLOR; half4 _FEATHERS2COLOR; half4 _FEATHERS3COLOR;

            half4 _COATOFARMSCOLOR;
            half _OCCLUSION;
            half _MetalicOn;
            half _SmoothnessOn;

            // tiny helper to convert a channel into a soft mask (mimics original graph's saturate/distance behavior)
            float ChannelMaskSoft(float c)
            {
                // make small threshold so faint values don't fully select
                const float edge = 0.05;
                return saturate( (c - 0.0) / max(edge, 1e-5) );
            }

            Varyings vert(Attributes v)
            {
                Varyings o;
                o.positionWS = TransformObjectToWorld(v.positionOS.xyz);
                o.positionH = TransformWorldToHClip(o.positionWS);
                o.normalWS = TransformObjectToWorldNormal(v.normalOS);
                o.uv = v.uv;
                o.uv2 = v.uv2;
                return o;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                // sample all masks and base color map (original used _Texture2 as multiply base)
                float4 baseColTex = SAMPLE_TEXTURE2D(_Texture2, sampler_Texture2, IN.uv);
                float4 mask7 = SAMPLE_TEXTURE2D(_Texture7, sampler_Texture7, IN.uv);
                float4 mask4 = SAMPLE_TEXTURE2D(_Texture4, sampler_Texture4, IN.uv);
                float4 mask5 = SAMPLE_TEXTURE2D(_Texture5, sampler_Texture5, IN.uv);
                float4 mask3 = SAMPLE_TEXTURE2D(_Texture3, sampler_Texture3, IN.uv);
                float4 mask6 = SAMPLE_TEXTURE2D(_Texture6, sampler_Texture6, IN.uv);
                float4 mask1 = SAMPLE_TEXTURE2D(_Texture1, sampler_Texture1, IN.uv);
                float4 mask0 = SAMPLE_TEXTURE2D(_Texture0, sampler_Texture0, IN.uv);
                float coatMaskA = SAMPLE_TEXTURE2D(_COATOFARMSMASK, sampler_COATOFARMSMASK, IN.uv2).a;

                float3 outColor = float3(0,0,0);
                float outMetal = 0;
                float outSmooth = 0;

                // --- GEMS (Texture7 channels: b -> g -> r priority) ---
                {
                    float wb = ChannelMaskSoft(mask7.b);
                    float wg = ChannelMaskSoft(mask7.g);
                    float wr = ChannelMaskSoft(mask7.r);
                    float wsum = saturate(wb + wg + wr);

                    float3 gemCols = (_GEMS3COLOR.rgb * wb) + (_GEMS2COLOR.rgb * wg) + (_GEMS1COLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * gemCols, wsum);

                    float gemSmooth = _GEMS3SMOOTHNESS * wb + _GEMS2SMOOTHNESS * wg + _GEMS1SMOOTHNESS * wr;
                    outSmooth = lerp(outSmooth, gemSmooth, wsum);
                }

                // --- FEATHERS (Texture4) ---
                {
                    float wb = ChannelMaskSoft(mask4.b);
                    float wg = ChannelMaskSoft(mask4.g);
                    float wr = ChannelMaskSoft(mask4.r);
                    float wsum = saturate(wb + wg + wr);
                    float3 featherCols = (_FEATHERS3COLOR.rgb * wb) + (_FEATHERS2COLOR.rgb * wg) + (_FEATHERS1COLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * featherCols, wsum);
                    // feathers: keep smoothness low unless set explicitly
                }

                // --- CLOTH (Texture5) ---
                {
                    float wb = ChannelMaskSoft(mask5.b);
                    float wg = ChannelMaskSoft(mask5.g);
                    float wr = ChannelMaskSoft(mask5.r);
                    float wsum = saturate(wb + wg + wr);
                    float3 clothCols = (_CLOTH3COLOR.rgb * wb) + (_CLOTH2COLOR.rgb * wg) + (_CLOTH1COLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * clothCols, wsum);
                }

                // --- LEATHER (Texture3) ---
                {
                    float wr = ChannelMaskSoft(mask3.r);
                    float wg = ChannelMaskSoft(mask3.g);
                    float wb = ChannelMaskSoft(mask3.b);
                    float wsum = saturate(wr + wg + wb);
                    float3 leatherCols = (_LEATHER1COLOR.rgb * wr) + (_LEATHER2COLOR.rgb * wg) + (_LEATHER3COLOR.rgb * wb);
                    outColor = lerp(outColor, baseColTex.rgb * leatherCols, wsum);
                    float leatherSmooth = _LEATHER1SMOOTHNESS * wr + _LEATHER2SMOOTHNESS * wg + _LEATHER3SMOOTHNESS * wb;
                    outSmooth = lerp(outSmooth, leatherSmooth, wsum);
                }

                // --- METAL (Texture6) ---
                {
                    float wb = ChannelMaskSoft(mask6.b);
                    float wg = ChannelMaskSoft(mask6.g);
                    float wr = ChannelMaskSoft(mask6.r);
                    float wsum = saturate(wb + wg + wr);
                    float3 metalCols = (_METAL3COLOR.rgb * wb) + (_METAL2COLOR.rgb * wg) + (_METAL1COLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * metalCols, wsum);

                    float metalVal = _METAL3METALLIC * wb + _METAL2METALLIC * wg + _METAL1METALLIC * wr;
                    outMetal = lerp(outMetal, metalVal, wsum);

                    float metalSmooth = _METAL3SMOOTHNESS * wb + _METAL2SMOOTHNESS * wg + _METAL1SMOOTHNESS * wr;
                    outSmooth = lerp(outSmooth, metalSmooth, wsum);
                }

                // --- SCARS / LIPS / SCLERA (Texture1: b -> g -> r) ---
                {
                    float wb = ChannelMaskSoft(mask1.b); // scars
                    float wg = ChannelMaskSoft(mask1.g); // lips
                    float wr = ChannelMaskSoft(mask1.r); // sclera
                    float wsum = saturate(wb + wg + wr);
                    float3 mixCols = (_SCARSCOLOR.rgb * wb) + (_LIPSCOLOR.rgb * wg) + (_SCLERACOLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * mixCols, wsum);
                    float s = _SCARSSMOOTHNESS * wb + _LIPSSMOOTHNESS * wg + _SCLERASMOOTHNESS * wr;
                    outSmooth = lerp(outSmooth, s, wsum);
                }

                // --- EYES / HAIR / SKIN (Texture0: b -> g -> r) ---
                {
                    float wb = ChannelMaskSoft(mask0.b); // eyes
                    float wg = ChannelMaskSoft(mask0.g); // hair
                    float wr = ChannelMaskSoft(mask0.r); // skin
                    float wsum = saturate(wb + wg + wr);
                    float3 mixCols = (_EYESCOLOR.rgb * wb) + (_HAIRCOLOR.rgb * wg) + (_SKINCOLOR.rgb * wr);
                    outColor = lerp(outColor, baseColTex.rgb * mixCols, wsum);
                    float s = _EYESSMOOTHNESS * wb + _HAIRSMOOTHNESS * wg + _SKINSMOOTHNESS * wr;
                    outSmooth = lerp(outSmooth, s, wsum);
                }

                // --- COAT OF ARMS: uses uv2 alpha (original inverted behavior preserved) ---
                {
                    float coatMask = 1.0 - coatMaskA;
                    // original used a distance/gamma trick; here we simply lerp by mask presence
                    outColor = lerp(outColor, _COATOFARMSCOLOR.rgb, saturate(1.0 - coatMask));
                }

                // Apply toggles
                float finalMetallic = (_MetalicOn > 0.5) ? outMetal : 0.0;
                float finalSmoothness = (_SmoothnessOn > 0.5) ? outSmooth : 0.0;

                // --- Prepare SurfaceData and InputData correctly (zero-init everything first) ---
                SurfaceData surfaceData = (SurfaceData)0;
                surfaceData.albedo = outColor;
                surfaceData.normalTS = float3(0, 0, 1);            // default tangent normal; URP will use InputData.normalWS
                surfaceData.emission = float3(0, 0, 0);
                surfaceData.metallic = finalMetallic;
                surfaceData.smoothness = finalSmoothness;
                surfaceData.occlusion = _OCCLUSION;
                surfaceData.specular = 0;
                surfaceData.alpha = 1.0;

                InputData inputData = (InputData)0;
                inputData.positionWS = IN.positionWS;
                inputData.normalWS = normalize(IN.normalWS);
                inputData.viewDirectionWS = GetWorldSpaceViewDir(IN.positionWS);
                inputData.shadowCoord = TransformWorldToShadowCoord(IN.positionWS);
                inputData.fogCoord = 0;
                // safe defaults for GI/shadow fields URP expects
                inputData.bakedGI = half3(0.1,0.1,0.1);
                inputData.vertexLighting = half3(0,0,0);
                inputData.normalizedScreenSpaceUV = float2(0,0);
                inputData.shadowMask = float4(1,1,1,1);

                // final PBR evaluation provided by URP
                half4 outCol = UniversalFragmentPBR(inputData, surfaceData);
                outCol.a = 1.0;
                return outCol;
            }

            ENDHLSL
        }

        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }

            ZWrite On
            ZTest LEqual
            ColorMask 0
            Cull Back

            HLSLPROGRAM
            #pragma vertex ShadowPassVertex
            #pragma fragment ShadowPassFragment
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            float3 _LightDirection;

            Varyings ShadowPassVertex(Attributes input)
            {
                Varyings output;
                float3 positionWS = TransformObjectToWorld(input.positionOS.xyz);
                float3 normalWS = TransformObjectToWorldNormal(input.normalOS);
                output.positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, _LightDirection));
                return output;
            }

            half4 ShadowPassFragment(Varyings input) : SV_TARGET
            {
                return 0;
            }

            ENDHLSL
        }

        Pass
        {
            Name "DepthOnly"
            Tags { "LightMode" = "DepthOnly" }

            ZWrite On
            ColorMask 0
            Cull Back

            HLSLPROGRAM
            #pragma vertex DepthOnlyVertex
            #pragma fragment DepthOnlyFragment
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            Varyings DepthOnlyVertex(Attributes input)
            {
                Varyings output;
                output.positionCS = TransformObjectToHClip(input.positionOS.xyz);
                return output;
            }

            half4 DepthOnlyFragment(Varyings input) : SV_TARGET
            {
                return 0;
            }

            ENDHLSL
        }
    }

    FallBack "Universal Render Pipeline/Unlit"
}