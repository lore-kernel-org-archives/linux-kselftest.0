Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA22DF15C
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751154; cv=none; b=W4Vlt6CXSxO5mnRPAjDX5gPTnauVomR85d16zl3DioOSpKilhVMMKGrhKIpn72z9DVCIX5/C6jbHlOdVBCZ2b4fiXR5SOizpFSUbwIfBq4laVR1d2r1JbbDWdZHLkxOSBM06Bp85x2hlrz1BjCGu/afhvFr4XK5xFbcmdOCDWkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751154; c=relaxed/simple;
	bh=i/0OlfT29DMUOjLxI+zP/lSGgbixizaY1dSO2x2Y5o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jasxUkW3K0QaknUqmvmKIDMydtl2CS8YxoVHgqPEwQ+n+dB0sdGJLDXa8B9VSrlu8OD/HwN/O6dQXNlwXjCPtO9CyoJYiU8q1fHZKeuLC54qiD4JfJm/tC+YHkvOoPOFVVE1YO2fRvR8GVOPuvinMRo/XvpWCyBnAct30t1WNE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oc7N0XCg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oc7N0XCg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-452169ae568so5955527f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751152; x=1779355952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYpkMhrLfOeREVg1A6emQSE4RLjyH6VWZIyJ8FRo8sU=;
        b=oc7N0XCg782m9kROF0mMVqhvI+mqc+mWHOkCKhYDuMP/h4u5PyK9qxx2prNIN3/cNd
         ghQ52IXpYduOnFmd9tg1goxIuU/bXtUn7UM6JHippkIbSBFNW888MKrLym4UIJifvqdM
         b4z2tS3jU6XHX8bq61x+MwMek8tUBWohFXc0vcsk5KF16WQU08lqbQRYcPFZIJVUvpYk
         sfmSgF+Kx69FAqrsWRGZrAEswJBSKL7qAC+TJ7eXqdFWZI7S5U28FF0mFm3J+fwnhQfs
         atTBVhsx5Dp/7+iXyDJFRJE/51d9UKVbYRjj+Oh8T+3PDBGTcL2tn003lVE26x6b0Us/
         UcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751152; x=1779355952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YYpkMhrLfOeREVg1A6emQSE4RLjyH6VWZIyJ8FRo8sU=;
        b=K8CnMMLkN3AUoN8d/SSzfrK5tCcfexg/NO/8s17W+0+D+asNdRwq3/YfN5BuQW8F5c
         dOZ8ouVNeY3bqQJPcTpAUGtc33G0cBoEw8VCkLFZzzTMvdOA6UaqIqyaHC3fKH80Quza
         GQOYVkiYoJOLqPquw7a+dvrDXB+GzuWN7CeqA75bKCV/tAx25HgRToh1UArLjqVK0H5s
         D+E/Rn7Ff5rLhxs7ut4lioCyrwwmvyoj3eTyuC3c0SqGIq6/gqrh7I7XI1eXCz0q/bX4
         m8S0Fy74U1NbOy43edqwo1qreSJwfuhht24DEkJXxRPMEDkPeCot5Q6X38eeLR2FbHNS
         eQmw==
X-Forwarded-Encrypted: i=1; AFNElJ/HF0dra4+KpMNycDsLwdn0n2lRxA8ONXHMz/cdG1j6JlmiTvAKXe7DLL+LwjcmygTU0JNYGAtCFZQ5Io5IlhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGPtpAvrXdPwhOi3JghTo86jaCCy196xFqu3SV4cnfjOGU2dF
	CdYQ8VA1PQRBGB39NM3TE0v2fJqQK+dFwkk6156WQVS0wde5vehCKGbwI99TfV531zg=
X-Gm-Gg: Acq92OHj/eIW1D4KreNjsr4qgwaMv+AFNjkH5MdkqjJ83bdXeMMYoMa5b6ZV+DQgf4j
	eWFoHPQr42igenwwKQ6POTWDEWr7d/gH+G2LJ0ywDSNkj3IqAUQBQ5VvawxoT37CjXFnES+c7oF
	RkyvguHutFZsdODPE15pEaSsE5Em992L3DBYxZ+qlLNypYhe/XtUpIrHzACiulfHBnoofzeqc9C
	0skfhRB4Eh5Ew/VjuG42n04dGmZpfDD+KFtZa/XHs3DAUUkkMLIi+FaCEd02KIVINBKKyhudlun
	je9g7BrnYUz/ILiZD0esPX/0A1iVKq5NUxJkBQba5fqa02mXOulPIJn0xRGUirjNW5tVebzsCmw
	F64hD8wCm7jopkA/CStcIKItq6tnfX4/jIWEEDXY9mtkdsJmQ2OfjwaST4ruWCYlEnl780evFAB
	OwafnU2+h5kFkmtBpKHq0TSQiJAHbHRSEF
X-Received: by 2002:a05:6000:4014:b0:44a:2555:f8a9 with SMTP id ffacd0b85a97d-45c7814a511mr10431648f8f.10.1778751151725;
        Thu, 14 May 2026 02:32:31 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:08 +0100
Subject: [PATCH 1/6] tools/build: Allow versioning of all LLVM tools
 defined in Makefile.include
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-1-6cac1a9a4c8d@linaro.org>
References: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
In-Reply-To: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
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
 Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, leo.yan@arm.com
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

