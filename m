Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65283B6364
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 02:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479480; cv=none; b=dzH2nQNkyXvR73ngoP5MASctbg+KvzFjVYnBUZyHknH0ma6F1rEzOmbYrwDs2x7KLAPjc2GDK0nH4B50rwi9QxG5R/q1yHgW/yuRzlUhxbqNFIoIyM3xd8nXKNmY9HEm4oRzq705GbzjCRBsYvKIRH9sgHRunRkNNuJzYvjktc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479480; c=relaxed/simple;
	bh=3j56XRit/D5wuYL8ciIptQ9YfsZGFgj9aMucYagHQRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DSVul2dslbuZOagSUkIM76FeffkXOMu8Hd3pDNZe5vjK+ZEf/kdAwyX+z3uXMWfqwXrnlJ89N2xWpb0vDl0VW60u3a2uB9NiUZfTIEBFV8L7VCC3nElhHlapCHBFAOZU0xkN23j17rAq2SWLzlY/EJaRaolBDQ0hkpBPghsVb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U34DRz1Q; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U34DRz1Q"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so1432246d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 19:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479477; x=1784084277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kWZHyi+T+vyeURiAwf3NckMe8YMnDEn+Lis3dCslKy4=;
        b=U34DRz1QfXj7RcCG52IOUrymL1jAB3ILopNIj+nROKyIhEGMDX46eXxeLSUicoLIl+
         aRdR8bB75PNgtoNdXjf5d3ehc328hr8BZKhc72T2wEuFsRwnTxWiy7uReqxJdVJzqjsp
         JkVZm4Sj3jU57kX2rcfPZ1IYflWkwF2mRUpwTySAKmaIC4+KilJaf416Uc4gVN1ioHX4
         G0Rb/D20ZWjTtEX5iJNmlac7LswQP7PRMhu2BboK7Jk7scHXmM50Zrxubx3hHJ1MZrQd
         nrC6qiAPSuO2NQX0ALIQ692UX55WMOaMYYR0arifSEsvYsD84HI5aYJ8sfGSlE4GmzRj
         Otig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479477; x=1784084277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWZHyi+T+vyeURiAwf3NckMe8YMnDEn+Lis3dCslKy4=;
        b=Gh0QUV7hocRaioRW1RdncYb858AyNsg9biXw+tZng8yZ4J+vbUnCHWvdmEWliyfrXF
         ypbFexPU5aElKO1VUZbmMvM2xeOE7pJoCEqe8h5wwNpzXrcempmIrAmyEopE7VlIMrF3
         cOTYf5kzNDHmxgn2KRemB7dtUftHSILFhQ8w/4rjrYA0UzVdDVnva7N10SKZNBSD/qdy
         DCTpM0fMNsul8dRQ9Kqiz2b/QiqBDBZV4Zl4CnnUGli/csQGIIFrz8T8aHoSrBxPl1Dg
         rnUX/lv1euVIXS5JyO4cxWkq6tMOFzT4xWhO/pC1A3WrIbDwUOPkEH25I/fWM9qDMoGO
         7MCA==
X-Forwarded-Encrypted: i=1; AHgh+RpKaPjns7xuubZOwfti3925kIePgULYbbi5KMYMb/oZ+SRu6izfjYH57Zf2l+Lk3V5j26v3cCgeXMaWsLyH9/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYYyG5e7Ecgah3VaUaoDdTW1818AuKMG+H3UxAq0ybi0duXbf
	ZHF/n6DCBV9dGeeNRsn+i7om2DztsF3ZiQs1xlSIgOFa784U8svA3LEX
X-Gm-Gg: AfdE7ck9xIe9kn3IVR5qSLrCMgg76ogDWh3RQkOVqde1sAx+xpxxSUdqpYq+U2NfVRL
	shhiHLvjVljSg3atgwffzDIO2G0tyTVC7JzqVyv+FpC6E82ZCQpUTrR5hpaTR0MZTk1oOs8OAd3
	bWKuctzK/6y1xharITWafYDHDH7e2AXjqyzpWYI3wmWlp1DAb8IgPV6hNxGBoDNIDWlupI96G5r
	x/5mJa6PK7ni0IpamPy3ndIghLSlF+j6hDOcFIeLD0VHkPCrsvNMx3t+yY7Gke0kuSDEfx4DSV7
	W8HesWLSNZ3USfuMBOSMuV3M7MxYcL0845vTrh28XksnFWOmq0xJLlaiKOGCp9qCqx3uEcFTZ3k
	vWgk6maCCPmYI+MngF1uDuI8Ip+GPwNMWiWTG4S8N7kALR7iEHj8nsEpZY8UwRLLKklZVVAr5PT
	HBa6u2tpR9LUr+cMCKeANbgl6FCr8UD62z0L9cljlCre9eLmhAqSYRFXr7aUzkQpBYsA5MuFhta
	PMJZLpA/ciB+64=
