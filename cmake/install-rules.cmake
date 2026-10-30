install(
    TARGETS dtripper64_exe
    RUNTIME COMPONENT dtripper64_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
