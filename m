Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1703CB2F4
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228375; cv=none; b=q19vV2+2iC9aAaUkdCQNFw07KbHhFjfJW5PJHTNBJyGbXGJaVEIk6H8U/ZGjVxwHh39F848DK3XJXuey/dLyUuOPoIIRJQj965N9KXmx2S8lcjhp/GdzCbPfAscryUmHAmvbMs2hdtnnw+zomqgGJIzJ6kBsKxWTM4Ue7Y1OnBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228375; c=relaxed/simple;
	bh=Vb0AXhFsDt9pyoh+t+bE4qmDULoWMSdi9FuzL2SfgS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeSDJpHwcM7Qb5dYvlLHCoQ4Wt2eTNm0E8+BD4Yq+9tGu+y7ErrtTfRZQvrbMot+ouVAHuEBfKZUTuihEcqP3eAXV0w1f91ApD4w6yw1w4MkVsWcWh204O9A8Wnj7wG1nv37IVoe0Z3gTZirO4RRiZNNQAjUQWlk+sZ46oGLQg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N2bfWapi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N2bfWapi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso27265555e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228372; x=1775833172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ls1McLWMN73ezSsTrZA7UyKWtFmBmekWaV7EBs/FdgQ=;
        b=N2bfWapi15j5WhocBuGowEHaYALGWUZz4FIqaB2t8Ar8rXk6yuVjDyW52+j0AsbzWD
         k2OT77Cfpp2nvmtQ/YraoXsIPaS41kF6KEi9HjOfaX9CheO3AgypX8vB6gmxKgtmBX0/
         gRJuqApZqHZbwojPnKRhUnSJbOlXaF1l0SwFUD6/6AdtIsrIx6JBEuGF2JRIH9FuoVfq
         Ycn0/Mx9i0YVT09y5LzkWL44VFQKi/oyd8l8Fqqd0njZXdNv8FCmQyV3BO5DVEW3NaGT
         R30zAzTNo9XLsniubyGYs/IltQBPmKh1WUQ/3vsFsw5YrrNihE8gG+zoIi7ZBenfvRuU
         C4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228372; x=1775833172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ls1McLWMN73ezSsTrZA7UyKWtFmBmekWaV7EBs/FdgQ=;
        b=SwbXb09mgYEUevRT/IqiKqyuJINMfdsr36xyvEidEl6b5AAE7YRAR0xZSPnTQt6O6C
         0aEX371jo09xG7meNVZwPi1G+tF4pEyG0QDscNaEuwrX9mpk+YMUfPG2FVEY/yC3jsWn
         jlfDsp5NJjkapVw07CiXyOvg0cqwCDkhORzbLnnLCX9tjHGRPsiIR5me80vAX6qYlsYF
         LyBpBLQV9T5ntWGzyfcZpp95aYWngvPOeE6RnTpEZbt1Vg/bPWuvRLOo4QIR8q88B+C+
         KFw4FT2iw/ULC58/RHWmMrwq9hc8oyY5aqWWTTA0h4mKGw5q5Zb9K5ZTLGjeufWBKOQl
         1o4w==
X-Forwarded-Encrypted: i=1; AJvYcCU8DdaFWBTnw+lkQfuFGoXGbREE6LAXVOnmUSOEp/kfzWzahDKO4ukknxyiy5Y3lJHdzphnwDa609yEdjsJryE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0qFg76UFfhPVs8CfV+UnZwzyZ4A5IsGCXX06JddvixwL6Byco
	sD4OfsYt2mCPHpNrk5QwmYORh6BZW2hWvOoEmWWOppputYqpJJLPgEiWwN1SNHXXUZY=
X-Gm-Gg: ATEYQzzka5VpnKOm/kgMOI6IQ6rq30grCCObRosJbvmMi+ZtJpk1AOospxHvZzqEaSk
	DyJQUHugeRI5Jb0Z1fnSVnqUQ5KOqRmMj87H3XMmHpqEnNY8JPzAfGJ0oHCLXVYqpXtanjJBUy+
	OIBKaowkCdZxm+CYY695C80H93hHctcPEixK8NLTu2vXcmlFpBg27J7rz+YKTLMLKcgb/a8QGdV
	k4KX8/kftBoZTj3X5Z3OUlglCJwZc0k7UGnDF7E2KqrRNSG8OgXnQZTPChCiWrnPr3Sie6qklEr
	8d/miEjGKl3i7ICZTgmdCnyZdrrlBxfI1ioSThR7mU9PtZpgwF42z+Tt7PVVlgDXxad0THhfZke
	H6bddK5oVYOdODNHRZL7FuQgAmvRLm41pOL6u7vezOzVAlSSlgOmGPxHkvyZenw2O141WofJVfM
	+7nfqd6ayp
X-Received: by 2002:a05:600c:4743:b0:487:36c:f5ab with SMTP id 5b1f17b1804b1-488996ff833mr53031475e9.10.1775228372464;
        Fri, 03 Apr 2026 07:59:32 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1214esm7347524137.3.2026.04.03.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:31 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:00 -0300
Subject: [PATCH v2 07/10] selftests/bpf: Tolerate benchmark build failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-7-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1818;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Vb0AXhFsDt9pyoh+t+bE4qmDULoWMSdi9FuzL2SfgS8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLCw7U/C0zz/637riIE16w5PGpjm5IiodgjmbH4UtLs0ATObTBKTosvzaC8RaAPLzHEy/4wpKYf
 PXEGmhaqR0AY=
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
index ca64a7678dfe..6c4f85459486 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -875,7 +875,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ || \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2)
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -918,7 +919,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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

