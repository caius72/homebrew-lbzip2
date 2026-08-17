class Lbzip2 < Formula
  desc "Parallel, SMP-based, bzip2-compatible compression utility"
  homepage "https://github.com/caius72/lbzip2"
  url "https://github.com/caius72/lbzip2/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "2e7db4ba4d04157e7a9f407ff785e1ae75cd54d88a85d4212d30fca0a7587654"
  license "GPL-3.0-or-later"
  head "https://github.com/caius72/lbzip2.git", branch: "master"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    # lbzip2 dispatches on argv[0]; these names select decompress and cat mode.
    bin.install_symlink "lbzip2" => "lbunzip2"
    bin.install_symlink "lbzip2" => "lbzcat"
  end

  test do
    (testpath/"payload").write "hello world " * 500

    system bin/"lbzip2", "payload"
    assert_path_exists testpath/"payload.bz2"
    refute_path_exists testpath/"payload"

    assert_equal "hello world " * 500, shell_output("#{bin}/lbzcat payload.bz2")

    system bin/"lbunzip2", "payload.bz2"
    assert_equal "hello world " * 500, (testpath/"payload").read

    assert_match "lbzip2 version 2.6.1", shell_output("#{bin}/lbzip2 --version")
  end
end
