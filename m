Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30D38D6A3
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 21:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286804; cv=none; b=btwy9vC1FqX0F8Rns6Jq4Sy5a4tKQD73PX/qVXyCsYj0kVUiGKFOHChvqfMhZPZFnT+NxdQlbe5ReC5O4rzVgTLtzUsPhmfsTc3BeB4R8spV4cu5Z22V4odXbrJL2lTi0Q3ivwkuW7RCMj4jeq33kUSmtSitgY/EZuB5GyRm3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286804; c=relaxed/simple;
	bh=XCKe1TjHfJlwSJAX4fuY9DLW2sOgBtAwMXzZhTx/5F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3RSJfyp+ynqg3WJX21+metIbt43Y1HheKXAg9F7yZtOzbpRpYxPCc1pZQVLTTuFdjCitJ3Lrsb3MXECAw7LPgz6XtMIX1VcHRCSkBrYKa37/eg2lgsg42oZV8CSllDfrKgd+KfiNpekBlIOvJU27/oHG2MjgpZpD5g3zsU8BQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ECY9UoUj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ECY9UoUj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso86216145e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286799; x=1776891599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtePe4tVB1ppaoNVFmbhZuXMDT7E+RF+3Sc+9onPhUc=;
        b=ECY9UoUjSbklVFUpImxTqN5Y9k9yqBCaMPKuv4QeR+9KYHB5HBgLFbkfmzlznCh0VM
         LsK52Pa6PEjzbINNwpHe5ONhUlvXky85o/GCmFgRRDcNDKWILDYSPZ8v4DFO6Zycvv31
         DFEWbCklXpqQlntixEWer3P8MnIv4n8oaHBrn0EOn5z4T3EDslCVVpLq5iOYdLEYUSqB
         UgBPUqPXrIULVFA8FbuzBlz01lhbSSFVWE4XGd7cGS5F2Zgf/nHxcRtHQ9s6XGliIkoK
         5nLaT3x2nhTJormhXgKSc7wxPjopBe6SlJzJ5S26zFIYbPpaN6CWYpAQk3hssPIdr5e8
         6Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286799; x=1776891599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DtePe4tVB1ppaoNVFmbhZuXMDT7E+RF+3Sc+9onPhUc=;
        b=XKMtqcfDmYvFo3zSb5d3IqzWsud5Wq4z/wo10q6WJGBr4Lalm+hwCrujBgAUMFmmTq
         wyQijxOI25UGqAubcsdCaKZMwDUdaqH5wYGsOhapIGFtMAsS2CrUjgntWLghtsDbEy3y
         B2eaz/ei7Fv2oqNcuXue3cH/Do8wZt08b+onGnrlkhdOSBHhJ9wcd9iWGKrlg1yMtyQ6
         xniwC7MJXl3Z2v2E5jST/IXgQpm41POPXGfCxIpI03c7cz/40LkDKfqmSOqRIJ4E1rFT
         Ur7Qm+kSVbO1+iYpa6hHI8xlKwIxLhVZPf19+DDPDL05H0TUMwBhdtk7MuITaum9DYZy
         rJzA==
X-Forwarded-Encrypted: i=1; AFNElJ/Yirev8MbbXiffAby3EnYUtSnd0QPB5YBsBNfv9e9Hi80HFwA7iWwYlPUrINcCM1MbwX/yl5HSHxXl/DQ1uos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00o0F0/IMiHyx2ubBdnpacdeCSoXteLlvv0L8UJjaT0djCs8r
	Z5ixJCUwlxrTklNmdVC9ssg0iEiMUKZuEZLwhdTmosa1sin0tDxUYsrmipbqNRZr77o=
X-Gm-Gg: AeBDiesh51JXJ2B7Ez0EijtxobQ0ZXL9/eU1ZkC3jhfGGlKRIkgdDToC3Fi3yTo2aZc
	/8FJ467Oj6lhYNIPzGS6cWxLAFM77xHC8lDvi6HumkJd7pXdjDIk0WYVDjfTroJm6BF6xrTYBUw
	nEuDi2KIDLvXULiGOYKlB5p6kEO6ityD/VTCdt6LBko0i8vKe2IL0AQ7Vx94g65Vr1zZK6hxV2M
	sCJ19GvhbKN2qpiOycjZUYCDgIs8NYrn3dwmq6qFTq/xVykF36cD7Deo9qebQb59yFNtHk7chK3
	oAuj5WPRKCnC65GQZVBfKHg6NVFsc/H5Iw4vCjKA2VdHnbwpBCCRo+vMVkxHZFzscgNB4NSa3Ga
	Ym9DKgdE6hrdIOJth1wmXPuqXsHZjTYblR8b+oFsB/20Ad7dsPuH+9yITlULcaVE9XQS1wQEAmp
	Eey32O9bf7FiU=
X-Received: by 2002:a05:600c:c0da:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488d685c12dmr272771665e9.19.1776286799559;
        Wed, 15 Apr 2026 13:59:59 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6b5627sm3423734c88.13.2026.04.15.13.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:58 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:26 -0300
Subject: [PATCH bpf-next v5 08/11] selftests/bpf: Tolerate benchmark build
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-8-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2217;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XCKe1TjHfJlwSJAX4fuY9DLW2sOgBtAwMXzZhTx/5F4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGIQ/GwDhPKHV+R8rebF8BWOcRFMS81S8508Z9JJXDlNZw35XGIdfstY8zicLVz7LEf5figjWEE
 JMfBs4EJgvAI=
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
index 128ea61fd986..163552458327 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -891,7 +891,8 @@ $(OUTPUT)/test_cpp: test_cpp.cpp $(OUTPUT)/test_core_extern.skel.h $(BPFOBJ)
 # Benchmark runner
 $(OUTPUT)/bench_%.o: benchs/bench_%.c bench.h $(BPFOBJ)
 	$(call msg,CC,,$@)
-	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) -O2 -c $(filter %.c,$^) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-BENCH' '$(notdir $@)' 1>&2))
 $(OUTPUT)/bench_rename.o: $(OUTPUT)/test_overhead.skel.h
 $(OUTPUT)/bench_trigger.o: $(OUTPUT)/trigger_bench.skel.h
 $(OUTPUT)/bench_ringbufs.o: $(OUTPUT)/ringbuf_bench.skel.h \
@@ -934,7 +935,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
 		 $(OUTPUT)/usdt_2.o \
 		 #
 	$(call msg,BINARY,,$@)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o $@
+	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$(if $(PERMISSIVE),$(wildcard $^),$^)) $(LDLIBS) -o $@ $(if $(PERMISSIVE),|| \
+		($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@) (some benchmarks may have been skipped)' 1>&2))
 
 # This works around GCC warning about snprintf truncating strings like:
 #

-- 
2.53.0

