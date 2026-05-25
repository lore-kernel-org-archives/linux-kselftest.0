Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37739B96A
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690514; cv=none; b=OhUGVqreLRd/b8C6EkryJziMNjBHhQ4GQp0EdYI8ld4UkrVXdi7Kod9e3OFR4jCc2Kck8xKHiVvJ6sfPPc7gvMt4V+9j3Z6Lh5KIak+sWNuFcw+tT9iKuSK7a2tPB6bUZfAlASTXI1dsj0zvg/th9y+pC23vd91ajbSwo0iAQ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690514; c=relaxed/simple;
	bh=l52I/z7XJH2APwRLqgnwRHl+vcigrCoeaI76EFL82KU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGS4uMxqSW/VnOMrLV1aNljJ/Cb0xw7Z0kryzGVXVmdIp1ROCmtU7j5ABa9rWAyEX8gHuTjg4KAPXu8RlzZbyCkz4XLH08arTlj3GIu7BbMRccltPnyrMg1Vh+1Vb7jNHS3gcaJsW4ZUol3uweMuE5Fia2xZZlMgTok2QAeycNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vUYWyZ1C; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vUYWyZ1C"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779690510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpXKe3wAdCVMwU6Llg7SIPesFhMG6uKuOmrHw+vv3aU=;
	b=vUYWyZ1CdvfZMVBvkgDZVbpei57KgtJs9mNpdIt8reqlu40mKSoS6h5RB2R2LDIOZMvIA3
	7wD1tTsQvzyaW5cW3fY+xdCoerMSlFATNZAzoiFX+PB+IxAQ6fG/swWTRU8fGQxzBcT63L
	bQbqgORkRf7hUz3cU/du0doFMLefN78=
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
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH 4/7] LoongArch: kexec: avoid overwriting QEMU's machine FDT at 0x100000
Date: Mon, 25 May 2026 14:28:07 +0800
Message-Id: <20260525062810.103367-5-dongtai.guo@linux.dev>
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

QEMU places its machine FDT at physical address 0x100000 when booting
with '-kernel'.  KEXEC_CONTROL_CODE was defined at the same address, so
machine_kexec_prepare() overwrites the FDT with the relocation trampoline
before jumping to the new kernel.

The kexec'd kernel's fdt_setup() reads the FDT pointer from the EFI
config table (FDTPTR = 0x100000) and finds trampoline code instead of a
valid FDT, so earlycon auto-detection fails and the second kernel boots
silently with no console output.

Move KEXEC_CONTROL_CODE to 0x180000, which is still within the first 2MB
reserved by memblock_init() and does not conflict with the QEMU FDT.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index d7fafda1d541..44df7dbd3de5 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -21,8 +21,13 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 
-/* 0x100000 ~ 0x200000 is safe */
-#define KEXEC_CONTROL_CODE	TO_CACHE(0x100000UL)
+/*
+ * Both addresses are within the first 2MB which is always reserved by
+ * memblock_init().  Avoid 0x100000 because QEMU places its machine FDT
+ * there when using '-kernel'; overwriting it silences earlycon in the
+ * kexec'd kernel.
+ */
+#define KEXEC_CONTROL_CODE	TO_CACHE(0x180000UL)
 #define KEXEC_CMDLINE_ADDR	TO_CACHE(0x108000UL)
 
 static unsigned long reboot_code_buffer;
-- 
2.25.1

