Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD2477E3F
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119193; cv=none; b=iwBRlcRcbv/2zRvsP4z+7ycY7v0uZp9sPiJKPXxx+wSSldJyMwLvMS/q0wB4YMFCkNaqYAo7qonPRK9PqN47abF8AhP/X1Y1H0nP+0SOCRMa7r87HQKCbUtBhQINKETtWy5YJhXj+Q0sgMXoJjQXGhDMj4Eqq/vjXOjvF1S37R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119193; c=relaxed/simple;
	bh=vierWn7zWoMEGxDcMMkTIOifh9Esb5HXc5nNQCPMiog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONyO0V3uVMhcFhNME4NR+ATwcMVEIDd1TRLaVNjPrDCv6LHM6GdPCqo62DYiqe4CBHyMupTIXx5Dq+RmPt3DR6C08/yUnWSKeYTcFvkop5SDVGIrNj3qw54F20ymjvyACBWFnUbfKa8Yeu0L2Ps0pyxE4AykXi+PyVqJ2gtl458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iscuYHnW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iscuYHnW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b1710405so29396675e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784119190; x=1784723990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=iscuYHnWApalvTNdzQuly/cRL/b23iMExltOin1d9eUYgcNlDnNcR1kKcBLkCTF1dJ
         iJh7GWWgxhX6TUUxa9u2XdS2GJ1Nrig1lxIkRn1NV/Gydgz3yhTFTDbEPaawyMHoAz6D
         iaiK7YFMBmjVvm4wPpQepXeaQhCCZNQ98AFKjCwLlW/d/faikV0Dukcg7AFmIZFK4t9e
         WEGp3cEau3PZvlCsflbDgyJm7tSUEXFvQWj7bexPSeCsVdfVuRchq81JLSx0fvIAxEyh
         fb1gJP8gQwgQxGAcFVPBKEjvzVSOiDLQ82tQyTYOpcGFfqqOTEkX/GUGA7/5czecc2al
         oEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119190; x=1784723990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=rlYT7D/z4KQIAZTNjJrH/74ZhAasG901sfFHAv5TbrP2BJC6hWG9qr0Ece1apZ42Q7
         1ukAGG5JUc6bHwc3cidnsPT8Jh/Y0zOxJRUWUvz13FiuQsGv+gfnO296kCe+/Kyb56Bh
         +BHgRXKYk2jsuPZALdZeMMcStn/6y5qcxUED8I+gaUvnxmPSZlI7YOBtzQhrYms6Ujtn
         eA2QrEW+ef6flwvh+mvVBD6msnbMRebXT0kBva71LRlssiDExRv0WrAoXMTIpRmbYvU4
         6IkHjIhCRCzGkK73QZ7AihFjT68uVVUv4hwBVmvTFxwB+AV1bRXiFlDTUXzkiGzB06nO
         sTmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJhRy4X399edy7HEOJQqwZB9PX6wODATgZzhtzyrbrGEOJ0s/qGei24UHPST/YS4qc5d7JD6UKj2Wo+I8L528=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEac1oy+EqDyfFZEjSZ5uI+CiUKhg5z6ugsFLx9C46Wnf89M0
	6PzBMG0dVoQpnfEI5wzKutuoLFkl07rKgi5ab9BYZjI/pytL8rsVoQKSs1isGTVSl/Q=
X-Gm-Gg: AfdE7cmj/4NJFSBrMet6zDr+phKfp7LBNtU19B7VFSknv6lNS1LAGv9So7sAFABjOU4
	iVq1q3IFuqYvih2/jjhK9b2D4tBQPLfW5ng3+pE3JsczFZcM7sMVrcPzAGGpmv2OPINNc7Iceyo
	XkhPPrUHdU+BbIxXQvz3uFdEHRCWU7/OZDdtaeoOrRLgNbiTXIn8Ix1oTg1b5L+q9b1tU4TqSiC
	q2EKVA8UYU5/8Kx2Bdygb/CbaPCLhcPtWaHg9gLq2JvocwhMUS5YWR+lHXYBW1Y4h3X4bsIgCa3
	vPxIhpXJq7zddkrNyG4cSvJrHQqmUvfGbQEArYDqsBSw+0mrXfHLjhA0Tj5U9rXbq6RXndNvtIP
	vQUEJWneSnmxCog2nq0BjYOXbbSl2XvdrS6LmviVLv+yF3svFq/ODkK6QCtGESVRPFE7NPNQpCS
	iAuOdnY99fzajfgXbonSR8Iw==
