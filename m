Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE446AEFA
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564950; cv=none; b=JU63ktHE/8vutnA7Dh/dreRjTTmuXk5U4aNZFGAgMDc42zoCSlbQK4HWeNSBa3MBlb3/mocYJyoI+WngnUgheyDxJcHRQlJNAEUr85/dKN1bsC8p6L2pnUISoPRLDeJl/Mlsi0VtNncK0cJds6lN/u8ShB9bZZTcxym+BhkDttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564950; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0bX90YGZFt3SaoWhopY+HHU3Ys2+T4yoW9HsN3Qbc9xu1uoRlq0Xoo3CticVeUIzgxTAG+k/7c+tBiobhw3nPlUN1Cg9HCKKPkRFZzbDNq4wqNXScFy4tDelySNezSguWFLJsyPdfeuYQ3gQJlRebJI+9x9OEyIwZvnrO5dptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RR3zcf3a; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RR3zcf3a"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a10d130b37so1141285e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777564947; x=1778169747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=RR3zcf3aM5vxaG5PFcHyI+pSVhLR2LWBIromtyrVDzZVDTgPwS4yATZCV4LhdqaKl3
         eeIWzsL0Hzz9krHxFBGCiZj4C0OmIsj4iUAdFln2rEPo68erqQvOgjZr2EwMbSPUoP+c
         sCWM8QCETTSl2WeBiQlVFxBgszjyagHl5FfOx7biK5rUYoRdFZ3IHa4wBnxlgntOPHKE
         puPPHePF+aokLfMzRBCtHhWg5eEP3Fq2hA92Ad/W7WP3HThQ/6E7kS81xbYkK9OZrauY
         hHqb2x2nMTW8+PvnXAuw0U5Y3IzWIIYUcYYHTyJ2BWpxGToTgEQA5yyCUkvqTEXkUtP0
         NfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777564947; x=1778169747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=sh2hLu6rbiz7UpQ1EYBA9fwRyZDgj4U0OjecUgdYQ3FUx2rcBV9Xh96QF6hXMAuDz4
         Eg8utXC3ENoFMfMG5jJaaQsoUJgLetuoksKcTA4EE1WGWns1N2AAH8i1wHVzY3EhFcUu
         nia/D4X+5V//Iis7ZD+6J/5j8k2VyjecKXBcvkJoBgQQMgujNcYlkR92gXgZz6tj1qa4
         ukb/QpboLH2PW80Zsw89dvpvU+wp1cztRO8Ok7w4SvRYLnch0grG8wP5YBsNZT6tB7h3
         h/o5sgi05Pk9MSFSFiSv9O5EwbiV4rYB1YbLoy5vyJTJNqxJqL0GKtFTB37eMJrYrKvR
         SKEA==
X-Forwarded-Encrypted: i=1; AFNElJ+60g79tYCyRcy6L2e4RmwGuJG7DXgzmXo0c/qY7g3EgF7x+WrBiGqW+KvOtziD9VdDXaIFE1CW0c0ymo33EHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye4BJYYk+cvc/tnWXWE4kDxa/+njxzvf+chMYC9fc82Hs8pQDs
	p7WiNBJKpiPxDOHw2hs54rhLPv8IzITNy+kNUFQZ/ANXqazvzPTaiUSHywq2VE/05K4=
X-Gm-Gg: AeBDiesYfEEQBkO6mK2WQsqhM+nNDcZFbSo4pc50DGSSA7fnfxchj2+GUghzZJ7l9gn
	n2FOGwIyoNjpD9HKYSDJX132Nxe+eDhZV0DMBJ7rUgddXL6u1TTg+KBaGpKLU8mxttM7mFykUO3
	fNN2cZvixOFMlj1BOYP+q6Y3ucKgydOYkJ/dHYByy6H7OAKWOJ5qK4+Wk3StGceLt47Jke4HNVA
	3blMcLDb2bf1Xj//r51caTtBmlObWC/hdi6H6TpM/HY6kg544T/GB/2b0xGuAEaFfMw5B3PnLhk
	fahfpm5mW9PNdUWN86byHGrfAJbGwFh4CdDvfLv1oZjdfPhgVuiKs0i6htSNRZuQ51bbJu4zS/K
	6XIrL6AcSDnDtYKWZdfsxpftq/GUBJnjE8pazPpCqpQSz7oTMIGdaZWgjoBJ77Auwqbes59b+8m
	QOiZnJXAuoV265wJ0KPvDURaz1
X-Received: by 2002:a05:6512:3b97:b0:5a7:4a61:251b with SMTP id 2adb3069b0e04-5a85274574dmr966110e87.23.1777564947049;
        Thu, 30 Apr 2026 09:02:27 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd5500decasm10147037b3.26.2026.04.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 09:02:26 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 13:02:05 -0300
Subject: [PATCH bpf-next v11 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v11-4-e11f7a8c4fdc@suse.com>
References: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v11-0-e11f7a8c4fdc@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777564926; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJCdl3O6dJs3KBM3TNjFWh/ti1NuSibuphC5wNsVk2bNEB1ItoSCp53bCr+TLScjI4dk9j82MgB
 V3vt+5ImILg0=
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

