Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47656217F27
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404510; cv=none; b=bJbn9fvJA1FD1UOgWL/OeifdzksH/FqhVu8O8t1PTWWpSfi26vqE4IWsKTHbSMWgz5ZBEjm3KxCzELTu0bD1G2x8a3KK1uLMk29tOZ/5BkrPROEpYkfBOrVcCOze3DqZ7t/QpDbDXIkLrYCl9b2MCEKj4qfQzweDg8dvDI9zEog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404510; c=relaxed/simple;
	bh=zMs7nSz36jZxUeTahMo0usqAkAszaWwPA1Hx749fPe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJT9brdyoR5MkkX5/KSkYVIdNjXXwTiFQ+bXikUfUyDsssMQDbYgWov1naYNxeKij9J6I5G8ySTmBUxveriBJkSzOD+ybl/Lt2uHMIxiYTwA6ZpYof8VOZVM8T2msqDb5Abq53zA1+iP/jAHjs1Dy5D/Qe/Cgl6pJppx+kOWS5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRsg5RsU; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRsg5RsU"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c96cb024ee0so2660892a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 23:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783404508; x=1784009308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpg9LG+O76eplxZLK8lJGM9FCJbB7J7EQAwbljKS/SQ=;
        b=MRsg5RsUjzCkDOHjgzJS6q+dooiX9Rn1pbwRAkk4AQV94Lk5PoMpR3nXGGsFoHnZR+
         BJw0BwlnE5b5wzeGQuzJYuza/V16UXlhY5OPL+JEKYP6JwNfQkuNL+a9Uw5+GMJ60az0
         d6zzpzfgxDpKqXX8nnQxSwnbDfCnzkevrkWdheQ54OuMN1ptAuqg+0i3mFz3wEfK7VEv
         oeP1YqNd1B1vDIDJYcrax20y1IA9qniDpJw+Smt3wJhw+qQpIHUM39L9UMTtzOOu4dvK
         hjT/hihrVujrgQsz9YtQ37L7lefPBGhOfmM1vlPeBi/0YjpM3o1Kk2lN9BCOUHLk36xE
         xNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783404508; x=1784009308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpg9LG+O76eplxZLK8lJGM9FCJbB7J7EQAwbljKS/SQ=;
        b=NiM90NOTIBZv9lHrRVxi/zLTTuEPN0pevxNmLW57W1uQxYl+9X1Hn1LVDQMKtxbelr
         LnZhHXwC4jI0QNvtxr2sI2/Y0kbYpqB5vm/5XvpIeEqCmUnieH4eOckt86z4nTkopTs6
         n3GkqUCOtVkHDJANB3UuJoCYQtE4yDNTcfQC4pPPpneIRL85ES764HHa0Zmnc6aOIsAO
         kts6sGeKtH0ESOTKMxEwf+pkG4PMl4C6vIxnaakG+ovJ+HeVowyg62rY+dlnF73K3INW
         0TzqJHDJZEYpl6iXzcMdQOdB/XyfXkqMCPWU81AZeQYaMBhAuLUCSKO2Yj/nZYkRG8a2
         0aCw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9rt7I/FcITRXT5ik75yL8f4nNofEEqY8O12CpNOojk5NpNO6zNk89K/7VVKYlzszDgljUJeooOmn7ES60rF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaaLAQtbUtwlPkbMpAc/y0jqa95IrHpMtgbhB3pRsZ4poWx+Y
	8a0XPta1bYMCQWRFj5qsvw2GqLZIWvKxl9Mmf4L3pxVnkqtmeIa8EP9R
X-Gm-Gg: AfdE7cmBx0EEPC3UoHu8AGNSqBhUBmGASlVW0J7qNPOCFIN+a3wsWe6gHwDq+wR77cR
	9fQnc9Zju09dxUZPWQRs84HDbCFz15DoBbDNoOBK/UhkxF1YFCCdBKPX5FA+31duktPCKv1VKnM
	A2Oh2OZu6WpjC3u6puC4MphAcUZ4NP2SwioHGJQVA9vdnSW415g3MmPanE2DVgZyKP4U3UYApLM
	pkqF5bRQ/hWZMYDma/Cm39tKaBRtZd17ip9y9ZSSEgV5xBxTocVm0mUoJu8mvsgGszWvLW2j2gw
	Mr9H6clnxpLGf92mZyD0DlvPLEMxOyRt4cl9EC1GrwKhUo1718rkR9cBm04LHouJKCBknWl8VoY
	ugEmicEregX9Nw5JpBiQaXc9FYIGfzjGlSWsJNry7tRQIOQn+EJXj4Bm0iP/duZGRXOLcu/BiJ1
	UoahT/1/y8fmtC7z8PTCpdfJtXEjGmRf2kOGXFenqci485OKiciLcsS+X3rgKltbrTeWmZ/Pl4r
	qdP1TPsaCZeme1wTXJA0JN1U5aEhbVreA==
X-Received: by 2002:a05:6300:618d:b0:3bf:a698:ce4c with SMTP id adf61e73a8af0-3c08f001b9fmr4812556637.58.1783404508412;
        Mon, 06 Jul 2026 23:08:28 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.tailf6b5e0.ts.net ([24.4.24.156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm4101507eec.4.2026.07.06.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:08:27 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] bpf: Reject negative const offsets for buffer pointers
Date: Mon,  6 Jul 2026 23:08:03 -0700
Message-ID: <20260707060804.93561-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707060804.93561-1-sun.jian.kdev@gmail.com>
References: <20260707060804.93561-1-sun.jian.kdev@gmail.com>
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
PTR_TO_TP_BUFFER, move it by -8, and then access the adjusted pointer.
The access is before the tracepoint writable buffer base and should be
rejected.

Compute the signed effective buffer offset before updating max access
accounting. Reject negative effective offsets and use the checked access
end for max_tp_access and other buffer max access accounting.

Fixes: 9df1c28bb752 ("bpf: add writable context for raw tracepoints")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/verifier.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 21a365d436a5..b4ed6d519630 100644
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
 
@@ -5351,14 +5378,14 @@ static int check_tp_buffer_access(struct bpf_verifier_env *env,
 				  const struct bpf_reg_state *reg,
 				  argno_t argno, int off, int size)
 {
+	u32 access_end;
 	int err;
 
-	err = __check_buffer_access(env, "tracepoint", reg, argno, off, size);
+	err = __check_buffer_access(env, "tracepoint", reg, argno, off, size, &access_end);
 	if (err)
 		return err;
 
-	env->prog->aux->max_tp_access = max(reg->var_off.value + off + size,
-					    env->prog->aux->max_tp_access);
+	env->prog->aux->max_tp_access = max(access_end, env->prog->aux->max_tp_access);
 
 	return 0;
 }
@@ -5370,13 +5397,14 @@ static int check_buffer_access(struct bpf_verifier_env *env,
 			       u32 *max_access)
 {
 	const char *buf_info = type_is_rdonly_mem(reg->type) ? "rdonly" : "rdwr";
+	u32 access_end;
 	int err;
 
-	err = __check_buffer_access(env, buf_info, reg, argno, off, size);
+	err = __check_buffer_access(env, buf_info, reg, argno, off, size, &access_end);
 	if (err)
 		return err;
 
-	*max_access = max(reg->var_off.value + off + size, *max_access);
+	*max_access = max(access_end, *max_access);
 
 	return 0;
 }
-- 
2.43.0

