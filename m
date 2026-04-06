Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A22388E5C
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491921; cv=none; b=fAzmmU8UVkzSkWhB21xOX4ATV2B7tqZP1xUlXkcYxfb44h3gSIYIRC9TQSIJ0HK5UmzZmxMDNApYprRYJfQ7yJSc2K99JpHVNDo+SQHNTblvQiFLM6iZZgKU+ohBTzGzW7yXeI6oPgoxo6gora234FfDecKHlrybWg5JJHGMfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491921; c=relaxed/simple;
	bh=SxhjXuCfOoDBfzhpHd2FQo7WMYqlfNQJpvpfGE0Qcnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvc8OlmxpkkQvwPmkzjVSf/dGCTprs6OsR/AZY5/ZkLEwWvfXAS/qfh4RMyK1m+yAZ7C5C4P3Gy56KU3B8ZOihmX/bkeAM8LuKK9uBBxEbmW+HqPdHkhPT9MEKxxrJpbTFrVEFhaIVy5HBVDLSgpIM6sYlJmUzZ4tGTsUGS4bOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AqqIB/xV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AqqIB/xV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba840146so1876665e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491918; x=1776096718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvVbJTt2G3f5MT1ZecImKaWgr21hR9oJpCuQYknRbaE=;
        b=AqqIB/xVV/+tl/ifggp7313YuHAocjmWlQmCEo54G8cMxxqGCca1cjIeOxTC2nzzpH
         XVlxLA/hXF9tma3WXOs6kcYQ2pYy/YsMnil9L1eZF7G8dNkDCw2ENs394sSTinjqZhDx
         Js+yPw5oDkjKJQp6HhOG7qGLrZyq9Y6odwqUMsZ9LP5hkGc4/c/BO4a4wKwDC/+oGgu6
         kvtYSkqu/Cap9/ynaS4VYJB34VAsiUcUWykDDXLIUWU8kYq00osVOLiZ8SJQmuCgc/z0
         7Z2+AulhbjdwdyqT7QnqQi4UQP6w1Y+6AOBp8JZc31c1tUTbQSCKeuWNFxbTM/4B3lFb
         IW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491918; x=1776096718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvVbJTt2G3f5MT1ZecImKaWgr21hR9oJpCuQYknRbaE=;
        b=RgjBvov1nSlUODX74At1HdUfNP+yqkDO+YSyMhC8cZ01RiiX3bs+1LKH/FLqZNwBlV
         ju2av/yQB4WnVKVusFuHIhSJInaNOclq0yEk9bO07jxOHRsUAQALTNwYRtoaIuWAlOZ6
         sOODadFivOEvs6YzH1CkiNrfyf+meQQgRs63p8jowlamZDtokD0Yx2aqpBGZDrZVM92g
         a+XrGl3Q1yj1pclvqMP/a1/mtWIOgsSCf6UXIQ0NPNRNe4M6CfEQ8FuylmFsx1q1EN+X
         SPqkOrTxBexCn49PrtRCag/riI/BkTZrEti9paIC194aHXI4j1JkGRAvCZ/0BXIkq7ZX
         ov/g==
X-Forwarded-Encrypted: i=1; AJvYcCW1I3Z4V3B7+d3yGYM4KRKRbbm/+EIUQb13WX1jJON4AIpyrxvEkg9zd8/Rif4sDTOemcL8k0py9USfknUEAI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrAnhDZSMGpKByhNGl1iOeyz6ITkIg9RQ89/42ZSA7iko0B3L
	tw3CVhLLzHxCigp2gUt6Rm1dKZapjHKwQ/aTlrVfamZivdKdrzJUPLzyZOo5TfOya/o=
X-Gm-Gg: AeBDietaU5tbLPaTXkN5dy9Qes046BSho6FmuyBI/xg/tzkAcKQQbmgKSDmVkT648n0
	tmYAaG5htjo/1rY3oeO2XJbv7SAPlR/c79qIBlaRCZaDAeWKFxBgGcXYwJ3SbPsuxt6rNuKhViY
	B1E1qbVs4vTVwqEDKzGXxxUd0LeNOyRYAYEXlhlIZaVcudZCD5ObpbKjz3/q+4QrqZPU4hlrgdO
	Btmznfhc3zaMSS5FdmlkA1fqeH7Zjp42mh8EhEPAQVRW0WKxYujjWxOOAEcmhMTW5CzYY+HSx8S
	WDas0luLuwwE311m35/WeOMwufdP741yqjISa5nxTxIPwmAuph13k9fsoTROHt1ajAEfYdYqpZC
	EZ6sVsomRmsaopCUYvop1qizhCivuyT+0452m4vh9WbOu6G0esbGtv6MtndIC8fDCEkMd9TN5zc
	EAPwgwW/8alQK7YvYpr/h04sg=
X-Received: by 2002:a05:600c:8012:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-4889974a310mr198214275e9.13.1775491918502;
        Mon, 06 Apr 2026 09:11:58 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582b562bfsm17283320137.0.2026.04.06.09.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:57 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:30 -0300
Subject: [PATCH v3 08/11] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-8-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=SxhjXuCfOoDBfzhpHd2FQo7WMYqlfNQJpvpfGE0Qcnk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMrhXQOPhVZEx57DEXWeTRhOLdCPBuBJxjffDgeT/GVPSwlxbq2FuHNs3JTsfnTU2Xw0l+8TPI3
 9coAEaN6I9AE=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Benchmark objects depend on skeletons that may be missing when some BPF
programs fail to build. In that case, benchmark object compilation or final
bench linking should not abort the full selftests/bpf build.

Keep both steps non-fatal, emit SKIP-BENCH or SKIP-LINK, and remove failed
outputs so stale objects or binaries are not reused by later incremental
builds.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index bfdae212037b..1e1da26153a2 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -871,7 +871,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -914,7 +915,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(wildcard $^)) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2)
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

