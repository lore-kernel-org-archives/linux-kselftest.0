Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF751AEC9;
	Tue, 13 Oct 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920428; cv=none; b=tFYMYngN9gWbG5DQ8wUXjtXKe1h46HUGnsw+JdFcjwerm/gTdYHkKx/Jd4t15wcZA2qibGZX/d9CeqFzRc8zYmfblNPmof/yOkInVYLKGxFXTy6qIXZ3LTtw7fa4N0M5XM1gTY/CvjWvr851KHyoCyFSvkIhcniKT+OdoVdXeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920428; c=relaxed/simple;
	bh=9ziVJdy+b1bhW1y6oYHX9sOcF9xtQOEucBLYSrTtguA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EBBy/pN2tuT2rTKnsHh29MpzrF4aBCvML3fkEgrxQyutJq2fDPyqSrUKVURF5X+dx2oha0tKwqZr6yBtggSyhBJoqMXRmwBfJO5GdpBbpE7J+ePAFiLb1A5s+hY/g+EtqAqDirm2kAh74Ahm7NXnFW5PiUwKtEtVdDnVFFAUeqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hl2UzerT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hl2UzerT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E11F1F000FF;
	Tue, 13 Oct 2026 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791920426;
	bh=gGEdva0B7T4OPQRwnKbjRWDsGnhVZMphnfZfZ2crsUI=;
	h=From:Date:Subject:To:Cc;
	b=Hl2UzerTz2USfL3Kc3QJ1bMmVsF3b/JgbrRDUwBSQTwWw0zSiWogUCweQZHj02pWC
	 +kHGupVx42+5sPAdrsC8GHec5SpT93GO5EiE2vJHfYfxiix4YWmgUblwSUsMxBo+85
	 h+jcmmyYIa6TE3/XRE73zg3Mg3Lx+GfIAkfey5eY9XCv/4YImMalZyk0dmAkyP+VAn
	 QyZ71KABka1yufikFOazJH/almB3cpCler6IhSAR9lhhyO6RmOfdzmebvzYaPXJunL
	 DsNihtOm6V2XoMeKwrLB+WTD65UqLFNAe4gWbWwS7y2PLkibO+kY7xbrrSKwcmiOXX
	 mdN03K0sEsuiA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 13 Oct 2026 20:40:00 +0100
Subject: [PATCH] selftests: kselftest_deps.sh: Support LLVM
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
X-B4-Tracking: v=1; b=H4sIABCJzmoC/yXMQQ6CQAxG4auQrm3SYiTEqxgXwvxodUQyHYgJ4
 e6OuvwW763kSAanY7VSwmJur7FAdxX1t8t4BVsoplrqRkX3/HDEIcMzB0zOMS5PPmiHNmgjIi2
 VckoY7P27ns5/+9zd0efvirbtA6D3TXt3AAAA
X-Change-ID: 20261013-kselftest-deps-llvm-51be8d160008
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4820; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9ziVJdy+b1bhW1y6oYHX9sOcF9xtQOEucBLYSrTtguA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOdape8zpSsHXFwXlu93Y9+Ra4ct/GJH3XebHrZ2fsz
 xd9t3m3QEcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmYvSRkeF8hyfnrk3xvnFC
 viqd7Z+OrOaOE/pn+kdqY5Qrx/ao9wyMDKuWbWX4I/da9uWT1AozAwUdkcgXJ1as5TQv3sPOcmT
 +bQYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The kselftest_deps.sh script currently takes a compiler as the first
argument and uses it to check that libraries needed by the selftests
are installed.  This works well for GCC where a separate binary is
provided for each target architecture but is less of a good fit for
LLVM where a single compiler binary can target all of the supported
architetures.  Extend the script to accept "LLVM" as the compiler with
an additional optional ARCH= argument so that it can be used when
building with LLVM in a similar fashion to how the actual build works.

