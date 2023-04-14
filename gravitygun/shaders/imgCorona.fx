// 
// file: image4D_corona_nomat.fx
// version: v1.6
// author: Ren712
//

//--------------------------------------------------------------------------------------
// Settings
//--------------------------------------------------------------------------------------
float3 sLightPosition = float3(0,0,0);
float sLightAttenuation = 1;
float sLightAttenuationPower = 2;

float fDepthBias = 1;
float2 gDistFade = float2(250,150);

float2 sScrRes = float2(800, 600);
int fCullMode = 2;

//--------------------------------------------------------------------------------------
// Variables set by MTA
//--------------------------------------------------------------------------------------
float4x4 gProjectionMainScene : PROJECTION_MAIN_SCENE;
float4x4 gViewMainScene : VIEW_MAIN_SCENE;
int CUSTOMFLAGS < string skipUnusedParameters = "yes"; >;

//--------------------------------------------------------------------------------------
// Structures
//--------------------------------------------------------------------------------------
struct VSInput
{
    float3 Position : POSITION0;
    float2 TexCoord : TEXCOORD0;
    float4 Diffuse : COLOR0;
};

struct PSInput
{
    float4 Position : POSITION0;
    float2 TexCoord : TEXCOORD0;
    float DistFade : TEXCOORD1;
    float DistFactor : TEXCOORD2;
    float3 WorldPos : TEXCOORD3;
    float4 Diffuse : COLOR0;
};

//--------------------------------------------------------------------------------------
// Create world matrix with world position and euler rotation
//--------------------------------------------------------------------------------------
float4x4 createWorldMatrix(float3 pos, float3 rot)
{
    float4x4 eleMatrix = {
        float4(cos(rot.z) * cos(rot.y) - sin(rot.z) * sin(rot.x) * sin(rot.y), 
                cos(rot.y) * sin(rot.z) + cos(rot.z) * sin(rot.x) * sin(rot.y), -cos(rot.x) * sin(rot.y), 0),
        float4(-cos(rot.x) * sin(rot.z), cos(rot.z) * cos(rot.x), sin(rot.x), 0),
        float4(cos(rot.z) * sin(rot.y) + cos(rot.y) * sin(rot.z) * sin(rot.x), sin(rot.z) * sin(rot.y) - 
                cos(rot.z) * cos(rot.y) * sin(rot.x), cos(rot.x) * cos(rot.y), 0),
        float4(pos.x,pos.y,pos.z, 1),
    };
    return eleMatrix;
}

//--------------------------------------------------------------------------------------
// Inverse matrix
//--------------------------------------------------------------------------------------
float4x4 inverseMatrix(float4x4 input)
{
     #define minor(a,b,c) determinant(float3x3(input.a, input.b, input.c))
     
     float4x4 cofactors = float4x4(
          minor(_22_23_24, _32_33_34, _42_43_44), 
         -minor(_21_23_24, _31_33_34, _41_43_44),
          minor(_21_22_24, _31_32_34, _41_42_44),
         -minor(_21_22_23, _31_32_33, _41_42_43),
         
         -minor(_12_13_14, _32_33_34, _42_43_44),
          minor(_11_13_14, _31_33_34, _41_43_44),
         -minor(_11_12_14, _31_32_34, _41_42_44),
          minor(_11_12_13, _31_32_33, _41_42_43),
         
          minor(_12_13_14, _22_23_24, _42_43_44),
         -minor(_11_13_14, _21_23_24, _41_43_44),
          minor(_11_12_14, _21_22_24, _41_42_44),
         -minor(_11_12_13, _21_22_23, _41_42_43),
         
         -minor(_12_13_14, _22_23_24, _32_33_34),
          minor(_11_13_14, _21_23_24, _31_33_34),
         -minor(_11_12_14, _21_22_24, _31_32_34),
          minor(_11_12_13, _21_22_23, _31_32_33)
     );
     #undef minor
     return transpose(cofactors) / determinant(input);
}

