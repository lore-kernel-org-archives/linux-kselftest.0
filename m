Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4A3CA49E
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228365; cv=none; b=fK1iIsOWuY0gORBTRaOeBbMviAtlvX1LvAyJGGoaQXkJOiLxvi9z7SQx6icaYp1aE5FMgpcj9V+iuOIRBCvaCXraBQsvgqlQ3o/PiNnvxs91XMmGoAXPV5UUqQnCtAXvn1WDHbBFqBu2k/C1TRcx3mLTbkFYIF6w6gbD06fccT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228365; c=relaxed/simple;
	bh=t1nbxFGOvUrbFlO+YSDPWdSnERxYyVW/+LqxXuvUGIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8/QvaunwBWYnuVeYVNodcxnKeqvf43BQSSu/tG5Fb52736j9fmbMhYk9ZDwcpYLCesCt9N8k7k6UhM4JQTDcq469P3xhHd6jBbFfh5kxg8gJywUzNBtaP0nOK68wdYz58t2hdokK+RMi/wMzjcMFwkdgFM6T7sVWhlUyWIylI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PrXIICPU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PrXIICPU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfd832155so1174029f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228363; x=1775833163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm04HqKISVuTOG2rwmdLIpXmgY4fspT7kbSOfzz2OgA=;
        b=PrXIICPUbdD5ckxrosQS5Pt+g6Ioivpdm1ua1yEz4D82bJ0M66uxzvK+UIr3eecGAj
         M7BbCE89M3ult5Ba6gKXWGz5PE1TSZaVdXLV3VghqljjoJEOyYDIfRBWIhwTJU8hFoN8
         HyI8B6DWuIkIxj01FKEVUdQL1yWYhhbACgV3Fzhm4I3Xp1d+H3r0O80AO7MzuutAMHdU
         WL/mCTNKenuW9SEB6QQQJv4H2FlGN1kYcmDCn4STB4B1VB0VZMgt1bmmEaUrgxK95m4q
         BhOKBVk1ypRVHpKLOupf8wwhd1XuJgxyNTRSYM2zdLKcw5batBnyMKJA4pExwz0AlZjn
         1sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228363; x=1775833163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fm04HqKISVuTOG2rwmdLIpXmgY4fspT7kbSOfzz2OgA=;
        b=ESJPYJNCdS/pezlKNIFHzgW9DwpOTLIjayjGmmWS/b6Yi/OxN1Aoz/V5ZeOvLeEWXi
         Jn/XyqtoLu7c8lgQ341q3RhGwRqjJAlXfLIap0KBc1XvDIP1XG4zOxkuby0tMnikYEwA
         5k8CXl+A9GbJ+NVZwwD3CG9nt1gS8P4Izs0zS9Ld1xrTLDXRwEyTKN9kxR5ZL3akr/KS
         nQLL3hI2Sl8fiWt+jjTZ6tayKmYCUTsSqSTN/yYiZhIHhZTT66awBj1WBdwQ+6eumjY4
         BFndzaMzLd/7SWc/2dbsOOXNxD9xudWcNUNrnUkgv7c/y+m6KK0j8Akw5nQVHOJtq300
         NcjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkReBtAxP/tj5KjzgsBeJkz4yXvYWuSJH3o1OE2q8fwLsvSfRxqieOEVS29yZgWrSnDybxu63pvrfDpXtL43E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfWQr2ZNaMH4+h9fmUuBiHdkIvasSYoHdmZ8yuPWd7aCjcHyf
	orrLvikH1zhUY1YKYe3cVHkPXfAvsxkjo4pK+EW3vfvfr4eUzKOmt4/2j8ME20CIhWE=
X-Gm-Gg: ATEYQzyr6LWYORLFrOOMrbrH/RQ7jg9/V2tsqcELwDPcvcIiZ2FSQTXjo584tkI/qYQ
	zN2sEGGLRutPGXPlrA807iaZdcjZY0Y6WvU9f4o6PBgpnKLCqEfRa5Ow3yTWzr0nPuWinngKZOU
	hQK2w5WTA/xaPdr3AzDQBIrBlTlKMOhv9xMv0WoPqgEv3fD8vSBgS9e4g31x0+2b/Wk94jP/C8I
	77m9e8Up2z6nBgxOoN+7nGSDSazuCp9tMumzmB51jQ8geKCvnZ2KPA46Wq+J0p1Dq4aWv/TJwpA
	/OF8ia7kaJ6aQjQDEYOJwi3GyuoD9LIY51zjwqrRw5i7GpHjgw4INPJ1lguyid1x1q19GvYMwUI
	zMtjuikp+54jsUUHcEkIOg3j1gNRey46gMDRpgJvMmte51BS8JJpwayTSKSewCRDSclD4DlaWnM
	c0UzPDC65u
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488998e3cbemr52789415e9.30.1775228362756;
        Fri, 03 Apr 2026 07:59:22 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm6958583e0c.8.2026.04.03.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:57 -0300
Subject: [PATCH v2 04/10] selftests/bpf: Make skeleton headers order-only
 prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-4-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1609;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=t1nbxFGOvUrbFlO+YSDPWdSnERxYyVW/+LqxXuvUGIA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBwL4B70EWSZDKx9NQHTd0axQjesmwmJMuHscAgUJcomCeJbZwqZe3rAtU4U6qHJtlEnvTUEAN0
 Rdl054LosNQs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating
a skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 781238152c4f..72f576a8236a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -697,11 +697,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
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
2.53.0

