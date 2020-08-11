class Contain < Formula
  desc "Contain your dev environments"
  homepage "https://github.com/jpettersson/contain"
  url "https://github.com/jpettersson/contain/archive/0.3.0.tar.gz"
  version "0.3.0"
  sha256 "09309fb2dda34484439d4384703046c353a1e95f178726c4a1af2d082928cf69"

  depends_on "rust" => :build

  def install
    system "cargo", "fetch", "--locked", "--target", "x86_64-unknown-linux-gnu"
    system "cargo", "build", "--release", "--frozen", "--all-targets"
    bin.install "target/release/contain"
  end

  test do
    # This test is not good!
    system "#{bin}/contain", "--help"
  end
end
