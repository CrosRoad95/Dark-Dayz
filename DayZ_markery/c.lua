
local t_shader = [[
texture MarkerSkin;

float gTime : TIME;

float3x3 getTextureTransform ()
{
    float posU = fmod(gTime/16, 1);
    float posV = 0;

    return float3x3(
                    1, 0, 0,
                    0, 1, 0,
                    posU, posV, 1
                    );
}


technique simple {
  pass P0 {
        Texture[0] = MarkerSkin;
        TextureTransform[0] = getTextureTransform ();
        TextureTransformFlags[0] = Count2;
  }
}

]]


addEventHandler("onClientResourceStart", resourceRoot,
function()
	shwaeki = dxCreateShader( t_shader,0,0,false)
	texture = dxCreateTexture("marker.png")
	dxSetShaderValue(shwaeki,"MarkerSkin",texture)
	engineApplyShaderToWorldTexture(shwaeki, "cj_w_grad")
end )
