Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7D43F4A7
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021952; cv=none; b=GMhh/cTEQgdsx1SqislpOEEj9ZMBgsilLdQfVwsD75CLyqoxCjf5Ir9kKk7rBri5IttquWwYaMqBU+FdqFI/fxe9OXkeggpJIcwofnOLQv2mXs/ML8qHTlqm/V8q9f0WC20CRs6oXhpzUF1pJ1eH+HQw0iPsCha7DNL9MSjre+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021952; c=relaxed/simple;
	bh=mfnEbSScsujRwoxasSxyWdhvlmzfSWWEe+mMVO63fwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tu5lIysYxW3ChiLTxCO2RZQ0KkhcoA+thVx/yJaFt3t6k5jVmdWCgfDrq+cgl7rdFkzttpvxvzBAQzWJCA1/1JT4CYCokosAwN7LJIPQAHvJ4xeu2fzTEW0D22uWM+8iAwVwJKRDyiNNYy/xMYgnNnH+owWxY48dfUabUG7UF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ajw33idr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ajw33idr"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51bfa429aa6so4879101cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784021950; x=1784626750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wL+dQXVVG1jrwdjXyQWY9fUn4W24MWcB/WCkDuLFzik=;
        b=Ajw33idrKx2wBknLRObepsEF2PyiQ5p/GpEFEudsDvoqMAiujy5gWefUB/St074/X5
         9rF0RzZy2qCl3dlktddBqoI0e0kSXOPtrEVLuaNQef+p48ZMm+Xm3MFN+bnzsZcrbUXu
         EQFPC2uE5kotDPwJOmjPM3ieuaHpW198N9d4YM+59/JgRBVtShihMyMq033aMDBAX/0a
         pFobB7xmEetSo2Eb6iUkfLMkXyzF4tSCejdJXhEWGqvVGpLhXcqwZstXvhIJcIRelAK8
         9kdVdYq0aa/QQNX1Bw2fI+rcTbnf/WenW30eRlQcqgPJWvhDeTS2cniXfepkKsj4U8EY
         G0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021950; x=1784626750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wL+dQXVVG1jrwdjXyQWY9fUn4W24MWcB/WCkDuLFzik=;
        b=n+4W0DhaRkz7rgRuaZnSMk/B6SorR5jPsMrN9shMqPr1dJuBYOCCxAPzuzQtQ/QXn0
         ko5H2uIB/KNeskAnnWVOKFR/2Q82BoX0tjYZUhly2jHW/ONhjuNfjND6EHFHvbPmHnaB
         eHro/Z3DbmJzd6teTiRDs5N033kwWSu2opC9zDjbbR8Wefj2CAhmmfut3HaIRZOuUSGE
         A3EcigwS7q8Aifq4fbboFwfQVc2lVTj+V6iwIoHDTdUOES5p07QG57WPWI8Yzp6b8dFi
         Ido0NuY5gEYVK+G8tlfKOnHpOiKZm5S+WWXbwjbHRmsSVzYiEnq9qA0psr6sIRxTtiv8
         KJcA==
X-Forwarded-Encrypted: i=1; AHgh+RrSJ2tUcdmCrVQqePwG8OTteJcetk5Nt9oBzDGgtRGAJG5dRjX979/co7a8eiUsq/ADkEoU2CgsRmpLeVOUjao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLoW0a0bvIVJvmx5lD2/efq+v1zYBjhpmf0ygtxs6qfDkj/Ez6
	iJVdhiHpkdiKV0CH/21pAMUuHkfL9rkVQ6OYjJT968YhDLKyuCUZBaFx
