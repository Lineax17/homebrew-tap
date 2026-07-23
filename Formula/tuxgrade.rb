class Tuxgrade < Formula
  include Language::Python::Virtualenv

  desc "System upgrade utility for Linux"
  homepage "https://github.com/Lineax17/tuxgrade"
  url "https://github.com/Lineax17/tuxgrade/archive/refs/tags/3.1.0.tar.gz"
  sha256 "f7ae804323da877eb0d2684760a8903ed7d9185d845f2a2efb6d9a49b754f254"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :linux
  depends_on "python@3.14"

  resource "distro" do
    url "https://files.pythonhosted.org/packages/fc/f8/98eea607f65de6527f8a2e8885fc8015d3e6f5775df186e443e0964a11c3/distro-1.9.0.tar.gz"
    sha256 "2fa77c6fd8940f116ee1d6b94a2f90b13b5ea8d019b98bc8bafdcabcdd9bdbed"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/tuxgrade --help")
  end
end
