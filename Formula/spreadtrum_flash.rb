class SpreadtrumFlash < Formula
  desc "Spreadtrum firmware dumper"
  homepage "https://github.com/phoeagon/spreadtrum_flash"
  url "https://github.com/phoeagon/spreadtrum_flash/archive/refs/tags/v0.1.tar.gz"
  sha256 "94c2e5b0c47a88f8e16011321706230a23cfeb933ed9d5cd13e8228ac62ab167"
  head "https://github.com/phoeagon/spreadtrum_flash.git", branch: "main"

  depends_on "libusb"

  def install
    system "make"
    bin.install "spd_dump"
  end

  test do
    # spd_dump doesn't have a reliable zero-exit -h if it expects device.
    # We can at least check it exists and is executable.
    system "#{bin}/spd_dump", "--help"
  end
end
