Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361167;
	b=J6eu4wdOx9QCNMzfrsQxRgFrtMyfdhCpQeA5L5Qt6XQnwySpjtJ0rmu/9PAys84Mu3+y
	 XnoCn2EzbdUcR4f+Ub7fd1e5YydKtSCcEb10wRrMfjhdrpYm9ySxCF6NZEeAgEVh7e9TG
	 letleRT3Lre5F3/OgaptBZ2lf/nt8F69Z+tmmXuy1WdfWq5fubpZySwXcrDzUv4lewiSB
	 6bhnHq/eX8zYPrULdodfl7U5G8YKkYz9nrOgu2AR9nSMBjAHTsbVrHjD2UITrqlM9GOVM
	 DCOZPILUv8cDX0/foBgOLPISRU+EiYmP+6S5UG65CUHY8g3fidBk9hkZ6h2pE/yPhhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
	b=G2oa4F8gC7qnyl5mNsf2hMU8yPA+YywVVy4inZq+1RZ3fhsfYM0IIor+LxuOw1HJDUlr
	 ihbEcfNaCx1ViakoI0o8r8BHIRp3In2YeAbl2eos6AdPmmeZaDdbRcGfiXpY0ZpoBQz1L
	 3lB/XXk54uGK3LKK72QIcCwDf/WwhYpGSLh3QglAPA0wDxgUfmUgzFWRv4nbGsY/KmD7j
	 5nslqPogl9OBhUMzBeMrTGPUvZ5Nwwk1Du2LZWklqBDUq7qMcqOjVIFfHW9kokM5lIjot
	 qKfc2aVJhVi7RC4tEoE8hqxlhr+s0V2wyebokan82crfP9zJ6VVlIILq9SKd5IchnNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPDkh6m+;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4C606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPDkh6m+
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18cdcfc05ffso750702c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361166; x=1793965966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
        b=YPDkh6m+oAJvbeTzt33kgmOmHciaaeSywRmJEgVL4G/ARJI6ESMCQhZmyforfI0eLE
         XmnBGIkk0YINe7wGPQ6GjT6IZ0kFw8P9s0fd3abtkw+Na1/ly6jyaNRIwKoriQ1/UnnX
         xnUaAilxXi/DMTuTL6NjRLMT4qGXZsnCpAfVZ1gl3LpHj8el4Uua6MKD1q72uVT40xNK
         JgOmVC0sADYusRbRcsZ3TL7hNlGOH/mtQJlA0SSI7+a+hNqzAyGtC20dUdX4J+sEi09u
         0CshUJo2fmklnIiSBFGsbI7erDAWWq/HeUv83aCBrXCrL/2IEvwiKxGyMmosWUHrwG7Q
         Ndyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361166; x=1793965966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLCHeRLnz6TqJOVgI/l/YrG6flGSfAttWQ6QR1FofSE=;
        b=Wm8zUqo6zDWJMt7bqgPO+I3fao52Si0+qV2QKExOd56NWXvTSPWWCT2oaSBNYD7J3E
         7z3W9k+nDPVMyccdhckKurKMPjB9gYmmYd4WDK25TvWKu0KgshXl2ATl7mzGNxUiO1Dj
         ZiKgMbuf7f9S17IW0OwSAjmzWtkjLdxeW8/jxXVRSaIhYMv2pr4iU/ZCIPxHykBwsUJ0
         fHZKeWP8/gkC803bs2A8ZlfGVm5QxkBLedurWA1R4vJZrGvZ3Qc6bCmoKcyXc7v2K00X
         GrmgGnY+m8LriO0VfEMHLU7UHdU16Lr9rEbXW3sRh/7JzT2z7foK8NpWuKcs4Z/hCcKA
         TmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqU47aBv22L4NdO9hgIwJuwVMy9u+0nxW6K8QMMEyATDxkOmIvsVPM1gioMeXoDqWTg2XrUis/ooFstruWT+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKarFCdzI75PLYfH2HBaPIyaNg70Yxh6LoSUSipYYAYVOVJxBr/
	n+V6vT+J7QU4VK1mECPRITFDDUiVGYbJbw1THtj1gmswMYGuOl21yrwo
X-Gm-Gg: AYBFou0IxSZfBXZxZUVN2GQQAK5ET37wID0zr5c9pvtfd1IQDi3k4ItLuYwKwqYdw/s
	Z2iIMlzxek8KclUpAC4MFwUquB3BxxgMc6ovx52a3El+DOFMmGueuIp6HgEhN6pQXB0lD/8HwlD
	WsROBqe9wSHgZ/3fuBVeUzcW/zi25SJHfaUC6TsPUHcSCgMBDsYVMP8E8bNSpSFqC85qrbwhvz0
	SU6teQj65TWGK1oUTeg03Dz8WE5kqIg4cqyQLhC7k98O692cGa0sJn271QmKyCiVSOrk7BgUEyr
	7YPvFLY8RiyzpYmggWd1hUKUWJWP9bGDMJPPp613Zgi/7249Eo1Blws5KDrLwVYerUGalApF0UE
	EmEwHqZc7KSTRw2i78q6OGHPbzGEuJvPSMQ/YUFqbj6DBFMA8WgyeQcda4p4SsobgUh4bR7li/U
	Zh7dUTMvtuodjR0xjNJ3PxjAQ/hSJPtOr/cUF/Vh6Zbh+u3glnLCBdJw3wPUqmiN0mjUzejVCmb
	+Hk13NxraxaAHKe4942jMhDTAJTj2dkkXtsE0hJpYq1cRc6OGYS+NArhi5VmduQtGWHeIsplzr/
	oQ1Rvbfa6PEaavKW4f7YlfXR
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr2871629c88.33.1793361166266;
        Fri, 30 Oct 2026 04:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:53 -0400
Subject: [PATCH bpf-next v2 08/22] bpf: Remove dead code through the patch
 list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-8-55cd43439f7c@gmail.com>
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

bpf_opt_remove_dead_code() removes every range of instructions that the
verifier never reached with verifier_remove_insns().

Each removal moves the tail of the program and of its aux data and
walks all of it, so a program with many unreached ranges pays
O(prog->len) for each of them.

Queue the removal of each unreached instruction with
bpf_patch_list_del() and commit them once.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 1a1a374a076b1..95f4fe5d607e6 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1018,21 +1018,14 @@ int bpf_opt_remove_dead_code(struct bpf_verifier_env *env)
 	keep_funcs_with_addr_taken(env);
 
 	for (i = 0; i < insn_cnt; i++) {
-		int j;
-
-		j = 0;
-		while (i + j < insn_cnt && !aux_data[i + j].seen)
-			j++;
-		if (!j)
+		if (aux_data[i].seen)
 			continue;
-
-		err = verifier_remove_insns(env, i, j);
+		err = bpf_patch_list_del(env, i);
 		if (err)
 			return err;
-		insn_cnt = env->prog->len;
 	}
 
-	return 0;
+	return bpf_patch_list_commit(env);
 }
 
 int bpf_opt_remove_nops(struct bpf_verifier_env *env)

-- 
2.43.0

