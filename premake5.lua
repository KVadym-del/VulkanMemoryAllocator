local vulkan_sdk = os.getenv("VULKAN_SDK")
if not vulkan_sdk then
  error("VULKAN_SDK environment variable is not set. Please set it to the path of your Vulkan SDK.")
end

project "VulkanMemoryAllocator"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs { "%{prj.location}/include", vulkan_sdk .. "/include" }

    files {
        "%{prj.location}/include/vk_mem_alloc.h",
        "%{prj.location}/src/vma_lib.cpp"
    }