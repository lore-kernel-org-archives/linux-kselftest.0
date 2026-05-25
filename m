Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2339B484
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690505; cv=none; b=hjLECDefeB794qvYELm/7fHjSi8FaXAbV3SifiuCg8uENtZ/UyaD+PahmiJmGJ68aWptdnRxsoMSbyt1adOQ82wPej3ett7SVyeY0coPR3FbNmxtCtV3YQzviyvo7+qoAMy2izYObHw835V2IVtHvHcQqeZakQPVHLaSJMnlrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690505; c=relaxed/simple;
	bh=47XrFlb1dzY3YvIYk9Rbrd7Ttz0GaDQ9JtQbuBkkxYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kCjoM7OM82wG98Z6gC2fYmiCY8bw7OLn8JZ6Dx+OLx4SIfwoxRhZjGXkEVGPANAHHJ/Td3J0A1bla+5nTIV0W2P0L8p4WbXA3tTlD6G6V9Hx/gJl6kF2OWGOPkzSYpuTeM4Nm8Ap6WTMXHMBQ4H/iJ/uxfH4bNhBLQdC0CU9tr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NPvavMM7; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NPvavMM7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQwJVQQJjFYaN+yiFzOfDgwbwCm5RC8KKUcRaw9Pru0=;
	b=NPvavMM7LwpyRPOk7aLy9mf3jwBIuy2kBfc/x0X7+veNaUruj/PKBV9g3H44cZGIqQOtqN
	z5a7J/msPcok+wpXXNboGsyf/g3pC+OABmW5zuB0p0D1VJ/ZG5lvhGIBmzeBHKH3aQRs10
	96vEyP3OkIMyCnw1q7e8sKiXci2FbPc=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org
Cc: kernel@xen0n.name,
	graf@amazon.com,
	shuah@kernel.org,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH 1/7] LoongArch: Add KHO basic support
Date: Mon, 25 May 2026 14:28:04 +0800
Message-Id: <20260525062810.103367-2-dongtai.guo@linux.dev>
In-Reply-To: <20260525062810.103367-1-dongtai.guo@linux.dev>
References: <20260525062810.103367-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Enable Kexec Handover on LoongArch64:

- Kconfig: select ARCH_SUPPORTS_KEXEC_HANDOVER for 64BIT
- machine_kexec_file: add cmdline_add_kho() to pass the KHO FDT and
  scratch buffer addresses to the next kernel via the "kho_handover="
  command-line parameter
- setup: parse "kho_handover=" early and call kho_populate() to hand
  memory regions to the KHO core

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig                     |  3 +++
 arch/loongarch/kernel/machine_kexec_file.c | 22 ++++++++++++++++++
 arch/loongarch/kernel/setup.c              | 27 ++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 606597da46b8..d494418545f5 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -684,6 +684,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool 64BIT
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT
+
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool 64BIT
 	depends on KEXEC_FILE
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..ddf4d0e0e7fd 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -55,6 +55,24 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 	*cmdline_tmplen += initrd_strlen;
 }
 
+#ifdef CONFIG_KEXEC_HANDOVER
+/* Add "kho_handover=<fdt_size>@<fdt_addr>,<scratch_size>@<scratch_addr>" to cmdline. */
+static void cmdline_add_kho(struct kimage *image, unsigned long *cmdline_tmplen,
+			    char *modified_cmdline)
+{
+	int n;
+
+	if (!image->kho.fdt || !image->kho.scratch)
+		return;
+
+	n = sprintf(modified_cmdline + *cmdline_tmplen,
+	    "kho_handover=0x%llx@0x%llx,0x%lx@0x%llx ",
+	    (u64)PAGE_SIZE,               image->kho.fdt,
+	    image->kho.scratch->bufsz,    (u64)image->kho.scratch->mem);
+	*cmdline_tmplen += n;
+}
+#endif
+
 #ifdef CONFIG_CRASH_DUMP
 
 static int prepare_elf_headers(void **addr, unsigned long *sz)
@@ -220,6 +238,10 @@ int load_other_segments(struct kimage *image,
 		cmdline_add_initrd(image, &cmdline_tmplen, modified_cmdline, initrd_load_addr);
 	}
 
+#ifdef CONFIG_KEXEC_HANDOVER
+	cmdline_add_kho(image, &cmdline_tmplen, modified_cmdline);
+#endif
+
 	if (cmdline_len + cmdline_tmplen > COMMAND_LINE_SIZE) {
 		pr_err("Appending command line exceeds COMMAND_LINE_SIZE\n");
 		ret = -EINVAL;
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 839b23edee87..5934ba6f13e3 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -48,6 +48,7 @@
 #include <asm/setup.h>
 #include <asm/time.h>
 #include <asm/unwind.h>
+#include <linux/kexec_handover.h>
 
 #define SMBIOS_BIOSSIZE_OFFSET		0x09
 #define SMBIOS_BIOSEXTERN_OFFSET	0x13
@@ -227,6 +228,32 @@ static int __init early_parse_mem(char *p)
 }
 early_param("mem", early_parse_mem);
 
+#ifdef CONFIG_KEXEC_HANDOVER
+static int __init early_parse_kho(char *p)
+{
+	phys_addr_t fdt_addr, scratch_addr;
+	u64 fdt_size, scratch_size;
+
+	if (!p)
+		return -EINVAL;
+
+	fdt_size = memparse(p, &p);
+	if (*p++ != '@')
+		return -EINVAL;
+	fdt_addr = memparse(p, &p);
+	if (*p++ != ',')
+		return -EINVAL;
+	scratch_size = memparse(p, &p);
+	if (*p++ != '@')
+		return -EINVAL;
+	scratch_addr = memparse(p, &p);
+
+	kho_populate(fdt_addr, fdt_size, scratch_addr, scratch_size);
+	return 0;
+}
+early_param("kho_handover", early_parse_kho);
+#endif
+
 static void __init arch_reserve_vmcore(void)
 {
 #ifdef CONFIG_PROC_VMCORE
-- 
2.25.1

