# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(dtripper64Tests LANGUAGES CXX)

# ---- Tests ----

add_executable(dtripper64_test source/dtripper64_test.cpp)
target_link_libraries(dtripper64_test PRIVATE dtripper64_lib)
target_compile_features(dtripper64_test PRIVATE cxx_std_20)

add_test(NAME dtripper64_test COMMAND dtripper64_test)

# ---- End-of-file commands ----

add_folders(Test)
