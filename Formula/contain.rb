class Contain < Formula
  desc "Contain your dev environments"
  homepage "https://github.com/jpettersson/contain"
  url "https://github.com/jpettersson/contain/archive/0.3.1.tar.gz"
  version "0.3.1"
  sha256 "e4d4a8ac8b71f27bac163551f648cee923025659b9b3b3315890bedd19fb1494"

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
