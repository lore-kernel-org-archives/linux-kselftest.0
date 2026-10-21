Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569674;
	b=vhYUS3eksRvOhbRG3nWBQVmUmT5Y7r5mfb5wDJcjvGTGHiJAhmT0WAv70wwRUdLFhVIH
	 AGG6FR3O1nmzIfCcB3DlhtPLKc2sA9tePwX4MAZoj4k7xQRye1HkvJBE/jy+/Jz2VSMh3
	 vjUdKSOdT2gMcAx8Rj1vU1CgPaqap2bSE5LhFUvWm1ZCczUlvg+Yti8o2C8PHJf2LMoHg
	 v72L0wmb6pY+mrt+HVw6k6Xe8Qf5IHXvnhZoz4ZEHGFQvFr2LVVjFd5oxArR2FGOEvpko
	 Lufw/6VZYqXEKyBPT7yuuBLVu1z7cDp/fN4gbJB9vZ2VSqwMS8g5VZxmU8u32daknJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
	b=Y7yMSknCyv9RQQgBx/UhqShNlIUiyskemi+MPapDxQ/mB6MNFHlhqWorAb2JuDmVO3IR
	 0yqrW5G/auqDBT0FefVSmrGFn6ztczqTyPRgVlkxXlsgNV3/ObvSYzX3rOIwxbjdAcx28
	 Cyp3E64L/Kck/F6Zvhe/gK8YfpkNm7gYEYD2o0N5e9UdThFnDXPZmKLvPuIIBqKta9GdY
	 v/IqgDm69T9OgelNuHXM8XUyYaRv9xR59fG7OJzEdZmtrFZqvm7G8FC7O7fLkUIr+8Orw
	 GBLYgGo2TO1iDLdnzA4K3c1QLNJMrrxAoVciD74pbFKrZUsS6XwMuQ73LHjskja5plw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=beu0BXXQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FA606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 08:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202FA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=beu0BXXQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1359986eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569673; x=1793174473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
        b=beu0BXXQNA4InNFt82BaFOJL7zjfNzYGRue65Lszr5n1WGFG30rIq1M+HQKabuKkU7
         WSGmDMMMCbDASNd576d4BDkYI/1wp6mgI/GmHyILQKHOSInIEZ1qkcYS0t9hULGA+kn4
         jJoOCAhS6O9mMs8W39ak8jOyiwaM8xvuuz/XFO4h/fHkykK3R3oP0lnsMN7QbzJJ+7Nt
         pZ1Ebg3bWHyPBJcfET7k48n8OnHw4wWjxUjiJKiA2d9nOVooBcUAkN6zawPdFd79CJYE
         1LCplnCxiXImwEi+W866dU/4WYnve+jSyw5TAMWa3ZSZGLM1vXr6YUZm0Hcdr9dR9PpO
         XT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569673; x=1793174473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiI4cMavYXtb8vt/MajCrhWPebqVcKLkNr8147+y6WU=;
        b=pamasJcikqzgLXgWu/ilkGp+9bsmG595B7wDe5BefKnsLd1mPndH3MH3V6PnR7v/mu
         cVqvoyw+xNWSjCbYptVIvIYS2gp8hiwMc127AlI4iXqBGAUcPhApcsstFSnEvnq2dIIr
         O5LAzznJLQH9bQmYYwlerZauW0PX2YDfYSy83LyhtMMHk4k4wwtMf6U3DgRtBtVvQUuy
         aUItIBN36QG6y0HxtWi1yLycnd6EMeAnbPpkWFekp8RDfO9djgJaaEvEUBGse87zkNUM
         ZR9TwiTuJoQ0o/4vd0eP1V3cjdMA9ae8LNl6i7LEDIsWIgS7V3b44hLt3yprAEUa500R
         sgjw==
X-Forwarded-Encrypted: i=1; AKwUvBwjGciey8u6w+ci3iSyViVb2uksR2r+LNj6BCSmXpEOsBOxAm5xCIdMVab3ZzDwAYkauHM8G7i8+ihWKla5uzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTn3PijKQVBwuj9+Vbn4Gdvyhs1bb9pfdKEFs2Oce71UiHkBr4
	w7hnTFDXSjx/B3eVKzOyOUe8EhZNDTEMXLiC8VH4ygVKnCJVOxpVn7jS
