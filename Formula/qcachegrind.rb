class Qcachegrind < Formula
  desc "Visualize data generated by Cachegrind and Calltree"
  homepage "https://kcachegrind.github.io/"
  url "https://download.kde.org/stable/applications/18.04.3/src/kcachegrind-18.04.3.tar.xz"
  sha256 "2370827f8d3c29ec931fc3ebf34726e42d25aaaab6c2f10dc5dd87f57056acfd"
  revision 1

  bottle do
    cellar :any
    sha256 "2e2d8e8cbce2e6e2fdaab39c0f1087a143a678c3b2b387dee3b912d8ef2cde2e" => :catalina
    sha256 "e53f3805eed322c207ea13e6d8a5917f16329b423adf11864ad6b4778110c07a" => :mojave
    sha256 "7a0dd392028ecb443bf84284dc671c1697781c5099c253dc526cd02d5530e697" => :high_sierra
    sha256 "f8ec63325129315fd760eccdc59ef14ac096f9f5ddb49e52a495c67e6980b835" => :sierra
    sha256 "4f5b0000b8391dcadbb9b043c475a80753e1421d314749076029674116840eed" => :el_capitan
  end

  depends_on "graphviz"
  depends_on "qt"

  def install
    cd "qcachegrind" do
      system "#{Formula["qt"].opt_bin}/qmake", "-spec", "macx-clang",
                                               "-config", "release"
      system "make"
      prefix.install "qcachegrind.app"
      bin.install_symlink prefix/"qcachegrind.app/Contents/MacOS/qcachegrind"
    end
  end
end
