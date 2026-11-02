Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623045;
	b=rw8iia0PEPAfOmlbs4Dwmt1MIFeHM+/DSoJcahdw0olDLCuw6w0/NmwzB7dyCucqo+nn
	 ZZTDTuazURAwXWThoOiOR2aqXfxc+RZcQ8sJmH7dCIKiuw6A0/tZ1FKXwxG07lrM48/PX
	 WjQiy8pA9/n/1mosXqo6e2Hk6/dBMJfQPmpzetE9WykOHuxgDj7ja8jY4lMFECrmOj0pI
	 EXnW0M+lRk7VSVV9H9ETUqCZqdHNc1KBqxi3G31AILZ9ZwMIYhc7C454YUVNDavnZ7+3v
	 rGRZk1tHhlfZuKgdB0jR4ScqaZT9AEjrjNV63wl7kwsju+6sKPxexi9aFJ6ZLA678mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
	b=IOuzpuUMubUHBz+13QLH9oBJ+q5W7bi9Z/ska0EyMrX68r1JbcGMfUxsTCgOguxmthKs
	 g0JlqrGjdHU5ZVCHPGbwd1Y2tYcwsaNV5vRMRFMrAgVCZusOyoQhLPF6shWnfCV+nJDrK
	 FmYXYv8/Bg8n8MieMdpmyOW6JLu8HOSjxfuQ0JQdKEIJDceUB+Pc0/1AUbkU+ctSdGUNm
	 NCSioA57yHt3khmlbAFsw/MJfEjSy4r/FWq0nYwFbALzcV1wLQZ8n0tFcQ0M5EzTUynLA
	 Q8FEJ53dOJ4IhIUgHJQGP/66PdcsnYYtOY0SNhlStGya6fB7EEcUE4YViqZqzAoSZrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOoSOkIu;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C10606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOoSOkIu
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so5404677c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623044; x=1794227844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
        b=GOoSOkIuby+zJ+pcXZDwDkR/Nxf9MBeqs/4E1GhaH0/jXxzlb1TOan8oTVifidcaD4
         20IQiOHxKTyNlO1vLS2jf4UCq0esA9+3smJJX824cnVNTgTVW6Z7riIFdCW6fq/44sTd
         NRIqrG9j9aMuDD/rdYH1NvHifYY2Glsh7UmhK4s5vpqEK6WbEg9XXdLqiioiNeaFGAIJ
         S6GgXgkSFha5wibG7ycUOTuZ0BwCxt07FTOwakhHFyJxzzmXaaZKF4k29n38IVTm+FnB
         YkLT7u58R3zKGSCMFRDbGR3fX+LUWd2UHPMC6ESCvhHHQm527TrBDQPDGE5aOC0mXzCl
         ysQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623044; x=1794227844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yGgdG3MuTUgBN2IlwGn1nZkRcdu7c0DJVMNgsIQLTs=;
        b=cLO5m5vDqbXvaBVVpTJRNtCYgDvUkJUfOCJbQYTcQ5gnbZr5WbkFddIRmEGZFekLq1
         O5QXWGL7x3XatLiekcUU/YL/SOg4OY+mV5Ljt/x5SbZzzYQeGakIqey1hzp5IqWIrZxU
         Ev5HX+8fb67+Rwz8JAAJSEiPEqTzg0OT1UXYmm5fZ2paxEHwkZTgmeN0wZmB6v1xf5lS
         IJK4cZI08kMIeEvRGV4OdlgufY9lDz20jkqlNiESiSNegdNWZsLz68BTGMK86O+rpxba
         qRbUzDSN/SYNxwtBoBxTvKoaNqVqI0ZUi1hYigLk58ujaHw93UawH2F+9HovpGh0wxA8
         yWQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWi7H00Fpu7ayyq2i8h2doC6aRgem5q+70/L5cTrijKE6UBCp39svIVfVy8vh0J10cxOisS+CWy2RF8mAxpz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTlDTqPS4K1OWIGHfN5ApJfbHXaZn+tEbmjq76e+MNTtP8SlwP
	fQp5l69LMaGvUjETgFyrt3HchxeeOT/TwXNU6Eo3bJmisddLmuHqmyd6
