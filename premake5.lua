workspace "NVRHI_Renderer"
    architecture "x64"
    startproject "NVRHI_Renderer"

    configurations { "Debug", "Release", "Dist" }
    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    IncludeDir = {}
	IncludeDir["nvrhi_vulkan_thridparty"] = "vendor/nvrhi/thirdparty/Vulkan-Headers/include"
	IncludeDir["nvrhi_dx_thridparty"] = "vendor/nvrhi/thirdparty/DirectX-Headers/include"

    project "NVRHI_Renderer"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++17"
        
        targetdir ("bin/" .. outputdir .. "/%{prj.name}")
        objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
        
        includedirs {
            "vendor/nvrhi/include",
		    "%{IncludeDir.nvrhi_vulkan_thridparty}",
		    "%{IncludeDir.nvrhi_dx_thridparty}"
        }
        
        files {
            "src/**.h",
            "src/**.cpp"
        }
        
        filter "system:windows"
            systemversion "latest"