Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993385;
	b=peAMguprVZhbcg+wSRE+Wk2wYoUTViErbFVfHCLhUsDQZW5FA3h35g22abPpeNhrHBI9
	 W6skgOYDglD8KcBmjQc9GU+lb/ykAAMhs+T4kZtn44BU+5lw1GccnK2E/Env8s6g3WHMD
	 21eLavPQCS7yKv7OYxR74Smrb9fuz2eX0oo+sOXomU5EtVicuqU/16WgwGXrGQ05hnGIJ
	 jo1Ge8xntEJnI9iCjf7zFkTkG42OhsaKR7lHAGsQiTw4emUPEXl82+TDLCocH6+hH8/Qi
	 dVaV9yWDE0heTaf6SUfHNhs/L9sp1GJT21LfzJ4r2arUZMSes8ls6cSzK04l/hSv8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993385;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rYTNFSuTJlFrpWYa18HHlkT3uGcwjQ9KRzLVSjey8BA=;
	b=MfMTLFIeC7I/EcJ5qZRbgFDvNrD4713JLQBA5whC5F3E+ugphtJEiY45sk6CEfbBsoGD
	 f7qvz7DfOG9j81en/Eni4KVqEDP547dlh74g3aCkmivJO3SMuAb4WmzzQZxqW9ngUIpfo
	 9rKk0Ao/+gSP9VRIj7Tfpkl4I06b6hRZcg9amn6GJsk0DlgDxYXWY3a3IZUAKWHpb2T0Z
	 nA3FT0pLPicJFhQDS5Ms9eRiCYl046MBLorjl45rI/6B1mBKfAYiHn6mxT259lRb4qXo9
	 kblImtqw/uGJ4zI8cKvZMdB9p3hcVX11yAwUKVBkHU3RVnpTSy1kVOMdL3tuKmgxPGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=vOxrTR1S;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B65606A885;
	Wed, 18 Nov 2026 09:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B65606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=vOxrTR1S
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794993375; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=rYTNFSuTJlFrpWYa18HHlkT3uGcwjQ9KRzLVSjey8BA=;
	b=vOxrTR1S3POtL6aMibVZzV5rG6tZX4qAtZ4KDeEcdaP6qsSCNtluxDv4R5q9LgeRVVvi4oIwVPWGqoIBafbw2ka9Kljk9Ty1iVyhLmCwaa/DbsA/3Nw5o6tLTtInPhSVH28hzjbkK1PvpTol+nFCLdxiVFLtPTtWFUzc9IMpZUs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XF0HHcG_1794993374;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XF0HHcG_1794993374 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 17:16:14 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com,
	shuah@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH v4 4/4] selftests: liveupdate: Add riscv support
Date: Wed, 18 Nov 2026 17:16:03 +0800
Message-ID: <20261118091603.979-5-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118091603.979-1-cp0613@linux.alibaba.com>
References: <20261118091603.979-1-cp0613@linux.alibaba.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teach the live update vmtest runners about riscv64, so the LUO tests can
be run on this architecture.

LIVEUPDATE depends only on KEXEC_HANDOVER, enabled for riscv64 by the
previous commit, so nothing in the tests stood in the way.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---

Test: qemu-system-riscv64 (virt, -cpu max, -m 1G, -smp 2, TCG), in-tree
runner "tools/testing/selftests/liveupdate/vmtest.sh -t riscv64 -T <suite>",
all four suites:

  ok 1 luo_kexec_simple succeeded
  ok 1 luo_multi_session succeeded
  ok 1 luo_stress_files succeeded
  ok 1 luo_stress_sessions succeeded

each with "# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0". The
simple suite's serial log shows the handover round trip:

  KHO: found kexec handover data.
  luo: Retrieved live update data, liveupdate number: 1
  # [STAGE 2] Test data verified successfully.
  --- SIMPLE KEXEC TEST PASSED ---

 tools/testing/selftests/liveupdate/config.riscv64 | 3 +++
 tools/testing/selftests/liveupdate/run-vmtests.sh | 2 +-
 tools/testing/selftests/liveupdate/vmtest.sh      | 8 +++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/config.riscv64

diff --git a/tools/testing/selftests/liveupdate/config.riscv64 b/tools/testing/selftests/liveupdate/config.riscv64
new file mode 100644
index 000000000000..edbc551199b0
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/config.riscv64
@@ -0,0 +1,3 @@
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index 6f592aec0f85..c3d828cfd63b 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -4,7 +4,7 @@
 SCRIPT_DIR=$(dirname "$(realpath "$0")")
 TEST_RUNNER="$SCRIPT_DIR/vmtest.sh"
 
-TARGETS=("x86_64" "aarch64")
+TARGETS=("x86_64" "aarch64" "riscv64")
 
 GREEN='\033[0;32m'
 RED='\033[0;31m'
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index dea5a6fb2abc..70a8d978077a 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -25,6 +25,10 @@ function get_arch_conf() {
 		QEMU_CMD="qemu-system-x86_64"
 		KERNEL_IMAGE="bzImage"
 		KERNEL_CMDLINE="console=ttyS0"
+	elif [[ "$arch" == "riscv" ]]; then
+		QEMU_CMD="qemu-system-riscv64 -M virt -cpu max"
+		KERNEL_IMAGE="Image"
+		KERNEL_CMDLINE="console=ttyS0"
 	else
 		echo "Unsupported architecture: $arch"
 		exit 1
@@ -37,7 +41,7 @@ $0 [-d build_dir] [-j jobs] [-t target_arch] [-T test_name] [-w workspace_dir] [
 Options:
 	-d)	path to the kernel build directory (default: .luo_test_build.<arch>)
 	-j)	number of jobs for compilation
-	-t)	run test for target_arch (aarch64, x86_64)
+	-t)	run test for target_arch (aarch64, x86_64, riscv64)
 	-T)	test name to run (default: luo_kexec_simple)
 	-w)	custom workspace directory (default: creates temp dir)
 	-k)	keep workspace directory
@@ -87,6 +91,7 @@ function detect_cross_compile() {
 	case "$target" in
 		aarch64) candidate="aarch64-linux-gnu-" ;;
 		x86_64)  candidate="x86_64-linux-gnu-" ;;
+		riscv64) candidate="riscv64-linux-gnu-" ;;
 		*)       skip "Auto-detection for target '$target' not supported. Please set CROSS_COMPILE manually." ;;
 	esac
 
@@ -194,6 +199,7 @@ function target_to_arch() {
 	case $target in
 	     aarch64) echo "arm64" ;;
 	     x86_64) echo "x86" ;;
+	     riscv64) echo "riscv" ;;
 	     *) skip "architecture $target is not supported"
 	esac
 }
-- 
2.50.1

