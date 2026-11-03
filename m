Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693395;
	b=xkgHeJinaXs5m4OmC421vLXFpSzH1scA0jDnJK5nKWim5b/jtHrj7nOPFHEkX2uJ5D4b
	 Mc/UUjYy9j3cnAasId+DIJyh/LnXYgR5tPpIz49dGuimAG4URXRCwNjMYbUi5kr/NvA7s
	 l5/UdNQQUNgclw9Fqvwa1lWfYsZteu9DI+vq1YLNDlcV4hoT+mw6yZ97bKlGBu8pQE610
	 XohuwQqrUlhXPcsOgDIjc4jEFABhedYIQ0gPX8btDl/Vpu2YdkqvKR9MtESv9qVtyPmMd
	 eOZt5eOjOTeceLpeOu5NbyChvQiufZO9AGXx2coOdeyxZL4pb6TBp9L5kMwsMjGD/Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693395;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c+UFJzAgy7f7fNDFNYwbu485X1uKYlUTNzJPVdBiORs=;
	b=OQU9JJMBUknnP/Bo0bkrA84JGtmueO+YhNSkqC0KFIk8pYYJyORIBHnRp+C+y5RBmiSg
	 4fdSECmiCl3VDUEGfbmR+AuJReeGyneFrBhrqyRdCLWyFabrute/WQ3+0g9L3a5oKibxC
	 JeFlOPBdnV5ZK1C/idrTP20CN4NdOJDM1Lfel46tIN+9yKUjM1pgGxX+M5uxXip88UaXX
	 fdWy+he2/d1zWzIZVXUK/R0Xa+FAzmRr5BktfYmZDxZXpqXw0zdc/3xCMLsYXDteainYc
	 hDSU+PQADq8wlesnf3D/6b0+G87Vk8aAzgSYMf4MfLExU1oZfWZn46bbOZ0COhIHiPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tQ3Zai7c;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC6606D816;
	Tue,  3 Nov 2026 08:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEC6606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tQ3Zai7c
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793693384; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=c+UFJzAgy7f7fNDFNYwbu485X1uKYlUTNzJPVdBiORs=;
	b=tQ3Zai7cuqu4WYgwoDNIyPKmX3fOXpq5cClXbNh9O1rJse5c1uz7Lg5B/1k18od18QPik+vxeLAY7ZRSNbqR6CqsyFp5pHMixfrTRDTsZ1keYbjNGuTc0jjfcQXKw68vfthaM9OVFCQTOKH52bcwZrd0mZFCZVEaCafGEmprjT8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XE27L1F_1793693382;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE27L1F_1793693382 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 16:09:43 +0800
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
Subject: [PATCH v2 4/5] selftests: kho: Add riscv support
Date: Tue,  3 Nov 2026 16:09:25 +0800
Message-ID: <20261103080926.2079-5-cp0613@linux.alibaba.com>
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

Teach the KHO vmtest runner about riscv64: map the target to ARCH
riscv and describe the QEMU virt machine, the kernel image and its
console -- a 16550A port probed from the device tree on virt, hence
the SERIAL_8250{,_CONSOLE} and SERIAL_OF_PLATFORM symbols.  Also
select CONFIG_SPARSEMEM_MANUAL: the runner requires
CONFIG_DEFERRED_STRUCT_PAGE_INIT, which depends on SPARSEMEM, while
riscv falls back to FLATMEM (no ARCH_SPARSEMEM_DEFAULT), so without
it the test would just be skipped.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

Test: qemu-system-riscv64 (virt, -cpu max, TCG), in-tree runner
"tools/testing/selftests/kho/vmtest.sh -t riscv64" (boots the Image
and kexec'es into the same Image).

  KHO: found kexec handover data.
  KHO: exec from: 7.4.0-rc1-next-20261102-00005-gfca49e548231 (count 1)
  test_kho: KHO restore succeeded
  ok 1 KHO succeeded
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

 tools/testing/selftests/kho/riscv.conf | 9 +++++++++
 tools/testing/selftests/kho/vmtest.sh  | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kho/riscv.conf

diff --git a/tools/testing/selftests/kho/riscv.conf b/tools/testing/selftests/kho/riscv.conf
new file mode 100644
index 000000000000..ec2a46cd45d5
--- /dev/null
+++ b/tools/testing/selftests/kho/riscv.conf
@@ -0,0 +1,9 @@
+QEMU_CMD="qemu-system-riscv64 -M virt -cpu max"
+QEMU_KCONFIG="
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SPARSEMEM_MANUAL=y
+"
+KERNEL_IMAGE="Image"
+KERNEL_CMDLINE="console=ttyS0"
diff --git a/tools/testing/selftests/kho/vmtest.sh b/tools/testing/selftests/kho/vmtest.sh
index 1e86ffcc3a79..56cac6ae3cf9 100755
--- a/tools/testing/selftests/kho/vmtest.sh
+++ b/tools/testing/selftests/kho/vmtest.sh
@@ -21,7 +21,7 @@ Options:
 	-d)	path to the kernel build directory
 	-j)	number of jobs for compilation, similar to -j in make
 	-t)	run test for target_arch, requires CROSS_COMPILE set
-		supported targets: aarch64, x86_64
+		supported targets: aarch64, x86_64, riscv64
 	-h)	display this help
 EOF
 }
@@ -127,6 +127,7 @@ function target_to_arch() {
 	case $target in
 	     aarch64) echo "arm64" ;;
 	     x86_64) echo "x86" ;;
+	     riscv64) echo "riscv" ;;
 	     *) skip "architecture $target is not supported"
 	esac
 }
-- 
2.50.1

