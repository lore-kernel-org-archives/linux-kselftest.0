Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FD3FD15E
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900217; cv=none; b=KM0Mp1jLgWXFzW16v8ZvxCaleInsjd/eu+TLpdVXc1U7/mXNsWl2wZzYCtGYapL08KYGBo3m+NJXxz7IHziI6Wirnki3vt5m0IMS6VB1W1iQRWVxcfbRKK5HYhL3xKe8VtsFx3HYtL94vFgJUyhrLrLUTvMxiFWEZIa9YbXZIE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900217; c=relaxed/simple;
	bh=cqnS9dTQdCRjp10FbcODhbDvs4uma81tqRdfe6RoMg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KDTWV5OJVlKjxiRxUkRFlL2EU3GP8ztWf1GlNWMT7yxWzHQOfBpUo2cSms+xDw5BuGGbz3fJeZC8jj5+f9ki0ftbFQ6P2cjfKEVQ/eHlEKWHUjS9+K0XmrPVarvKQ1qtd+CJ+p3K7tUinkF0r02uayzEFRelqrg/cB2G0oICqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A/AlBlPe; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A/AlBlPe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D7F3C79ABB;
	Wed,  1 Jul 2026 10:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7099860288;
	Wed,  1 Jul 2026 10:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F39A4104C9AA7;
	Wed,  1 Jul 2026 12:03:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782900211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7ZwZS2SJc7/8lz+4gUaWWMn7u7LAxJs3R9X+PmjbFzU=;
	b=A/AlBlPeoti0Gph3Qe9H483VZSLzrEIYEwL1csn6gbyQiQri3oAxPTNcgWrbINo8pMHGbY
	EHipa6hNO8EVJuRDY4ksocPdc6H0BKTZAcgo7mzRAhPJCDrPrDSN9ZSQXSiasHCnmk6iWL
	Is/j+A1UP1iUZ3kVnYiwK6XriSQ32e3TfMZSJEan1sR8MOgGr/XUwqvWQ8vCDSQjD9+Wax
	2FMaNAVRDWAHbVZCOAfR//1lEJQTZzqeiycIUhHCXxfWrXtqUsg9Yy2VsBd8B4JwQuCy7u
	A01kI/GG7qNAtS3JuTRNbIbZqI8PQ6Wl2806dPYWCQMLWJzDvpHI6NZ5IWNjuA==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Wed, 01 Jul 2026 12:02:50 +0200
Subject: [PATCH bpf-next v3 02/10] bpf: mark instructions accessing program
 stack
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-kasan-v3-2-bd09bb942d86@bootlin.com>
References: <20260701-kasan-v3-0-bd09bb942d86@bootlin.com>
In-Reply-To: <20260701-kasan-v3-0-bd09bb942d86@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Andrey Konovalov <andreyknvl@gmail.com>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In order to prepare to emit KASAN checks in JITed programs, JIT
compilers need to be aware about whether some load/store instructions
are targeting the bpf program stack, as those should not be monitored
(we already have guard pages for that, and it is difficult anyway to
correctly monitor any kind of data passed on stack).

To support this need, make the BPF verifier mark the instructions
depending on whether they could access or not memory other than stack.
As different states in the verifier could lead to different memory types
for the same access, just marking an instruction as accessing stack only
is not enough (it could be some other memory type in another verifier
state), so the algorithm rather sets by default any load/store
instruction as stack only, and if _any_ state leads to any memory access
type other than PTR_TO_STACK, it overrides this setting. It also takes
care about shifting back the instruction marking in adjust_insn_aux_data
if the verifier patches instructions. However, if the verifier generates
new BPF_ST/BPF_STX/BPF_LDX while patching some instructions, those new
ones are systematically marked as non-stack-accessing: this may
over-instrument a few memory accessing instructions, but it allows
making sure that we will not miss accidentally any.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Changes in v3:
- drop getter
- drop cBPF handling
- update marking shifting logic to track more precisely orignal
  instructions
- systematically mark newly generated instructions as non-stack
  accessing

Changes in v2:
- invert marking logic to cover possible different reg types when the
  verifier covers different states
- add a best-effort processing for classical bpf programs, inspecting
  directly src and dst registers since we don't have verifier env
- make sure to keep marking in sync with prog when it is patched by
  verifier
---
 include/linux/bpf_verifier.h |  2 ++
 kernel/bpf/fixups.c          | 23 +++++++++++++++++++++++
 kernel/bpf/verifier.c        |  9 +++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index 76b8b7627a10..868101ef5002 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -723,6 +723,8 @@ struct bpf_insn_aux_data {
 	u16 const_reg_map_mask;
 	u16 const_reg_subprog_mask;
 	u32 const_reg_vals[10];
+	/* instruction can access non-stack memory */
+	bool non_stack_access;
 };
 
 #define MAX_USED_MAPS 64 /* max number of maps accessed by one eBPF program */
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 1f340211b65c..0b58a02a7179 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -152,6 +152,17 @@ static int get_callee_stack_depth(struct bpf_verifier_env *env,
 }
 #endif
 
+static bool is_mem_insn(struct bpf_insn *insn)
+{
+	if (BPF_MODE(insn->code) != BPF_MEM &&
+	    BPF_MODE(insn->code) != BPF_MEMSX)
+		return false;
+
+	return BPF_CLASS(insn->code) == BPF_ST ||
+		BPF_CLASS(insn->code) == BPF_STX ||
+		BPF_CLASS(insn->code) == BPF_LDX;
+}
+
 /* single env->prog->insni[off] instruction was replaced with the range
  * insni[off, off + cnt).  Adjust corresponding insn_aux_data by copying
  * [0, off) and [off, end) to new locations, so the patched range stays zero
@@ -183,7 +194,19 @@ static void adjust_insn_aux_data(struct bpf_verifier_env *env,
 		/* Expand insni[off]'s seen count to the patched range. */
 		data[i].seen = old_seen;
 		data[i].zext_dst = insn_has_def32(insn + i);
+		if (i == off + insn_off_in_patch) {
+			data[i].non_stack_access = data[off + cnt - 1].non_stack_access;
+			data[off + cnt - 1].non_stack_access = false;
+		} else if (is_mem_insn(insn + i)) {
+			data[i].non_stack_access = true;
+		}
 	}
+	/*
+	 * Last slot instruction could be a newly generated
+	 * BPF_ST/BPF_LDX/BPF_STX
+	 */
+	if (is_mem_insn(insn + off + cnt - 1) && insn_off_in_patch != cnt - 1)
+		data[off + cnt - 1].non_stack_access = true;
 
 	/*
 	 * The indirect_target flag of the original instruction was moved to the last of the
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 25aea4271cd0..e24545dcb4f9 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3144,6 +3144,11 @@ static void mark_indirect_target(struct bpf_verifier_env *env, int idx)
 	env->insn_aux_data[idx].indirect_target = true;
 }
 
+static void mark_non_stack_access(struct bpf_verifier_env *env, int idx)
+{
+	env->insn_aux_data[idx].non_stack_access = true;
+}
+
 #define LR_FRAMENO_BITS	4
 #define LR_SPI_BITS	6
 #define LR_ENTRY_BITS	(LR_SPI_BITS + LR_FRAMENO_BITS + 1)
@@ -6355,6 +6360,10 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, struct b
 		else
 			coerce_reg_to_size_sx(&regs[value_regno], size);
 	}
+
+	if (!err && reg->type != PTR_TO_STACK)
+		mark_non_stack_access(env, insn_idx);
+
 	return err;
 }
 

-- 
2.54.0

