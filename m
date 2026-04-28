Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122E38B7D1
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419937; cv=none; b=pYsGowtSrRxibfdUeHmZubzU+E/gp9PvW9h+TMdrOgvL/7D/6RVRaza7vo+5cR/ZwrBjXjN33TvmTA0dH7iRdssXND+l78K3WEzyPWiauzaEh7LcxyE8Zk7b1pg/Vd4WhhKqN2kwac+OTAeGlqPEkM6MeHI/FvFckrrzHuTw/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419937; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maMTCefLPuJdE4eM3yE999hdBbam1j2tthdxCZ1QEMCudbKzJOFyCCoNrruzTsA96OYFULBlwgqHYP1FNEukca5mu9Z0rU9jcs0XSL7K+vQkFpclA/GuYO2gBLEpoVRQr/J7luUMGXQNRCbmwh3TZfTQfxFETaik5P97qTsM7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K7XEhlQA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K7XEhlQA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so70492865e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419933; x=1778024733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=K7XEhlQADJDvOMKZSclwFRMmJGc4YQ3uqT0g4F8Dxi2NWx/yWOyFyA1GmRkd7beP4W
         BwKBS42GfdVwIj3+ucPfU8GIdXmnf5xS2D3hYd70s9mK4bPyX2/hDuGF3TM4HaDUl/K0
         6sC7xuNlX9ZZzyE4DLyAHaGijNYUbnkCCWAUG34oNSG7sV2de0bAhYr4/FpLeOge6sSk
         +tDzblQJ1RnZyjw2BagW/eqJF14S+x7+HPrKPho+UF+vpQjXuguddglgx2UePHkHb687
         8LwEXVDMyYupbinQYWJmEmNvxnliw4OxX2jyX1DHreit43yBzsBmc8buqMtRGO3W3stm
         ckZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419933; x=1778024733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=PuAONgoPiST96PWZBAnUAox8Rq97o+mNCtABqoWMEVSGoECLy51fQ6WQ97OoT4k9QJ
         T26V85i4U+F3ab/Mo05t28nN+vo8JqGa1I567f4GY62wxPv8AWF7Izh5AAzyLdgSIVnA
         82ASDhMB74vb9lmEA4+WOXGHmAKsGq2mGYr7fHzCGmhmhyZnqIQ/MRRQcYzbL5Ubsbse
         j9SMR3/u1twPa/msHmuIM5F6pvI6UzRamGN0gfp9dX1i4UqVwbn1ZDVbHmXfOvpu2etq
         dnKTLSKqKIG3S8LG8d7DaZkVKdHyUtIFlf0FeFmk3S8VEoJ9Mf9ZesUwcK4v7pyxUL26
         CkgA==
X-Forwarded-Encrypted: i=1; AFNElJ/lxl3FwhyIUGDBT1JNL+FdlQBUZsDTw6URUHqRTb3RTrkNM9exBpZhxPv7/1sFArF9kfzRcTC8kE4Acw4RVLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpHbjJHWLe9xHnSXG/M6ZB3M6aiRARobmxSnC38Tfv3FMw76u
	clHcce4gqVhgsYnEWkkg5xH3bA/CtwdbNMflKjIIHcq0yT+Fu1O4ZhLK90Bm6ZR4Nw4=
X-Gm-Gg: AeBDieso97A6lH1cHYIRBmSwbhumBfLrZ224Cftls67sav4YeateAm6dMSLQbzI38YH
	WuX2CdXu7HuSNs6Z87gTynzJ8MvZ3AQ0zw72p6w61u2HYfWPyXagFyn7+rZFkRuh9PWQuwGPdzc
	l5mW8rmb/h0gX4KOfSFkAS1aRgIYMvQY3Ey2DTZaCi9ziWAXHD7mycLErqh4wsX4V4WtpQlVfza
	74igq4516siLWbH39LuGQhoLy5GfgOrxOAw0hUNWcWLSY0uGrsaviQhsaR11WTnYDZcdRlTCgFN
	hnShzD836qc7aIZYIamQwRNM3PVdLM544tvzscOiE1UNsgc0s8RSCCr5URCiyZW4Bwtz8v+CvhW
	A4NwzSi0fftY/tKxISJK7HuM/LxrM34A0zmtkox3c0iTeBF7jgBvQMcTZMCKklvlak9WifqsZo7
	K9s7MG9C9/bhD0s7PFxPHzdlLh
X-Received: by 2002:a05:600c:4713:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48a77aed429mr80989345e9.12.1777419933461;
        Tue, 28 Apr 2026 16:45:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629843365e9sm214210137.7.2026.04.28.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:05 -0300
Subject: [PATCH bpf-next v8 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-4-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCxcEN5y899hg/gBfdfhM/iJ0taCQUUzGVXJ6akhKBwDcjQYo5+ftQKPAvExHbXI1hqz3Rykm14
 5VkDKVo5YMA8=
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

