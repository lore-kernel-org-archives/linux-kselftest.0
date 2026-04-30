Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D6472782
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564965; cv=none; b=rPegrwefOldJyOG4r8BJY6X5Wl2G7kzV5xli20t1vaINZbgHMv4Suui8lSSmEb49bzw+MPq3rGHfa1YMLizou8+G0bJzwMTGpG4HCb6YtkLQt5khBemm9qMQx5f8W4aT/dUvq1gUagdJSIcY22+anshtPAWlYP53zi9JdVQxBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564965; c=relaxed/simple;
	bh=Tn5NUZT+pbq8d9j5af1FMYMU7d0yJV1oSa3Io45PNeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHlpzBDtrF0YTHQVWt+LP1OrVavijJeGsCzw2RoJGD2VEFqx/u+QSGEEu6DFyocFITLLWnUoFXjpU2ZYUu/DftND4hrK9A4MfqdBxPV3M1Bauw/6JLIRs5JWOT4WnxXYlKtqeAeLasL2MKUcG88bgO5hTJYvgg/jVQk4g/zZDJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JsKokeER; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JsKokeER"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso965159e87.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564962; x=1778169762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ/nC6oZIV/xRN2y3005qSyz6fuB0fLlWJ3jGKxB/as=;
        b=JsKokeER2VPkBVKwq2c0EFMSKbv9JF3K3xYriVVhx8LwbCPAlGEXr55Y8VmvXPxNMR
         yh2NcKwl63ydHVW8ZziozO94LmAObg4cZDBlGDwGajMAwcZvXbAG9FbMGsbcBm38k/oJ
         Zpuyq7MtwvT3kUNlyGN6AF2QGCrXBXZ1Dkqt1IPaey64Up//Rl/VnsypD0BydAIaow0q
         YJIZVYWbLP3ZnTE9+BDX1WpLUd5IToiDnOw395fnMv4R5p8hA21nc4a9E8MHVOfJRf4o
         Aa4xqtsY060djFMoP+erUeP1zETjFi8osD+1P8IEa3+o7A5Zh4nFlYEpRWWoBPOi1+pe
         /Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564962; x=1778169762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IZ/nC6oZIV/xRN2y3005qSyz6fuB0fLlWJ3jGKxB/as=;
        b=jBUFU6MsIgFoICA5Qk7RFzbK4xfi4dtsPi7KZ4/R+YvqSNFhCwURYCuO8aVwVxBBAt
         Sl0Rt0HXc0nBJ6cUHZX/TIrpQr/Etpiks2QUJlQdKD+LhZtufIj1cjLc+qs9cbcwo/Dm
         w5nmWOVAbHONWk8npEDCF/6Dg9Z9SZEjutJ6iqTsKeA+OFHKfovy9Yp0LEakxNniq5G/
         0rTZW9L3FBiKT6akI0PwxwTB+R9cXqHc16v/TOtz9GW5voS/omBHgRb9D83pXSt+cjel
         EMLttky+/vXog5lVmldHddPdkxTqTBSORIZiLbf+oasmnuDonU46+UpGt4GU1hqpdtCD
         idXg==
X-Forwarded-Encrypted: i=1; AFNElJ84Rrih7ptbd+cBUf2roEl/IYZZIgs2KnWPBNINDlm4R5FOeePfoMtF1yzRqC9P1NLokYyhHVT8ikIYHyOA0l0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gBehi9KRHFOCPC9Z2Yzt3xZmOChIKk2RtNnSDDB29ebqc+Kj
	i5FOXA735EeErDkYw9EYrZBs5z+2Kzw/IBESDqTrOCyGgLG7IC+u8DV82JeymKRE2KRPmKGeaFc
	dWmrT8pU=
X-Gm-Gg: AeBDievm9plmbEbkYaGf38UrsKXADFZAKG/D5DZ5rpPP4p9OfobVfQSJY19gVb0c9My
	bRyXNemnTnhUZsTo4YPh8Chv+FxJ+9KJJOjgwzdp8N1svBz46ii7j9ogsCsJMxX/mtiCzbmzk+q
	0Ni/TgoTfib0ZjvczTUfJRrnGM88D7+LsZVScOb5VAFh8jOQojTNTKCgN8mDARLtmZ03nXybqKU
	VQTqi+ICNGWmmqQJFHh8vHZlWqfQYT3y57/qCRkT0lNlMVzPEcISK1I6cj1peX2yfYU1m11RoQx
	X15LPIALPsOHkfWxyv/b5RG6Tb1WZ8E5p1sno6ZP6DdWS48oba7uPwdB1I5Si6DVFHyFpGA5c1V
	nk5ppOxpTYZsSKTrwT5F2dITwEYIU/GtkeXt8TXadQ+HuCDyqWw+z9U9zsNGrIY5WPz77XZQZ4O
	W79C7kPkBHtJo2oHbBisHe6Vf8
X-Received: by 2002:a05:6512:3ba9:b0:5a2:b43d:ac47 with SMTP id 2adb3069b0e04-5a8522b2610mr1204014e87.5.1777564962328;
        Thu, 30 Apr 2026 09:02:42 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de326a583sm9949074c88.14.2026.04.30.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:40 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:09 -0300
Subject: [PATCH bpf-next v11 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-8-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Tn5NUZT+pbq8d9j5af1FMYMU7d0yJV1oSa3Io45PNeo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB7rtyLKv2zd0Vo+lD7jhMZadO7ImkINeDH2z0HsbYRtg70xcDwaC/3gA2KGFzTlRajqwomOy1V
 fwc1xnxJEKA4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

In permissive mode, declare the test objects that already exist on disk
(via parse-time $(wildcard ...)) as normal prerequisites of the binary so
that modifications to a test source still trigger a relink, and keep the
full TRUNNER_TEST_OBJS list as order-only prerequisites so that initial
fresh builds still produce them and missing objects do not abort the link.
The recipe filter is split per mode: in permissive mode it combines a
recipe-time $(wildcard ...) (which catches objects freshly produced via
the order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but
drops the parse-time wildcard duplicates). This avoids passing the same
.test.o twice to the linker while still presenting test objects before
libbpf.a so that GNU ld, which scans static archives left-to-right, pulls
in archive members referenced exclusively by test objects (e.g.
ring_buffer__new from ringbuf.c). In default (strict) mode the recipe
remains the simple $(filter %.a %.o,$^) since TRUNNER_TEST_OBJS is part
of $^ exactly once.

Gate the partial-link behavior on $(if $(filter test_progs%,$1),...) so
it only applies to test_progs and its flavors. test_maps and similar
runners using strong cross-object references would link-fail with a
partial set and intentionally retain strict link semantics.

Note: adding a brand-new test_*.c file in permissive mode requires
removing the binary (or a clean rebuild) before the new test is linked
in, because the parse-time $(wildcard ...) is evaluated when the Makefile
is read and will not yet see the new .test.o. This is acceptable since
permissive mode targets tolerant CI builds rather than incremental
development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index df173f9800f7..04634e6e0661 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -773,14 +773,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS)))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

