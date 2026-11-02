Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622752;
	b=nSqhPx2kSa2Om72qm8otoOef+ZvdQdGeTgZSo4WMPaXeqT5N1xCKJ1/16Vkf5mj2J0vT
	 thntZvaZFAq/aw02LJNfMoDWm38PREngE8R1atg7hMcadhxBoO2IPza5f4/Fps+y1PPUb
	 6zYl8fCdAB3OFQXUsCJQyY/OEoFyZRIZdMy3Otd8DQ8o34Ncw92/osq6geiMOBgbiGESo
	 gjZ/sJ7xyPMKs/w8b20xxmzwhMskgBjWyk4Ytgu+TLFx4KNXM0x2fzmuL/kTgzChQvJEa
	 59mx8xZ9HhUA/xuzH9AVRKbHV2qtsRxRf1kAiEYQGuvUSAYgQwMeaXiPGxLOpkD7ZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
	b=vK8FP+tLTKkapiG3wUHxMBdFT/COrHq1fWTp6Tdc9PHxK7x2XS2Do8ibxddsIW7ynGn3
	 Q/OGWgKvdNdFLUKF6OBFf0wq0pCfSXPFnZCelBRrFsLaGOgC5FCezjdAUy5eJQ3SNUW2o
	 izF6uvOu4bcnQcYVIW+GU8N8CciNiqaQoOtGg/9AuaIrmtaf7mc0LlUOJBi/kY44kfxLY
	 wJHMWYCUVFWqG1SmSmtsAdC7wAqBaAbHbLBcluWoU8IjN4CG7vZdEWI8RJP9/hTpdAnmr
	 ZV1DwtmOUgwMAZeCRKeR/GolpBDHl+85XHW5qsGBklEPbIi1l9H14kbvMdPrQ0h+p3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/E9KdFk";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A26606A334
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A26606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/E9KdFk
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2524004c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622751; x=1794227551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
        b=c/E9KdFkkQYlPtAuldaJu88tZq1+LgL4K4loOdTzgo6lVjbL+9mjVIc/qHzxkWJmRM
         qO+GfXKnyZ28hwG0cDofLMGssranDxNP1faLTCAkQntDWGo6CCnLJSQ1hiJJtd2acTaI
         7WhzNsMj0IcHIcXkWG2Q6eDQFSM19xV6hajtlIiyqi9yLlX9ITyY5KJkXLI6fejGkNT+
         Mk2aQPaiD7U1FOWlRH6PfG7ZsH+wOs5hx1XLUdX6MOcw80i9iaCuWKPDA+0yCwg6h/65
         sAwBROTPU3h7mARWRVou+4/iROk3ji+SS3WfmRw3ZwYyY7n+54qkjs6UQFdOCMXKyzLk
         J+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622751; x=1794227551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7HK95+Ejz25JT6Hfe+wCQgxilDD6LrZVyreaMFx54o=;
        b=cC5aAgtizRu+gE4YqEXH2NxBZxJBMc+cXAQeE82UpI0OSXahsGEZt8G3eoGIiDPQf+
         cOhR5aPCzlAUxzBQpq5ddfkpPdKSgNyamKIl6RhiT6Z0LADOquh88fr90wD41uUaNlO5
         faJYNLa/ah3dlEbgZ7vpR5+OguWn9A/Lms8TQVYdNthoh3zv2wqPQIO9l5T9qR7xSOBR
         0e1f1PLSrb5N8//33ofUbS7U4JzZan0WS1NshzNGdkH/64V4lXxwOcVxtQVSscfTN4aP
         RP3uumFUCJSMqHjRLSdvAqXMuw7KIauOd73CINeO/j2Fn3cwyc5Ln1Jyt7o8cphbNgvo
         /eaA==
X-Forwarded-Encrypted: i=1; AKwUvByjVk6tZzdJkWeaXj16OllUJVo7ddVLVRJDE38dBKLAcYq6l5vyRoDmG8m6+jyhBYp5sneHmuwsgxrThWxvgj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE5mLpZyPz5MYtsup+z9jd7Y/rexNSVTikkpKGwHAa8hqCDRmE
	IFcsKn5M2q2dF8Vfxy6UOEs431ALQ5zzmTDWWiu1q5DqMQlAFHhwj9TF
X-Gm-Gg: AYBFou1zSmgmHwYJI8bmpuhRbYMTuRRoriNx2ni8YmhnzG9RrUduVhb9/eWXJq/Kg2o
	Rl6r6b601ndgUr/ch/G11P+la3W1JxmB5yZPvkbOkd8SWdXDUWQIWZt8hfIX7pBz7W54r4kWg7g
	C0N7BSc4JJS1OndXyqE9+TgvynxDYGxofORpm4NYg36blDvpygIlmcB38/8EjhqqvMwVvzH3ZRc
	ibvrO6ueTbDQxiJEdpVqOx1jfk1NF9zADuRX9ypt5Ec+nNEZJ1v8tQkmvdtCSn5QC4+w+gtbR3J
	VSOxqu8KSy2CmBmNIXFHIySGwLx9KGaIzVAlrQir01+1ITC/Ib4/sildMcW07AwflMs4BUr1K8m
	hRdh/bG3Y1Jt1Dj5TYwSnmBmWSSQGCNzc7hn/b1DL2kWm2euofsZW5zBpXYxmd+1IqEfOWYPiE2
	sfOz1bjGVaARHH5fBgJGKCaNimTI1lIzlF4s0a4bnZFOppphTykzM5vac1quyE7L5k5VwGCSou6
	xSB4i9GNDCPFFxSZSrZ+p4JjbjgszGLaGzxJnOh4p8uD/n2WXAOzT9zKM+GTMXocv/La7aXpplL
	b16ky5DmQo1W+CUaPkj/xbVp3qaX64oj8jReLcFZ3xbu2VE=
X-Received: by 2002:a05:7022:fc05:b0:184:992:c9ec with SMTP id a92af1059eb24-1ac5fd06166mr10389427c88.38.1793622751151;
        Mon, 02 Nov 2026 04:32:31 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b2360d2066sm4950951c88.11.2026.11.02.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:32:30 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 07:32:13 -0500
Subject: [PATCH bpf-next 3/4] selftests/bpf: Match the insn number of the
 out-of-range message
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
Message-Id: <20261102-bpf-patch-list-followups-v1-3-ddc8ccf40f43@gmail.com>
References: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
In-Reply-To: <20261102-bpf-patch-list-followups-v1-0-ddc8ccf40f43@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

"patch list: jump pushed out of range by patches" expects the load to
fail with "insn %d cannot be patched due to 16-bit range".

It matches only the fixed part of the message. Which insn the message
names is what the patch list decides: the jump that got out of range,
not the insn that a patch replaced.

Match the whole message, with insn 2, the jump over the divisions.

Fixes: 67d4d0b73c29 ("selftests/bpf: Test jumps around patched instructions")
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/bpf/DMKHZS5B5CNO.186F6YH1T6YU4@gmail.com/
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/progs/verifier_patch_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index 3ba99cf16e96b..045081936d73d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -128,7 +128,7 @@ __naked void patch_list_may_goto(void)
  */
 SEC("raw_tp")
 __description("patch list: jump pushed out of range by patches")
-__failure __msg("cannot be patched due to 16-bit range")
+__failure __msg("insn 2 cannot be patched due to 16-bit range")
 __naked void patch_list_jump_out_of_range(void)
 {
 	asm volatile ("					\

-- 
2.43.0

