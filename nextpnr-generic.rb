class NextpnrGeneric < Formula
  desc "portable FPGA place-and-route tool"
  homepage "https://github.com/YosysHQ/nextpnr"
  head "https://github.com/YosysHQ/nextpnr.git"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "eigen" => :build
  depends_on "boost"
  depends_on "boost-python3" => :build
  depends_on "qt@5" => :optional

  def install
    gui_string = ""

    if build.with? "qt@5"
      gui_string = "-DBUILD_GUI=ON"
    end

    system "cmake", "-DARCH=generic", ".", *std_cmake_args, "-DBUILD_TESTS=OFF", gui_string, "-B build"
    system "cmake --build build"
    system "cmake --install build"
  end
end