X-Gm-Gg: AfdE7cliUqQlQW7ScgRxccaw1dJ4BJZhGmTy7zemg2dDnysT/fI2iWpz8dsj4HjWAfx
	238H/wLm/epxiukE1DQe6w451TsRi3qDwl0SDrd4bFPJP4n3RDFRQibBZIOHzyG33XUyagFrc5t
	MC72mjG7fHrd+pZL7tKTIICQ2BB5QQa72H2x8C+2F73DPZE9uYaFKlP7DEWajSAXvy4d6lDnJO0
	D7/y4Sj/ir5OAFfuiF5KXl6sv1Pj89p1O+RV9WVr1hgCTUW4TYIsGhSaLAFy9Nc/tan8083qIl/
	GnfFHn+gaFz9hHT6atWIy5i0uHjjzxHaTRCx49Ro1fdqpXsgw+Ro/0w9JTsp5gUk5zysCbtzkV6
	8z4vnC8Qbm2lKZA+DVNEWcEFPOXOFhJs3Iix4O+6ZFV+zXNcs1I/ufL6a7Kdpn6ohJMOV4xLaSi
	G8T6wwgAjlhY19MWMeKLuHZ/TfKu4vXtSSELnyjO2JGQlwMntd87ZS6PGVnL2Xz1efCVsgmWA9
X-Received: by 2002:a05:622a:1e07:b0:51c:4f35:81b8 with SMTP id d75a77b69052e-51cbf73e524mr120889981cf.7.1784021949680;
        Tue, 14 Jul 2026 02:39:09 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacf2a75sm111460511cf.13.2026.07.14.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:39:09 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Matt Mullins <mmullins@mmlx.us>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH bpf v5 1/2] bpf: Reject negative const offsets for buffer pointers
Date: Tue, 14 Jul 2026 02:38:45 -0700
Message-ID: <20260714093846.18159-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714093846.18159-1-sun.jian.kdev@gmail.com>
References: <20260714093846.18159-1-sun.jian.kdev@gmail.com>
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

Commit 022ac0750883 ("bpf: use reg->var_off instead of reg->off for
pointers") moved constant pointer offsets from reg->off to reg->var_off.
However, __check_buffer_access() continued to check only the instruction
offset. An access with reg->var_off equal to -8 and an instruction offset
of zero therefore passes verification.

For writable raw tracepoints, the access end is also calculated from the
unsigned reg->var_off.value. An eight-byte access starting at -8 wraps
the calculated end to zero, allowing the program to load and attach
without increasing max_tp_access.

After ensuring that reg->var_off is constant, calculate the effective
access start using signed arithmetic and reject it when it is negative.
Use the validated start to calculate the access end for both
PTR_TO_TP_BUFFER and PTR_TO_BUF.

Fixes: 022ac0750883 ("bpf: use reg->var_off instead of reg->off for pointers")
Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: stable@vger.kernel.org # 5.2.0
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/bpf/verifier.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 6515d4d3c003..9f1333676365 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5326,14 +5326,11 @@ static int check_max_stack_depth(struct bpf_verifier_env *env)
 static int __check_buffer_access(struct bpf_verifier_env *env,
 				 const char *buf_info,
 				 const struct bpf_reg_state *reg,
-				 argno_t argno, int off, int size)
+				 argno_t argno, int off, int size,
+				 u32 *access_end)
 {
-	if (off < 0) {
-		verbose(env,
-			"%s invalid %s buffer access: off=%d, size=%d\n",
-			reg_arg_name(env, argno), buf_info, off, size);
-		return -EACCES;
-	}
+	s64 start;
+
 	if (!tnum_is_const(reg->var_off)) {
 		char tn_buf[48];
 
@@ -5344,6 +5341,15 @@ static int __check_buffer_access(struct bpf_verifier_env *env,
 		return -EACCES;
 	}
 
+	start = (s64)reg->var_off.value + off;
+	if (start < 0) {
+		verbose(env,
+			"%s invalid negative %s buffer offset: off=%d, var_off=%lld\n",
+			reg_arg_name(env, argno), buf_info, off, (s64)reg->var_off.value);
+		return -EACCES;
+	}
+
+	*access_end = start + size;
 	return 0;
 }
 
@@ -5351,14 +5357,14 @@ static int check_tp_buffer_access(struct bpf_verifier_env *env,
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
@@ -5370,13 +5376,14 @@ static int check_buffer_access(struct bpf_verifier_env *env,
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

