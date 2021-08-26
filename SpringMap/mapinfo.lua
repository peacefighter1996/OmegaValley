--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- mapinfo.lua
--

--TODO V2:
-- lighting
-- grass fix on darkest areas
-- maybe whole map is too busy
-- way less AO?
-- more groundambient
-- less lips on cliffs



		
local mapinfo = {
	name        = "Omega Valley",
	shortname   = "Omega Valley",
	description = "4v4 map by [DE]Peacefighter",
	author      = "[DE]Peacefighter (peacefighter1000@gmail.com)",
	version     = "V0.1",
	--mutator   = "deployment";
	mapfile   = "maps/Omega_Valley.smf", --// location of smf/sm3 file (optional)
	modtype     = 3, --// 1=primary, 0=hidden, 3=map
	depend      = {"Map Helper v1"},
	replace     = {},

	--startpic   = "", --// deprecated
	--StartMusic = "", --// deprecated

	maphardness     = 200,
	notDeformable   = false,
	gravity         = 100,
	tidalStrength   = 15,
	maxMetal        = 0.49, --0.69, --=1.40
	extractorRadius = 90.0,
	voidWater       = false,
	autoShowMetal   = true, -- this seems to interfere with cmd area mex


	smf = {
		minheight = 0.0,
		maxheight = 1000.0,
		smtFileName0 = "maps/Omega_Valley.smt",
	},

	sound = {
		preset = "default",
		passfilter = {
			gainlf = 1.0,
			gainhf = 1.0,
		},
		reverb = {
		},
	},

	resources = {
		--grassBladeTex = "grass_blade_tex.tga", --blade texture
		--grassShadingTex = "grass_shading_tex.tga", --defaults to minimap
		detailTex = "detailtexblurred.bmp",
		specularTex = "Omega_Valley_speculartex.dds",
		splatDetailTex = "iwantDNTS.tga",
		splatDistrTex = "Omega_Valley_splat_distribution.dds", --sand, rock, pebbles, cracks
		detailNormalTex = "Omega_Valley_normals.dds", --holy crap we can do 8K?
		--detailNormalTex = "blanknormal32.png", --holy crap we can do 8K?
		--splatDistrTex = "throne_remake_v6_splats.tga", --sand, rock, pebbles, cracks
		--skyReflectModTex = "skyreflectmodtex.dds",
		splatDetailNormalDiffuseAlpha = 1,
		--splatDetailNormalTex1 = "Ground_MossSolid_1k_dnts.tga";
		--the order is cliffs, pebbles, grass, metalspots
		splatDetailNormalTex1 = "torturedrock.png";
		splatDetailNormalTex2 = "perlin_noise_seamlessly_tileable_for_shaders_rgb rock2 1024.png"; --hehehe 'pebbles'
		--splatDetailNormalTex2 = "Ground_LargeScaleRockyDirt_1k_dnts.dds";
		splatDetailNormalTex3 = "Ground_GrassThickGreen_1k_dnts.dds";
		--splatDetailNormalTex3 = "test_cube_normal.dds";
		splatDetailNormalTex4 = "earth_NORM.dds";
		--lightEmissionTex = "",
	},

	splats = {
		texScales = {0.010, 0.005, 0.0075, 0.01},
		texMults  = {0.75, 0.4, 1.0, 0.75}, --cliff, pebbles, longgrass, sand
	},

	atmosphere = {
		minWind      = 3,
		maxWind      = 12,

		fogStart     = 0.8,
		fogEnd       = 1.0,

		cloudColor = {
		  0.89999998,
		  0.89999998,
		  0.89999998,
		},
    fogColor = {
      0.80000001,
      0.80000001,
      0.5,
    },
    skyColor = {
      0.42879999,
      0.58016002,
      0.63999999,
    },
		sunColor = {
		  1,
		  0.92,
		  0.78,
    },
		skyDir       = {0.0, 0.0, -1.0},
		skyBox       = "cloudySea.dds",

		cloudDensity = 0.5,
	},

	grass = {
		bladeWaveScale = 1.0,
		bladeWidth  = 0.82,
		bladeHeight = 8.0,
		bladeAngle  = 2.57,
		bladeColor  = {0.59, 0.81, 0.57}, --// does nothing when `grassBladeTex` is set
	},
	lighting = {
		--// dynsun
		--sunStartAngle = 0.0,
		--sunOrbitTime  = 1440.0, --how do i turn this off?
		    sunDir = {
      0.8,
      1.0,
      -0.7,
    },

		--// unit & ground lighting
         groundambientcolor            = { 0.8, 0.8, 0.8 },
         grounddiffusecolor            = { 0.99, 0.99, 0.95 },
         -- groundambientcolor            = { 0.0, 0.0, 0.0 }, -- specular debugging
         -- grounddiffusecolor            = { 0.0, 0.0, 0.0 }, -- specular debugging
		 groudspecularcolor            = {0.7,0.7,0.7},
         groundshadowdensity           = 1.1,    
		 unitAmbientColor = {
			  0.66,
			  0.66,
			  0.70,
		},    
		unitDiffuseColor = {
			  0.99,
			  0.99533332,
			  0.95000002,
			},
		unitSpecularColor = {
			  0.8,
			  0.60000001,
			  0.60000001,
		},
         unitshadowdensity          = 0.70,
		 specularsuncolor           = { 1.0, 1.0, 1.0 },
		 
		specularExponent    = 100.0,
	},
		water = { --regular water settings
		damage =  0,

		repeatX = 10.0,
		repeatY = 10.0,

		absorb    = { 0.05, 0.005, 0.001 }, --absorbption coefficient per elmo of water depth
		basecolor = { 0.3, 0.5, 0.5 }, -- the color shallow water starts out at
		mincolor  = { 0.0, 0.3, 0.3 },

		ambientFactor  = 1.0,
		diffuseFactor  = 1.0,
		specularFactor = 1.4,
		specularPower  = 40.0,

		surfacecolor  = { 0.67, 0.8, 1.0 }, --color of the water texture
		surfaceAlpha  = 0.1,
		diffuseColor  = {0.0, 0.0, 0.0},
		specularColor = {0.5, 0.5, 0.5},
		--planeColor = {0.00, 0.15, 0.15}, --outside water plane color --

		fresnelMin   = 0.08, --This defines the minimum amount of light the water surface will reflect when looking vertically down on it [0-1]
		fresnelMax   = 1.6, --Defines the maximum amount of light the water surface will reflect when looking horizontally across it [0-1]
		fresnelPower = 8.0, --Defines how much 

		reflectionDistortion = 0.5,

		blurBase      = 2.0,
		blurExponent = 1.5,

		perlinStartFreq  =  15.0,
		perlinLacunarity = 1.2,
		perlinAmplitude  =  0.8,
		windSpeed = 1.0, --// does nothing yet

		shoreWaves = true,
		forceRendering = false,
		
		hasWaterPlane = true, --specifies whether the outside of the map has an extended water plane

		--// undefined == load them from resources.lua!
		--texture =       "",
		--foamTexture =   "",
		--normalTexture = "",
		--caustics = {
		--	"",
		--	"",
		--},
	},
	
	--[[
	-- lovely acid water settings:
	water = {
		damage =  50,

		repeatX = 0.0,
		repeatY = 0.0,

		absorb    = { 0.01, 0.08, 0.01 },
		basecolor = { 0.8, 0.4, 0.8 }, --or 0.4 0.0 0.4
		mincolor  = { 0.2, 0.0, 0.2 },

		ambientFactor  = 1.0,
		diffuseFactor  = 1.0,
		specularFactor = 1.4,
		specularPower  = 40.0,

		surfacecolor  = { 1.0, 0.65, 1.0 },
		surfaceAlpha  = 0.1,
		diffuseColor  = {0.0, 0.0, 0.0},
		specularColor = {0.5, 0.5, 0.5},
		planeColor = {0.02, 0.035, 0.02},

		fresnelMin   = 0.2,
		fresnelMax   = 1.6,
		fresnelPower = 8.0,

		reflectionDistortion = 1.0,

		blurBase      = 2.0,
		blurExponent = 1.5,

		perlinStartFreq  =  8.0,
		perlinLacunarity = 3.0,
		perlinAmplitude  =  0.9,
		windSpeed = 1.0, --// does nothing yet

		shoreWaves = true,
		forceRendering = false,
		
		hasWaterPlane = true,

		--// undefined == load them from resources.lua!
		--texture =       "",
		--foamTexture =   "",
		--normalTexture = "",
		--caustics = {
		--	"",
		--	"",
		--},
	},]]--

	teams = {
		[0] = {startPos = {x = 7090, z = 2098}},
		[1] = {startPos = {x = 7246, z = 6437}},
		[2] = {startPos = {x = 7227, z = 748}},
		[3] = {startPos = {x = 7446, z = 7608}},
		
		[4] = {startPos = {x = 1088, z = 6064}},
		[5] = {startPos = {x = 950, z = 1200}},
		[6] = {startPos = {x = 959, z = 7429}},
		[7] = {startPos = {x = 736, z = 555}},
	},
	


	terrainTypes = {
		[0] = {
			name = "Ground",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.0,
				kbot  = 1.0,
				hover = 1.0,
				ship  = 1.0,
			},
		},
		[255] = {
			name = "Low Road",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.3,
				kbot  = 1.3,
				hover = 1.3,
				ship  = 1.3,
			},
		},
		[170] = {
			name = "Medium Road",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.2,
				kbot  = 1.2,
				hover = 1.2,
				ship  = 1.2,
			},
		},
		[100] = {
			name = "High Road",
			hardness = 1.0,
			receiveTracks = true,
			moveSpeeds = {
				tank  = 1.1,
				kbot  = 1.1,
				hover = 1.1,
				ship  = 1.1,
			},
		},
	},

	custom = {
		fog = {
			color    = {0.26, 0.30, 0.41},
			height   = "80%", --// allows either absolue sizes or in percent of map's MaxHeight
			fogatten = 0.003,
		},
		
		--[[
		precipitation = {
			density   = 30000,
			size      = 1.5,
			speed     = 50,
			windscale = 1.2,
			texture   = 'LuaGaia/effects/snowflake.png',
		},]]--
	},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Helper

