Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F569315D33
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946024; cv=none; b=K2RcaUlzNFf6lVxJR9fgR6NPl3A0bq/TJRVHdV0s25p2fhg9IyWfd9pXV4U1hAgswkae0lYyFXi3ALAs/cpRzjyTHQDEjFFCPFy25Mm/NG/Ys4VFnB2Dt6tlxNjY74nLFIaGdF30a8yjUaY7oJy/Bgrg3d7pMtrvz+FDfFrdyuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946024; c=relaxed/simple;
	bh=BME0mcse/2cL4aD8NNnE58IwHey6vdaf0KgJLaRCaLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCH1IphhnsD5fygkaluovs/Mi7/B064ngVIWbvN4D60hUJS0QP1irIcj6+mYa9fYDxyApL8TnHf7u/gjM462jmVqKCwHW3BkCVwKIPWsDEM+CzVKo8lrmj3D1+/8K7V+odedPONC1qGJGzjI5az0N0hVDQpfq4lUiYxYi+OiTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDZe9qnK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDZe9qnK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so2609019a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 22:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946020; x=1780550820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCcNiDXdQEqR3ER2Fj1mnGxx4mfjr4kOZtzyjsTx4OA=;
        b=DDZe9qnK0GECMHdXkYoqi6a3ROOX0tSFkZjkUKNZGWE4qPqGsJ4unSJrXdubeb2o63
         Us/AIm4SBea0XQFfEso3Jh8oBTnhKduIIKJlDvNcPK+oJonPh5PEWzaQezkes2k5u7MV
         9cRkCXMCUgpcXAExSS5KK3G7ZruhwLi7N9lzZwToTLKswh/HG/CC3+MlPBo/AsItsJeI
         kfHiT69G8BTEneoQCFfWTcjZ5+YImlVMYIjh0qWmyiWm4ZPjOxw41so3djP9jCbnjfjh
         wmQqqAgNEhso91zC1YlDkoHc6cpj2C9wuhv0ftMA+lJPDOtnHbjvnQz1+cH6nh8rh/3u
         TS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946020; x=1780550820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCcNiDXdQEqR3ER2Fj1mnGxx4mfjr4kOZtzyjsTx4OA=;
        b=P2PUFwnDVz6V+CBP1wuMEXl+oaNW7wSXjikcrRfhSOQyH0CUPFZrjvhddFbK9la4NL
         lZZ0MagB8H5k09cW51VVNSTcfTHyNPHD/QdalFQ7OM4SBQzZKEgG34xvBxAwal7/r0qy
         NCVXmUTAENV9UjBP5A15NMGCsdm7sFauBN8tpqIS7w+bgFYJOEZpgpQWDy+TJxL/C51F
         XbUNFKRtRfdOL/qDz9xEnnnAI6aGQ8h1KCx6mdNAT15wYGJBrtsHibFmlNXOmlisKdE1
         Ya020am+vZkv3GXAWNUzfrOL2alDJlsxUF+wwO6WFzL09bkKb3WeoM+5ekjXBzVVRxaE
         5edw==
X-Forwarded-Encrypted: i=1; AFNElJ/vPGEPMC5reccFeu0OJDkB0H5wQeJEru4P767ISL0o8t8+Dvwo2ls8yAXSsTGCXzSADMXr6sHgIIxx0pJtZR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDD3lilF/SAPp1aQER+djbifuQcuu0JN6Xu7ulfAVFftRn7j7
	JC5X5RXr+ub+xYKyKxFSWPsMNXhym+Agdzwr6DaS5etwH2Q3MaMe5hMM
X-Gm-Gg: Acq92OFIeUd7yFrwLgL+onKBF3gODvTq8H24LIBQspa5WnVm8dj4itx23z0i7VGVfCp
	mtV5aK6mvcDCQoIOh0uqx+0jLNsnbmuTZ+Uko93Rz88H3ywcZ6LkSSLvR+VeO4pkf0Cm0bZo0X2
	+5BJHUU66HArZrpy6ArcI/RBGftsTi4rfj8op/B0+vr6b8MAsPM4u/43JiIO/0hL629xcbqAQQm
	lTOOFFzb2QMmy92hwz0zrNixPvqaRUKnQ/UvLEYEzrJuV4Ju2U7UW6HZWZV1W8jzokNbZFugIQj
	n9Hwl6XniOJ9iAD2sHMCf9byZsH+mrr95ziokeD9ep0cs4RkFvJDAvbw6lSMGMusp2catHY71C8
	PDRD6YPD53LmapAOxCknyE8f8/zIYnCtGH+dtcm9c2eVJ/r1j3qX1fBxx86f8dOMljd24lxBQCB
	someaFkcxnDlj7k5M+TpgcPdDuzb04Z13twBqArD7I8SkHw21dh4qAxw==
