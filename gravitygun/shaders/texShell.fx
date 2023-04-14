//
// texShell.fx
// by Ren712[AngerMAN]
//

//---------------------------------------------------------------------
// Settings
//---------------------------------------------------------------------
texture gTextureShell;
float fSize = 0.03;
float2 fSpeed = float2(6,6); 
float4 fTextureColor = float4(1,0.6,0,1);
float fNormalStr = 0.45;

//---------------------------------------------------------------------
// Include some common stuff
//--------------------------------------------------------------------- 
float4x4 gWorld : WORLD;
float4x4 gView : VIEW;
float3 gCameraPosition : CAMERAPOSITION;
float4x4 gProjection : PROJECTION;
float gTime : TIME;
static const float PI = 3.14159265f;
texture gTexture0 < string textureState="0,Texture"; >;
int CUSTOMFLAGS < string createNormals = "yes"; string skipUnusedParameters = "yes"; >;

//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler2D Sampler0 = sampler_state
{
    Texture = (gTexture0);
};

sampler SamplerShell = sampler_state
{
    Texture = (gTextureShell);
    MinFilter       = Linear;
    MagFilter       = Linear;
    MipFilter       = Linear;
    AddressU        = Mirror;
    AddressV        = Mirror;
};

//---------------------------------------------------------------------
// Structure of data sent to the vertex shader
//---------------------------------------------------------------------
struct VSInput
{
  float3 Position : POSITION0;
  float4 Diffuse : COLOR0;
  float3 Normal : NORMAL;
  float2 TexCoord : TEXCOORD0;
};

//---------------------------------------------------------------------
// Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------
struct PSInput
{
  float4 Position : POSITION0;
  float4 Diffuse : COLOR0;
  float2 TexCoord : TEXCOORD0;
  float3 WorldPos : TEXCOORD1;
  float3 Normal : TEXCOORD2;
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

//------------------------------------------------------------------------------------------
// VertexShaderFunction
//  1. Read from VS structure
//  2. Process
//  3. Write to PS structure
//------------------------------------------------------------------------------------------
PSInput VertexShaderFunction(VSInput VS)
{
    PSInput PS = (PSInput)0;

    // Calculate screen pos of vertex
    VS.Position.xyz += fSize * VS.Normal.xyz;
    float4 posWorld = mul(float4(VS.Position.xyz,1), gWorld);
    float4 posWorldView = mul(posWorld, gView);
    PS.Position = mul(posWorldView, gProjection);
	
    PS.WorldPos = posWorld.xyz;
    PS.Normal = mul(VS.Normal.xyz, (float3x3)gWorld);
	
    // Pass through tex coord
    PS.TexCoord = VS.TexCoord;

    // Pass through Diffuse
    PS.Diffuse = VS.Diffuse;

    return PS;
}

//------------------------------------------------------------------------------------------
// getReflectionCoords
//------------------------------------------------------------------------------------------
float2 getReflectionCoords1(float3 dir)
{
    float m = 2. * sqrt(pow( dir.x, 2. ) + pow( dir.y, 2. ) + pow( dir.z + 1., 2. ));
    return dir.xy / m + .5;	
}

float2 getReflectionCoords2(float3 dir, float2 div)
{
    return float2(((atan2(dir.x, dir.z) / (PI * div.x)) + 1) / 2,  (acos(- dir.y) / (PI * div.y)));
}

//------------------------------------------------------------------------------------------
// reflectFactor
//------------------------------------------------------------------------------------------
float3 reflectFactor(float3 i, float3 n, float f)
{
    return i - 2 * n * dot(i, n) * f;
}

//------------------------------------------------------------------------------------------
// PixelShaderFunction
//  1. Read from PS structure
//  2. Process
//  3. Return pixel color
//------------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    // compute the direction to the light
    float3 view = normalize(gCameraPosition - PS.WorldPos);
	
    // make animation
    float2 animSphere = float2( fmod(( fSpeed.x * gTime)/4 ,2 * PI ),fmod(( fSpeed.y * gTime)/4 ,2 * PI ));
	
    // create rotation matrix
    float3x3 sRotation = (float3x3)createWorldMatrix(float3(0,0,0), float3(animSphere.x, 0, - animSphere.y));
	
    // get texCoords
    view = mul(view, sRotation);
    view = reflectFactor(view, PS.Normal, fNormalStr);
    float2 RefCoord = getReflectionCoords2(view.xzy,float2(1,1));	

    // get texture pixel
    float4 texShell = tex2D(SamplerShell, RefCoord);
    float texAlpha = tex2D(Sampler0, PS.TexCoord.xy).a * PS.Diffuse.a;

    // apply color
    float4 finalColor = texShell * fTextureColor;
    finalColor.a *= texAlpha;
    return saturate(finalColor);
}


//------------------------------------------------------------------------------------------
// Techniques
//------------------------------------------------------------------------------------------
technique shell
{
    pass P0
    {
        AlphaBlendEnable = true;
        AlphaRef = 1;
        SrcBlend = SrcAlpha;
        DestBlend = One;
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
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