X-Gm-Gg: AYBFou0nIimbu+Z538bGe2bXWtZpwmq1GyfcGMCEB4Rnv89GY+6snXyuLAINE0ithRP
	Fwtf3UVlpL6j6kVUax8khHQ5v3bDbaLyt4yfiUjwcZ9gUWJjPd7sY5fk5lW7MwaSSfmkI7N9dcI
	O0mpqR0U/Uf8RyOQiBxWLyS/uujrEQG+7Wq9Nkwtj31oCjb1/iD+SQUBdJnQHGXzw6MMOXqX5HN
	wTTVPmAiSsXM0nmtx0b54mWFpI3an01XpLIHk4wzuf5M9t2pahYQqbLToqJzaVcx9c9jkLaG06u
	pSSsT26D/IL/gWZQ0wH8zq186yscgrKIGcidCTWk8PyP2uCLYvacqGFYp7Tnc7lJGdfbebX6PJQ
	S2WNrEqBvgvfmUIpE4zmls92cVyZZn+RhcOFph4YMKfvMQIMaf8WrQAAHFImzi9PquHgOAZ1GY5
	gqQn1s7853whu9C+/XhBPQ4zlnNerY1xuEBIIPNl5EhnUwAtLbn0Wb934AYLXZGW6qbmaelvMWq
	A+N8NmH8prRFs8zztEQV2Six4yzZIWldINCo0eK1Rog38QsnL5LwnppOvQiagqN6M9EuNr3PADa
	rDdh/6mWVKUO9eDyZ69BCkRZ7jK5
X-Received: by 2002:a05:7022:e1d:b0:141:4c37:a212 with SMTP id a92af1059eb24-190a051dd9amr2581121c88.2.1792569672784;
        Wed, 21 Oct 2026 01:01:12 -0700 (PDT)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm4470610eec.20.2026.10.21.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:01:11 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+eada64ce90ecebce@bugs.sh,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH bpf v2 1/2] bpf: Validate stack arg reads against caller state
Date: Wed, 21 Oct 2026 01:00:59 -0700
Message-ID: <20261021080100.2663618-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

check_stack_arg_read() bounds a stack argument index with the callee's
BTF-derived argument count, then uses the index in the caller's
stack_arg_regs[] array. The array's actual logical length is recorded in
caller->out_stack_arg_cnt, so the bound and indexed object can diverge.

A crafted BPF_PROG_LOAD can use an argument mismatch to mark a static
subprogram's BTF information unreliable. Later calls return from
btf_check_subprog_call() before check_outgoing_stack_args(), while
check_func_call() continues the static call on -EINVAL. The callee can
then read a slot that the caller never allocated or initialized. The
earlier commit 4286f5deee14 ("bpf: Validate outgoing stack args when
btf_prepare_func_args fails") closed this hole for the first call, but
not for later calls after the subprogram has been marked unreliable.

Callbacks have a related problem. The verifier can make incoming stack
arguments readable from outgoing slots at the helper call site. However,
helpers and kfuncs invoke callbacks through an ABI that passes at most five
arguments, so the runtime callback receives no stack arguments. Async
callback verification can also reach check_stack_arg_read() without a
caller frame.

On x86-64, KASAN reports the direct-call out-of-bounds copy as:

  BUG: KASAN: slab-out-of-bounds in check_load_mem+0xb51/0xc60
  Read of size 80 at addr ffff8881009af550 by task poc/131
  Call Trace:
   check_stack_arg_read at kernel/bpf/verifier.c:4234
   (inlined by) check_load_mem at kernel/bpf/verifier.c:6645
   do_check_common at kernel/bpf/verifier.c:19568
   bpf_check at kernel/bpf/verifier.c:21318
   bpf_prog_load at kernel/bpf/syscall.c:3134

Reject callback subprograms with incoming stack arguments before their
state is pushed. For direct calls, retrieve the slot with
bpf_get_spilled_stack_arg(), which validates the index against the caller's
out_stack_arg_cnt and rejects uninitialized slots before copying the
register state.

Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
Reported-by: <co+eada64ce90ecebce@bugs.sh>
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Assisted-by: LLM
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
Changes in v2:
- Reject callback subprograms that declare stack arguments.
- Drop the curframe-zero check because only async callbacks can reach that
  state, and callbacks with stack arguments are now rejected earlier.
- Explain that commit 4286f5deee14 closed the hole for the first call only.

 kernel/bpf/verifier.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 72a3f5998dd27f..f461e9e5d19da5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -4228,7 +4228,12 @@ static int check_stack_arg_read(struct bpf_verifier_env *env, struct bpf_func_st
 	}
 
 	caller = vstate->frame[vstate->curframe - 1];
-	arg = &caller->stack_arg_regs[spi];
+	arg = bpf_get_spilled_stack_arg(spi, caller);
+	if (!arg) {
+		verbose(env, "invalid read from uninitialized stack arg off %d\n", off);
+		return -EACCES;
+	}
+
 	cur = vstate->frame[vstate->curframe];
 	bpf_diag_mod_begin(env, &cur->regs[dst_regno], arg, BPF_DIAG_MOD_WRITE);
 	cur->regs[dst_regno] = *arg;
@@ -9839,6 +9844,10 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
 	err = btf_check_subprog_call(env, subprog, caller->regs);
 	if (err == -EFAULT)
 		return err;
+	if (bpf_in_stack_arg_cnt(&env->subprog_info[subprog])) {
+		verbose(env, "callback subprog cannot have stack args\n");
+		return -EINVAL;
+	}
 
 	/* set_callee_state is used for direct subprog calls, but we are
 	 * interested in validating only BPF helpers that can call subprogs as
-- 
2.56.0

