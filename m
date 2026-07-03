Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776F13164C7
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Jul 2026 03:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783050725; cv=none; b=q1vsK4ea7P+boaI9RzfiQ5Hpub8rE267GOeYxP13heovXFcG/zY64V6MNADRHEFGvY9tQ2vHqtO93nVxcYYti3B3UiVGShidQj0pBTaK3KrdsQEfAb3O9kPib+tdNCZPLeiOzpepj+eW6WRcrgkvOonms07MN8ij4K6TwbwbSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783050725; c=relaxed/simple;
	bh=n9otxYLLiVUCiF0NwBWC80h7o2RKMS08s81YRFvEbGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qmr/EcbyoxzeSo7A4A5AaAjZKwhe1/nJ5kjFCfVpZirTAZVnDgyyQiXt59UHGBIxGFjPyMPiKTxDVgA7cDTRvgiTZdWD8FyADhhefnrHALM0dGEQJiN+9OpHDbOqvZDK23j5Ul2GgrzzPSMeNUcylQtKuuZ5cXJXx92UdYQdflw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBULXGrH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBULXGrH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c7c61b5292so1521935ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783050713; x=1783655513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=irOx4um9SxVnPfyQhReoF+nfX6PSfywyMAlSD0zArHg=;
        b=EBULXGrHQOdatlJZ2pVyQERbi8gAUzgYotR+3WB1dxaFC1KToZ7iOHiykVXOw7fUhe
         SNCYWjJlMpS5FkvHeIWxRio51Z7wNhXENlSoRDmnxxL3tzOr2pGt+Rts7r8yB/LxQNjK
         0O8QofLWBTzwuLO1njRW2JylNnZW1bOAWUw54ieXrOM9CRiIWIbaLCz+wE9t2Gj858sV
         hwg4Yi0C13YC5Jq1q1ZLVgVoPPx9MzybPvdBMTXdd5GE+kGGGb4DDeRPPTTk9svanW52
         wtTKzvonds3q4vZKbLVZcg+ugH35Cbu2X2Lpo8jbu768RAoRFXdZ2h8Pugxaj5xk2jtB
         dtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783050713; x=1783655513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irOx4um9SxVnPfyQhReoF+nfX6PSfywyMAlSD0zArHg=;
        b=O4kREP/30TqSlLQ48N/FUxU4IU2UXgzHZkfN/iz6E81FhmkfKNOFNzKhq7di4KPb6B
         NnYU6ZYqj3E+xq/1wj5SIVubNHR6WDth7M57IArhy54lNlSzmy5uCDUbDeUwMgz/TrA/
         lZM6vMXQOTXvxeZghI5Uv89ejemJNruFP3XeTJZ4XBSDP9khHznmpyQzQ6YkrPHaHtZo
         gtitCioVV9RUICEmL8Zl7mobmFPSbitIptn1o8M1itoOnEXOOkZVMwcqi9WFkdmc4Rpl
         MJbRas8zBiJAP5A2u0uZtMQBK64PH3Aka2Wfz9C8GcLJUAZaCNpI5I0oMuGNoGYWRqJc
         N8dA==
X-Forwarded-Encrypted: i=1; AHgh+RrRrpLGYdZdd22fkKP/EDYLt+1hOGWpGA73rP718/S5A4m322jFqWhyQEmBTomCoVwKvDceFtQ2r3OFKiyDjl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYYzCp9ijxiGkczVAyEqiNy9OfBcdvaNohDOpxOhf4mAl56Tb
	81FqP6/jOZN4H9WBFLnGSlc3q36rCv4J4SjYaJfH3+Dr5kjUDaSsitUc
X-Gm-Gg: AfdE7cl7nsYn5asskZZQ/nZjGW9kKvs1qdv013JbVKP+nxAIUKKXjLkAPIg/lvC+Xd2
	OPJKVHHZFWSWeHnmRfSeukmhYghXJa2rWTCIWdN59XG084RygNjgnXEVUx/yWJQnDadPeo45Iq1
	SwbPCgGAqgWIvjcR6J+WO6XeZpuIqIdI4OILXq4iliE0IXMASWt5xqMbnUE1Jc+KYyF4UcZSIFs
	K5HQVqqk993pa6iDG/qaV7ihmcA46nkUIfRiz+R5EbSeLptGaAjGBAHavCAaaZ0jA99aE/rpelR
	lc2n71Tcvbi7McO4wlDimp67uhgIlMQ/OO2pnOsbXHWE1qnFUaPokpay3W8zha0h2ISnwCUYt22
	h2uLMncZ9H5z6u+z8NRHqMNS67Nl/O+sbahd8pT6yHjV6pv9FkECEQoRTxFBqy2/HAQsfNUV+H8
	w+1kzpXESwdcChzrLTXaecaMJRpvwzkqJCLnt49jDNQ94mWMbOauXgbEOy5QIl2k4tHGf+SeA35
	OgcUCTF2HVX3FIUHiSCuhRjbA==
