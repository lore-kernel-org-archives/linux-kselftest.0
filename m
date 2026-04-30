Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9140FDAE
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553634; cv=none; b=HhsO2eQHyv8YTNE1SpnAM7alWuGQ1O1eSjeqBJ6Xm0An3XjlMi8noHRroHpSbsMdWnBbr3ndt3yMYD7lJ5o8LNGzqNuUVSTTKTAQqDfw4uh3+gu85BdwCj+YVxHPyh4GhxTjxMxWOUUMN1QMBJ6IzVuybQBniPV6obRtXLkcaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553634; c=relaxed/simple;
	bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe0nLhZrZsMaDhg0KauWywxwSkcjbQX6qW8gednB0Ritr+Jbm7zZMW44veP5amtBqOPyEyNeKyOA88O1KBp8phQGegEAQtzxDwTeuJ3t4vbNomThOwm0nhbfG5tsGG3uO1GZfuqsS5KNHiptU8ICU79WHPGaAui8fMPxhyb9wcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U/6MQlw6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U/6MQlw6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so7887565e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553630; x=1778158430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=U/6MQlw6i3VPQIReT8bkpkgWOQiaApuJQQ30NrlDSP6FP/zKOCx3G5MKHavp99xZ78
         d/UnMFG0yq5QDHd9HUIuv+xzPXVMRFkCpdw91vAqlAjf0jlEMlbUAse7qB/dxv51FJNF
         sa8D20APeAJxVZcrAeaI8oyjNsDDAtZs/hiYhk4LWiLpMGMEb1EiqwZmMYGoUWgYemmR
         v7bnbytM3LAEQ9uhSju1npLzVqPYjyg+MswOx7TZtZnAa6iX3L9+Q4+eWvS1JDM7eKfa
         mVebM9xF12XpyZhKEBY39Ba0zusHQTtdGS7ZMCDDe1t5y5bfX76etASiT3ij2MZGSyl8
         HqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=KLT1xmJpz20E2afIkKqlRLbKdpqN7KNWUIZyhUaG4/8jhscvTLtCXabg0lwgnRrwt9
         pExUzLUGDo0sa/lCFchN7GdvWQsirtvQIkZe1+arXMQiqKYAtSLzw+xfuzY9ejr9Sz0L
         xyi4zS1vrsWml0XdaNhhQs0tVIiCD1PheBIwcqacvdI5U8r/2MaM4A/kd95txTA4BL8i
         pX0uLAAWcutH05Q8r4Go1s8N8ry/QvyVtIqpV+XDY8UzqqNcLWG8Z4nBTMvMVZ/hFqYc
         syNH3mDwV5QvlaUwKXqR7hGE6lfiTHAu1xLQguKo6KwW8F4r/jKGoga7QorFyhxQ5tD5
         LjkA==
X-Forwarded-Encrypted: i=1; AFNElJ/PMZH6QBLQS/aH/fZfxFdj/wceCaJsWjFVmOn7GDb4lCcEk0qkUCIOccFUZ67y/X2lXY73pIrKPAEFccSUVkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1UiPtU/AQuBf426Nv2HctzP3FnWQxFYP94RRZCby8PP2KSe0D
	k3AHlgOzZ1h4pS993wT3WVMLDyQxcrnN4YTGPd0aBe9j+Ofu5fdB/7R6yILVAXiR2PE=
X-Gm-Gg: AeBDietwwGGnZ/Ra1fzed2icu/4DxPzYUVWgQb/esModJ8vJDNlElavZ0FcIxsBsIZ8
	oMIEkR4ukRPGPW8JYwdOmqTUoaJX8vEeXaMeoKrzXV+fbOz8Y6XLjFw+WsG1wF3+VwmM1YgiAu+
	vK/6aIwDg5R+j4VQH3HdL2Qy1ovBc8t95Ahe4cXS8PEP43rNSjLya2SCGNd99efo5RscrsGfKtu
	yOEwRBzBfwnm55CdM1/ZttcGNq2sGu21LsSYSdJoOj+ad4oxS8yIG4MyDhxpjj9tZXA9Hm/+Fi8
	thY/2eXTPKw5kBf/jGR9OQllsmO1meFhVcXBKHmi18OkikmoylSk4YkCgfARfW8CDV75XCWmE22
	W5pfp1Ld9umFem2m1V+Kut1m64rKsdQeuUiRszGs8uJgg7UWHkQPlCC/Hk8k0rKQpoBjgDypVTD
	pzYzLg5lYj/4mfHdVvGe4swiiy
X-Received: by 2002:a05:600c:4688:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48a8444d7a9mr50732385e9.21.1777553629800;
        Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c07058esm8543218eec.15.2026.04.30.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:20 -0300
Subject: [PATCH bpf-next v10 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-8-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKqqdQsm33ueetLi82n66giduvjncuOEMLEwyV2vO+e5ZLsOaGwzTZasZ7Pb+J1KfYDzndi4FiJ
 5jpUI9g0qewY=
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
index 9becc077eb23..a64e822dc540 100644
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

