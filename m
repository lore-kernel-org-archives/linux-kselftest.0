Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6FA3876B2
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 05:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759780; cv=none; b=UCEeE8k+YOgnjt9+6BN+dnwdSUOr+Y/8EG63801twR/qcCosxWWj3c+tsox7GCqwqn8WsfPOa92ubhfcOQzXwNBFkGMWq+T4GfzqE8qB+WTv3BDw2wgDy30J7DD73xotmXRmvXVFXhgo0Md314fyvtoRFGGhPH1P+XvgRHO6d5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759780; c=relaxed/simple;
	bh=G34zjPBMFtkZaAwCtGSLCjmaGqcYTVNtc9ds5LdSbII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MueZvbnfxbCCBxICy729MIZxjYtZrcvaT9dutRGwzNjIip2jxCtB3CxmxH7xMFbsLLhsypBqP8YF1UjaTNqVYcpC8va8vs+iDwjVkfhNXp6MrK9RnDsKpnQy/EYHylIZQqZpDQhCE6yScyyqO5LNmTANAgxAIjXHOtHz7OP87q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLL2Lx+g; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLL2Lx+g"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db3305f94fso19416945ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 22:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788759777; x=1789364577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLA6m2ZV0veg8WJCdKpkBRm0szwwq2AWMNzI7Yue3NA=;
        b=eLL2Lx+gXQJJ9T89iZrduDW7wxJ90hjEvO7bc1TY/COqtq/ZekvEOT5qRM29GS4VuS
         S6slV+jcuPWREdpHAYBTt7Pei51FIbiiRUoVIu/nQ1dn6zi+cRNpcjnGmsssy5hj5sXs
         h3ejm2kQwPi2Z0qwR7JEUpLp01EdE7+HluWfLl7HoSI/8BMFPj8nOiz5jW7Zr1B3g7ES
         xal2TMvQsvTxyxFnyIi15NpB5gYVc+0iPeQ8SycRi1tBSWZ+cUB66zZsuRt7whu0A0yA
         UrdsZUq0ztgBWPklAEgCgZbt2VR3bCfuJHxJxxeWqOZvMzkab3Eegmmpua3fZHzJD3hH
         IQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759777; x=1789364577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLA6m2ZV0veg8WJCdKpkBRm0szwwq2AWMNzI7Yue3NA=;
        b=ZCskaElEIkIJK0T5d7nZWhojXZiDF85DKIfHPTygYBnfO/JVoT0WigoTODCcZM/AjK
         vVl9fQ/EPEDIivdiDgXJgmhgkKh8S7s39OJ6ZmICJ+qPS57VqYFkJa693X0MV6gR0e7a
         ArS5VX3t56EOvwmS1g08FFsk6LmRVLNhABqlhs9fcHjalQgtNEyL6oWEzM5r+5/A4KzD
         1sI/J1Pbo+Y+YQhxIiNKNykERiGthvpABVBzN9nQVcKBz9QkFYN2nBKjUh7utjEcJOj/
         hG+ueqNoqB858rDHgFISLjVx7oCPb7Ym8iLfaqezI/VpsqA6GsY3UNzAK3k1U3EY9Wiq
         q6bg==
X-Forwarded-Encrypted: i=1; AKwUvBwY9BBRTegs4+Z+mya5Z32tWsqA7xC+L4b1fMbxFYD73431U7Tc+81tNQz7ZEFxuDf8VIw84Id01eReWTurEKI=@vger.kernel.org
X-Gm-Message-State: AFuF++mIjZCdNdoanGRLMj0EBEU4aF7oLjFkJjflWtPbj1mREjyFRGdZ
	KJZ0ztX8rGIznSENE4edDZcTg4z6v3AJ40SNe0QMFKa28TM5HvHDNZM=
