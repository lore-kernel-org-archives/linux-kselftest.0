Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC3ADB8F
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751164; cv=none; b=X8cboM2BkvnuaHWYCUfhAQx4hQiw0CYygP5Ei6n5/Kn9aJIXjUlfXzHp/YYiGE6+UbioVQkOQzdlOfKhzyONpOJnIvdxjObabvh2/DwT1nWY1qRtqmSQIJdVQt0mEM8Y2fywCUWQSmtjtyIARRDmkfdRuQirUMBjZ6Vse3x5IQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751164; c=relaxed/simple;
	bh=XYN2OerTukpjvC5uTpCQ4LBfsGgqw8htnZqoFgokKo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAfJAEBdW3/6anRMSeD/hcuM/9hvBii5p9AE3/AO/wrEEiGzc7XJ5xMgVeM6vCMTon85NlAMW3IqMEK8fmxaJuWe0EEOFymMiPovup02C1Y/aEwdBDxz5AzR6f7ajf5iWZIYzY0Qoqr5zMA032SC4GRMsrtt4v+HulcHUbAVoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qndKZp7l; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qndKZp7l"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43fe62837baso4071903f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751156; x=1779355956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuYOAkPGvNGtocwKIFKK4r5RpQsaxB3pkCmwnF/UVxs=;
        b=qndKZp7lDorCBa7sajI+CZYDZB1NuRkdNQ0d+iHDv/tiKuipVL58gdzg5bMk33ic+l
         Xy4tob6aYuK0gybNkNeUXOnGE8I7Oy+Kysn0zjXrE3I2mvuBpjY2lSAskTCLhKM9y/Ig
         V2CD2E6pcxCupf11HnAD3fOHsQMU4wAyOy8uoW6xHrS4tawDS1hEy2J9jBdjq7p+Y7dd
         /MsEtG0XzBdvMkr9duleLozwIPnvWLEVNYLW68gmbap4Ug/HfzbzWknouqgPe1gn/5ny
         0HI7Wop5qjEwxNV8rO2NLSKSwQJTKWq8l8xnjCVeq3Zp+Tbrin/msiGZUXR6vslAXkfd
         pxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751156; x=1779355956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuYOAkPGvNGtocwKIFKK4r5RpQsaxB3pkCmwnF/UVxs=;
        b=XuXZXcdUAOJA39j7yl9tsqFXwkKY/8i3CP0i/B8Hc5wPgBwhAPFh3NZS+MHdc9PtLg
         Ril1Q4R8FQkmpB8g8CWyMEziQedwCWTbDLi8E/tnplK+QBbRq0fp8cRYm1SPXd4tKSCO
         E0bCpJkFALzQ+9ZD9OKvTaB2e8h7A7fWjPcmjSf+LIjzorPQ33maG0XgREitNmSwvJvG
         sVN0EU85vIokMH1dsMRy/UHQWxx0nAyxC8CQY/1TyJlXN/pjE3XQhx+dJqZwr69uFQ8h
         LUWxQJlZpEK0qmtbqYsfu8RGY4BLDJxjlDMKbHFa0SFeNea5/aZxf+fhmq4f8N8f9luI
         6GSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Orlk9cj0vwV8KndepAs19WhAY2uMRzxldJWpFXDGiCNeJpFXQ0SDCXqp8dx0JhrPjv6OvOlKDyGFG0qiFmZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrMfHPCXCZmVSg43oYFypcXNWdc79sbYzOrrN3yagK1GCrdQGk
	cMQbt+OQ2fqXl3Cybq4WmLVucuf2t+8R+FsQK1+drQY2+6gQneeVPsFPKrmd8CzlySw=
X-Gm-Gg: Acq92OFPJCH/On3VN+1uKhDuwM5mWZNlEWlz9mHifQ1hvCDixQ7Bu3F0+38WaJiMGMZ
	DeK0u7Fz57psk4G6ZdFZq+1GaRLg7eqCbbZbsyOaXxdK4ZmpId1BBhYkrcC52zK8nLdfl+EN8qN
	b8jJG/prQfZx04K8ikTbqDnMXyHWMW13SxFevWC8HXqd0jz1mVUvRcb4MvcwsHCnBLGtsEgu6Wf
	Pta7TW/ReKMiuI9XC5GGU4wbL5SYILh8Dp3yqeQivT9ulMVss0iXLba/Uk3Aw5jwgM90qx2w5kG
	SsTcHbcvhYFIOJHVqB5LpQYPI+gySgJFTyeT36nDv5g06XjVYr4A1ffRjbFXzsT8/PdxZRgt8Pw
	0r3Z2kJ0ZKRSBD33R/tL59OxBgikgzeJiBnYpsZE3WOWb+0FjzRhkWf3cHe7gBSVVNOVweyvUm8
	7CuuCgPCbw9M7plHJxJ1snTueXGsyeCCksAEAsVauL5+g=
