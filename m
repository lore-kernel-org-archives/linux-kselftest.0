Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361241;
	b=EOQZA+rNJf0NK8bMmOXLr7HWVY+cYdmtSXGsZ+OEgb3jG19qaAVh81frHL9iACDUEkAD
	 uhjxkDH0nSrcQSBLl71FhBZ/fodzmlYWC7VxBlsk7Mo3vXmQwEH+UBYFrpAL0xZOOu6Za
	 xs7HVBT5+kZOKHsXhMYlUouZudfUyw2LCvF3LzNO4WUdrgV85RYYRh6Ks22o26w2eEHaO
	 fB3xCmVWV5V9HjV6FjsuJflIq2/7e+uHhN9amOdxzEcYOgySV/owDCssxXCbR2HjtxPvy
	 4VRGsaaGysUWAjG4XxyvsZ2lOtoF4grBuNLy1HjQiZn0IYJkdv5zaIY3Rd3yMbvZ8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
	b=ZScvjUjwp93YJ1NUURh50rdFCAbV19RCGJq1n+ZMomr8+cLJNnuN1AHPT/PQNdFPtRtS
	 556C6/ST+m2v2bqg+v9eKXm/tGakjpnc3CCps7FRUKWnJiTil2GweprPQU1VDldt2fXOI
	 1XkvlYg0aFGO6wKH1UxiXZ2N2C7/lpn7RxjLsXBaBQ5oH6tiZdXwlvr2gOwI6qUWcZ7yo
	 o+uBErfSgR2ce784KGRfUSMBjKZk66S00a6YY77UvcsDiTSEfJUeFR1Lq/h//hooCp1MH
	 TZmFhPF6eMPBf/KsO/79NqR0of46Cdzxsj+G7vi6p/nnbani4z9hJqZlU80gQY7rD3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxyEvOzq;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609DF607086C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 609DF607086C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxyEvOzq
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so961434c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361240; x=1793966040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
        b=xxyEvOzqrbzcQJzLVkp035VbfRAh6iTF2D9eMoC/wyCk+0IIWkwpm/ITiz0QLnIO8N
         8O9s+KvlI7UG1pa5k49XfYk+MFxePnmHyNvOIyF0YRPFWOaVfPLf0mWy41/QCJRrtBlD
         KSwubb821xm13piN6Y0kp/IxqMw5jXvei/Zd2KzTYLxdBaWIqDxBtdorCY94fGec/Zry
         IWzXeKPRKcY5MaBzhvXA3NiTeD/CfDebU/S8TvA+jXmNN4+m5JLMkp3MIg7tEh89OfA/
         bhDfwfbl6d7nVrPYWQ4anN6xKq0u+2dZetbJbfU1bktQZlWZQ9d8D3ZQi7l2Y25uCvd9
         11hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361240; x=1793966040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rifggq3wvmtKN9HBpcJIa5sJWlnd49WFlLOgBeYNSRk=;
        b=hjPuFc/P0sEgqZyLoWXyD74cOIRSoMllqUBBW8HDYbmHQkGALKHuXA5TIW950WFCqt
         RlfZygr18Dvh9NEL/jJDWojaE+2iEHSAfDrKbajgaT7k6VHSdoFUZRV1zzNtxuN3dmVU
         bCc51sR2Mlhpt9qcsLbyKMxO2vO8gZmsTRe2vJSt9NjAvBmtN/e9neCKMvhYnSSSp+KO
         s3+YoGfQy0rbtvH+Hto00zbSc66k7XOnFWLW5i1vxjCg6rE9434bhXvRa7muQ7usU+0H
         FXwten2hG2ir7+Ja76QiYNOUpfW0WrfMwZaq6MQn7BGVk69A2Yu/YRpMOFWHFZzzKIhy
         opeA==
X-Forwarded-Encrypted: i=1; AKwUvBxOpsV/ollhBiG++tP3hb5RaTHFt2RuXbBlsgIBWfOwCTu2xnxxnXEEUTlL9qN+OaMA61TYDUO6SFM6IQR8irM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvcxmIs6AVBFsJkLvAl+jv3lbKq8VdyjKJMxJB3wJdS+sLyA1M
	DS+hI32sqxJeonP9zRMX5i8TYJ5WPIdtWHXBXuHjAOoOuxmglEQDoX8O