X-Gm-Gg: AYBFou01CH8cLvL5LzAFx9ir/JXC3FuRPMcswd/rDhdrmkj9MvxY6Ze+JCBOqi4iw09
	+pr2XbeoqD9zRInF/n3QvvaQtra4E2DLY7uOXst15jY66ygKkcNlYJh/oFEZVa9bBSgamRCMq4q
	QkXSteZwKaqzku8V1ucZ3QvWmK7XpRaeq6Yx8YwuuX6gAmn7ZfyKFruttH/Q7D4UCsBrAFwVM1D
	kC4yacUj4/GQl0jAEFipf3mZQoZ18m/NMazuIXtJY1PtF/oJqh5rO9bvuPmFUDbhn4uBV7VzsAO
	rBnwC/n2zm84Xu/rsSiTEUwmtYBWJFTLIiImTfy1vSZYNPAM51ZWWLCK3sQimF3zepOo3LB/AfM
	FfHGt5bQqni1KJaRZJfIS7offeDctO5ZuaVW9Dt9HdlqVcxB51H7c8WVpDDfjzmXjk/gmYp61Jo
	Ehly+uNqI9SlvmMvPIcQFseYDAKS7XxPa5+/1KTsKwW2TtbSoDkyn6tC91Jknk3975m0NE4j+kw
	JY+tM7VPFl6VY3b
X-Received: by 2002:a17:903:19cc:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2db125cd39dmr342177905ad.5.1788759777012;
        Sun, 06 Sep 2026 22:42:57 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483dbddsm39107695ad.12.2026.09.06.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:42:56 -0700 (PDT)
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
Subject: [PATCH bpf v2 2/2] selftests/bpf: cover the exception callback using its own BPF stack
Date: Mon,  7 Sep 2026 14:42:35 +0900
Message-ID: <20260907054235.473103-3-donggeunyoo.kernel@gmail.com>
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

The existing exception tests do not reach a callback that materializes
BPF_REG_FP into a register. They either throw from the main program,
where BPF_REG_FP already holds the value the callback needs, or use a
callback whose only stack accesses are frame pointer relative, which the
arm64 JIT rewrites to be stack pointer relative.

Add a test that throws from a subprogram using its own BPF stack, with a
callback that hands the address of a local variable to
bpf_probe_read_kernel(). The helper and the callback have to name the
same slot for the value read back to be the one the helper stored.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 .../selftests/bpf/prog_tests/exceptions.c     |  1 +
 .../testing/selftests/bpf/progs/exceptions.c  | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/exceptions.c b/tools/testing/selftests/bpf/prog_tests/exceptions.c
index 3588d6f97fd4..639866ce09a9 100644
--- a/tools/testing/selftests/bpf/prog_tests/exceptions.c
+++ b/tools/testing/selftests/bpf/prog_tests/exceptions.c
@@ -55,6 +55,7 @@ static void test_exceptions_success(void)
 	RUN_SUCCESS(exception_ext, 0);
 	RUN_SUCCESS(exception_ext_mod_cb_runtime, 35);
 	RUN_SUCCESS(exception_throw_subprog, 1);
+	RUN_SUCCESS(exception_throw_subprog_stack_cb, 0x1234);
 	RUN_SUCCESS(exception_assert_nz_gfunc, 1);
 	RUN_SUCCESS(exception_assert_zero_gfunc, 1);
 	RUN_SUCCESS(exception_assert_neg_gfunc, 1);
diff --git a/tools/testing/selftests/bpf/progs/exceptions.c b/tools/testing/selftests/bpf/progs/exceptions.c
index c8d716fbd419..2b01b45cef06 100644
--- a/tools/testing/selftests/bpf/progs/exceptions.c
+++ b/tools/testing/selftests/bpf/progs/exceptions.c
@@ -212,6 +212,35 @@ int exception_throw_subprog(struct __sk_buff *ctx)
 	return 0;
 }
 
+u64 exception_cb_stack_src = 0x1234;
+
+/* The address handed to the helper has to be this callback's own stack
+ * slot, not one from a frame that is already gone.
+ */
+__noinline int exception_cb_stack(u64 cookie)
+{
+	volatile u64 val = 0xdead;
+
+	bpf_probe_read_kernel((void *)&val, sizeof(val), &exception_cb_stack_src);
+	return val;
+}
+
+/* Throws from a subprogram that has a stack of its own. */
+__noinline static int throwing_subprog_stack(struct __sk_buff *ctx)
+{
+	volatile u64 pad[4] = {};
+
+	bpf_throw(pad[0]);
+	return 0;
+}
+
+SEC("tc")
+__exception_cb(exception_cb_stack)
+int exception_throw_subprog_stack_cb(struct __sk_buff *ctx)
+{
+	return throwing_subprog_stack(ctx);
+}
+
 __noinline int assert_nz_gfunc(u64 c)
 {
 	volatile u64 cookie = c;
-- 
2.53.0

