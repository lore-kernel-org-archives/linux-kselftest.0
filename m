Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295059;
	b=HKn0DYm2Y1yhDIKx0r4bIH+HEUr2Fyx/V9Qr9m7w53oTXb8VYwRMecDrkZdQk8+auxXR
	 8E1Trpu+N57PToKmH9/559XsoXmBWf7spR+Q9NyMB6ghJJbPhtD/+UzqYUD+HYN5nT2dH
	 K3z/NSvwRiz9c2T51ymqQ3EU+t+y1kkcMTZgNWivaQEHYQNXWhq2taZGSdIPHy9gk2jpe
	 sT7EC+5IFxn7byMHtPvJGKopr6Ln+PbhwC0IK/+MNCduNMl3/Vt2yDmH7dAR4kPhWzcly
	 SNklC8NODa0bz8zXpYGlcWUEQ6dc7spaJ1ZewXL7bDM+1nqt/lPj2Mwu4zzYFM2NBBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295059;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=62v7psIL8EAQ47S6rRTJha+UTtgm3E7BPb1/D07Yo+E=;
	b=nlICJ1AqOapkoCkRSDvTXbQ+mf0Vc2xzzmRGURNYCspU9Iz5yMODc2xi21lpZXm+MILZ
	 VqQjkHktuApenywpFoUVPjEV/cg7OL3LbUJCSmyg/xoZiBpB//hWht6f6noFHxfUY5mKX
	 /AZTtJ1Xfyg03ez+/Fio+VjMfwrsByB2n/jbX21tdyFj9JqLGtRLd2XXgSuidWOs5ZVBs
	 Kgz1sD2pEuzgn1EYJHs8qem5y642TRt4PiG6pDZPYinTFAirze9OQyCv+DpKZ6u7m0yYf
	 akA+qJCAo53Z6wqWjcbOZ3NwjgH+8cKdikZN7C55lcfk+ss00F9ZB0xg6pTpuDK9loQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMMfsIV7;
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D852606A32E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D852606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMMfsIV7
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PxCNVTb6jX0UZU4kP0/sdxuyaH5XxnIihD4Mw61jNnk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295056; v=1; x=1793899856;
 b=LMMfsIV7/WEuySCEeQ2ahXjZrszY+S3tecdRjOn+1M62yCAFfHGHSIAKS1DEwfQK1o7OKVxb
 bz2XZ5ru3RXLaPasMWrVcUPjFWcjPvXGUeJ9AOs+lztf4LL72U/mAHJpNKfXXPY1B30JgfpTTSS
 7QgfD0efB+yaycgxYhXyGieE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdb39e29496ef9b2;
	Thu, 29 Oct 2026 17:30:56 +0000
X-Mizu-Trace-ID: cdb39e29496ef9b2
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v6 6/8] LoongArch: Enable kexec handover (KHO)
Date: Fri, 30 Oct 2026 02:29:53 +0900
Message-ID: <20261029172956.20791-7-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

Enable ARCH_SUPPORTS_KEXEC_HANDOVER on 64-bit LoongArch with EFI_STUB.
KHO state is passed through an EFI configuration table installed by
the stub.

Disable KHO at boot if the table is missing, since the kernel cannot
pass KHO state to the next kernel without it.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig        |  3 +++
 arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a21f51e5815e..d35ddd6ec540 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -685,6 +685,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool 64BIT
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT && EFI_STUB
+
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool 64BIT
 	depends on KEXEC_FILE
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index dff2e0c67ea0..e1023f93460c 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/initrd.h>
 #include <linux/ioport.h>
 #include <linux/kexec.h>
+#include <linux/kexec_handover.h>
 #include <linux/crash_dump.h>
 #include <linux/root_dev.h>
 #include <linux/console.h>
@@ -594,6 +595,20 @@ static void __init prefill_possible_map(void)
 }
 #endif
 
+/*
+ * Only the EFI stub installs the KHO table, on a cold boot. A kernel
+ * started by kexec from a kernel that did not install it has no table,
+ * and the next kernel would not find what this kernel preserves, so
+ * turn KHO off.
+ */
+static void __init kho_check_efi_table(void)
+{
+	if (kho_is_enabled() && !efi_kho_table_found()) {
+		pr_warn("No EFI KHO table, disabling kexec handover\n");
+		kho_disable();
+	}
+}
+
 void __init setup_arch(char **cmdline_p)
 {
 	cpu_probe();
@@ -608,6 +623,7 @@ void __init setup_arch(char **cmdline_p)
 	bootcmdline_init(cmdline_p);
 	jump_label_init(); /* Initialise the static keys for early params */
 	parse_early_param();
+	kho_check_efi_table();
 	reserve_initrd_mem();
 
 	platform_init();
-- 
2.53.0

