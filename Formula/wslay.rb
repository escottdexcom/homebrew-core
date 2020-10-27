class Wslay < Formula
  desc "C websocket library"
  homepage "https://wslay.sourceforge.io/"
  url "https://github.com/tatsuhiro-t/wslay/releases/download/release-1.1.1/wslay-1.1.1.tar.xz"
  sha256 "166cfa9e3971f868470057ed924ae1b53f428db061b361b9a17c0508719d2cb5"
  license "MIT"

  bottle do
    cellar :any
    sha256 "b0c31393b4065ddad22d079252f4310ccafee1c26d5ea56a58c2bc3bfa728b46" => :catalina
    sha256 "4ea82d98c0fd0cfcc1e842dde6e0fbd15355d538876f24fa0c2ca6f05ed17926" => :mojave
    sha256 "6aade683b7db8a32c859e54134568bdb3983d57878783d86c89e5d28c5e8db77" => :high_sierra
  end

  head do
    url "https://github.com/tatsuhiro-t/wslay.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "cunit" => :build
  depends_on "pkg-config" => :build
  depends_on "sphinx-doc" => :build

  def install
    system "autoreconf", "-fvi" if build.head?
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules"
    system "make", "check"
    system "make", "install"
  end
end