X-Received: by 2002:a05:6000:2910:b0:452:2834:c690 with SMTP id ffacd0b85a97d-45c554747bbmr10469740f8f.0.1778751156557;
        Thu, 14 May 2026 02:32:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:11 +0100
Subject: [PATCH 4/6] tools/build: Allow versioning LLVM readelf
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-4-6cac1a9a4c8d@linaro.org>
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

Documentation/kbuild/llvm.rst mentions that readelf is included in the
LLVM toolchain, but it's not currently included in this block.

Add it so that LLVM=... options also apply to readelf. Users in tools/
were Perf which was hardcoding it, and another was the BPF makefile.
Both already include Makefile.include so convert them to use the new
variable.

It also didn't have the cross compile prefix, so either readelf didn't
mind opening cross binaries, or it wasn't working for cross builds.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/lib/bpf/Makefile         | 8 ++++----
 tools/perf/Makefile.perf       | 1 -
 tools/scripts/Makefile.include | 2 ++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 168140f8e646..180dca9c57c8 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -114,12 +114,12 @@ PC_FILE		:= $(addprefix $(OUTPUT),$(PC_FILE))
 
 TAGS_PROG := $(if $(shell which etags 2>/dev/null),etags,ctags)
 
-GLOBAL_SYM_COUNT = $(shell readelf -s --wide $(BPF_IN_SHARED) | \
+GLOBAL_SYM_COUNT = $(shell $(READELF) -s --wide $(BPF_IN_SHARED) | \
 			   cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | \
 			   sed 's/\[.*\]//' | \
 			   awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
 			   sort -u | wc -l)
-VERSIONED_SYM_COUNT = $(shell readelf --dyn-syms --wide $(OUTPUT)libbpf.so | \
+VERSIONED_SYM_COUNT = $(shell $(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so | \
 			      sed 's/\[.*\]//' | \
 			      awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
 			      grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | sort -u | wc -l)
@@ -182,12 +182,12 @@ check_abi: $(OUTPUT)libbpf.so $(VERSION_SCRIPT)
 		     "versioned symbols in $^ ($(VERSIONED_SYM_COUNT))." \
 		     "Please make sure all LIBBPF_API symbols are"	 \
 		     "versioned in $(VERSION_SCRIPT)." >&2;		 \
-		readelf -s --wide $(BPF_IN_SHARED) |			 \
+		$(READELF) -s --wide $(BPF_IN_SHARED) |			 \
 		    cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |	 \
 		    sed 's/\[.*\]//' |					 \
 		    awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  \
 		    sort -u > $(OUTPUT)libbpf_global_syms.tmp;		 \
-		readelf --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
+		$(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
 		    sed 's/\[.*\]//' |					 \
 		    awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}'|  \
 		    grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 |		 \
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 0aba14f22a06..63276bf55856 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -215,7 +215,6 @@ FLEX    ?= flex
 BISON   ?= bison
 STRIP   = strip
 AWK     = awk
-READELF ?= readelf
 
 # include Makefile.config by default and rule out
 # non-config cases
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index e81e5b479c56..380ad84ac51e 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -73,6 +73,7 @@ ifneq ($(LLVM),)
   $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
   $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
   $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
+  $(call allow-override,READELF,$(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX))
 else
   # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
   $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -80,6 +81,7 @@ else
   $(call allow-override,LD,$(CROSS_COMPILE)ld)
   $(call allow-override,CXX,$(CROSS_COMPILE)g++)
   $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
+  $(call allow-override,READELF,$(CROSS_COMPILE)readelf)
 
   # Host versions aren't prefixed
   $(call allow-override,HOSTAR,ar)

-- 
2.34.1