//--------------------------------------------------------------------------------------
// Vertex Shader 
//--------------------------------------------------------------------------------------
PSInput VertexShaderFunction(VSInput VS)
{
    PSInput PS = (PSInput)0;
	
    // get camera position
    float4x4 sViewInverse = inverseMatrix(gViewMainScene);
    float3 sCameraPosition = sViewInverse[3].xyz; 
	
    // set proper position and scale of the quad	
    VS.Position.xy /= float2(sScrRes.x, sScrRes.y);
    VS.Position.xy =  - 0.5 + VS.Position.xy;
    VS.Position.xy *= sLightAttenuation * 2.5;
	
    // flip texCoords.x
    VS.TexCoord.x = 1 - VS.TexCoord.x;

    // create WorldMatrix for the quad
    float4x4 sWorld = createWorldMatrix(sLightPosition, float3(0,0,0));
	
    // calculate screen position of the vertex
    float4x4 sWorldView = mul(sWorld, gViewMainScene);
    float3 vPos = VS.Position.xyz + sWorldView[3].xyz;
    PS.WorldPos = VS.Position.xyz + sWorld[3].xyz;
    vPos.xyz += fDepthBias * 1.5 * mul( normalize(sCameraPosition - sLightPosition), (float3x3)gViewMainScene).xyz;
    PS.Position = mul(float4(vPos, 1), gProjectionMainScene);

    // get clip values
    float nearClip = - gProjectionMainScene[3][2] / gProjectionMainScene[2][2];
    float farClip = (gProjectionMainScene[3][2] / (1 - gProjectionMainScene[2][2]));	
	
    // fade object
    float DistFromCam = distance(sCameraPosition, sLightPosition);
    float2 DistFade = float2(min(gDistFade.x, farClip + sLightAttenuation / 2), min(gDistFade.y, farClip + sLightAttenuation /2 - (gDistFade.x - gDistFade.y)));
    PS.DistFade = saturate((DistFromCam - DistFade.x)/(DistFade.y - DistFade.x));
	
    DistFromCam /= fDepthBias;
    PS.DistFactor = saturate( DistFromCam * 0.5 - 1.6 );

    // pass texCoords and vertex color to PS
    PS.TexCoord = VS.TexCoord;
    PS.Diffuse = VS.Diffuse;
	
    return PS;
}

//--------------------------------------------------------------------------------------
// Pixel shaders 
//--------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    // compute the distance attenuation factor
    float fDistance = distance(sLightPosition, PS.WorldPos);

    // compute the attenuation
    float fAttenuation = 1 - saturate(fDistance / sLightAttenuation);
    fAttenuation = pow(fAttenuation, sLightAttenuationPower);
	
    // apply diffuse color
    float4 finalColor = PS.Diffuse;
	
    // apply diffuse color
    finalColor.rgb *= saturate(fAttenuation);

    // set fade
    finalColor.rgb *= PS.DistFactor;
    finalColor.rgb *= saturate(PS.DistFade);
	
    return saturate(finalColor);
}

//--------------------------------------------------------------------------------------
// Techniques
//--------------------------------------------------------------------------------------
technique dxDrawImage4D_corona_nomat
{
  pass P0
  {
    ZEnable = true;
    ZFunc = LessEqual;
    ZWriteEnable = false;
    CullMode = fCullMode;
    ShadeMode = Gouraud;
    AlphaBlendEnable = true;
    SrcBlend = SrcAlpha;
    DestBlend = One;
    AlphaTestEnable = true;
    AlphaRef = 1;
    AlphaFunc = GreaterEqual;
    Lighting = false;
    FogEnable = false;
    VertexShader = compile vs_2_0 VertexShaderFunction();
    PixelShader  = compile ps_2_0 PixelShaderFunction();
  }
} 

// Fallback
technique fallback
{
  pass P0
  {
    // Just draw normally
  }
}
