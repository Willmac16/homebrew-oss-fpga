class NextpnrIce40 < Formula
  desc "portable FPGA place-and-route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen" => :build
  depends_on "boost"
  depends_on "boost-python3" => :build
  depends_on "qt@5" => :optional

  # In addition to the generic requirements
  depends_on "icestorm"

  def install
    gui_string = ""

    if build.with? "qt@5"
      gui_string = "-DBUILD_GUI=ON"
    end

    # clang-17 macos fails to handle #embed when it uses clang++
    inreplace "cmake/BBAsm.cmake", ".cc", ".c"

    system "cmake", "-DARCH=ice40", "-DICESTORM_INSTALL_PREFIX=#{HOMEBREW_PREFIX}", \
      ".", *std_cmake_args, "-DBoost_NO_BOOST_CMAKE=on", "-DBUILD_TESTS=OFF", gui_string, "-B build"
    system "cmake --build build"
    system "cmake --install build"
  end
end
