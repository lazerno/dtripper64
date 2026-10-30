#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "dtripper64" ? 0 : 1;
}
