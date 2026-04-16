Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A333C5DDD
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367882; cv=none; b=mGA8bFSBTTskpDdUp+Sym0K/yTlUAPLzjOP19JypP99E4BLjrCwO1ZplfXoYu52O4PM0CXqCe0S25H1k7+fw8weak9UitK6TWaZQvKL+kI1Khqo9NhNxtUAQyl8AAI4hxrT/lzoiFc2+/sMBJG4CbJ8dltp9tEkYWwnwGe2SH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367882; c=relaxed/simple;
	bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQvDYEFyheKuUbF8ZR4XJ4hlItDI+GlCFl+RODCMqJSGMAqt06qzjxJZJzW5jaZu1D5iYDlspHJyKWHEXL3wOr+Wrj80NtvcgoqPkyO0bb/CFDY4hUI4oHhkovKzbTddtgNSHRZ9vegozIYx0eEsHS8/d8mZVD+1n3+SBv+7zdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ERPlUVrt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ERPlUVrt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso78441785e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367873; x=1776972673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=ERPlUVrt+QCIJiDX+FG+8lqoWzIs+EkhCLMF6Fv9oQPegvHry1yP5aSa0fACAKYDv5
         mNT2EvZwLXvCX+x7TkG8FBfmG8KsIILl1AZIonwqjrRqMdRAhY9bV0Y9QtfLe4rYDL5w
         oxaYBleOBohAoKmLaO8FxbTCGZKak1gzDVjvi8A2ySKl1AZaQBN82nMjyXYogL8e9+6v
         p6LHXUHAXFoUyWa5m7wCFXXhFxztNeJeXLXQnNudf4152O8dxE4vbXsvCIygV+PA06AV
         agurNpWttk5LW4lmMD9JB4R04jJD2WRTOPinS0C3EcElSiAO3Hy08RrPYRA84bb3Fhwc
         x0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367873; x=1776972673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+TFkSx0/A90udZGFwEtC3VdLgE/56vsioCu8yOMo9s=;
        b=SRLhpdyb2nUHLkS4uzYLpSDixA/De9Kg3auHY7MJ4h+u7CtoX/enJQkikUPg4jhajM
         meyOUGRgKYAeIBQ+UazyttJsw2WS60aiKcBLRwtEV5xSTEVZeYvWwSUbVrmwh3i5v4tQ
         jHZSB6/HW3NeJpp44P7/gKH5PhCc1+ZUuxe8WCsrUnxBAiLaf1V8gl9Lfg5Zp0o3Fbry
         9mh7SaIGW5uMKHZa/ZOO1b0oJvKKjBHQU4/C/nmW1RLM09Mf4c67RHXNmCW3pW1/JX5j
         Lh5K2VOgmnOQ+LAhUduDEkZF48hiBBYzFa5ue2/PDEA2w0KlgoEOypDySzu+hRuOWTRX
         wy+g==
X-Forwarded-Encrypted: i=1; AFNElJ8O7K/FpJERvOgxm2qbB20CA7VxyPSfyNe5BOvtzlArjtAOXqGeR0nICQJKPtDUic+pv014vsqkWujXCS703oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/fFUF7aibUc6kjxYBI3+VycaJpVh5JVOqS8dKsv/UBd6IKzy
	JoMajyyPhbZEXW+5j72CEkKvjFNvC3BpyjPaxdjC180UbqcErOydBezeEr9KkpFN+JjrUYFxkEu
	4uImD
X-Gm-Gg: AeBDieuzImtac4YdrMtFQ+ONyBXizHcUX8OxlPFw18/B0iKWbAgJOLV9yZtjY+rP7ZD
	TQhA+E8DjXcz1XWqyMjvHbNDv3rlDuIGLWQRYeoUhk14Vp9gMbBBh6/n16LcpyrGjsUf4DZLZkx
	iVs2z3u0ia9Z905FZYo3KW+G6ZUhp+hLaU4//MH/WXH7AkBDc+DDeQW8+fbHY7jt6FAcUQ/pCfL
	HJLK4y+i5gNLhVhVhLB3UN2tDpq3eGzzrJYnxpuv+0nCybaIxd7UkmCQ1F6P9nu/ZfIj1JfjDsn
	P1IYQsov70YPoHt4rY/k4C0b+S3SaytexluONYuHjGJwi0fi5/wGKzRoOoQPVe2GR7xnBBjhpBO
	mtdc96NDjtR1nFPRg0o4Ah5OxErubGn7+HOcyoUaSoZaSTlVDQJRgZtELIikxy8E3vKKQIgMo6P
	TH7BG8wuz0L82UHY8bAY8I3yk=
X-Received: by 2002:a05:600c:c0d3:b0:488:c282:e77e with SMTP id 5b1f17b1804b1-488fb2a698dmr1869965e9.28.1776367872924;
        Thu, 16 Apr 2026 12:31:12 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm8749784eec.14.2026.04.16.12.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:11 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:53 -0300
Subject: [PATCH bpf-next v7 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-4-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=LGjyQ4DJZImIa+l6d/sVh7HyuyYJEGS3b/TTHgcThlA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI08/ckqohz/nSiAlXnI3fU3hujs2YjUPKtdoTCJ2gaAO2XqJOQXDYVBE1H3ACYPQ+TXtotgsne
 sNSpimrFKZgw=
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
index b23703f2cf89..7d1e5d6c30ec 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -164,7 +164,7 @@ endef
 
 include ../lib.mk
 
-NON_CHECK_FEAT_TARGETS := clean docs-clean
+NON_CHECK_FEAT_TARGETS := clean docs-clean emit_tests
 CHECK_FEAT := $(filter-out $(NON_CHECK_FEAT_TARGETS),$(or $(MAKECMDGOALS), "none"))
 ifneq ($(CHECK_FEAT),)
 FEATURE_USER := .selftests
@@ -723,7 +723,7 @@ $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_BPF_SKELS_LINKED)			\
 			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
 
-ifeq ($(filter clean docs-clean,$(MAKECMDGOALS)),)
+ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))
 endif
 

-- 
2.53.0

