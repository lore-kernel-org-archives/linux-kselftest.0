Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8246AEFC
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564969; cv=none; b=XNfEYfzazU9O02NHJK+xEIn9rcWkUo7+Wf4NQQ04iuhbZN7oloo/4DsEoNefVo1omF8QcpWR5xoSqD+QDHeEcTDGIwPRfIWLducJafWsJNX1718ZItN/vCKzdJ+szUbZYCiZwCtZGjL98deoJ8Xry4+2VRkHbxUA7rm3EW1G5Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564969; c=relaxed/simple;
	bh=f06ir+V8MBP2SSgv5G++kXrrlxY69TYTIXZ0uOZw4tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmkdjhflPoJzEDdhis48R2UCEi9WVgH1umEvcVAWp2uJtCyobKtPJQqVE2HGwihGl/tMuMsU3OBa2WklAx13rJgUzWxp89Qc9u60c5WLL2mAZnIKmEiKsHvdxa7yLtLsK9FQvdZZ3yNN0sQaDxJbbvpe6Mfg1GCv2wyuLZvUUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BbgOkp1h; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BbgOkp1h"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so1206247e87.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564966; x=1778169766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b/4j6CY19W7q3lBMrvL6zjiFHJtdkm0lZNuDa90g/E=;
        b=BbgOkp1h4NZjuZnS1ecSgcBanzQRf+I7hEzbxGYA7+Ni7PpefqOmk6p1YKo09cmBTY
         iJumjiaVS51V808ZI36yl5XtB5IcwP711UJLYsdQArN8BBOeaFMG3jVzBXE6l+VzXbJ7
         Rcv/JWuBriULySNjQ1g2KxcUPK/nw+ijrXL5CIf0yubFZlclXFcDEHToV1MeFL8Xtf7C
         Dq/XQVCEbSqEvGlVSUlV4kEuzya26VaV6Vg+D13oa9zC8PG7oJ7kDCD+30Ims7k945rn
         OG0s3QKER4t729DPt38lXaK1uCwT3+lipqc9Y5thukO4TXaOelcaVY4KFBiT8WQp7X1n
         60mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564966; x=1778169766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+b/4j6CY19W7q3lBMrvL6zjiFHJtdkm0lZNuDa90g/E=;
        b=IkhkPbezCU9Eh94weMExLh85xyrRctbIyrasH3mkWBsLBAWNSiohRb6+FU0aj/BGrs
         3SqB1GmeWPJSEPuK98CLlccXqMYycevZbxwueW5fcJvFmYxPYSlLjkTa5cb+3iKNTbAo
         6teYsLWhVB5je72qPmC3gNp2hNi5iMctLJo/+5Uf4ui3sabXBAigvK8VJ6tOwsn9DZgT
         SOmbZnFdobSVSJ5d07Vt2RTqXb95RodeGm76fmbhAjwG+fvPTC3losWYQHkRQZt2OIss
         eZA1F9qmKJy/rRwWq3TRcAC2YsgKJ+VOy+NtQQeh3vFA9VaFMSUoPFEF1GwmwkH4bFSK
         nrDA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZvMcHvT5v82xdNZDFe3Ov/d9sGaWifGUcynaWhflOsMJ2gycgjZUVqGZuQcbVdEsckQnmrEe7hFmOXUL1noo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdniJwFqsH/meDNUNXwgzjr7iyEH9UMwH86aB2Jlssnl6Trugz
	bhQLdgSFIo9C2BeYRCmEKAlan9WRYGvNH5Ifd4Y1QzLBPL5iugHRDQVNRQ7QQJGJRPc=
X-Gm-Gg: AeBDiev3CnM+xg25v3r54xVJUQl99fdFglO2zah0349EsDLfIKpv8+SHfyxQsUDFFE+
	+ebt4KBrE6z7WfJibJbflVMDEtjDshqneNh66S0DUNB8ewNDiN3+HxnKwh0b3un4Wt0+v5bOCLE
	/ROQUC/XOm640UghsGWP34fchBpMB/EFrZAYNZ8dxKXtBAZ/dsr/iD6A868zJ8VFqip7Yh2Agna
	beiM246sV30LDmP69xKqGzLcYDrWATwkX75jaYNoI1E2ru7Wp6RVgbmjQ4Imcz9bvczwtpETPv+
	2EDAgpfuhcFWSb1tvDsdLw1xE3SlmW7pu4TG5pa4MDCHVcISG9axvpA20746iQG2OCZ/BB7oU9M
	vyxeCGsKB5wy1P+SlZLUrYTtbtzMSHy33V7raWZn1BrXss4cwPzkwK61bQA1Vq7dKAdt0srfpcY
	1+sGPSEQOPgpS1KCI3uMEFU53d
X-Received: by 2002:a05:6512:3e0c:b0:5a4:19de:eb70 with SMTP id 2adb3069b0e04-5a8522d8efamr1578264e87.28.1777564966083;
        Thu, 30 Apr 2026 09:02:46 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b878317sm382791eec.23.2026.04.30.09.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:45 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:10 -0300
Subject: [PATCH bpf-next v11 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-9-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=2182;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=f06ir+V8MBP2SSgv5G++kXrrlxY69TYTIXZ0uOZw4tM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDUnUVNq+KTiBlpnlPZJH1cqaY9VAtOaYXT+y5Wn+5QoEO5ilHeYCkdfLjoxtRlU7pi1iZ/BAUz
 EoNU6VSR3dQo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds. Note that because bench.c statically references every benchmark via
extern symbols, partial linking is not possible: if any single benchmark
object fails, the entire bench binary is skipped. This is by design -- the
error handler catches all compilation failures including genuine ones, but
those are caught by full-config CI runs.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 04634e6e0661..a460f2ad3cff 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -945,7 +945,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -988,7 +989,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0