X-Gm-Gg: AYBFou0LzKalpP8b8c11KI+aS2XVmyYxD/wSgXfLqNeyIMew5xMY0vQ0qTal4heZ1xW
	qUq6djOMcOf7msgeGrQoM4VcPcY3TCuztXq+3FuX9vmdqlgni1Ej4sqIfYS7LtMJhUMcI69NZ6Y
	B/BXRsWoS0QWd+LhXSERUMpP2p6U1X461PbrmAVt8Iubi+Jr1aoMTZ1PJNRCgxRTr4/AftVtJWt
	/GnqsscVym9tO6797HcQ9SiVRHHOkC1dgF/1tgToYCD56pTDgres9hwJicYc4T2tlODpKAONE6c
	m5XBrSIGg1ddZ62astqSYWE8FAgwlQPDxDd8rpIkU9/AWMAUirsKP4QVk9bTofO/utPQz6P6o+8
	Qnect3ZHR2ThHG7cgojtCnfCt9igNgp2rA8ssFEqF4OZVoX14kzWrBIM8IHwFluYEO1Ar9cDcTV
	G0U4ccf7EeiSNDfYdS7symnGfQAP05Bw+OEc7rFKCrdC3ckgH8L/QLWRKq+zVQX5dH8FHi109Lu
	+jGQbqMoeDK+Oy9eNsYqj7vD21lzBKSKhy1PbFEg6M++YAagSQr45EeEuvJQVR9v4UTDjTpycu0
	2BC/5pkgCQSU8aqZtk2qaJuj
X-Received: by 2002:a05:693c:41da:10b0:36a:1cc2:45d5 with SMTP id 5a478bee46e88-36a423ca2e9mr15639313eec.26.1793623043663;
        Mon, 02 Nov 2026 04:37:23 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36326095eec.6.2026.11.02.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:37:23 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:37:03 -0500
Subject: [PATCH bpf-next 3/5] bpf: Finalize the verifier log after the
 runtime is selected
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
Message-Id: <20261102-bpf-blind-nops-fixes-v1-3-844300e42cdb@gmail.com>
References: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
In-Reply-To: <20261102-bpf-blind-nops-fixes-v1-0-844300e42cdb@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luis Gerhorst <luis.gerhorst@fau.de>, 
 Henriette Herzog <henriette.herzog@rub.de>, 
 Anton Protopopov <a.s.protopopov@gmail.com>, 
 Xu Kuohai <xukuohai@huawei.com>, Hengqi Chen <hengqi.chen@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_check() finalizes the log, which reports its size in log_true_size,
and selects the runtime of the prog after that. For a prog of one
function, selecting the runtime blinds the constants.

Blinding can log "insn %d cannot be patched due to 16-bit range". The
message lands in the buffer, but log_true_size doesn't count it: with a
stats-only log, log_true_size is 219 while the log takes 264 bytes. A
caller that sizes the buffer from log_true_size loses the message.

Finalize the log after __bpf_prog_select_runtime().

Fixes: d9ef13f72711 ("bpf: Pass bpf_verifier_env to JIT")
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/verifier.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 935b163f81e4b..974dc571eff05 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -24112,11 +24112,6 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 	print_verification_stats(env);
 	env->prog->aux->verified_insns = env->insn_processed;
 
-	/* preserve original error even if log finalization is successful */
-	err = bpf_log_attr_finalize(attr_log, &env->log);
-	if (err)
-		ret = err;
-
 	if (ret)
 		goto err_release_maps;
 
@@ -24167,6 +24162,14 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr,
 	env->prog = __bpf_prog_select_runtime(env, env->prog, &ret);
 
 err_release_maps:
+	/*
+	 * Finalize the log after the runtime is selected, which blinds the
+	 * constants of a prog of one function and can log an error. Preserve
+	 * the original error even if log finalization is successful.
+	 */
+	err = bpf_log_attr_finalize(attr_log, &env->log);
+	if (err)
+		ret = err;
 	if (ret)
 		release_insn_arrays(env);
 	if (!env->prog->aux->used_maps)

-- 
2.43.0