The duplication with the main Makefile isn't ideal here.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kselftest_deps.sh | 83 +++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest_deps.sh b/tools/testing/selftests/kselftest_deps.sh
index 487e49fdf2a6..70b834361cb7 100755
--- a/tools/testing/selftests/kselftest_deps.sh
+++ b/tools/testing/selftests/kselftest_deps.sh
@@ -10,13 +10,20 @@
 usage()
 {
 
-echo -e "Usage: $0 -[p] <compiler> [test_name]\n"
+echo -e "Usage: $0 -[p] <compiler> [ARCH=<arch>] [test_name]\n"
 echo -e "\tkselftest_deps.sh [-p] gcc"
 echo -e "\tkselftest_deps.sh [-p] gcc mm"
 echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc"
-echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm\n"
+echo -e "\tkselftest_deps.sh [-p] aarch64-linux-gnu-gcc mm"
+echo -e "\tkselftest_deps.sh [-p] LLVM"
+echo -e "\tkselftest_deps.sh [-p] LLVM ARCH=arm64 mm\n"
 echo "- Should be run in selftests directory in the kernel repo."
 echo "- Checks if Kselftests can be built/cross-built on a system."
+echo "- Compiler can be given as LLVM to use clang, as with LLVM=1 in"
+echo "  the kselftest build. LLVM=<prefix>/ and LLVM=-<suffix> select"
+echo "  the clang binary as in the kselftest build. ARCH=<arch> selects"
+echo "  the clang target architecture, defaulting to the host; it is"
+echo "  ignored for other compilers."
 echo "- Parses all test/sub-test Makefile to find library dependencies."
 echo "- Runs compile test on a trivial C file with LDLIBS specified"
 echo "  in the test Makefiles to identify missing library dependencies."
@@ -53,13 +60,32 @@ while getopts "p" arg; do
 	esac
 done
 
+# Pull an optional ARCH=<arch> out of the remaining arguments. The
+# environment is used if it is not given on the command line, as with
+# make.
+args=()
+for arg in "$@"; do
+	case "$arg" in
+		ARCH=*)
+		ARCH=${arg#ARCH=};;
+		*)
+		args+=("$arg");;
+	esac
+done
+set -- "${args[@]}"
+
 if [ $# -eq 0 ]
 then
 	usage
 fi
 
 # Compiler
-CC=$1
+case "$1" in
+	LLVM|LLVM=*)
+	setup_llvm "${1#LLVM}";;
+	*)
+	CC=$1;;
+esac
 
 tmp_file=$(mktemp).c
 trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
@@ -178,6 +204,56 @@ exit $?
 }
 # end main()
 
+# Mirror the LLVM handling in lib.mk: LLVM=<prefix>/ or LLVM=-<suffix>
+# select the clang binary, and ARCH selects the target triple with the
+# host as the default.
+setup_llvm()
+{
+	local llvm=${1#=}
+	local llvm_prefix=""
+	local llvm_suffix=""
+	local clang
+	local target
+
+	declare -A clang_target
+	clang_target[arm]=arm-linux-gnueabi
+	clang_target[arm64]=aarch64-linux-gnu
+	clang_target[hexagon]=hexagon-linux-musl
+	clang_target[i386]=i386-linux-gnu
+	clang_target[m68k]=m68k-linux-gnu
+	clang_target[mips]=mipsel-linux-gnu
+	clang_target[powerpc]=powerpc64le-linux-gnu
+	clang_target[riscv]=riscv64-linux-gnu
+	clang_target[s390]=s390x-linux-gnu
+	clang_target[x86]=x86_64-linux-gnu
+	clang_target[x86_64]=x86_64-linux-gnu
+
+	case "$llvm" in
+		*/)
+		llvm_prefix=$llvm;;
+		-*)
+		llvm_suffix=$llvm;;
+	esac
+	clang=${llvm_prefix}clang${llvm_suffix}
+
+	if [ -z "$ARCH" ]; then
+		target=$($clang -print-target-triple 2>/dev/null)
+		if [ -z "$target" ]; then
+			echo -e "\tUnable to run $clang ..."
+			exit 1
+		fi
+	else
+		target=${clang_target[$ARCH]}
+		if [ -z "$target" ]; then
+			echo -e "\tUnknown ARCH $ARCH for LLVM, supported:"
+			echo -e "\t$(echo "${!clang_target[*]}" | xargs -n1 | sort | xargs)"
+			exit 1
+		fi
+	fi
+
+	CC="$clang --target=$target -fintegrated-as"
+}
+
 all_tests()
 {
 	for test in $l1_tests; do
@@ -285,6 +361,7 @@ print_results()
 {
 	echo -e "========================================================";
 	echo -e "Kselftest Dependency Check for [$0 $1 $2] results..."
+	echo -e "Compiler: $CC"
 
 	if [ $print_targets -ne 0 ]
 	then

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20261013-kselftest-deps-llvm-51be8d160008

Best regards,
--  
Mark Brown <broonie@kernel.org>

