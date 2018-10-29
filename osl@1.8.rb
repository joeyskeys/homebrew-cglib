class OslAT18 < Formula
  desc "Advanced shading language for production GI renderers"
  homepage ""
  url "https://github.com/imageworks/OpenShadingLanguage/archive/Release-1.8.12.tar.gz"
  sha256 "dcf85a2cf3047f15da6239238efc4c81cb56f137b7b52197e92293fa5f682092"

  depends_on "cmake" => :build
  depends_on "llvm@3.9"
  depends_on "openimageio"
  depends_on "ccache"
  depends_on "boost-python"
  depends_on "partio" => :optional

  def install
    args = std_cmake_args
    args << "-DLLVM_DIRECTORY=/usr/local/opt/llvm@3.9/"
    args << "-DLLVM_STATIC=ON"
    args << "-DENABLERTTI=ON"
    args << "-DOPENIMAGEIOHOME=/usr/local/"
    args << "-DUSE_LIBCPLUSPLUS=ON"

    mkdir "macbuild" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test osl@1.8`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
