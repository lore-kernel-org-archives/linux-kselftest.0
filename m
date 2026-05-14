Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A773A383B
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751158; cv=none; b=VBKP10K+JkaEhrVbTrTk/gV91NYcV5zmnI4XruX20K6IC9o0xe41B+OaZ1PtIBSzpK0nEf/vfpPXN8Ip6EI9iLcxdgncerYJnUtAtL+hmI+cEj5fJmPzz34aWZc80rkTUqc7cXrv+U96F9kzNbIX1e1oVhLq852arnK5WmpQsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751158; c=relaxed/simple;
	bh=PhCveEiZIdUmcGwyU5spejpP9AhnWoovrQrg6qXZOwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODJIE7YRIvcDYG9tJ+WuHVqhjflM4H89SbJ3xeqQPnMBwVKwxmLcTTk4SedajnXFMUF5yXAxrtD5YQUekCkYJgLEzsNbodN67ZH1xAv3orO/QVytf/jMFslAiBk2g5Vve+74YZXKxYDQ2gdPEFP05kMvssB2mKwy5SOYOFacfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKllLdfo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKllLdfo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so4124901f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751155; x=1779355955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=SKllLdfoN0Y039PhFkLl9oTbjG8i/6bFqAK1ersRlrGseyUNRaCnIy9+QWfDVkY/f9
         BWFii5iiQzPYcVx/xkhRJummjt7betIPkydGzr1pVaC3/qIgPHJhb46KsgsMBZEvoN01
         kHbwJ/ogyi+E1e7WEdXPZwIKk98z39/WjyqvMfUCQGAQlvZZUYxWC03RNJ5OJvDFzXzn
         ehYj5rxpQFFL1Ow1mFV24OiAPiT4qe9h9OwK6a2fV00tOSS8ThAywAsaZ9QYCCSg+EoE
         KonrDqzE4IVe52SzdJCAZ+gG4D5p/7ugJiEOL8eeD662zovMIPy/N8Y+r/RCESH8HgAl
         IG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751155; x=1779355955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=OXDaQkInl/iNcA+Wi8/pjoDa7gn5Cnbf+nx+pYKFc7nyWSUB3ghZsNAMCqaP2I77Ji
         tKD/cAaNJsNcEFLrgFLWdriXVCD+quvey74KSDu4FAiRwti6XfzsJIXO4YpLyDH9Typi
         CyigICF7D+T93BqBTLPHVRlVUNv8rhXYMh48jeiA+pl4KrK0tZo82ZxFekK8hmw2BtCq
         6uP+rFSIFLGJpghEDJy/c0oq74EZAPoIF+VSS4loi2IPHxz5poN6Z+Yd4rLPxfmXO0os
         uxdlLjWcXZIOycPPxX/+EiGtneGEYzlP5axXiAm+CqqPWoggw6o7YnKl9bBoLPsV/x21
         D4dQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YAeKDcbxoXrr7XmDGNWwuP9TiAkp4BbnzPSa2QbZs42mVgZLr2PPLQhonP3THTWtAjE38C88rVIRysUAsD8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBk/OOm1qkgG0Eau93Co7xXA73qi7D64U16s2Nktf5Xeqg56j
	uwqBNPCKKgxif5yOX//OraC5dRfnAy3/Ps8nZRwVFTwr0HB6iN0mbndMpqROmn3OUqQ=
X-Gm-Gg: Acq92OEnKSb8D8SiMAF+ITIw+KhJwXbgN+LrN1j6M49s3yH6aunz5+2vq0OTmDMBep5
	JRqQL5jAdFswoyzHEqgJIvEIm1fvDPWnUpTAlS/w1chC2IvUErkBg5UqAJ/pblBW+ojmRRaR7dJ
	GeSS9pvhszFN64X9c6++HBq1cVKo1q/k9Y/9Kqb84n7FW+Ts3Cdi37+zwIV4j9K9KUsdKNG7iCJ
	3YAyYQ9HfEDHpCe2VYJPIvxhz7TsU3ac/yZ+27zXrB014fpaNnT59e+rlIVnCxS9ByZD4UM+eKb
	Z1KwEBmSk7QR0/CJh1+kdGLTW7eC/O52Zvl2lFT39Gz8Vpgk1dCn4q/8lkX0w127gEm9c17AEca
	iblv1mi6RqpyA5tD9WC3aN1FJ/MMprVDS+e+hDDMDW7oM9rRqkJGwHirnjzWidLd25c1sv6NXsv
	zliwsjUsInNXD4V6HPG8aSXDYQQ2mAg4M1
X-Received: by 2002:a05:6000:2882:b0:43f:ea91:63ff with SMTP id ffacd0b85a97d-45c58a70c1emr11251761f8f.10.1778751154951;
        Thu, 14 May 2026 02:32:34 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:10 +0100
Subject: [PATCH 3/6] selftests: Remove unused LLD variable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-3-6cac1a9a4c8d@linaro.org>
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

This file was mostly copied from selftests/bpf/Makefile, but the LLD
variable is not used here. Also, this copied block didn't get the same
fixes as the original one did later.

Remove it to avoid confusion and so future fixes don't have to be in two
places.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/testing/selftests/hid/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
index 50ec9e0406ab..96071b4800e8 100644
--- a/tools/testing/selftests/hid/Makefile
+++ b/tools/testing/selftests/hid/Makefile
@@ -105,13 +105,6 @@ $(MAKE_DIRS):
 	$(call msg,MKDIR,,$@)
 	$(Q)mkdir -p $@
 
-# LLVM's ld.lld doesn't support all the architectures, so use it only on x86
-ifeq ($(SRCARCH),x86)
-LLD := lld
-else
-LLD := ld
-endif
-
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
 
 TEST_GEN_PROGS_EXTENDED += $(DEFAULT_BPFTOOL)

-- 
2.34.1

