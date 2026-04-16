Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100E03BA221
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342130; cv=none; b=KXg1k7nu0CmvT7XoIcA0iWKIjVqTdjmfK22Pxn1M6b+chJSN5SNZDx0ci1m/1D11Y67DjYBuGuVrsCVHH2Ql8hM/qFmCjATIAxjmc2GUvhrpWxTmJoo9zXicAhBoO+fv1YMsodS/IYCe+1OHYj07cjIyoI8nt9s43DMl0EcYykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342130; c=relaxed/simple;
	bh=+YBja3AAyMuyPOK7hY8a4GWFTYXYPSBMUIrp92cTH/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTi4BDmmGgYr1dXBtTeHRWk/LUbyp/CIgUJJtEt1qvUWy/8RgAqAdBNKHRN0VfMgevyJQVhYNdJ/U9FMTpcq1fY1MQXzJmtL9ysXR24RrqTmSQ7fXpCLsrDnmT/q9WjD6J025K1ZtQWHGkDjTvqn5aAicaIe5rb7TnINzYNQYsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D+ULfnEV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D+ULfnEV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso77474415e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342124; x=1776946924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvrCOjn7+Dc7pEGNMqsF8NC6gFHe3KAEuMAKz+F5t7U=;
        b=D+ULfnEV1CStbBURrGak8ju4SBJkwSwwZGXDBwKDCqChiV8pUGQ0vKN2SMAejuwal4
         m6XmWp229lv/ysZ5PbLfhqiVmUrP03vsqzlZeiRZOwinqWSD0rHtLSbkwfiy0AolzO7Y
         FlsJswOrJJ344GmAzAplC3exPD+L8neDVI+AXfBESA3xuLe36QA0ivcsyy2/Liahgm8U
         yTMs2ajmjXiqdaUAINoOZ5kNgvYZ7jlHxa33GrPF3Rup7V1NOJjLMzwQItW0YBOSpiga
         CwpLy5J5dOIUEXKnFNJm27oOCswCvTZxypJ2b6oBYgZeTM4pyowaSicO3hlan77wC+em
         oAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342124; x=1776946924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvrCOjn7+Dc7pEGNMqsF8NC6gFHe3KAEuMAKz+F5t7U=;
        b=GJyxNkPBWLD6tzRdFAyWL8ycJm7NILy7LXIBRFk1c0STrDrBII3OPYmwaz6dNqX5du
         +XB/xqbytkDuRQmpIhuLi5OFGkcXK1nwjmLxCXyUKQnsG0/GAAdUsFUoYljuX0yMl1YT
         zOaFAlWcOXn1mxyaLHorc4bTArnit0ySknBkjM+UpvN6dAOR8/a7z2nz+sjS+VcdOFCJ
         BXjWo+nZk7oju+2oJMo669njdDUgQeltQYql5XIzGjkV2UY08cyRztFoo3csTZq2UkOY
         VGY183aGIAooGLoik7ESa7VmYj9nOYxyEdis5CC+Bmg7f0whtHlMZN/d+b7Hm5Q9fERb
         US9w==
X-Forwarded-Encrypted: i=1; AFNElJ9hGgRdMfe1NTjG5pPi6Y4jY7qHSDQqGzkyCpoa8UgZTpFnnvTOhdn/a6PY8RVzYHYJ0FRkL4IS6Zz1/Dh/Yls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm6g2wQaEu08/PYmWrwYLcLqXdvJsSK2taAfUj5wg2TEaU6Csx
	X0wEzTbAIIq5WZ8rXS3HeDPeBcdVqVbGMysH3u6IJ6ogy3nS5aQPa3ZdaIpzabRphWV/RL+C+i7
	PfpmFjo8=
X-Gm-Gg: AeBDietON3p+jcwm6tTq3LPlR7uCBXuHKqkzgrOyaAkyAQ4OoXGuGvza5nWLjGDCkmL
	8SZrPwM+tkmq4kf89y//6Yh0wD8JDOxJ8gOcKYw6WtgFitEGcDvuydD3gKWsfZNKvs9KFCi7wgK
	++8gxrughvQAUCBCrAqBI0p3iaAxK80XdHKcm/W1ivsjJQd72oIoHEp7XnZzKwUNxyHk3MmZqpr
	GCS8KjTIzvneyTO0UMS5Zxx2KSc8JSTPEBKq8a/Y/AtpjLrnNJ4F2fAdB5U31WgcLLjN66fR2s+
	IC7OSl5SplQsZVoava1/NlYjlGhBV5GKSt1PX1dPtm2LIhcJFdCeVnaARr2/DI8ySAouq/9FGxt
	62QsSgiAsn2fz1rZc6ZN+dm4k9yFMnpEO8MJ9LjUeN+ukqJ7YiS+/y4EwbsTqo8FpIZSRHAxLsy
	65J8nLzM4pKVc=
X-Received: by 2002:a05:600d:4:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-488d68ab2bfmr295279095e9.24.1776342124135;
        Thu, 16 Apr 2026 05:22:04 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb84673sm7164252eec.19.2026.04.16.05.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:22:03 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:25 -0300
Subject: [PATCH bpf-next v6 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-8-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2177;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=+YBja3AAyMuyPOK7hY8a4GWFTYXYPSBMUIrp92cTH/A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCjJr7qrZTvsZeXw66sAmgEJNp6GdcrYlWF3NbAxILcL6xQzFchcMR6yXSO6q6ybEvNTrrLSd05
 jOLUJE3UtxA8=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

Move TRUNNER_TEST_OBJS to the order-only prerequisite list so that their
absence does not prevent linking. Use $(wildcard ...) in the filter
expression passed to the linker so that only the objects that were actually
built are linked in.

Place the wildcard expansion before $^ in the filter to preserve the
original link order: test objects must precede libbpf.a so that GNU ld,
which scans static archives left-to-right, pulls in archive members that
are referenced exclusively by test objects (e.g. ring_buffer__new from
ringbuf.c).

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 5ad50d3ff2f8..79991dc98ddd 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -758,14 +758,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(PERMISSIVE),,$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)) $$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.53.0

