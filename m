Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD1332635
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473260; cv=none; b=UD11M66V+10Ks8GDGrGwVRXjbwyAzi51/RguoTqq5MPXQzj5PY6g3gWurEE5tRK4KMtnkD/s+DVpZjR2pvtSN0tSbHUFWHQBajfvcKOkubPy89iv2mR3eZbq02DLfMYD6XkLclbI4YKAJzm+Z/rO8rFzFL1QKwDrspQrfwxJKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473260; c=relaxed/simple;
	bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DONjYxNphSzev7jVeGBDgPpp08+79vsai4NqMzr0iypaiSUl+IJkBaCXLZW4nEjJvo9bjKtfSRKJdxkRy/K/iMWsAEBoIa/PMEAlyADeaIsSMJfUxmZORZngLLjPGRL+Yfp0hwfrLoVgWCbfRi++KSbuBorS6e6rZyzbEqyinak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bCJHhO7z; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bCJHhO7z"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ad135063so116167735e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473258; x=1778078058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=bCJHhO7z+SALJdpUx209jEJe2jqByLm5RqdxN/5RjPzxBlKP32nyLmQzCairVAJKq7
         EyQbEwOGqORbSfQdghEXKHPWqMSYG+mJ+yv397bDRB20l1iXTliuD1FmELwJtLmu6WsF
         ModyBBfJbpMb5EqcMwtkRBZfQQdMZx1DhccpChIBamYC/OzGDekCJ8TD0ntwYvwEzy49
         FrHbTbiJyNaZlSHVOl0XIzuBnrMNeKp5F+xLgQp3mNxYP3pcND22yH+Olc72jE6H3C0e
         q/FS5OTfKH1fg++SYzav4ENPo6byD+iCZ3JmZnI0R5fjtm9jrcMCpFCSRbKptsuvEgHH
         /bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473258; x=1778078058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FfRfeM2Ktoz2YBd+nAbVoRoGagqa4SBjA60nTAl7vkM=;
        b=jf7OrqLPvVEZiNaj+fPMiGB7fAXosd1/4dZSuuygE3k3i+PXlHahZA+Pwbmhw1MSLx
         ePi4hDJ5ZkDhIXNqAdipcg8ViUQOSnF8seakS9nULH9DfG9AbDA/6/RZAXx8h/g4Bg8O
         Y1JuiSyb+iJqHyphrNcEX5cf3GtFq7DwyU7GK5Fl0pnimx4VrTPDTRbmK68o4jWL3hqb
         AaF3dALgsKrpu9GT/KWb/rK3NtHUyezT168IgXOzVlMo8mYdShM4LNwqeNj4XTtUeC4P
         mlHFNJQuP75v5wt9LTyxJeN2Zj9CEe2edjBw/oKhFopO8B8p7tul+wMu2tAdyMvmHy3/
         67WQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f+GUfhGxWMa7qmXFMkpsduL6h33TR6aE+4QvxS5PtM6yfI/39c/d7mwL9Ou50T3RVTDmJbmROS29dfu9OR9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5IRTgPHJxIV3X1b7oxAlE+iM27A855IbtytyGfOJMNvQbJ18q
	RkoYmxRuV8rXiMdorIzXQdfPi/W13ZbgccKv/mYOMKreTQzjFJBefSlFzc9HG4l3cCg=
X-Gm-Gg: AeBDieufRDxaYvmy1IjX8I1ZR7E62PmZ6/X5GoluWjatYecSdTr+StU6gGfep9BPxkF
	enHkxvOB5ucxXq1RQVwtX1KBWWZaUv1P5ylpz7V2Eu4bc1hDeaiRiSBcpNhdty8nzrkNY2ZCJx4
	Omqwi6kscfy4/QqZkHiV7VNcFg63Zxghd10MN0Lxskv544tiCJqNzRrBqcHEarJaViV7PW5geZN
	yeNKl2SRnwz3urv0MJDTcKRkxnL3X4NwYMXgGX91x/ld394Pp8y4SfqH+ezQLCmR3xYxig+Nj8w
	3jX5m1SLDzByeJWfbYzZI3kBHh7QZLOkP/BpUTzfQdYAHiC6Fo8vkgm0VfUVJIrPP5Pov8YaiiS
	Vve1eIXwUquZayWKK0DOjvgdT3xZyARsjHcPhdDkIo5VQckkHKYmHozpm2v1G+EimUcaobIjsK9
	wSu0zIE8ZHWYtJYjOnEK880c9Qhh1nRsfnA44=
X-Received: by 2002:a05:600c:4e91:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-48a7b54bf85mr71682935e9.27.1777473257522;
        Wed, 29 Apr 2026 07:34:17 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7831df4sm1071527241.12.2026.04.29.07.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:16 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:46 -0300
Subject: [PATCH bpf-next v9 04/11] selftests/bpf: Avoid rebuilds when
 running emit_tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-4-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=1555;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=pbpwT1aTnlvs/k4VWEJw+b4cingvftFSwGWkwuBMoWA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOx6r1sN+pHaompviJvGnsc7htEYgbZYrQe0hCIZL1j9hp1PNBETKr1kJS4dG0hJni6LhDBotXn
 AqgE2bAczzAc=
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

