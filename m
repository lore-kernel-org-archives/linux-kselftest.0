Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8C47278D
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786413; cv=none; b=nHMBONFddbZ23efZ2KHdHXK47+Wtozscgq/I2dR32kWGxgq/gs0PxgN0Xj4aX0dQ8Bgjhir1tyxU/IKl3oXszkCU2lnLVniOLbgBZ1CwgsKmXBdb27KS4KqBGtUiNByGuYrDmk0dkU8LckvkSFitqUxCORZh86ouWgx3WlIEQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786413; c=relaxed/simple;
	bh=kUOr/kXMiEHJllHl5FfrdB2jjdM1d+MjF5uadLEvrz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxsYU7MCmn0HKq/2kn+D5n0atPGZwdxL7oljzr3LaL8m/cnsvyPeLuKaSihIJXRztBo7jqsPSvZMhyU0uFLxnriXuaX0wSW7eH9s69O5lxG2EDwo3cBZVP8o/GVVQeEOaVE9lDmRJXpm1Da5oJgmudyZ9EkhityrqASJd8uw4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9P/Own6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9P/Own6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3517741a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786401; x=1789391201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=K9P/Own6aA1ed3yRY33F8o7yCZCXQGZbbI5VONJr581lkdOfGz/ecACdtWg0ntZhsk
         OG8HA/MU6V/QewoeFr0qSeho3AYtTypFZxrPX+h6bvodKg2VW2DVFIANZWpk7O6z/5Cf
         Do+IWVaYbWI0Zl/U5c+UAdSkSZ8zutS5umCFLCI1LdeJYOQcxVMGY4uoXp0bnDFqCgW8
         3JMXgnvycXpFukGHA340BYGX6LH1sBEwWWs8Wj763SvguLdtyx0jr+1QYj9l9cKNxvhR
         ggq2r+sNKqpmK9MAMcSRj0j4Rl88MW5Wcb7/PseOL3AA6zaGtaX0CacPU9sk9+8A7Nsv
         QZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786401; x=1789391201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6SxQC1ayWQCOsksETTmVt8rx2S1MTrrOl76Pd3OeUuw=;
        b=a8ag+7RCUe4PykKR9J4YIbPNeNQZ54HKxrS+N8aO7f2VpGol17NwLOV+m7vJ9wDlhF
         3yGXwKlfJ0OTkkCsWhc2fCSvHhduWjVrVvpIpTOY+zvuTHvkBHkR8xqtTojDzB4yVFze
         e8C7Npp54jR09MqPcaBuytDc43Z1rA7BeDBuS90NquIl29umOIxm5/yokggfgNZUmBwP
         wBLRcHBB23gmxLiugtiZYA1pDl63GL5sJhNPO/pjyFXFLSGAFVUnKMFTiub/MkUQUwJV
         O5G6tEaQcCdKwL85H5uiF62omy7mtJk4lNmzhvyp/hk9LYZ/buAFV1yz2ls6GMt6PQf+
         1IfA==
X-Forwarded-Encrypted: i=1; AKwUvBzFeuncA5WZFHR6RUXVTWYtWpZfutbYuSFwjuvPSOCV29L3iz/JIfIXdcJhUVWG2pJLuXg04kD/mso1ovtONXw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/SN65WU5K1VcOmFLwd6LnD5uNf2J3Q/5HSS1p5AsG0LTZqsZJ
	yf8lRy7VFt3Dc9Z+y3d9NpIPUZBcZD4fnPXOIdEQ/cMPKFbHjdfdOEY=
X-Gm-Gg: AYBFou3xM4nNtW1rLT2kMkRb1hG5OzeE4+ujepeUq5Nu3cwts1MtjHtLDKYw5Ei37f5
	4ZzU+zCq8bXWGfhZmtzHKR65Ir5kfhy00tElEJ/SmrbFZ7gG4y0Y0KDUepwZ5eezMWZO5jQAdcD
	TbVM+J34cokk6LticSFuEwWJshpXLRWXOsM7nnXO7dSwb6vjMyyZpNVrPoiJpeBCj54qDGU8XVD
	YpIl87f27QovyFYJ2CFzz8zmKrmyz7+J+8IU1evzcwi8Tmi1kGVlsoOX9zOoPtYOErDNouf1SAa
	zvpMmBFVjo6p71kJh7Xf1W9fNzNGClvbt8HA5whRg/QbjZVH246I2QDGvhHFcI6f9Jqr9zah56d
	K1K7EX9qjNomubSd23MMl7p797sEeSjaja83qQkuHmo9ZbrpjYujgkqX8WEqzwweHhQUmb4gpnJ
	J/JmQ9DYgbCWEA9I9JOa5LrFTgzL4jX62l2+J3JzU3NmL8nQuKSEi+BgwtLLH7vIRG901wwnm6P
	/10XcHjRULLodOC
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33674550a91.23.1788786400789;
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm26742398a91.0.2026.09.07.06.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:06:40 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v3 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 22:06:23 +0900
Message-ID: <20260907130624.611942-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
References: <20260907130624.611942-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A program acting as exception boundary saves all callee-saved registers,
so build_prologue() takes the exception_cb path and never calls
push_callee_regs(). That is the only place find_used_callee_regs() runs,
and with it the only place ctx->fp_used is set, so the callback prologue
does not emit the

  mov x25, sp

that points BPF_REG_FP at the frame the callback runs on. x25 keeps
whatever it held when bpf_throw() was called. If the throw came from a
subprogram that uses its own BPF stack, that is the subprogram's frame
pointer, and since the subprogram never returns it never restores x25
either.

Stack accesses through BPF_REG_FP are rewritten to be stack pointer
relative, so those still land in the callback's own frame. Materializing
the register does not: a callback that passes the address of a local
variable to a helper hands over an address in the dead subprogram's
frame. That address is below the callback's stack pointer by then, and
the helper's own call chain covers it, so the helper can write over its
own return address. 0x1234 below is the value the helper was asked to
store:

  pc : 0x1234
  lr : 0x1234
  Call trace:
   0x1234 (P)
   bpf_test_run+0x188/0x3e0
   bpf_prog_test_run_skb+0x47c/0x998
   __sys_bpf+0xbdc/0xdd8
  Kernel panic - not syncing: Oops: Fatal exception in interrupt

Set ctx->fp_used on the exception callback path so that the existing code
further down sets x25 from the stack pointer. The epilogue restores it
from the main program's save area along with the other callee-saved
registers, as it already does. x86 sets the frame pointer for the
callback from the argument it is passed, and powerpc computes it from
the stack pointer.

Fixes: 5d4fa9ec5643 ("bpf, arm64: Avoid blindly saving/restoring all callee-saved registers")
Acked-by: Xu Kuohai <xukuohai@huawei.com>
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 arch/arm64/net/bpf_jit_comp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..c5f55d6161fe 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -600,6 +600,8 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 		 * 12 registers are on the stack
 		 */
 		emit(A64_SUB_I(1, A64_SP, A64_FP, 96), ctx);
+		/* The callback may use its own BPF stack, set up fp for it. */
+		ctx->fp_used = true;
 	}
 
 	/* Stack must be multiples of 16B */
-- 
2.53.0

