class Alembic < Formula
  desc "Alembic is an open framework for storing and sharing scene data that includes a C++ library, a file format, and client plugins and applications."
  homepage "http://alembic.io/"
  url "https://github.com/alembic/alembic/archive/1.7.9.tar.gz"
  sha256 "04012fb37c02fd1ba8e4d4f37f5b1e7a3d78151c6368718c4be07f89a99c8148"

  depends_on "cmake" => :build
  depends_on "ilmbase"
  depends_on "boost" => :optional
  depends_on "hdf5" => :optional

  def install
    args = std_cmake_args
    args << "-DALEMBIC_LIB_USES_BOOST=ON" if build.with? "boost"
    args << "-DUSE_HDF5=ON" if build.with? "hdf5"

    mkdir "macbuild" do
      system "cmake", *args, ".."
      system "make"
      system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test alembic`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
