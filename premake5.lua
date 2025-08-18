workspace "NVRHI_Renderer"
	architecture "x64"
	startproject "NVRHI_Renderer"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

	IncludeDir = {}
	IncludeDir["nvrhi"] = "vendor/nvrhi/include"
	IncludeDir["nvrhi_thridparty"] = "vendor/nvrhi/thirdparty/Vulkan-Headers/include"
	
project "NVRHI_Renderer"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"vendor/nvrhi/src/vulkan/**.h",
		"vendor/nvrhi/src/vulkan/**.cpp"
	}
	
	includedirs
	{
		"%{IncludeDir.nvrhi}",
		"%{IncludeDir.nvrhi_thridparty}"
	}

	links
	{
		"vendor/nvrhi/out/build/x64-Debug/nvrhi_vk.lib",
		"vendor/nvrhi/out/build/x64-Debug/nvrhi.lib"
	}

	filter "system:windows"
		systemversion "latest"

	defines
	{
		"GLFW_INCLUDE_NONE"
	}

	filter "configurations:Debug"
		defines "DEBUG"
		symbols "on"
		buildoptions "/utf-8"
		runtime "Debug"

	filter "configurations:Release"
		defines "RELEASE"
		optimize "on"
		buildoptions "/utf-8"
		runtime "Release"

	filter "configurations:Dist"
		defines "DIST"
		optimize "on"
		buildoptions "/utf-8"
		runtime "Release"