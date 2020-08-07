class Contain < Formula
  desc "Contain your dev environments"
  homepage "https://github.com/jpettersson/contain"
  url "https://github.com/jpettersson/contain/archive/0.2.0.tar.gz"
  version "0.2.0"
  sha256 "70f5297cff02ec36c58e5d60a5e87cd30aa6d94d87ee0ccff8547efffff9cff7"

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
