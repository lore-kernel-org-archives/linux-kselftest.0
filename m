Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060763EA96A
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405432; cv=none; b=o7mWzmvEpI4GdcD0XJjNGma1m5ShpiGeAzXaOfFVIf2n/uwDAPo5GikRR87FrbxG2j1Xu5wEQi1izza/00q4nCrOWNkaTvStc/m5lSQhGdytlYY3dNwoapo+xjNpM6xvcAu9z6QaXvbBg+IMKzoRdGP8JT/SMzFV8pZpfe4yCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405432; c=relaxed/simple;
	bh=WDLnHiZPtsQn+nJrqLJZCP+unVavs2qfj0Icse9NGF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMSDNNi5c1aSqgNSLQBD24w7kcW9CmbMsOUef5AzWB9pu2BXPzxVdNUEXMu9GvGBfyYlLKTRYYF96LURxOfXpi+eVFhQhooTmvES0PFpC7DslIDNn+/FGQZr46TZi7ugZWGrCStLUGPpHrE+f+e6VgI46DolmyaUI0h5ZA+KuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K47k+/M5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K47k+/M5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bec3f69d343so342738666b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405429; x=1781010229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RALhkDAmVWzUkKWUeiSZlbMaX2cF2Z8Q6irmSkI6Xu0=;
        b=K47k+/M5Mnt81D1NBeHmlHjKLBcVWDW+b4FQVxLXtZ3yFD7R5jV+MmSQC+0gaeHnPo
         TUbU8eSwLkLdY7KtOFqTYkpHrxA69aNxegxHJxpzvg4WfwZYiCKL+sL5C5nOp/ld4PIO
         atrzYWTZWhnUZLXPpsgRsId8JA7Ia0qe+g2dKr5UNgcLQ/CIV7poluwxYPpAfpMmGSdF
         SM6COPql3NG7zYs2s1/7NGu8ZK3bVKv1BB8VV5hwzwIlV1lHamyj+C7UARN8z+vTbJA4
         XMMy33bPLK/UwU+fahHee3VXcWeP0nB1DysACafj9rRnTmckoM0ice3T02fqOHJQRd66
         wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405429; x=1781010229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RALhkDAmVWzUkKWUeiSZlbMaX2cF2Z8Q6irmSkI6Xu0=;
        b=ruETjAYflcCCnHjiVzIfZbFMlTuQyr5UB21Y1+CxabOppNp/eTY7bh0FRL6DoCf5Vy
         uTfSpO0K7Jrst86ymH84tE7DnZwFaTbSZNnDfe3mHKT+EBQQ+Kk5KWvx4rzdWfMli8B+
         5da1u5TgXm9TrAMI1qPY/GM8+4pIBQIEVMjF//LJBBznQwj16W8QRCRkV00ViZF99z5w
         o5k4atnvjPp1cIjfQtzL3yZl9gIN1khZ8qtSgzWZafb3hrV6z8eJ8Q2lB8RpU+9p8Md7
         luWLyqj5np2BleFj4ojK3rUkP4Qeqix73JkX06WcctQSPs+86gGiSWxt9dO1nbfh1Ww2
         PNFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PymLticDWU5QzZmPJOOEWxin5xXCIKXFaG8lF318tG0wNFCDyh1FH8+d9qtjSn6UpOh13mLFzCKNogKRryo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjC4zcNxgR0pdabOrS420OLaDuImTJJ1O+xFfAmnnSN08YMoc5
	qpg+cg1l5I31eYNfP5RgGcGjdsr77mPn6yGTIyVzAQXbu+gbuOO37Esu6+7GFq5k3io=
X-Gm-Gg: Acq92OFG9H+ZiKWDjlNpp81Kal9Dg15f9b+v5CVqrze69CCVhSSqM+jJRiBVjZ8RSLF
	R/AWGlN5AO7NJyR4Cg2OezmAnAN+7/LqCn/quOK02gVeM0d0Hp/znIDVNxjBYB2Eq7y4cWVWGQX
	8ultpL+PgGLyN6VfKc5iufztL1mpOX/0xU010ZBiuNe7/rQhqYEfv4y2ENBYD20x/sTs2dBUwRm
	01Ub5wPJpVB7C9/bG3OkTmfPdsNwBuHhg6dist/vV69QgOuXN2LTDEaNfD+sP/S3Bn7e5Ba76Ty
	zfP2elVYiQClvtkvF0KfHzjNIYZ31L/SfBrdk9lS5aVoWCEQjC6oqwXXILLYRCquUR0CeuWTpXM
	ep+JwdzZ/oOrkM2wjnCtt5qhR6v9C8EFTFzBC4HbgFl46M6Tjcb1sCXQNILo+splNfqolZGG53O
	ogAK6Popo2Z+75FQlBcULC+w==
X-Received: by 2002:a17:906:45a0:b0:bef:12f:346b with SMTP id a640c23a62f3a-bef012f3d62mr204216666b.15.1780405429527;
        Tue, 02 Jun 2026 06:03:49 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de5c60sm493403766b.16.2026.06.02.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:49 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:58 -0300
Subject: [PATCH bpf-next RESEND v12 09/11] selftests/bpf: Tolerate
 benchmark build failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-9-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=2182;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=WDLnHiZPtsQn+nJrqLJZCP+unVavs2qfj0Icse9NGF8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKMXfHUk1I1JTIi4GTbj16UrnRNnyc+KvHxKx4cxzf3g9RoKrr0SQ0O3kfcYEedas1BqOUIhlYq
 o/u4jLX9QRgs=
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
index bc845022a7ef..4eebc15670e3 100644
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
@@ -994,7 +995,8 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
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

