Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F7537881A
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473280; cv=none; b=AI4uoiUK1KSr/u2ce1Gm8KmgWGMYEf+7Ey5VoC1MBuImJb8uOBCJiTmjlUWSOcXx30vkuiqyelt2Z0r+kBCrvj5qoXGff6EjfWE3qHjeZkto3u8ddnMh9v8lhVEuhe+5+TvU2Ck720KUJzDIu2pSllHTQ6oB+VV5IgiDLPOEC60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473280; c=relaxed/simple;
	bh=/tFqTU8qCqbw1U9FnIiYVTRI8v+EYywy6kgC9ZG44pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMDSbK8ucM7l5BkPkV0wnoeBjzHwNl1G84hr9L4axHm5+qhuEggnFwS1BQCXBtWqxxIbqyVTA0Yap316BG0OVZANDlczvKZOFh9bpRWIbRUSc5n99v2g3yeFpcYJTOxX/ZlgggQPSn/EdU4vpfPmAWvoiGeiNEomPUkhcLetihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KCE8FWMv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KCE8FWMv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso105541345e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473276; x=1778078076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5w5DjNIWsG7anqLb8lN7r0B795MouNr1LYZRRhTV6gQ=;
        b=KCE8FWMvm8h0VCu8GA3sUqKglDzW+PkeHMjoGMkTVb3VXOporkoQvc6TMNZz3ph3D/
         K2YMAFnI5XzNOlzJiOglPJbksXKOJis5YkTAZ8Sy426BqsxzHl1tE7dp5Kd3kH4FFaOP
         bSgzvUGz06zz+DN3Jf4w+s6YsN4gHiNg/DFyt35d9+wnZN9LpINnHwrJxgdv1HP/fidC
         pW8TOUrQWFNIuT8JjRFYwA4T5y0n1qzNvh2rNfz0fADmfuIe1FPiOV+1G5T6n8BFA3kB
         kw4TkIs0VhwRZz4U+EvZU+05U4Nac80tiWdDiMJVWyNr7Q4bhnqeBLTYvjPdZ8KFBb6q
         5GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473276; x=1778078076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5w5DjNIWsG7anqLb8lN7r0B795MouNr1LYZRRhTV6gQ=;
        b=OlpPGHNCLEGhmFRnMLng/EB/xm3ze9XLS+iRK/zdhiRxLKE0QpD5d05AapX+cZReET
         qqO8wSARW1NimyXDobUVcrftu+7PdBgmsfLqr8A3KI/L5cy51G4qSBWnk/u48PTQWbHS
         ZkKH7CmWvEeEZ/YH+q/MiYaBCKB8XHLIF/EkhI8XcYgbcuX/O0es9iVgPV2RJ84oyE8E
         pHGeSMT6H/va7HJRPyeQDEoZUaVB0FekNJWUtqAvPyFaO86jTQ2xPgZRMY0KfbItC1Mq
         nk6oe6v21pt2zyz75ADUpCeL5al6YOo/nLF6ZOtuA+geNBmXnOQq+iy5Gsfni3JFik+Z
         MH9g==
X-Forwarded-Encrypted: i=1; AFNElJ/LsbF9WqPef5cVoXS8lpl/CJoUFRyRUrBhag7HSbAxuhf/Uy2wdt7jKHv05J30P8rTYPduQNt7lwDPlNAQzns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxet9DyGSnnStmvR7UDDu2QhzOTTCxRRfsCoEY9e7SvelFXsheh
	GaCmGVMiLWzkRqc+U6rubPoRklhSu3XBbd0DCwaQgN1DLp8cKEQbUhV5XO3oISpuvTc=
X-Gm-Gg: AeBDiesiK2zZbfuYctl+4YLExQnCbrb/Ha0eY1gFWmbX3NC7bh62BVtVGA40gfxfSqx
	3FCd7r5FpIBpIZ0qtGCXNzn54eL/Mh5pF1JVapwSY/IrZKTpiPqd/x8FP5Hu92XpZuYOzU7qJGq
	HVeE412i2LcGxE2jOKER8yuJCg0co9X4ylWT5q/pUf6yVnVciuOCWBEUmCgXT9PNzClBcmhJxfU
	XoORB2l8JDNeVEQK+Lf2e7uNQo9eIMfN3DV1vCyVy5YSkxyE+V5E9VABABPu8K1GaeViNhfTAmE
	TwEPLq8lOcbDAaBc6QjsbfveZ1FB9B/7LPdXenzBQLUdE/LHRUckSsNquyZfsrjLTcXX6X1Q7Iw
	KfNIw2agx3Cu0sVrUnHU3MIqUekD/3R9uA7GqUGsjGKVNt0lKvGfRMqNqERf3uishwEMIEGShlL
	5VHiIuJMYCdGF6B7TnLm3XWj4/
X-Received: by 2002:a05:600c:5299:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a77b25324mr133662415e9.29.1777473276053;
        Wed, 29 Apr 2026 07:34:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb717d119sm1099129241.0.2026.04.29.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:51 -0300
Subject: [PATCH bpf-next v9 09/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-9-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/tFqTU8qCqbw1U9FnIiYVTRI8v+EYywy6kgC9ZG44pU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGYVkomWwEQDvE7Wxp+afLciqIHnprO59BIW8nFs78OTE596z0JktPlMkzB3u0Bmymz9v5I618g
 V8+gHhjjGYw0=
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
index a64e822dc540..db4ff951fc88 100644
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
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(if $(PERMISSIVE),$(wildcard $^),$^)) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.54.0