local function lowerkeys(ta)
	local fix = {}
	for i,v in pairs(ta) do
		if (type(i) == "string") then
			if (i ~= i:lower()) then
				fix[#fix+1] = i
			end
		end
		if (type(v) == "table") then
			lowerkeys(v)
		end
	end
	
	for i=1,#fix do
		local idx = fix[i]
		ta[idx:lower()] = ta[idx]
		ta[idx] = nil
	end
end

lowerkeys(mapinfo)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Map Options

if (Spring) then
	local function tmerge(t1, t2)
		for i,v in pairs(t2) do
			if (type(v) == "table") then
				t1[i] = t1[i] or {}
				tmerge(t1[i], v)
			else
				t1[i] = v
			end
		end
	end

	-- make code safe in unitsync
	if (not Spring.GetMapOptions) then
		Spring.GetMapOptions = function() return {} end
	end
	function tobool(val)
		local t = type(val)
		if (t == 'nil') then
			return false
		elseif (t == 'boolean') then
			return val
		elseif (t == 'number') then
			return (val ~= 0)
		elseif (t == 'string') then
			return ((val ~= '0') and (val ~= 'false'))
		end
		return false
	end

	getfenv()["mapinfo"] = mapinfo
		local files = VFS.DirList("mapconfig/mapinfo/", "*.lua")
		table.sort(files)
		for i=1,#files do
			local newcfg = VFS.Include(files[i])
			if newcfg then
				lowerkeys(newcfg)
				tmerge(mapinfo, newcfg)
			end
		end
	getfenv()["mapinfo"] = nil
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return mapinfo

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
