project "VulkanMemoryAllocator"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs { "%{prj.location}/include" }

    files {
        "%{prj.location}/include/vk_mem_alloc.h",
        "%{prj.location}/src/vma_lib.cpp"
    }