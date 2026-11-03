Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693394;
	b=46ss8mmgeESMHJYC+UnTQVy+x2ASxohosWmzi95rpE+2REnujU3trBGCLqIw7bar2JYz
	 7N77UqGjj7Fw1FRkU8cXb1QmKfsOnqb/ho4E+ZyzOxPT1kE22gKgktUxZwfXgibAX9DPX
	 CstAq424CRPZFTTUA8mK9LdizJkELJQHlDXqX1uYDMRcRt99VMN6mzHSx1eh2gZ4y/HAV
	 fOC+CScl4SKqBKA9FjYPZqv+zY2BMVDOuaZv+EVukH4uAzoLJfo0DSqMDRgU7awhKkGsx
	 XN1YsygDGM0ptJk/rkn3FbPIadGJV5LOQy1nQIH5uzBmtd9PBdN2JeNzVe7UTfw2zhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693394;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WJpxS6fBbPkCEJfRw7yC+xmbJiBPG7KHL3DiOO0TU/c=;
	b=mEtx9pGyi3V0A/yqFRnp8yRkCtAyXOI/jR0EAUKoXHwubMBUZaIY5K+oDKHH2rxEKPYy
	 DoJMKxNXzQKJhZI9lrzpMaoN13Rm4fBJWBQOsEcHlZ6EjJkmPOymotpYe9VXIf/JgTD8w
	 4Wwth8tGRBPC9th64ZQO7J62X2/RTYA9Dmout9sm14DRpJS+wYNu/YhdW6zblTVYqu8gz
	 7e6YtLSARXatlLjJmuP0gmpiAy5F1Pkeq2+uPhHCm0Jg0p6LvicasKiEQnh7KOxiCRk9U
	 xZ/acQKAugqZLaS2Vp7SBSw+PI4VGfi2+JyeaA1ta196XH8XPSEJNY6wKg5hZ2vTu+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JuHRba7b;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC51C606D822;
	Tue,  3 Nov 2026 08:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC51C606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JuHRba7b
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793693384; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=WJpxS6fBbPkCEJfRw7yC+xmbJiBPG7KHL3DiOO0TU/c=;
	b=JuHRba7bal3xRsUkT+NxShOoaQgxvaYvTPQVmS0c5QGTwTbi79g0laFbosNUxnITrh5dbl4RZkQxMNRdExT7PyQdixjozTTXrz+R4pDMPY0KyGnwYRUnE4K1h9PohAG9qJux7e5iw+cT7Q7zYFtSf/WI7xj6uIBRzNT5DSmXjFA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XE27L1d_1793693383;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE27L1d_1793693383 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 16:09:44 +0800
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
Subject: [PATCH v2 5/5] selftests: liveupdate: Add riscv support
Date: Tue,  3 Nov 2026 16:09:26 +0800
Message-ID: <20261103080926.2079-6-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103080926.2079-1-cp0613@linux.alibaba.com>
References: <20261103080926.2079-1-cp0613@linux.alibaba.com>
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

Teach the live update vmtest runner about riscv64: map the target to ARCH
riscv, describe the QEMU virt machine, the kernel image and its console,
and add the arch config fragment holding the three symbols needed to get
a console on the virt machine's 16550A port.

KHO is the only dependency of LIVEUPDATE (kernel/liveupdate/Kconfig), so
now that riscv has KHO the LUO tests only need the runner to stop
rejecting the architecture.

Add riscv64 to the CROSS_COMPILE auto-detection list and to the target
list of the batch runner as well, matching the existing aarch64/x86_64
entries.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

Test: qemu-system-riscv64 (virt, -cpu max, -m 1G, -smp 2, TCG), in-tree
runner "tools/testing/selftests/liveupdate/vmtest.sh -t riscv64 -T <suite>",
all four suites:

  luo_kexec_simple:    SIMPLE KEXEC TEST PASSED
  luo_multi_session:   MULTI-SESSION KEXEC TEST PASSED
  luo_stress_files:    MANY-FILES KEXEC TEST PASSED (500 files)
  luo_stress_sessions: MANY-SESSIONS KEXEC TEST PASSED (2000 sessions)

The simple suite's serial log shows the full handover round trip:

  KHO: found kexec handover data.
  luo: Retrieved live update data, liveupdate number: 1
  KHO: exec from: 7.4.0-rc1-next-20261102-00005-gfca49e548231 (count 1)
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
index d656ce58c5a7..2e3f5f6f96b3 100755
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
index f3fb4142c81d..e67e4613aee8 100755
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
 	-k)	keep workspace directory after successful test
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

