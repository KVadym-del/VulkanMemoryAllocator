workspace "VulkanMemoryAllocator"
    architecture "x64"
    startproject "VulkanMemoryAllocator"

    configurations
    {
        "Debug",
        "Release"
    }

    location "build"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "VulkanMemoryAllocator"
    kind "StaticLib"
    language "C++"
    cppdialect "C++14"
    staticruntime "On"

    targetdir ("lib/" .. outputdir)
    objdir ("obj/" .. outputdir)

    files
    {
        "include/vk_mem_alloc.h",
        "src/vma_lib.cpp"
    }

    includedirs
    {
        "include",
        "%{VULKAN_SDK}/Include"
    }

    vpaths
    {
        ["Headers"] = { "include/**.h" },
        ["Sources"] = { "src/**.cpp" }
    }

    filter "configurations:Debug"
        defines { "VMA_DEBUG_LOG_FORMAT(format, ...)" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "system:windows"
        systemversion "latest"

    filter "system:linux"
        pic "On"