X-Gm-Gg: AYBFou1nZHO1u9S8SFI+qH02ira4Kha5+5KAcECfl8kNSe6ZT7CYE+WuyusHC6gCwmt
	fFczoA7a7ohWIaau3xrzqlQPk+vkx+hGR9TOH00CVH8OY2Wzv6abvGr/xHWNwgPiGNoNhPZsl4t
	qnXUgvZx5s3g0asBn72x/0ulNcVOV23Z6GV7o+4RuTHbxcI6vpliXB5JbaeR3DNLVUyGyjT84jM
	Q49zlSKsJJ4xIZWVM01vw8Etcb0qY048FTsXG/JsaKPqHCH86b/ocQic0Ss3eCrmZ2YDzzleNml
	j1+q8b8QWJ8DAWs86V79j/sZUHxxVvsaYgh4y329JIc+DdKURsid++ja6aKYUAvyFJGhh2a/CRr
	yURpLZR6XwcwhTxpAuUI8QziYI2zKJEtosegV+/dSA2qRKo2d+6z3iLGKr3h6NXCojEbAxifS+H
	cG4Adok0yV3c+QKO4r4dB88nGyNIF0aYefuXgL+4AldlIgpv3vWz1DH9WznR55rnNCNIQTZcpuw
	kQy/yt4GhZZbGFMQxP8xpEUZpqj70QePh5WSaocxaH1yHD2mnX3GvDKU7JG2xm69RO/CdZpx78Y
	tw31BNvk+BcTOxoyEANn+sCP
X-Received: by 2002:a05:701b:2311:b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-1ac5ae39462mr2790819c88.19.1793361240486;
        Fri, 30 Oct 2026 04:54:00 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:54:00 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:06 -0400
Subject: [PATCH bpf-next v2 21/22] selftests/bpf: Test jumps around patches
 of bpf_do_misc_fixups()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-bpf-verifier-patch-batch-v2-21-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_do_misc_fixups() queues its patches and applies them at once,
relocating every jump through a map from old to new indices.

No test checks the xlated code of jumps that target, skip or leave such
patches, a jump that the patches push out of its 16-bit range, or an
indirect jump to a patched instruction.

Check the xlated code for forward and backward jumps to a patched
instruction, jumps over patches, and a may_goto whose jump leaves its
own patch and crosses another one. Check that a jump over 8200 guarded
divisions fails to load, and that a gotox to a guarded modulo by zero
lands on the guard.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/verifier.c  |   2 +
 .../selftests/bpf/progs/verifier_patch_list.c      | 175 +++++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/testing/selftests/bpf/prog_tests/verifier.c
index 04740ba37e918..40788891641b5 100644
--- a/tools/testing/selftests/bpf/prog_tests/verifier.c
+++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
@@ -96,6 +96,7 @@
 #include "verifier_netfilter_retcode.skel.h"
 #include "verifier_bpf_fastcall.skel.h"
 #include "verifier_or_jmp32_k.skel.h"
+#include "verifier_patch_list.skel.h"
 #include "verifier_percpu_addr.skel.h"
 #include "verifier_precision.skel.h"
 #include "verifier_prevent_map_lookup.skel.h"
@@ -287,6 +288,7 @@ void test_verifier_netfilter_ctx(void)        { RUN(verifier_netfilter_ctx); }
 void test_verifier_netfilter_retcode(void)    { RUN(verifier_netfilter_retcode); }
 void test_verifier_bpf_fastcall(void)         { RUN(verifier_bpf_fastcall); }
 void test_verifier_or_jmp32_k(void)           { RUN(verifier_or_jmp32_k); }
+void test_verifier_patch_list(void)           { RUN(verifier_patch_list); }
 void test_verifier_percpu_addr(void)          { RUN(verifier_percpu_addr); }
 void test_verifier_precision(void)            { RUN(verifier_precision); }
 void test_verifier_prevent_map_lookup(void)   { RUN(verifier_prevent_map_lookup); }
diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
new file mode 100644
index 0000000000000..1370cdd5e5836
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include "../../../include/linux/filter.h"
+#include "bpf_misc.h"
+
+/*
+ * bpf_do_misc_fixups() guards each division by a register against division
+ * by zero with a 4 insn patch. Jumps to a patched insn must land on the
+ * first insn of its patch, other jumps must follow the insns they target.
+ */
+
+SEC("raw_tp")
+__description("patch list: forward jumps to and over patched insns")
+__arch_x86_64
+__arch_arm64
+__success
+__xlated("0: call")
+__xlated("1: r1 = r0")
+__xlated("2: r0 = 7")
+__xlated("3: if r1 > 0x5 goto pc+1")
+__xlated("4: r0 = 9")
+__xlated("5: if r1 != 0x0 goto pc+2")
+__xlated("6: w0 ^= w0")
+__xlated("7: goto pc+1")
+__xlated("8: r0 /= r1")
+__xlated("9: if r0 > 0x3 goto pc+4")
+__xlated("10: if r1 != 0x0 goto pc+2")
+__xlated("11: w0 ^= w0")
+__xlated("12: goto pc+1")
+__xlated("13: r0 /= r1")
+__xlated("14: exit")
+__naked void patch_list_forward(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r0 = 7;"
+	"if r1 > 5 goto l0_%=;"
+	"r0 = 9;"
+"l0_%=:"
+	"r0 /= r1;"
+	"if r0 > 3 goto l1_%=;"
+	"r0 /= r1;"
+"l1_%=:"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+SEC("raw_tp")
+__description("patch list: backward jump to a patched insn")
+__arch_x86_64
+__arch_arm64
+__success
+__xlated("0: call")
+__xlated("1: r1 = r0")
+__xlated("2: r2 = 0")
+__xlated("3: if r1 != 0x0 goto pc+2")
+__xlated("4: w0 ^= w0")
+__xlated("5: goto pc+1")
+__xlated("6: r0 /= r1")
+__xlated("7: r2 += 1")
+__xlated("8: if r2 < 0x3 goto pc-6")
+__xlated("9: exit")
+__naked void patch_list_backward(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r2 = 0;"
+"l0_%=:"
+	"r0 /= r1;"
+	"r2 += 1;"
+	"if r2 < 3 goto l0_%=;"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+/* The jump of may_goto leaves its own patch and crosses another one. */
+SEC("raw_tp")
+__description("patch list: may_goto between patched insns")
+__arch_x86_64
+__success
+__xlated("0: *(u64 *)(r10 -16) = 65535")
+__xlated("1: *(u64 *)(r10 -8) = 0")
+__xlated("2: call")
+__xlated("3: r1 = r0")
+__xlated("4: if r1 != 0x0 goto pc+2")
+__xlated("5: w0 ^= w0")
+__xlated("6: goto pc+1")
+__xlated("7: r0 /= r1")
+__xlated("8: r12 = *(u64 *)(r10 -16)")
+__xlated("9: if r12 == 0x0 goto pc+9")
+__xlated("...")
+__xlated("15: if r1 != 0x0 goto pc+2")
+__xlated("16: w0 ^= w0")
+__xlated("17: goto pc+1")
+__xlated("18: r0 /= r1")
+__xlated("19: exit")
+__naked void patch_list_may_goto(void)
+{
+	asm volatile (
+	"call %[bpf_get_prandom_u32];"
+	"r1 = r0;"
+	"r0 /= r1;"
+	".8byte %[may_goto];"
+	"r0 /= r1;"
+	"exit;"
+	:
+	: __imm(bpf_get_prandom_u32),
+	  __imm_insn(may_goto, BPF_RAW_INSN(BPF_JMP | BPF_JCOND, 0, 0, 1 /* offset */, 0))
+	: __clobber_all);
+}
+
+/*
+ * The conditional jump skips 8200 divisions, which their patches turn into
+ * 32800 insns, too far for its 16-bit offset.
+ */
+SEC("raw_tp")
+__description("patch list: jump pushed out of range by patches")
+__failure __msg("cannot be patched due to 16-bit range")
+__naked void patch_list_jump_out_of_range(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r1 = r0;					\
+	if r0 == 0 goto 0f;				\
+	.rept 8200;					\
+	r0 /= r1;					\
+	.endr;						\
+0:	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
+#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_powerpc)
+/*
+ * An indirect jump to a patched insn must land on the first insn of its
+ * patch, here the check that skips the modulo by zero.
+ */
+SEC("socket")
+__description("patch list: indirect jump to a patched insn")
+__success __retval(7)
+__naked void patch_list_indirect(void)
+{
+	asm volatile ("					\
+	.pushsection .jumptables,\"\",@progbits;	\
+jt0_%=:							\
+	.quad l0_%= - socket;				\
+	.size jt0_%=, 8;				\
+	.global jt0_%=;					\
+	.popsection;					\
+	r1 = 0;						\
+	r6 = 7;						\
+	r0 = jt0_%= ll;					\
+	r0 = *(u64 *)(r0 + 0);				\
+	.8byte %[gotox_r0];				\
+l0_%=:							\
+	r6 %%= r1;					\
+	r0 = r6;					\
+	exit;						\
+"	:
+	: __imm_insn(gotox_r0, BPF_RAW_INSN(BPF_JMP | BPF_JA | BPF_X, BPF_REG_0, 0, 0, 0))
+	: __clobber_all);
+}
+#endif
+
+char _license[] SEC("license") = "GPL";

-- 
2.43.0