X-Received: by 2002:a17:903:1b28:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2beb05d366amr303009205ad.26.1779946020423;
        Wed, 27 May 2026 22:27:00 -0700 (PDT)
Received: from foxirain.tailf10b76.ts.net ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c7046sm172642695ad.57.2026.05.27.22.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:26:59 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH v2 1/1] bpf: reject overlarge global subprog argument sizes
Date: Thu, 28 May 2026 14:25:33 +0900
Message-ID: <20260528052533.3940181-2-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528052533.3940181-1-hataegu0826@gmail.com>
References: <20260527052539.3388700-1-hataegu0826@gmail.com>
 <20260528052533.3940181-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Global subprogram argument checking derives generic pointer sizes from BTF
and passes the resolved size to check_mem_reg() as a u32. The access-size
validation path then uses a signed int, and stack pointers negate the value
before calling check_helper_mem_access().

This creates a wrap when BTF describes a pointee size larger than S32_MAX.
For example, a global subprogram argument of type:

  int (*p)[0x3fffffff]

has a BTF-resolved pointee size of 0xfffffffc bytes. At a call site the
caller can pass a pointer to a 4-byte stack slot at fp-4. The current
PTR_TO_STACK path computes:

  size = -(int)mem_size

so 0xfffffffc becomes -4 as a signed int and the negation validates only
a 4-byte stack range. That range is covered by the caller's stack slot,
so the call is accepted.

The callee is then verified independently with R1 as PTR_TO_MEM and
mem_size 0xfffffffc. A small instruction such as:

  r0 = *(u32 *)(r1 + 4)

is accepted as being inside that BTF-described memory region. At run time,
however, the actual argument value is still fp-4, so r1 + 4 addresses fp+0,
outside the 4-byte object that the caller provided.

Reject sizes that cannot be represented by the verifier's signed
access-size API before the stack-specific negation. Add a verifier
regression test for the oversized BTF argument.

Fixes: 2cb27158adb3 ("bpf: poison dead stack slots")
Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
---
 kernel/bpf/verifier.c                           |  5 +++++
 .../bpf/progs/verifier_global_subprogs.c        | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 7fb88e1cd7c4..caa5a6323810 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7107,6 +7107,11 @@ static int check_mem_reg(struct bpf_verifier_env *env, struct bpf_reg_state *reg
 	struct bpf_reg_state saved_reg;
 	int err;
 
+	if (mem_size > S32_MAX) {
+		verbose(env, "R%d memory size %u is too large\n", regno, mem_size);
+		return -EACCES;
+	}
+
 	if (bpf_register_is_null(reg))
 		return 0;
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
index 1e08aff7532e..0ff8f85b4d46 100644
--- a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
+++ b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
@@ -151,6 +151,23 @@ int anon_user_mem_valid(void *ctx)
 	return subprog_user_anon_mem(&t);
 }
 
+__noinline __weak int subprog_user_anon_mem_huge(int (*p)[0x3fffffff])
+{
+	return p ? (*p)[1] : 0;
+}
+
+SEC("?tracepoint")
+__failure __log_level(2)
+__msg("R1 memory size 4294967292 is too large")
+int anon_user_mem_huge_size_invalid(void *ctx)
+{
+	int (*p)[0x3fffffff];
+	int tiny = 42;
+
+	p = (void *)&tiny;
+	return subprog_user_anon_mem_huge(p) + tiny;
+}
+
 __noinline __weak int subprog_nonnull_ptr_good(int *p1 __arg_nonnull, int *p2 __arg_nonnull)
 {
 	return (*p1) * (*p2); /* good, no need for NULL checks */
-- 
2.43.0

