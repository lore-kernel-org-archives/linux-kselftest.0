Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81334376475
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473265; cv=none; b=t0tPpViM5jCJcaVFgGKH+bBTA2T+JRWpB52v1OGgRZyXLbU4r/vpkunqKTa0zfU8iSousc73sTt5a302Fp0MYfX07RwbGY7t7uce3/Jw9xXHW5jsdIK5QrD8XoWcNjuX2d1TnZHOz0npp7gZiHOO9Q4P5xn9EwbEu3viTZeleoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473265; c=relaxed/simple;
	bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOsvKSjofL1cqWt2Y1wSEATGgVch9WO3TOccwRYBP4JGRiSeRhlHGqCu1iAhfqdCZ7K0os5/Z9M8A/8wo5Y+OM0CZmEBIHkq/xos1aGY4B7twIXb14XWdCgnFnSOyT9kfeR4YlFczgo0LEZf2ZKCE0VrS2RDRn87APRAyoZmiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q2T3FS+p; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q2T3FS+p"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9358bc9c50so1696283966b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473261; x=1778078061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=Q2T3FS+pNznYI2mAKhOMxhCmLzbjwKMg1tjPVGpb3tsUzCYxvefV9zEcqk48e8CLDr
         56PbeUTFb8lpvHfSgWQOvrssDg0HJM9ogT3QS11oxs/CR29HpPltth6GVZmvbi6TSMM4
         p4SbiHLiir/FdvwJgfwu6OBa2oGbzvV3YPhpo9NC6gXUUrIyCBZ566WWpLRo+E1tqiCY
         9yXsZT9zDqeUq6QWRhu+hMP7GJ+/wvSemDNnQrAcUXHiO4lMTmkh0Z/BYqy49KUJIPw+
         6URLKbBPdtM7gvy5WWHFdWoDjVIxNMOQoDrDkCt11LXw9Ppu0loT859c3e/gsZ/lcSKm
         X+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473261; x=1778078061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ysP9AGtPxCAbfR+Tj7mfuITrZ+N0ZILV2wyZ0Jzr9sk=;
        b=HGu5Vee43+E5cgr6aJtW5XnmxAq+e9+IepWpXeOWwdRiYx8ivsSmJGjr+oJzWUwQzT
         G1/5w/5JdbUlGmm2qpFw6dAk2MrsUZKdDUEZKPpg/kTkqUCQru/rLRHKgsylmW6bI+ji
         wMtpikWhTH1gOm/3awqb/dDMFispwAZvQ/Vj3JtdL8n5eSPwLPLjSDxxwmzL8KvOjqGv
         QFqMSbxgTsh28yyg+feFRtI34y4l2Xf3B6F6h30TThC8FhVfFExzp45fDB4YCTo/ycLu
         /M05znBptQBcGXX99bpc4R9IzGSk+SiWgBYh0tLR7aJlLjXjoTmqCQgQ/Fm3zN5H4C6C
         FaUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c0/9OXLeg0TcgxuTpj9tz+8pNvwFsWdT7lkaz4ncA0sJem9zPsdzpIrFWgV2UlnXu3oJnvBmkR9MlZ6M75c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfwS2En7fe6ZX7TbdvQrbvdFakUNWbK1LzuMk39zEtvAiNK84i
	NOmEQL9/MZ9XWJduFFQngM7vLx7dpmNwZmJKUYLw8xlXPypNL9E40redzk1w71JPkXA=
X-Gm-Gg: AeBDievv8ft6i8E/fl79J2KXkzOCvDRo8mr4bPRbiriCw4znsqvU6Gev273Q4gnzX4J
	9+jtsxDDAUAfkE0PEJGGXf6FU2A+oKWZ6rEPBRo/PHl2HB7XBw0lCzyHcTtHCpPHmlxYU0CAFpX
	xdZDPt+chSzD64T6lDaiZ6I5qLQ+5C9/iKVS3335gkBX2B7C4qf0eZEhx11sgJiXlY0evLyQyK4
	eLZC3m2KfsgXDiSaxRKrtDnuCGA1/Pw6JHhq9Pm+Qqs2q/UeIJzKzBaJcx3kUA2g9NVJBxaOqxZ
	ZTUNMEuLpDO65tw9uJI6h51C4D21awmQTlgOJB4V/vXKooZdxKIsjlx5YIJZUBzUqql4SuaznUO
	fGQdLJjzzNwW6SAWTx4lBFXUMCBtVn6s5lFFKyxcfljuF9UZRV9s8lDbS8fNLnlatuXOtKhBex4
	MDNyOoRxH7kJ4umDwoSqZhIxYO
X-Received: by 2002:a17:907:c50e:b0:b97:c719:14d4 with SMTP id a640c23a62f3a-bb93e64c44dmr268755366b.29.1777473260782;
        Wed, 29 Apr 2026 07:34:20 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6d87e40sm1209035e0c.12.2026.04.29.07.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:19 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:47 -0300
Subject: [PATCH bpf-next v9 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-5-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=aqXG984YlUxMtsZ+i7vquyVJaGX8IceA6DEnTDh+TX4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFgbYQ184IounnbSc2yS5rRTZVxJcGqh/hXS3g0Je6tNmN/jnaYCgSWS4Hbx4AaGX+s1ErFeyEs
 tZWsUuJcpdAo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

$$(BPFOBJ) is intentionally kept as a normal prerequisite: a libbpf
rebuild legitimately invalidates .test.d, since libbpf header changes
can affect the headers .test.o sees. Only the skeleton headers are
moved to order-only.

Note that adding a new BPF skeleton via a modified existing local header
still works correctly: GNU make builds order-only prerequisites that do
not exist (the order-only qualifier only suppresses timestamp-driven
rebuilds, not existence-driven builds), so a brand-new .skel.h listed in
TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date.
The modified local header invalidates .test.o through the previously
included .d content, forcing a recompile that regenerates .test.d with
the new .skel.h dependency captured by gcc -MMD.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9a4d8bea0c18..608e6dff0392 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -726,11 +726,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.54.0

