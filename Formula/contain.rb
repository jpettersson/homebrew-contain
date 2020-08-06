class Contain < Formula
  desc "Contain your dev environments"
  homepage "https://github.com/jpettersson/contain"
  url "https://github.com/jpettersson/contain/archive/0.1.0.tar.gz"
  version "0.1.0"
  sha256 "9fb38b13a663847d2d4ef5011cad4265b4981a0c89e0688e05481b2d51efdd78"

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
