Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D912FE56E
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095054; cv=none; b=fBCjXMQLu6ny0GUap5RqGJmtQ/qzL+SFpmWzO//I9Z2GfTMYMVu+Q9v4BEYWplAr/5h35STPBL0EH8aJYRxkCm2HeASwNKLWfZv0oAgOcuanOdQFmfRd9N1o/bC22bMZ2fNtG24sGxGdgBqrSfotvlna+R+EkQXmwki7/pYVD9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095054; c=relaxed/simple;
	bh=i/0OlfT29DMUOjLxI+zP/lSGgbixizaY1dSO2x2Y5o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEpshsqurF2Zb0ib8MEtbD47WBF7ivoPOv/+l1XsShdoAQKF3ylDZUMI9Hx8WBkinG0RSEj0AHIMRgacz+2Kb1oB3pZrNU7qvbMC6viXduF71igj5J2wzcRWj6pDQAu9Z+phrfT+HF77cVZTdc0bUvxN0weO1pEAGlHQ2Q7nZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0iGl2hc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0iGl2hc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e5624c053so1080558f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 02:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779095050; x=1779699850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYpkMhrLfOeREVg1A6emQSE4RLjyH6VWZIyJ8FRo8sU=;
        b=W0iGl2hc+IvDGg8O89hdPF4M60uNm6FefAHNtWPf1fpEZDArGSDw1aPxpvmy5WgxAg
         Z0KRzZl+KWtzrFqWJkjnazhIs5CVcY4BEL/ge66JzVDzl5HiOaLNr0MogRMKMMmG/afe
         cBP8IgtRAd9wZ3HBxgDb6PHx9AnliIgSSPs8jF2CYy/ZOPEErKg6vY9w/mLBED1fqtvF
         tHIlaKYYhMVJ5y1cHIwqJvm4EcNI7Uu+LfvY4MZOGVddRPL5sEIKARlgDyBKYUABuEOB
         LoCzttFdmou+XiXPt+K+IxVkXhcwYgNgd4LcxQ+inNnt+0002fwCwM46M/go0E9rCPz6
         1kCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095050; x=1779699850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYpkMhrLfOeREVg1A6emQSE4RLjyH6VWZIyJ8FRo8sU=;
        b=kQM/oCflBj6kC3LysPsN2/vwH0tdHyKHoQ30/Oq4s4QCh2lUVFSc9smDF4IaqCvpwM
         69JmJAwoa5gExFS+YH8BgnLs/qF0ojspqieB7dThrFevEjf35BST7NtyGmS7ZySuFMYd
         +J8fJ74LB/XakMPPSA29HieXHUU9yKZYnnG8BCipF0/knwTzYi0nyCVkJPxCoK77Pr+9
         IV/od3eA3vmabWXmZ4+oFGbQwH85dT/GvZyHFkpMqJHheAOMQBuEoLwmc/4W5MgkZ9Ma
         qFD4lWXWmpVxQ//zZk6JhSIjbfgEcwB+c5ef5l8H3tFBxyqgd//g4E07snex5a9Az9F4
         3TgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7IfME2AvvOc+ngONKVjDHG+IdJ/f8sGr3MK60xpDaw5IYWYUWegC21gPKMRQebhSeRvY58B9ZqRppjC4DxdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlmgTDVFMihRRZDhDJYq2D5ZRvJ4dvzsmBuyBe8Me9xgjyO7wo
	zPn7dTgccoocQWG206bjYWmEOqY39xbMf7Hz3aD54TJYQcOOmChy2MDwpWa6AlDv4sA=