X-Received: by 2002:a05:600c:1d9a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-495384a43aemr83497955e9.36.1784119189932;
        Wed, 15 Jul 2026 05:39:49 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c710facsm32360695e9.2.2026.07.15.05.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:39:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 15 Jul 2026 13:39:18 +0100
Subject: [PATCH v3 2/5] tools/build: Indent if else blocks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-james-perf-llvm-version-v3-2-8854bfe5af7e@linaro.org>
References: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

These blocks are quite big and unreadable without indentation. Indent
them.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/scripts/Makefile.include | 76 +++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 7022e78208a236604a681d45b1ff4f2128f412e5..e81e5b479c563321e458b2a7ad8fca2b4607a254 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -52,46 +52,46 @@ define allow-override
 endef
 
 ifneq ($(LLVM),)
-ifneq ($(filter %/,$(LLVM)),)
-LLVM_PREFIX := $(LLVM)
-else ifneq ($(filter -%,$(LLVM)),)
-LLVM_SUFFIX := $(LLVM)
-else ifneq ($(LLVM),1)
-$(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
-endif
+  ifneq ($(filter %/,$(LLVM)),)
+    LLVM_PREFIX := $(LLVM)
+  else ifneq ($(filter -%,$(LLVM)),)
+    LLVM_SUFFIX := $(LLVM)
+  else ifneq ($(LLVM),1)
+    $(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
+  endif
 
-$(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
-$(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
-$(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
-$(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
-$(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
-$(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
-$(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
-$(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
-$(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
-$(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
+  $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+  $(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+  $(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+  $(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+  $(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
+  $(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+  $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
 else
-# Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
-$(call allow-override,CC,$(CROSS_COMPILE)gcc)
-$(call allow-override,AR,$(CROSS_COMPILE)ar)
-$(call allow-override,LD,$(CROSS_COMPILE)ld)
-$(call allow-override,CXX,$(CROSS_COMPILE)g++)
-$(call allow-override,STRIP,$(CROSS_COMPILE)strip)
-
-# Host versions aren't prefixed
-$(call allow-override,HOSTAR,ar)
-$(call allow-override,HOSTCC,gcc)
-$(call allow-override,HOSTLD,ld)
-
-# Some tools still require Clang, LLC and/or LLVM utils
-$(call allow-override,CLANG,clang)
-$(call allow-override,LLC,llc)
-$(call allow-override,LLVM_CONFIG,llvm-config)
-$(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
-$(call allow-override,LLVM_STRIP,llvm-strip)
+  # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
+  $(call allow-override,CC,$(CROSS_COMPILE)gcc)
+  $(call allow-override,AR,$(CROSS_COMPILE)ar)
+  $(call allow-override,LD,$(CROSS_COMPILE)ld)
+  $(call allow-override,CXX,$(CROSS_COMPILE)g++)
+  $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
+
+  # Host versions aren't prefixed
+  $(call allow-override,HOSTAR,ar)
+  $(call allow-override,HOSTCC,gcc)
+  $(call allow-override,HOSTLD,ld)
+
+  # Some tools still require Clang, LLC and/or LLVM utils
+  $(call allow-override,CLANG,clang)
+  $(call allow-override,LLC,llc)
+  $(call allow-override,LLVM_CONFIG,llvm-config)
+  $(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
+  $(call allow-override,LLVM_STRIP,llvm-strip)
 endif
 
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)

-- 
2.34.1

