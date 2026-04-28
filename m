Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF939EF21
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419953; cv=none; b=FLupypXsx4nTYAK2jb33IqZBBnuZAhYZj2YAwwx3ueDXHMGFJHeyFFv1+4adILae4PdRtKx8T0CTKyqYxpxkiRhqVMLWja1QyciviPKbXQvhCDeZv9y6M5SbL/RykcJpdrIAZvZLyu/L0z6jAbBAEn2vusmxIcYNBHEfgwEJgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419953; c=relaxed/simple;
	bh=bp6nwxzrFREUgn01pCEsReac6kfcDYuXiYr9ESZXpIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkVX5PGDXq3kShjWsEcfkN76GBqC/6JpyF0yColwRmLBdLKWvLd7cvRjfbn5zGXAIk+sOVZmzuYKoWPH20+0h2unhMdwjmFaJ3M0uHDd1GUszrIhnmwZ3LeA9dqD+5O/J1Yrabh7nymp/axLsdm+FVEtFlWc1ZXyyLnC/4cwdrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DJ10wR5y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DJ10wR5y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso123492545e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419950; x=1778024750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hdu595jYeB1D4K1cw+a/FSX5Nhp2ZnO92G/7aUFiPw=;
        b=DJ10wR5yT1PwTWCFYOwseh7crUIJ38vKaGLIi1g2W+5CSnE3FtZfEfk7p0KIf2SQSk
         9VXfdLyD3dgifX/YhmrH5hcEO5AEKxUPCexxx48YEmia+ExBkn+yA8TcNG9OMNsTbpGV
         cA+Fj++xhwZHjoIgPB6yq9siHtgtiWNqiETX4PI9dM2U9xbFADsi4JWfQt3SLJ+N8ie1
         ToIWM2/B2qWeOZqBVcCF8JHewmn/Hs//0qb6/8ixJOeONjaJzmvVzMEuxb8VeKTsFhwM
         k0dQlXavw5/OIQ4cK4uSEVr4bOR+hGdak2/9XPAa5IyI6wkAdiCWcF1M6aBhipE03FBL
         taOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419950; x=1778024750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hdu595jYeB1D4K1cw+a/FSX5Nhp2ZnO92G/7aUFiPw=;
        b=TSXWWyt26/kUc7mHEjBv03opRcuYTJUz8ircNZ+oJQoO+OaKGTlQSNJcLZc0f07Ie0
         tKqft4u0HKv7a4l+3E/GH19Epl/av5boVQG3v8lvNeoCPFVgtmgtajMs2BCJLlAWVRQl
         wybAw5DhdosuRXpd5jc0NZ2wWjCJ8YPd34BvxEQXACjmIgUS24c1ckhQRR+2U4t9AY9w
         /f4+GjylZXLpCQAyqxvl5ZGYcJyKoJjpxbY8SZtVwrlmpMYrlM64XXpZKTb+hZScEhC2
         AisYqK12yKL0he68vM4u4uG/ICM8VOL5LjxvbJ5HWua1HKRJaYmTlPUagb42k+nbKQWn
         Q1JA==
X-Forwarded-Encrypted: i=1; AFNElJ8VCRsd9HoRiFuN8ePyLGDt/Tfw2oU5dzO1Ex5qC5Nt0zAUjce5R1gujhbHZJOk7TRnb8ObjGmEhJLrjzbUDxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwemeKOEc3lMOoc2eFcpjDvG0ccJi0NAkUyL7P9bSSCMuQNGWOs
	cVrv09xfYPrCiUzcL3X34sy0a0bgdshIkTO+5b5FMlCStd0ZgeSVNd9Qqc4OUMQKB0c=
X-Gm-Gg: AeBDietmf68JijIMneFLY7WVprM/zcNu9ypbt8dfnny5P43FOp9+ftc+lWldFXLNOR7
	MvdU3kp5RvkFzAwJcOceGSmfnHx/dZ0tbzNj/WDjf/NHBwjvR9bd73MJtJvnDDZR6BRLIA+c7Jn
	PQ6NkEvzwcElpGUH9RCIV9NzEgaNAY/jswy4HuM4DVkhcEH8Gwarh/0ywk4vop/DNfQEmSsaPkX
	SdKvLpbW8yAFLCwBvpxQARNmjqxXDAC1IZgjy+/BdP7/8JQTLwYGIamiTBdDkZAM43wduz/VsHe
	EbgAaMDqHogMl3S6NnFEvXy9GhoWwi6XA2HEdCZ7/3F3N3CEis7pxvAqsUFotViOzWjDRT+WcDu
	EOttH1PKWIad3le9OjfAG4IoOFkK+lK4Fo7K+IkG1BLoKSb8as9s/yIuE4Z5C1HE9iGON1IbkH6
	RykrkUkuuDfhDwCFhNczpcKNve9/SRN0jnHfs=
X-Received: by 2002:a05:600c:828c:b0:489:1ca2:eafd with SMTP id 5b1f17b1804b1-48a7b51bcf7mr25090455e9.11.1777419950411;
        Tue, 28 Apr 2026 16:45:50 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7831df4sm131316241.12.2026.04.28.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:09 -0300
Subject: [PATCH bpf-next v8 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-8-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=3164;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=bp6nwxzrFREUgn01pCEsReac6kfcDYuXiYr9ESZXpIc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI0hxMH5mboGWDH9N3nD/FcQJitJcEB3D5vN43cKT82ONg6T2bIh0WA3f2tOXEcc0QmwtCIFLlr
 kbZw83cM8Bwo=
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
recipe-time $(wildcard ...) (which catches objects freshly produced via the
order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but drops
the parse-time wildcard duplicates). This avoids passing the same .test.o
twice to the linker while still presenting test objects before libbpf.a so
that GNU ld, which scans static archives left-to-right, pulls in archive
members referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c). In default (strict) mode the recipe remains the simple $(filter
%.a %.o,$^) since TRUNNER_TEST_OBJS is part of $^ exactly once.

Note: adding a brand-new test_*.c file in permissive mode requires removing
the binary (or a clean rebuild) before the new test is linked in, because
the parse-time $(wildcard ...) is evaluated when the Makefile is read and
will not yet see the new .test.o. This is acceptable since permissive mode
targets tolerant CI builds rather than incremental development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f0545ee6b32a..9a5177455f0a 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -767,14 +767,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

