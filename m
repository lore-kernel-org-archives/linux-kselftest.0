Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693392;
	b=u1evOw4crra/Wj+DjaBWg/zJ5OdEkrAsQnWd9kagNleFvceUyeDwzSkwAGlNkr05pFmm
	 Q6SocksCI5yJ5/tM9n0DGdfclGBx/rYrNliIyh8/LLmJLluS2IbnhtN5RRrpt/iA3Uygj
	 emLlkGC7EVEZETFewa9+//k37sHf7iza1WvmiYoTOHIf3rN3ih1z7cGvZZif/N56CyzSo
	 xIMjScreYn7qQFvHeLgVBsFSlDNpFdFieWHINBBVR43MnL9dzHhsWZC7XZareIwdZuMOB
	 PRWCxQ/w/hxJBcUbqaFz5MwvZrhs2780njAEs1paMf/iL4CCHssKzeDZjXcs2UYfJjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693392;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o3gZPUQLWwPhGV6D4A+78sPcL2sUrR6F9w4Qn0I0nOg=;
	b=iWtkaDqKG2EApOJJRapC8Nm7XAjoeEaxEuBC7epcNjPK/0ebbC39Ioy4LH1u5MshhZu5
	 JWLLpp6Uzp+JEGjW4yKceZKEeHD3E8eNOJ2nQNcPh+yfAMd9B+ef46LAQjJehir1JEcTl
	 5M1+MUItPCC2LNLMk7LO2ENaO4d+a/KYRb+tsKC/2ARPgUr3HYlcfmOUswKsXW4Qyy6rS
	 K9eJtvMF+Nty+iQJhOKsNMXh2R218EB0fr6y+dSzLxGoQs+8GAwQYq4NowC5ubGiorquq
	 elYiLUUpRsmO4ZHkoTumxy9UPFKAWlPemIYl3g4ey2HPeB3EHY9ZeObCpWDkhk6B6+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iiG8CCqB;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59328606A324;
	Tue,  3 Nov 2026 08:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59328606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iiG8CCqB
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793693381; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=o3gZPUQLWwPhGV6D4A+78sPcL2sUrR6F9w4Qn0I0nOg=;
	b=iiG8CCqBa/RrPbbDC6xfxjAXrR/xIXBquz/CjKjtOdTcuOS56kKcqjxymuNzcQR+/v3OLS/XX4fj6/85TdZiiTTNlbvcQqSvnMgu7EDNRUC3YgykClcDbF3cI5OO4xsS9bJwmhE7oWjnnAEGGzqr0d3K5vzdonQBXhZ5OhptIQM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XE27L.Y_1793693380;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE27L.Y_1793693380 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 16:09:40 +0800
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
Subject: [PATCH v2 1/5] kho: Do not translate the handover FDT address in is_kho_boot()
Date: Tue,  3 Nov 2026 16:09:22 +0800
Message-ID: <20261103080926.2079-2-cp0613@linux.alibaba.com>
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

is_kho_boot() only has to say whether a handover FDT was recorded, but
it asks kho_get_fdt() for one and so converts kho_in.fdt_phys with
phys_to_virt() just to throw the pointer away. Both callers use it as a
boolean and never dereference the result.

On riscv64 that conversion is not valid yet when efi_init() reaches it:
setup_vm() leaves kernel_map.va_pa_offset at 0 and setup_bootmem()
assigns it later, so a handover boot that came through UEFI panics in
linear_mapping_pa_to_va(). Only debug builds fail -- without
CONFIG_DEBUG_VIRTUAL __va() degenerates to "phys + 0" and the boolean
stays correct -- but the panic also goes unnoticed without an earlycon.

Check the physical address instead. Nothing needs the translation, and
architectures stay free to bring their linear mapping up whenever they
like.

Fixes: d6d511639185 ("kexec: introduce is_kho_boot()")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

Tested on qemu-system-riscv64 (virt, -cpu max, TCG): edk2
RISCV_VIRT_CODE.fd/VARS.fd on pflash with OpenSBI fw_dynamic.bin below
it, and a GPT disk holding an ESP with grub plus the kernel and an ext4
partition as rootfs.  Kernel config is riscv defconfig plus
DEBUG_KERNEL, DEBUG_VIRTUAL, KEXEC_FILE, KEXEC_HANDOVER and the kho
selftest fragment; the outgoing kernel gets "kho=on" and the kho
selftest init does kexec_file_load() followed by reboot(RB_KEXEC).

Before, the first handover panics.  earlycon= is needed to see it: the
BUG precedes console registration, so without an earlycon the machine
goes silent right after kexec.

  KHO: found kexec handover data.
  efi: EFI v2.7 by EDK II
  kernel BUG at arch/riscv/mm/physaddr.c:47!
  epc : linear_mapping_pa_to_va+0x1c/0x1e
   ra : is_kho_boot+0x18/0x28

After, the same setup keeps handing over until the window closes, 29
consecutive boots and no BUG.

  KHO: found kexec handover data.
  KHO: exec from: 7.4.0-rc1-next-20261102-00005-gfca49e548231 (count 29)

 kernel/liveupdate/kexec_handover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3181..6ab181de345c 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1643,7 +1643,7 @@ EXPORT_SYMBOL_GPL(kho_restore_free);
  */
 bool is_kho_boot(void)
 {
-	return !!kho_get_fdt();
+	return kho_in.fdt_phys != 0;
 }
 EXPORT_SYMBOL_GPL(is_kho_boot);
 
-- 
2.50.1

