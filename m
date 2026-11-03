Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693392;
	b=IzAB921oYURzRPpIj4bfUsGy/lsEz/e9OWeZqOr1uRa1B2uhfb7ANw+7il1MHlze/mIr
	 Iwkr0tWBXwF7EBJlfgx8RNvUvfTeoiZZDP4gBU6ePGsTh/BDNxpXlv+9ykINSUu3L+/27
	 HcP6nBNJCQtMi3FQlQ71JC/jikVed3XDV4bfGpOBW1M5mysd+DFLMkBzo6OM08RaP4euj
	 zCMmesMgxD6uVkVFT9i56lKf9sDvdOZcOfp1nJtqX1fdXV/vJSiq0ckC840a+I53IQdMh
	 eJHSjEFxWD5tuOvJvpGDnTRPrpuksaxxrd+0zn4idv7CyKWl2BFBC9QjhiOZdhmPQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693392;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XR763hCbspNzvt9Ja5KlngGTT7u+E0yj2HR4cp4PfjA=;
	b=T9aDLgv2eZZxVDBkMAbfU1h428nTxGPwaGzkZPsQMnMnTHxl0WnqTVZRUl5EL+HemZh9
	 MSwROQ8pesyJtWGxGqmR5NjxomSP0qCY6pHHH1GCsTnjzCvIHFsvxbca9u8BPHGVufcs8
	 atWcN0FzPeY86vdHF++q/G+NulwMSHent5sskFpUslONaeM7WbjkBQ58TsR6LbPLwJZO5
	 6A8O5D7qNZfza1h4VJZQ15uj2PQD6IdAPRgNtmaeCIH352RtXs88Nt3ffAesHWs1obwsc
	 hDo9UbOGcs0AS+gWo1fVwpqcyvIzYJEsEkwEXPwxBgMBO1kcyaooHQ7fdTYJukIl7vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="GmD+/f44";
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEF606D802;
	Tue,  3 Nov 2026 08:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CEF606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=GmD+/f44
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793693382; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=XR763hCbspNzvt9Ja5KlngGTT7u+E0yj2HR4cp4PfjA=;
	b=GmD+/f44f1RyDyJe7erwdfFa1X/AHP0KD6LWWFwPDRsbi/xDff0N7sRoodRqP3N91v2/TLd0/nQ9OQr2DmDcUtr68gwotu/aLidiIJu0vBvQCWICPUAjeFJkY0Xiz08m2iOzcDzfbhGQzqVTuNy9jsms3wFw0j17ev5/QZs5CFY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XE27L01_1793693380;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE27L01_1793693380 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 16:09:41 +0800
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
Subject: [PATCH v2 2/5] riscv: Call early_ioremap_setup() before parsing the DTB
Date: Tue,  3 Nov 2026 16:09:23 +0800
Message-ID: <20261103080926.2079-3-cp0613@linux.alibaba.com>
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

early_ioremap_setup() fills in the slot_virt[] array whose entries the
return value of early_ioremap()/early_memremap() is composed from.  On
RISC-V it ran after parse_dtb(), so an early_memremap() reached from
the device tree scan returned "offset + 0" -- NULL for a page aligned
address -- and the caller could only report a mapping failure.  This
stayed latent because nothing reached from parse_dtb() asked for an
early mapping before; the DT based kexec handover parsing is the first
such caller, as kho_populate() maps the handover FDT and the scratch
descriptor array with early_memremap().

Move the call to the top of setup_arch(), which is how arm64 and x86
already order it (early_fixmap_init()/early_ioremap_init() before
setup_machine_fdt()/parse_setup_data()).  The BTMAP window is mapped
into early_pg_dir by setup_vm(), and RISC-V neither calls
early_ioremap_reset() nor defines __late_set_fixmap(), so the virtual
addresses stay identical across the switch to the final page tables
and nothing else in setup_arch() depends on the previous ordering.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..45e2ef9d32fa 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -308,12 +308,12 @@ extern void __init init_rt_signal_env(void);
 
 void __init setup_arch(char **cmdline_p)
 {
+	early_ioremap_setup();
 	parse_dtb();
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
 
-	early_ioremap_setup();
 	sbi_init();
 	jump_label_init();
 	parse_early_param();
-- 
2.50.1

