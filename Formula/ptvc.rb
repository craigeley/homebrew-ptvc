class Ptvc < Formula
  include Language::Python::Virtualenv

  desc "Pro Tools Version Control — versioned snapshots of Pro Tools sessions via PTSL"
  homepage "https://github.com/craigeley/ptvc"
  url "https://github.com/craigeley/ptvc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5828714089308564bd489718f2c6764d271f1228695db750b093bca5d03b3e91"
  license "MIT"

  depends_on "python@3.14"

  resource "grpcio" do
    url "https://files.pythonhosted.org/packages/source/g/grpcio/grpcio-1.78.0.tar.gz"
    sha256 "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc5b3beea9c4f1c5"
  end

  resource "grpcio-tools" do
    url "https://files.pythonhosted.org/packages/source/g/grpcio-tools/grpcio_tools-1.78.0.tar.gz"
    sha256 "4b0dd86560274316e155d925158276f8564508193088bc43e20d3f5dff956b2b"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/source/p/protobuf/protobuf-6.33.5.tar.gz"
    sha256 "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # ptvc requires Pro Tools to be running, so just verify the CLI loads
    assert_match "usage: ptvc", shell_output("#{bin}/ptvc --help")
  end
end
