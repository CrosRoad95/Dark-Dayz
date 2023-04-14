// 
// file: image4D_bezier.fx
// version: v1.5
// author: Ren712
//

//--------------------------------------------------------------------------------------
// Settings
//--------------------------------------------------------------------------------------
float3 sPointPosition1 = float3(0, 0, 0);
float3 sPointPosition2 = float3(0, 0, 0);
float3 sPointPosition3 = float3(0, 0, 0);
float3 sPointPosition4 = float3(0, 0, 0);
float sElementRotationZ = 0;
float sTesselation = 1;
float sWidth = 1;

float2 sScrRes = float2(800, 600);
bool sIsBillboard = false;
bool sFlipTexture = false;
bool sFogEnable = false;
int fCullMode = 1;

float2 gDistFade = float2(250,150);

float2 uvMul = float2(1, 1);
float2 uvPos = float2(0, 0);

//--------------------------------------------------------------------------------------
// Textures
//--------------------------------------------------------------------------------------
texture sTexColor;

//--------------------------------------------------------------------------------------
// Variables set by MTA
//--------------------------------------------------------------------------------------
float4x4 gWorldViewProjection : WORLDVIEWPROJECTION;
float4x4 gProjectionMainScene : PROJECTION_MAIN_SCENE;
float4x4 gViewMainScene : VIEW_MAIN_SCENE;
float4 gFogColor < string renderState="FOGCOLOR"; >;
static const float PI = 3.14159265f;
float gTime : TIME;
int gCapsMaxAnisotropy < string deviceCaps="MaxAnisotropy"; >;
int CUSTOMFLAGS < string skipUnusedParameters = "yes"; >;

//--------------------------------------------------------------------------------------
// Sampler 
//--------------------------------------------------------------------------------------
sampler2D SamplerColor = sampler_state
{
    Texture = (sTexColor);
    MipFilter = Linear;
    MaxAnisotropy = gCapsMaxAnisotropy;
    MinFilter = Anisotropic;
    AddressU = Wrap;
    AddressV = Wrap;
};

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
    float4 Diffuse : COLOR0;
};

//--------------------------------------------------------------------------------------
// Create world matrix with world position and ZXY rotation
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
// Create world matrix with world position and vector
//--------------------------------------------------------------------------------------
float4x4 createWorldMatrixVector( float3 pos, float3 fwVec, float3 upVec )
{
    float3 zaxis = normalize( fwVec );    // The "forward" vector.
    float3 xaxis = normalize( cross( -upVec, zaxis ));// The "right" vector.
    float3 yaxis = cross( xaxis, zaxis );     // The "up" vector.

    // Create a 4x4 world matrix from the right, up, forward and eye position vectors
    float4x4 worldMatrix = {
        float4( xaxis.x,  xaxis.y, xaxis.z, 0 ),
        float4( yaxis.x,  yaxis.y, yaxis.z, 0 ),
        float4( zaxis.x,  zaxis.y, zaxis.z, 0 ),
        float4(	  pos.x,    pos.y,   pos.z, 1 )
    };
    return worldMatrix;
}

