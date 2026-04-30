Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380E401A1A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553619; cv=none; b=WyayW3ZyNSdCYJVJGoJqE3mN0iQr1w4usWEBIR2ZObTs7yrhv/bg0dHzYxAjif8CAbpfFXY1rfz4YsRYT/ZCwWdcq60saChzvowURfGR0gvaaI+rPmm2lqjP/RNW/h7Y7EBYMt9dBy7J0fW1yxB2MLCPoJuWuG/Ky5sTf7eBlu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553619; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzXdMcTnjRBcbZR5dSgIg7hN4XFyraDpysMqOe+mOJbCEej5aJe3aOgJCLHEc0Oqn8F8rgZqx+N4PIZ0/8WMhvNGAmltyfkzdJnDQ5jtVg8HpwjaEl4mphiV2qVFjj3hfcylWZ1GI0/Nw0F2jcKeTk45Q3q0acJspM9BYlxtcaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NCHtlnwg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NCHtlnwg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso6460895e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553617; x=1778158417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=NCHtlnwgNKqI9Uvd8Lf/aPyw1jKtiG/ewZLGly4LPocHNcsheKeKfrdTTYmyUiYhmr
         xJhucsQq6uwrdKd8LKgOKCklg9XRW4zgfsfppQwjvQn28VpGYVD54ZROLFmh/WXouv97
         QvNxtuucrelwJLH5W4XX5o8QvBzUqjyD1UGjP97vrhXcHzRdpsLm7EXmd8rALPG+g32s
         opOK6ozFz7YshkdcXYp/izRHuv2iUCaZVs1b3EIyY2wPVLTNqdWLn2sIamDTYW/lmEe+
         S/xCUgWnN1fT5vGdj6Ns+7XGh3Hd1GsK1qN/tQkGdF6RvqVxmmqUBmtIpMAzl1GLIr91
         myjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553617; x=1778158417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=DtCYx5tThSGzRfKJPuhKjm707YYGH2fN8Fd1k8QQe2tuhfxN0hxEUpM5hKgxpTzXHg
         HlOMcaZL+qkT+YZqsW5Zh2MXPt4/suqKdYzfGN4letRaE6Jfy4NK5Ey8jZHNLucZqlyN
         7tfneyXG8mELe0Y87S7h4SNo61wlNX3wVsRcA6E29JSlbaGIqvHqeTmBdBz9fDcQfhDW
         TVuXGjGBjqHF46Wb85AcG346wNhgx9rqMJGg1AM//HKmO8g+DDi20PEfEcydfvaX13e0
         SUK31q9tbOYwkrmcwN9YyCY1WCKUYGoWP9eRIOa9+MP6COdpgYbKEycnjD6uVSZiQ0az
         eICA==
X-Forwarded-Encrypted: i=1; AFNElJ+A3I7ZulzOKz3fD64VG9MLojObqiL2C1vxzqub3/+NBPQioo6iHDgL4STBARSJ7fhE6qy6OQDdajiFM39wJjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FwEyICEodow9M1MHJp2AS9oVFaTXDLFksTN9dglZK13MyKC2
	7DvX4EH+GMRUHA5JU00utX9jhmOPA78OHhaf6D5QFzJgFQ4N7bnrbOmkrMISBdauymo=
X-Gm-Gg: AeBDieso0hzhTfWjVJbsKWwJx0AVsc8XJvnxJbuzsB9n5GszCBMHzu3U5tSE9dtcTW0
	PP3XmjhfkykE/E70cH7O3wXfmL1ERqJCi4g62HpcTRZHSnI2ZLUyXsewg/yQeG4PwaKChWWk7ov
	uyU6tnurMy8p9Mvg5+OjflRJkQ/aamiINeXokwXtFfT190MKqtoQPXMVmpCcDZFc0pagLJUyvIK
	pzPcJehJ8Oc1bTAt52/dERyaJAnpT0cbwCizF6u+uIqXk4B86ImtNh02qfvifsRuCfPWSv9u3fn
	dcRQOd66uI2uNDRFxDxgmnBm5AMdXU7dS94MKscKTm26wltQK6Bh1Ui3HDvuBx4amMdz3gpD5AT
	5WXk+2GoeNetYGzLK0aJO+KMxmyEniGjNmO2iWekTppBSBJTnAHblaha+q/lPdZrWpkt0txkmk1
	MDXFSnpRyTs9y7VMmMGBNlFzjS
X-Received: by 2002:a05:600c:8b0d:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48a8451d095mr46117185e9.13.1777553616550;
        Thu, 30 Apr 2026 05:53:36 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1bf8ddaasm6815518eec.7.2026.04.30.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:16 -0300
Subject: [PATCH bpf-next v10 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-4-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJIjnHCrkesnvZDd+1xOOBY/I9I5aTn568IujXQ9IpcHNyVhJvVFyR8S5WD6xdKtB20+tTHHv+y
 eD6jnHos26AM=
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
index b104c687dcf0..9a4d8bea0c18 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -170,7 +170,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -732,7 +732,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.54.0

