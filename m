Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338F386443
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759772; cv=none; b=IgNH0hFDLUpgc4sagIwgVYEvZnYAgzrfOxd/ScFtdF0QEr9if7Z6qFJAuhmesCdJaWSk0CuQ6PW3lhaziyWvtwwtVCroLjuZCzhqW8VN9b/XroE1+kXKiWjeEBJ42KsYLgrdWYGChIPQQ4gPlI5gSxyVIYVUUNHfDC6/mX0EGgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759772; c=relaxed/simple;
	bh=L9Q7H6XzdldeK7oJVUx64Jc4Oyk5d2RSK8iopIFNoWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+TCcrZSNRBXh2LubVA9tI3ZPC6P7Q6/W2tTLbkzGOO9eKjLogsarXMJ+ciGhF4HcWli5hpPjGho7Xcp78iC39zeOzgaFTBHKkJVNdH1b1YT3qvdnoeMdFb9NOxLtBMJGn1S0IPGHg1+ccWqAaRk77UXhRKL9HkCwCeNviFjEZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGKiPRlr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGKiPRlr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d58efc7356so39374045ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759771; x=1789364571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=pGKiPRlrCglX5ZlCCX+8muWb1y+DK89kIAfAtF6w/pV8fWmI+kwlRAzL1fH7QObWJ+
         zuLN3biM2/1oEGi17JfIKa+5IKe3/2CJlyIgsTSkNhHAodz8ARzpIXhMHKnFlQn8RaaZ
         Iu/Ylrp6C9TQwQOJ/J0YmEcVdwLrPVPm3Z83iak61AQuNeAB2nFmprPGE6QQjPPvkCjp
         Fflfra9EgDytmgKwSx71OOm4aPxjGx8DMm6kX1no30TuQ3Y3+nHoVHenqGLgFYpagw2S
         kdPClZGXzs+/fU4MhNGwSM4gATfUmKGdCxNJXvjOIS+PVdyeORtxG5yabPAmEvnNTMP7
         jGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759771; x=1789364571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVyebJSrPANro9+ZzIJ5GUMECycDoWkIReTgM/W+/mE=;
        b=R0GYkIoSCxei5Pud+t+VqupGcEcPUGMXiPyI/Isvi014len/2urzWuy21dhBZ9MymP
         jYpTM9jKj5h4p5ZV3faE8Q5E3/hm4eF79ylejeuF5T+N2TJNz1dTZ/MR/dfygtbTBzCc
         GK4P+aK8SOmL2K/rsbsYspWSDj7U5agY7HBS4JgcViyRjqubd4Cg3M7WcUqpidngNTte
         XUY+Mdw7kgaHVnII/gtqnjcTuRHXad8fC+B8g+WTPDyZcLJpqk5nz4JZcsA4aBufGQLf
         aH+sebt9xAsM6tdUt7wL+AoNjeyTEfDIn5jKOoFF1fm+iGBrnHjKEoVBllBdpv9uzEIe
         JkNg==
X-Forwarded-Encrypted: i=1; AKwUvBwvasTU+E2CseHKBXcvxjAve6mnkeYoueBfqGVYz/sWW8nQtlE9hKolDT52ufmRTr3ztsZsZUT1eA/jfcP8oFM=@vger.kernel.org
X-Gm-Message-State: AFuF++mBOiFIhxOe5jmifyOw6YYqZze4FjpORNbVSsxB5k0rsc3JvlRS
	lx+yD0lX2xSCdREwR3CSjBI6fDg5w1pvPvcY6pMeyp1wepgZdwsXdrI=
X-Gm-Gg: AYBFou35kPjtA0UiAAX5nrcI0X1Q2jJOi/ctb8nHwhoOGjmFafT2bxn6TezzN3ufNSw
	2OHKmHxb+OMeGNJPoMgJm2aVXzOk5bhhVrk/L9Sjp4yZeZdN4sIWTsp/2OXPWb+PB9Z35rAzgQT
	gCYUy4xpXS2pBX0d//zhUvqOadnEj/ymRsmmz4RM0O94DY/NqaVnqeEUwkCd4khVJ03OdE8dy5J
	tO54Jm5kU5M/2SuiJDmYypBKtpNuXgZZRxv2AQ+MqXi08BfpqKPyIiWKmG1sAASHV+JxaG6y2xW
	iIr4L0UY2iZLF+IkB5e9hRNYVdkuI4HU2EVlG9KJlziaoYfxWHKlBdRXV5dAUF/9r82+pHFQaGk
	efsDRUcY7ypp4vmW8naEy+jJl1rlF6DZIiDIFCsaDgrVWdKS11EFHX3lARlBPc2R+hG1uw3Sat1
	G+q0CEZjItue8GpzYi0xCuSEXo2pd6Di+vRq19CqtzgvYBoeqtOQrT32se1Bwe+P6BuMUIP2kxC
	af/1UKHzIuu2SxP
X-Received: by 2002:a17:902:d587:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2db1265add0mr308117045ad.7.1788759770837;
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:50 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf, arm64: set up the frame pointer for the exception callback
Date: Mon,  7 Sep 2026 14:42:34 +0900
Message-ID: <20260907054235.473103-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
References: <20260907054235.473103-1-donggeunyoo.kernel@gmail.com>
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