X-Gm-Gg: Acq92OFnDDSQC4WYf7cTYvTQ42BqnJ/8ape05VMoZXwV1jOvofq1lWFLjuw3OdwnAMJ
	hDgm1GwZver9VmxqYYC726GGTbgTfu2u6mgKWpSH2Qf46POUoabwZijTEmwfsOJlQfWWICXEL2y
	HSF3T7C29aP0boXhws9yj7NYNU4D8uRdgNoaY6WqYsMV23yV+hK03pHc6q41DxeGxkFG+2CXMgH
	//92l3gAcYc8RbxFpjjDqiLPWtBzf3zfA4gu7O0gHXXq3laQNL3wlJeEmDE/oYJQhh1f1lOdoX9
	PSiv6amXy/bM6KB2lbwV4u940JNVofA2hFzgkySIBgg0+J9wtFv3wscQ2D829dVaf6r4j1sodYA
	lytYlr8RCj6LR4LvOGSh3v7Nj0jGzpENZcKHEJnNsWiaWgQsRe6mxPIsVc2uFogKEPp1LVSlVR0
	aEOmq/WqC84Ett1HLc01ACdUNnSV97N8Z4
X-Received: by 2002:a05:6000:2083:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-45e5c5dd921mr22974719f8f.34.1779095050244;
        Mon, 18 May 2026 02:04:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35084436f8f.5.2026.05.18.02.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:04:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 18 May 2026 10:03:07 +0100
Subject: [PATCH v2 1/6] tools/build: Allow versioning of all LLVM tools
 defined in Makefile.include
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-james-perf-llvm-version-v2-1-f12cc4f031d8@linaro.org>
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
In-Reply-To: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, ihor.solodrai@linux.dev
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

The version of LLVM tools can be given on the build command with
LLVM=-15, but this isn't applied to all tools. For example $(CC) gets
versioned, but $(CLANG) doesn't. This causes a Perf build with LTO=1 to
fail with an error about mixed clang versions:

 ld.lld: error: libperf/core.o: Unknown attribute kind (86)
   (Producer: 'LLVM18.1.8' Reader: 'LLVM 15.0.7')

This file has two "ifneq ($(LLVM),)" blocks adjacent to each other, so
merge these blocks making it obvious that all tools should be versioned
consistently and there is nothing special about each block.

This also reveals that ?= and "allow-override" are used inconsistently
between the blocks. "allow-override" is technically only required for
builtin variables, but isn't only used on them, and doesn't do any harm
if used on a non-builtin. Make them all "allow-override" for
consistency. The only functional difference this will cause is if there
is a file level definition of one of the variables followed by an
"#include of Makefile.include" which will now overwrite. But this isn't
done and in a later commit some of the duplicate definitions will be
removed for good measure.

There are also some other LLVM tools that are not defined here and will
be moved in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/scripts/Makefile.include | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 41971a68972d..7022e78208a2 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -61,10 +61,18 @@ $(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
 endif
 
 $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+$(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+$(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
 $(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+$(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
 $(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+$(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
 $(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
 $(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+$(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+$(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
+$(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
+$(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
 else
 # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
 $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -72,26 +80,21 @@ $(call allow-override,AR,$(CROSS_COMPILE)ar)
 $(call allow-override,LD,$(CROSS_COMPILE)ld)
 $(call allow-override,CXX,$(CROSS_COMPILE)g++)
 $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
-endif
-
-CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
-ifneq ($(LLVM),)
-HOSTAR  ?= $(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX)
-HOSTCC  ?= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
-HOSTLD  ?= $(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX)
-else
-HOSTAR  ?= ar
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
+# Host versions aren't prefixed
+$(call allow-override,HOSTAR,ar)
+$(call allow-override,HOSTCC,gcc)
+$(call allow-override,HOSTLD,ld)
+
+# Some tools still require Clang, LLC and/or LLVM utils
+$(call allow-override,CLANG,clang)
+$(call allow-override,LLC,llc)
+$(call allow-override,LLVM_CONFIG,llvm-config)
+$(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
+$(call allow-override,LLVM_STRIP,llvm-strip)
 endif
 
-# Some tools require Clang, LLC and/or LLVM utils
-CLANG		?= clang
-LLC		?= llc
-LLVM_CONFIG	?= llvm-config
-LLVM_OBJCOPY	?= llvm-objcopy
-LLVM_STRIP	?= llvm-strip
+CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
 # Some tools require bpftool
 SYSTEM_BPFTOOL	?= bpftool

-- 
2.34.1

