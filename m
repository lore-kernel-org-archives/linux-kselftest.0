Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF78138CFEE
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286787; cv=none; b=oEUMi410LcCM/H/xk3lVEAQECRMQV0uzrWZJ7NST4r+yqn1KtUyw0Yjkt5Cwi4pxMMv4TZqRoSWUiCS8/amJj5qmGfC1OZD2tKdGNYvXRMvB66eXigz9qumBLGn0bm5QpT/ToHoDnULdKMyvTp+oVNsA4T7qDisYx7CRsHi2zZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286787; c=relaxed/simple;
	bh=jf/lYASugDruBo2CvozLAvQJRNcmvI/0KtRg+oBQlXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zchr5lW19kEcKNfqLRXii3LCHl23UTFsTw5b03m+U3ZpHG8wJSnmFpLrANx/8KIpbw7uI85vVp/XMlQtaq8jcgv0TnNSHFbv/scPCMONayYg2riB8fB35+F+ZrB5pUovJNoXkaXtmIDa/xwXZv/U4h4vz4RyfzENVlwjSbKn5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SamwDOqy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SamwDOqy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0046078so70885075e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286784; x=1776891584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWBVVAIazNyVJhptvtVZua+eaWOgIyfcbCtd+y2obXk=;
        b=SamwDOqyW/w8M2PzaWd6Wd30tOvyVY0ZDLJn6iSrEbv5gi+9G18OqBPcLRrzypNr6/
         yOnCXn/25VQKpa/XrzAeHHAnQw2u7Q16+uEhdGMkN5C38aAYQgRo2whLnhspeglEdi5f
         EmTAsHV6FJ+nCMmwQ4s1rhuCzm3svOduuMQ6GA3JGDCmd2WmKZ8McTavxde1dmGuAMbx
         4lGOELLuBKGe2JmEYPIYDLmC84+uxtr0u8gifzLzwS/NVBjwU+7m59f14lC3lXMkvM07
         Nk02QiSy2K2VJiJ5SVH8QuOi5oM3CWNFyPRGO6gQ6SuGpo6ZfFWjeTW7mWi3TRKKBrYR
         dTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286784; x=1776891584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWBVVAIazNyVJhptvtVZua+eaWOgIyfcbCtd+y2obXk=;
        b=LJbRaJd3eFdJy5NuMLL1FonHQoQq9u1mYnKoEgve/I7Zfcw4zVM4z8+OKzyWtfBcEG
         Ujopvej9uq4na3JBdNEQlpEg3Mk47oS9ioVe8BtgYQHJbXHl9fWEXzdfzjm/yvYTEXBZ
         rvDnt7FhRr0UqlWmIUbX7FFpi5egoXWzi0mABGVm92X3zlVAhDqUuwlYlD5QuRzdebVS
         xExJITZutpddIKJx0ioYm8MLheQsC8Fqp5IEGWsXsVuVwxudF+vGOrH/iQYs0qQG2HJm
         uQKUizNVKre+VPXyee/45Sv2CGLZG/MNhX5fuT5w1ZO4uDClMeEIiUhVuIwG1svfJFyF
         g/AQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ODZPQL1PFOIlpw7X7ZXY0aeyN6AGXl0yE7hGi6LrXCCgGNJnT7Ff6igcXse+qUGtV/SoCF5V4kmd1Oprs0Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz693sSfsODLtqGYL+4IP2YnuyLw6dVpfJMMky2HJfA0a8vP07z
	vs4u/hMYw2nvrH/nG76kLc7CosYKJAH9smMyY8CTHa63jtylIqvC7igWb2bMH8xha54=
X-Gm-Gg: AeBDievS6LBKeZqAn3yPsTEa0WM4EEK3O1uY/EfxvqsGfRsB9ru1OpBT+uO9IcVvRv9
	qMfIFAYQaR+wSBxEZLNLGKqgpuB3e/BH971qv5TKNBet6c/TEFRWmc4pXpG5/dM8qSXTVDjJXFZ
	CIpAbqQNQx9gnpL+Z+CLXIYKNk/7LsVW8MmTNBz7LKpxdW9/G7n/VfiKKt8OMhPzg1HXeC/5+6B
	dX+r7+EDUPLchfxKtRa6qBO8C2UYmDpfRjLA16t+KqPyJMwdh2XmFEhrK1Z9zkXUUiM5WfQCqJ4
	/rmsO3CteiLumQEPpXW3l5yKocZ73Z798+/5E9SV13xF5FWhNCO/cexPIO10nt5fY74dfa2gSxM
	NOhIfkXTY1O3O78Q6pP7ClSzXN6qjXuQnTdwwG+bPb7UKlaMuL8Pr8PMxXfk2Hcohi1Ek1vSTxT
	436f5V8javu6w=
X-Received: by 2002:a05:600c:c0da:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-488d68a10e2mr277440585e9.31.1776286784356;
        Wed, 15 Apr 2026 13:59:44 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c90cd7esm5413125eec.13.2026.04.15.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:43 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:22 -0300
Subject: [PATCH bpf-next v5 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-4-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=jf/lYASugDruBo2CvozLAvQJRNcmvI/0KtRg+oBQlXw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM34cirDbmhRm1nPaul7h/ospSnIGvJSl3eEH1VlVZwcLyto9/noFt/cTRess+j3NXHabjG9xfF
 M1J6t43xiUgc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

emit_tests is used while installing selftests to generate the kselftest
list. Pulling in .d files for this goal can trigger BPF rebuild rules and
mix build output into list generation.

Skip dependency file inclusion for emit_tests, like clean goals, so list
generation stays side-effect free. Also add emit_tests to
NON_CHECK_FEAT_TARGETS so that feature detection is skipped; without this,
Makefile.feature's $(info) output leaks into stdout and corrupts the test
list captured by the top-level selftests Makefile.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index a305d13409e4..040617c01bbb 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -164,7 +164,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -719,7 +719,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

