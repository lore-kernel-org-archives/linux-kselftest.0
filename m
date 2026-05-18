Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCBB3E7148
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095063; cv=none; b=sDPWKkHghcSDaF2jD5LUdvoTbmeihZaM4QyJk1opv/VoKhD6Jvaa7RPhXDpd8D5Uof54dacQG0wq4y/k06s+GsoM3bY5XxIO4OFM6Zxg1EgBbRS6at1tcxXayFMRYhYanrFfFhZ+jsH6ifKYrjlEe1isSH+AzUd0j9K5jgXPApo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095063; c=relaxed/simple;
	bh=fzYRY6fdwwtc2iRyj9RCOJMDAIdKHmJQQ+6ehPNKfyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVnHNtKpBbbBGNkaX7UP0+E1PY1G7fiV/4LtWrK2tQaZklSkX7XqRYmj0O85IxS9bEzkxJ5jEsv3AY/Dz6Q4+XdDDDbhBCioLI/YtMd7D+uc4aRUAmTGkepDdZ0BE5dfRu8KuOvk3mGzhi6X/gEBzQ52pQTpd8sqrCjzz2m0dR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=knq/CMsC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knq/CMsC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd0209f25c1so349141666b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779095059; x=1779699859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eZhJfDWaDpr1HIAphXElaRatPY/KQEr+aNnKVotSAw=;
        b=knq/CMsCVaus/TiINPDj02am41TsRjY4ov+VlTNeAPR4IRhRGHEscb1/UFrRXKafyy
         V1KhjM1IEjpjEiqV/wXjRCgTFpzYvaZ0bmYcRJNur0Sxxt/xZ5LBuF2LRqq9HcDuNl5f
         P2QcRTWb5U4qK3faMDXTOBtTsQzIO/k76FXlUwBSLd12jazgWPEnD0ogrP6k2eFBZUWS
         kK4Z3O2L2u8h1qkA0OHB2ylvK7ElQI7Dj9q6NG9wzog1TUFRwFdUGSevc/1nUXR0V7PO
         rkxTItUCS6vlUnmUgD5FbohsC4RMQAtT7llysFBxZLMRcEpPnP/vYnUdKheTI7RXLXul
         BW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095059; x=1779699859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eZhJfDWaDpr1HIAphXElaRatPY/KQEr+aNnKVotSAw=;
        b=RSRyNk7UQXRxwd2AmHhB+ERGehWeHakXGhefF0u4i3bz0GpIogZjDB9ieYIr3spImQ
         hlfw0uq8xkN6M3JvWaO5h8PPfKrokOZRCUEMujdWbFdX9+w3yd/FnuLXEQW85gWH5mnn
         AglFY3PIJQUbyg6Z7I5r9fB41TYbGJkE6GqhKyFXAbNRm7eIzFrVFCbzt9RIdALVmaP1
         cK58DrO3YfFrQsQLFhdJ1E65fyFx1FJGFkd0Aa/mkOMA3NKkCf6zvLNaA9klty7IdAGi
         V/KkAaOadssDbNtvpRZE9Qk3OFk+Yo1nzAyUSvAxCpaH5d157jEWryfvx2JvVQ4H3Zzf
         MWgg==
X-Forwarded-Encrypted: i=1; AFNElJ/fge9iCBIYG/16LPIk3nU8+RMvxgLNtpH1Kesgr6mgxz2b42AFy6vRWZPIFOfIjF1y7tyfDwy/qxA8DSvsobI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hxki00SLd3YnVF6OWjhcY/v5p5QmaaUoQcumOvzRg3rxP4Wb
	Lgg/PUn/g3D8Cm0C9XMSsxZC8gLi64TppqNZ6tWGP+fyvsMYIyBW9TLyRy5utJztEWo=
X-Gm-Gg: Acq92OFofiIBzNk6Nf5PTdfWIEEVELA+eMvb8Nvbs9KN2UB8sUs6U4qfU77lT0a1zIa
	QGZRgRsjrUuOtAua5z2vMz7bQMPupt/I9lPcNtpEZ/QOCOMZd5UomYApwdtDVDp8oGmi6Losbqz
	eYU5xfxDQKNOeBlwO1nbfTlsbOtd2Icyy4dublUu6NPCPT6eac7PfLFEv5We0c3EJvoSfHYsdjl
	5mNgDfjSXpx7row643lAytMmZkW03rQXvsnP3AwAvYehJwkxBUUNpcWPvSMWQrDUvyyQoLI6ZAW
	gRlgW0iy3YyU0GxDPgz+OUORmQXcfC2cXnNAAV+CeEu4vPoLLsFBcKkD3Ch1tMQSTsxRBQdU3FN
	uJTuBfS1pprdBq0ebDJriQqHXaPAApcl+jOLA77+1upczs8BFUi3ayuk2eAZt0RQLRQzxqO0yQY
	2pgdRZaybrHl4QC499FRqaU3l8KGiOu/S1
X-Received: by 2002:a17:907:c248:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-bd5177ee49dmr801041366b.10.1779095058404;
        Mon, 18 May 2026 02:04:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35084436f8f.5.2026.05.18.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:04:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 18 May 2026 10:03:12 +0100
Subject: [PATCH v2 6/6] tools/build: selftests: Remove some duplicate
 toolchain definitions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-james-perf-llvm-version-v2-6-f12cc4f031d8@linaro.org>
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

Try to remove some, but not all duplicate toolchain definitions. In
these instances, their makefiles already include
tools/scripts/Makefile.include which defines these in a consistent way.

STRIP is the only one that was set with an '=', but I don't think it
was significant so that difference can be dropped.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/bpf/resolve_btfids/Makefile    | 3 ---
 tools/lib/api/Makefile               | 4 ----
 tools/lib/subcmd/Makefile            | 4 ----
 tools/lib/symbol/Makefile            | 4 ----
 tools/perf/Makefile.perf             | 6 ------
 tools/testing/selftests/bpf/Makefile | 1 -
 6 files changed, 22 deletions(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index 7672208f65e4..6fdb6302e0a2 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -20,9 +20,6 @@ HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)
 		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
 HOSTPKG_CONFIG ?= pkg-config
 CROSS_COMPILE =
 
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 8665c799e0fa..a228fdb5adba 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index 8703ab487b68..9f1ddcf0504d 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-LD ?= $(CROSS_COMPILE)ld
-AR ?= $(CROSS_COMPILE)ar
-
 RM = rm -f
 
 MAKEFLAGS += --no-print-directory
diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index 426b845edfac..d692abe8add6 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 63276bf55856..948abfd2ee8d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -174,11 +174,6 @@ endef
 
 LD += $(EXTRA_LDFLAGS)
 
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
-CLANG   ?= clang
-
 # Some distros provide the command $(CROSS_COMPILE)pkg-config for
 # searching packges installed with Multiarch. Use it for cross
 # compilation if it is existed.
@@ -213,7 +208,6 @@ FIND    = find
 INSTALL = install
 FLEX    ?= flex
 BISON   ?= bison
-STRIP   = strip
 AWK     = awk
 
 # include Makefile.config by default and rule out
diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 836e783f0170..f038642b283f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -3,7 +3,6 @@ include ../../../build/Build.include
 include ../../../scripts/Makefile.arch
 include ../../../scripts/Makefile.include
 
-CXX ?= $(CROSS_COMPILE)g++
 OBJCOPY ?= $(CROSS_COMPILE)objcopy
 
 CURDIR := $(abspath .)

-- 
2.34.1