X-Received: by 2002:a17:903:2411:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2ca911de5d0mr82443825ad.23.1783050712813;
        Thu, 02 Jul 2026 20:51:52 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([24.4.24.156])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm22506479c88.10.2026.07.02.20.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:51:52 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org,
	mmullins@fb.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf] bpf: Reject negative const offsets for buffer pointers
Date: Thu,  2 Jul 2026 20:51:37 -0700
Message-ID: <20260703035137.109608-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The verifier rejects variable offsets for PTR_TO_TP_BUFFER and PTR_TO_BUF
accesses, but it currently accepts a constant negative offset produced by
pointer arithmetic.

For example, a raw tracepoint writable program can load ctx[0] as a
PTR_TO_TP_BUFFER, move it by -8, and then read from the adjusted pointer.
The register is still tracked as tp_buffer(imm=-8), but the access is
before the tracepoint writable buffer base and should be rejected.

Check the signed effective buffer offset before updating max_tp_access or
other buffer max access accounting. Reject negative effective offsets and
use the checked end offset for max access accounting.

Add a verifier test that rejects a raw tracepoint writable program using a
negative constant offset.

Fixes: 9df1c28bb752 ("bpf: add writable context for raw tracepoints")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/verifier.c                         | 41 ++++++++++++++++---
 .../bpf/progs/verifier_raw_tp_writable.c      | 16 ++++++++
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 21a365d436a5..421ca118fcbf 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5326,14 +5326,18 @@ static int check_max_stack_depth(struct bpf_verifier_env *env)
 static int __check_buffer_access(struct bpf_verifier_env *env,
 				 const char *buf_info,
 				 const struct bpf_reg_state *reg,
-				 argno_t argno, int off, int size)
+				 argno_t argno, int off, int size,
+				 u32 *access_end)
 {
+	s64 start, var_off;
+
 	if (off < 0) {
 		verbose(env,
 			"%s invalid %s buffer access: off=%d, size=%d\n",
 			reg_arg_name(env, argno), buf_info, off, size);
 		return -EACCES;
 	}
+
 	if (!tnum_is_const(reg->var_off)) {
 		char tn_buf[48];
 
@@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_verifier_env *env,
 		return -EACCES;
 	}
 
+	var_off = (s64)reg->var_off.value;
+	if (check_add_overflow(var_off, (s64)off, &start)) {
+		verbose(env,
+			"%s invalid %s buffer access: off=%d, var_off=%lld\n",
+			reg_arg_name(env, argno), buf_info, off, var_off);
+		return -EACCES;
+	}
+
+	if (start < 0) {
+		verbose(env,
+			"%s invalid negative %s buffer offset: off=%d, var_off=%lld\n",
+			reg_arg_name(env, argno), buf_info, off, var_off);
+		return -EACCES;
+	}
+
+	if (start > U32_MAX || size < 0 ||
+	    check_add_overflow((u32)start, (u32)size, access_end)) {
+		verbose(env,
+			"%s invalid %s buffer access: off=%lld, size=%d\n",
+			reg_arg_name(env, argno), buf_info, start, size);
+		return -EACCES;
+	}
+
 	return 0;
 }
 
@@ -5351,13 +5378,15 @@ static int check_tp_buffer_access(struct bpf_verifier_env *env,
 				  const struct bpf_reg_state *reg,
 				  argno_t argno, int off, int size)
 {
+	u32 access_end;
 	int err;
 
-	err = __check_buffer_access(env, "tracepoint", reg, argno, off, size);
+	err = __check_buffer_access(env, "tracepoint", reg, argno, off, size,
+				    &access_end);
 	if (err)
 		return err;
 
-	env->prog->aux->max_tp_access = max(reg->var_off.value + off + size,
+	env->prog->aux->max_tp_access = max(access_end,
 					    env->prog->aux->max_tp_access);
 
 	return 0;
@@ -5370,13 +5399,15 @@ static int check_buffer_access(struct bpf_verifier_env *env,
 			       u32 *max_access)
 {
 	const char *buf_info = type_is_rdonly_mem(reg->type) ? "rdonly" : "rdwr";
+	u32 access_end;
 	int err;
 
-	err = __check_buffer_access(env, buf_info, reg, argno, off, size);
+	err = __check_buffer_access(env, buf_info, reg, argno, off, size,
+				    &access_end);
 	if (err)
 		return err;
 
-	*max_access = max(reg->var_off.value + off + size, *max_access);
+	*max_access = max(access_end, *max_access);
 
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c b/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
index 14a0172e2141..4055a6443bc2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
+++ b/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
@@ -47,4 +47,20 @@ l0_%=:	/* shift the buffer pointer to a variable location */\
 	: __clobber_all);
 }
 
+SEC("raw_tracepoint.w")
+__description("raw_tracepoint_writable: reject negative const offset")
+__failure
+__msg("invalid negative tracepoint buffer offset")
+__naked void tracepoint_writable_reject_negative_const_offset(void)
+{
+	asm volatile ("					\
+	r6 = *(u64 *)(r1 + 0);				\
+	r6 += -8;					\
+	r0 = *(u64 *)(r6 + 0);				\
+	exit;						\
+"	:
+	:
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.43.0