//--------------------------------------------------------------------------------------
// Return a rotation matrix (rotate by Y)
//--------------------------------------------------------------------------------------
float4x4 makeYRotation( float angleInRadians) 
{
  float c = cos(angleInRadians);
  float s = sin(angleInRadians);

  return float4x4(
    c, 0, -s, 0,
    0, 1, 0, 0,
    s, 0, c, 0,
    0, 0, 0, 1
  );
};

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
// getBezierPos
//--------------------------------------------------------------------------------------
float3 getBezierPos(float yCoord)
{
    return pow(1 - yCoord, 3) * sPointPosition1 + 3 * pow(1 - yCoord, 2) * yCoord * sPointPosition2 + 
        3 * (1 - yCoord) * pow(yCoord , 2) * sPointPosition3 + pow(yCoord, 3) * sPointPosition4;
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
    VS.Position.xy = - 0.5 + VS.Position.xy;
    
    if (!sFlipTexture) VS.TexCoord.y = 1 - VS.TexCoord.y;

    // get curent vectors	
    float3 bPos1 = getBezierPos(VS.TexCoord.y);
    float3 fwVec = normalize(getBezierPos(VS.TexCoord.y + (1 / sTesselation)) - bPos1);
    float3 upVec = normalize(float3(0,0,1) - (fwVec * dot(fwVec, float3(0,0,1))));
    float3 rtVec = normalize( cross( -upVec, fwVec ));

    // create WorldMatrix for the quad
    float3 sElementPosition = (sPointPosition4 - (sPointPosition4 - sPointPosition1) * 0.5);
    float3 fwVec0 = normalize(sPointPosition4 - sPointPosition1);

	if (sIsBillboard)
    {
        // Get distance from front
        float frontDist = dot(fwVec0, sCameraPosition - sPointPosition1);		
		float maxDist = length(sPointPosition4 - sPointPosition1);		

        // get projection parameters
	    sElementPosition = getBezierPos(saturate(frontDist / maxDist));	
        upVec = normalize(float3(0,0,1) - (fwVec0 * dot(fwVec, float3(0,0,1))));
        rtVec = normalize( cross( -upVec, fwVec0 ));
    }

    float3 rot = float3((asin(fwVec0.z / length(fwVec0))), 0, -(atan2(fwVec0.x, fwVec0.y)));
    float4x4 sWorld = createWorldMatrix( sElementPosition, rot );
	
    // get element's view direction and distance from camera
    float3 viewDirection = (sCameraPosition - sElementPosition);
    float viewDistance = length(viewDirection);
	
    // is camera at the left/right side of the plane
    float planeYDist = dot(sWorld[0].xyz, viewDirection);
    float angYDir = planeYDist < 0 ?  1 : -1;
	
    // get angle between left plane and view
    float fwDist = dot(sWorld[1].xyz, viewDirection); 
    float3 sLinePosition = sElementPosition + sWorld[1].xyz * fwDist; 
    float angleY = acos(dot(normalize(sLinePosition - sCameraPosition), sWorld[2].xyz));
    angleY = angYDir * (angleY - PI);
	if (!sIsBillboard) angleY = sElementRotationZ;

    // calculate screen position of the vertex
    VS.Position.xyz = (rtVec * (VS.TexCoord.x  - 0.5) * sWidth);
    float4 wPos = mul(float4(VS.Position, 1), makeYRotation(-angleY));
    wPos.xyz += bPos1;
    float4 vPos = mul(wPos, gViewMainScene);
    PS.Position = mul(vPos, gProjectionMainScene);
	
    // get clip values
    float nearClip = - gProjectionMainScene[3][2] / gProjectionMainScene[2][2];
    float farClip = (gProjectionMainScene[3][2] / (1 - gProjectionMainScene[2][2]));	
	
    // fade object
    float DistFromCam = distance(sCameraPosition, sElementPosition);
    float sLightAttenuation = length(sPointPosition4 - sPointPosition1);
    float2 DistFade = float2(min(gDistFade.x, farClip + sLightAttenuation / 2), min(gDistFade.y, farClip + sLightAttenuation /2 - (gDistFade.x - gDistFade.y)));
    PS.DistFade = saturate((DistFromCam - DistFade.x)/(DistFade.y - DistFade.x));

    // pass texCoords and vertex color to PS
    PS.TexCoord = (VS.TexCoord * uvMul) + uvPos;
    PS.Diffuse = VS.Diffuse;
	
    return PS;
}

//--------------------------------------------------------------------------------------
// Pixel shaders 
//--------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    // sample color texture
    float4 finalColor = tex2D(SamplerColor, PS.TexCoord.xy);
	
    // multiply by vertex color
    finalColor *= PS.Diffuse;
	
    // set fade
    finalColor.rgb *= saturate(PS.DistFade);

    return saturate(finalColor);
}

//--------------------------------------------------------------------------------------
// Techniques
//--------------------------------------------------------------------------------------
technique dxDrawImage4D_bezier
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
    FogEnable = sFogEnable;
    FogColor = float4(saturate(gFogColor.rgb * 1.6), gFogColor.a);
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
