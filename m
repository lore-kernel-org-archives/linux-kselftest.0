Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4639D6C6
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419941; cv=none; b=DL3gVgGTIhZDpMRnVI210yxPDa6RlaloXPb4+zFU4oP6h/f8BSDylorg8BdmzKWG48HThuHrd6i7m0tFYST5/QtqmKzpHhwuYux9DVKXZFmprl21Kh09RHpNN7bboISWZ2ne68EzNC4uycy5/o/5bATW4UFxwHmCv/cK0qisk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419941; c=relaxed/simple;
	bh=95satU9q5Agv8MCheK9ldPmy80aoR7ITuWu90cxm+F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igYoskPnf4Q7dtsRYBCkiWHiDzSpXqtxK3GE3EqfDRZ/U17fChBKkDZWpP7lZKQBQSro8KbHsjK+zH6xnL7br2EatrHhvbVefO8mnVWCym1ximUV43gmi1XVxRZSeQckjk/GV2LidVlzirH1vBXwL8L4ARjTBCNVmXgzpJnXG7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K9/qlE5h; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K9/qlE5h"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48896199cbaso117860405e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419938; x=1778024738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCFQo4Aru/JTwsEjOuajhbqjGOTLFNs9niLacwe8mnA=;
        b=K9/qlE5hGgkGuEZxJBdUE4N99tBYDcQ+JHa7qtCAVggP45Ok7MTSFhqN+WWDgZqC0X
         R61B6YvctRytVRiRc9VllQZ9u+f3PKpDyJXCk9nSEBY38Pm2paNHWotdrH/Uf1AclZ3C
         eKLeakwQvDeTgqLO/ODIxw/Rr4E+YBHn5WxAkN7EDv+ZR3cfsfR6krjDv24aAQ954FNi
         zno1jHr8Mfju1piLzgRJyIlnBQGkTs2w0C4rbbfu9aXYzBlQ50t5eeJNWOXZysRb44cm
         AkffyRH0KQb1r7Llg4l+Kr5ARqXq3sSXnnbPLi0vnNOnswR0QJlSzt0SNWXILNC2/erx
         lDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419938; x=1778024738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PCFQo4Aru/JTwsEjOuajhbqjGOTLFNs9niLacwe8mnA=;
        b=FSh+akGxzEkYgrNhHR8DSA7/Io9kWg6TPe9+evz1uMCK19ayAdbg1MLr/STWDLFH/o
         o5lgEsCgbjF4bFFrLYD5RSEDfd1N9LJYXlzzfSmaf2jbVDe23p+LtJKy7NBuTuV55QNO
         J82re6G1Cb0VaxRCHcrbNtOfwbjp+pYPxL/g4Pidqg+WQJ3Kmtx+ZS8MHzP8wCsHiHM8
         Bek2dS4qt5GHVrc4ZVZuUYwXTOaLpx3/BJjEFMY0uC+z4tLO8Xv/BiLCrc/QghY1Ovci
         wAfRJnO9D9Q43O2hWRSH7LsERrJOsi2QXdJhXb9H1aUrXi//tvy3b3iE0WKllzRgbrF0
         yxKg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZZcg9aga4y44WZt3GPYIN6wlTJNlNveuHGP3JjUPyHqZeLzj9HOQMx8i95Suh7gVaoTaztVnLB0LiTHAN0qQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx36bh3eumMKJUiczmaHubnVids5yAuqZxAFkIvVEEjgiV9owf
	zx7eerwfiNSnG6hsBGWWbMkqUVgiSHy1AXwR+qL9AcHMDLeUg3cj6LholFOoEFAh2Ak=
X-Gm-Gg: AeBDievIKCRIbBoas1+Agx1qAPElrPb7DjddlF1nyJrq5cowChehKTQPttejEmWFoiP
	hJ+5cuy+trzpavZ2SsIw8G9RElbQtT0nakn+2Y2iXKGyZJUBhPgsRVJRmIdBmROxwm6HOqAodOz
	ItvrUrggFkwAdAm0yQKD6TW8ORTCzJ2UDEP1+Aj/ke1Ck2qLnPMlLc5HlryJEgyUrfUthqQgCjC
	evQhrkPx/JM0Xdmuv4NQGlgkL0PiIqLLDmRZAxpjGjnXL7LaLRSxoHTn0/KM9yPd9mQkAsC908+
	UL8PHrIF1FaYla4iaxZp152yZIQORScjiM2QTBTTiLs5zDo5fMxcrhFtNLQeu/AmEa0AH9wYdLf
	ib4UXrhaGt+x3TbJOWYSX837aOmjnfjKQutWhsZFUjx4zEQjZmA8XV4GPwAXdYNVQCzLqCbqkkO
	eqbgkWhlypxyV7yRgEXIjYRgwh
X-Received: by 2002:a05:600c:5494:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-48a77b05c77mr86131225e9.19.1777419938146;
        Tue, 28 Apr 2026 16:45:38 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm135209241.8.2026.04.28.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:37 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:06 -0300
Subject: [PATCH bpf-next v8 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-5-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2200;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=95satU9q5Agv8MCheK9ldPmy80aoR7ITuWu90cxm+F4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD+jepyNJMWD40lOW5GvIdeaEl5O4OF/51LYPAKc8TQEKsNlSTvnUZVCp681bxFrGne7JnKymWr
 Z4n/nlSmKBwQ=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Make skeletons and BPFOBJ order-only prerequisites of .test.d so that a
missing or skipped skeleton does not prevent .test.d generation, and
regenerating a skeleton or rebuilding libbpf.a does not force .test.d to be
recreated. This avoids unnecessary recompilation and, more importantly,
avoids build errors when a skeleton was intentionally skipped due to a BPF
compilation failure.

Note that adding a new BPF skeleton via a modified existing local header
still works correctly: GNU make builds order-only prerequisites that do not
exist (the order-only qualifier only suppresses timestamp-driven rebuilds,
not existence-driven builds), so a brand-new .skel.h listed in
TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date.
The modified local header invalidates .test.o through the previously
included .d content, forcing a recompile that regenerates .test.d with the
new .skel.h dependency captured by gcc -MMD.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9a4d8bea0c18..608e6dff0392 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -726,11 +726,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.54.0