X-Received: by 2002:a0c:f405:0:b0:8fd:6de3:dd8b with SMTP id 6a1803df08f44-8fec3bf69e6mr4016686d6.65.1783479477529;
        Tue, 07 Jul 2026 19:57:57 -0700 (PDT)
Received: from battery.lan (pool-138-88-31-60.washdc.fios.verizon.net. [138.88.31.60])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de83f8sm175762936d6.33.2026.07.07.19.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:57:57 -0700 (PDT)
From: David Windsor <dwindsor@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David Windsor <dwindsor@gmail.com>
Subject: [PATCH bpf 1/2] bpf, x86: Fix FineIBT #CP in BPF dispatcher's indirect-jump fallback
Date: Tue,  7 Jul 2026 22:57:55 -0400
Message-ID: <c5a6bff16c0885d3ec756a1cdfb623636d0bdb4a.1783479101.git.dwindsor@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 4f9087f16651 ("x86/cfi,bpf: Fix BPF JIT call") updated
emit_cfi() to emit FineIBT preambles for JIT-compiled BPF programs, but
did not update emit_bpf_dispatcher(). When prog->bpf_func is not in the
dispatcher table (e.g. an XDP_REDIRECT target program in a CPUMAP or
DEVMAP, or BPF_PROG_TEST_RUN of an unattached prog), the dispatcher
still jumps directly to prog->bpf_func. Without a FineIBT caller
sequence, under FineIBT this raises #CP:

  Missing ENDBR: __cfi_bpf_prog_..._xdp_dispatcher_unattached+0x10/0x10
  ------------[ cut here ]------------
  kernel BUG at arch/x86/kernel/cet.c:133!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
  RIP: 0010:do_kernel_cp_fault+0x126/0x130
  Call Trace:
   <TASK>
   exc_control_protection+0x46/0x80
   asm_exc_control_protection+0x2b/0x30
  RIP: 0010:__cfi_bpf_prog_..._xdp_dispatcher_unattached+0x10/0x10
   bpf_prog_test_run+0xda/0x1b0
   __sys_bpf+0x70b/0x990
   __x64_sys_bpf+0x2d/0x50
   x64_sys_call+0x1079/0x2d40
   do_syscall_64+0x12a/0x3c0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

To fix this, we precede the indirect jump in emit_bpf_dispatcher() with
the FineIBT caller sequence: load cfi_bpf_hash into %eax and subtract
cfi_get_offset() from the target so it enters the preamble's real ENDBR.
Only needed for CFI_FINEIBT.

Fixes: 4f9087f16651 ("x86/cfi,bpf: Fix BPF JIT call")
Cc: stable@vger.kernel.org
Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 arch/x86/net/bpf_jit_comp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index de7515ea1bea..1c8249d8ca3b 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -3740,6 +3740,15 @@ static int emit_bpf_dispatcher(u8 **pprog, int a, int b, s64 *progs, u8 *image,
 		if (err)
 			return err;
 
+		/* If running under FineIBT, enter the preamble so the following
+		 * indirect jump lands on a real ENDBR instead of the poison.
+		 */
+		if (cfi_mode == CFI_FINEIBT) {
+			EMIT1_off32(0xb8, cfi_bpf_hash);	/* mov $cfi_bpf_hash, %eax */
+			EMIT1(add_1mod(0x48, BPF_REG_3));	/* sub rdx, cfi_get_offset() */
+			EMIT2_off32(0x81, add_1reg(0xE8, BPF_REG_3), cfi_get_offset());
+		}
+
 		emit_indirect_jump(&prog, BPF_REG_3 /* R3 -> rdx */, image + (prog - buf));
 
 		*pprog = prog;
-- 
2.53.0

