Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BE3E5EF6
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405420; cv=none; b=QTYN1DkthiGq7FcD/vJe2nDwOHJP/XEvJ0ilGF/BIUgwQofnRoHoUGOAj3uBKX3Jzz34QswmDzZYmRYYW48JmY7YijwgT8htz4kr14XB/fDIE+2E70HA9W34e40aMFkabyyY0v/VuY3PJK1WFZ6iHLXg4FREhkUy5woh27tKe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405420; c=relaxed/simple;
	bh=h9YPiCy3D78JKFK96WbgjB0Gv9K8gRrn758T4BLo7I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+DuuRZL9+U6/D0UEiFZeUkbOaSeYRoUN8LKa/dlq+kDzY5D0sUH0RAuhX9bk7y+dbvVJ1HiTH7uaySKn1aLOmWXCyG0wiKGerEph64qkbCKqyiAi7SfInZjAGPbZQXA03rYkXgBxk2YHN+R+J/udrVb9E9SubwmPgVX6Lh7xIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Vlwgv8vB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Vlwgv8vB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68b482888c3so7243517a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405417; x=1781010217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SleKcaJS2ZrPKi8iOetVvP9OF/8OPZ5a/bR4NWlSpno=;
        b=Vlwgv8vBbjEei+PBqDmKwaa0C3+imgNy/sQ2ebkEHtM2/t3+tXIwoW6uNh4o1DsY97
         ucTyMe7XuS/XankrDWCz2VLKTeaAziGx9fJyiI50raT2G2DnLGZ2i3zgl3FgzkJUrtu1
         1WdZvNOziIrvyGWuw2Xo9qdbwFh+Cbkl9co4vr8d/YucOyGU+bXqNaXHAz7XYkQeNhEp
         HI9NkWVho8OxXUKsqeQGtatG1VXrFOmoJE9+XETl8KKj8oi0+f+rUsXcuK8BGgluGbdw
         41Rwwh9sCMlBcwxiLN/UT4boVmJ3v1biCtw6DXE/DHfckUlUfwkzgfvGPippQKMdJ2nW
         gOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405417; x=1781010217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SleKcaJS2ZrPKi8iOetVvP9OF/8OPZ5a/bR4NWlSpno=;
        b=QMRLJjpD8D4qLHzZ5M2VHqEXovhMOzRN7jQJTLMLLyZwd1poTwtkQ4u/zdBnGMLexb
         Xim4egyhsYqP6TePju6bOOvwhW9xRThXGbAH92IOmpaXZMr2a8kUFsLpYSIWMNakQoHT
         0IRbqAiigs/Xwtssf+qXt4kfS/prUlKV01XoOPS6wjYW7hyeQnu7wOZSQt/IdwDBUsMQ
         Hc87JyEtvKVcbQSwBftCnmoLAC1GxmShMBKadSRRRVjTFAHT9/DCfixYwlMfDEFkbakW
         elgKQRW3Z/dsEionQbGSxmqtzZ+tCz/UyrgPdEZsF6qZX90lEFouX00pNfrudbnRA906
         1nwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JrjhqIAOk4xA7mRg9aktHBafja/md3Xrd7190tzGcuHYKvayq6KigcXqFLxiG1jqAxretcVo9uy/EOTe1hoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjFGQf2t2XpgPyxC0YkpPigyidGRIjZo2HmGlOvChhsi/MMsOj
	NaqqALgMEvzmEaX686m1cuIK/2bqK1d2/NyZwuS5HcPDNuRK07SII6JNtSGudBPlLHAv2kV44lo
	K4lPDoBg=
X-Gm-Gg: Acq92OEgk1rYo6buVZlkZjlFGfLQbyAKq2OxOEXE+rrKP0ssvw/2xTsOMyTAD9+uwkV
	xhIsGiAhqUOsbNIyKjMe63gcs5GJhjK090+7gryFyzjmqu2DiomnVskXsXV2AWtVaRzC5gSw/Gg
	4ZEN8sjaH28UKu0Utm+db0o66pOXmJzw9mxSX1DfDquYBG+nLkwZG5hbX2rRXqwtRJ8NzwJ+h36
	Gmus2tKIFJ0Jkz3YtPdWc/Usgx+W9qqMQqgTAtBJ6z5f51CEfndpmMPdS1qMNRvTJMEgCaXJN1e
	TUF2kZFrYXi/B+CpvjrSwUHcpVxZDGZVxRmUYRsVdEeLNegxxhBrSka1cOUSZJFchO3LOlWKtZy
	iLYvZu45BlHHEVikCmqbInWjFby5RQFjNQ5d3dytdikTedBmJjphxsB16eizM5fIT09kZLMcmLq
	+12JuFqemw5di1BvvZyu1ZVA==
X-Received: by 2002:a17:907:d11:b0:bee:7c9b:fbcb with SMTP id a640c23a62f3a-beef9fc49cemr247115566b.5.1780405417123;
        Tue, 02 Jun 2026 06:03:37 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb85359bsm3373260a12.22.2026.06.02.06.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:36 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:54 -0300
Subject: [PATCH bpf-next RESEND v12 05/11] selftests/bpf: Make skeleton
 headers order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-5-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=2402;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=h9YPiCy3D78JKFK96WbgjB0Gv9K8gRrn758T4BLo7I4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKabAdhXGu9n7wxD04JnGNenevlMwzntkoujlqFOAcVLNfePEOFjOxkzc/tTq4K7yqGPiLQGs/N
 FWoW72knPDwY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

$$(BPFOBJ) is intentionally kept as a normal prerequisite: a libbpf
rebuild legitimately invalidates .test.d, since libbpf header changes
can affect the headers .test.o sees. Only the skeleton headers are
moved to order-only.

Note that adding a new BPF skeleton via a modified existing local header
still works correctly: GNU make builds order-only prerequisites that do
not exist (the order-only qualifier only suppresses timestamp-driven
rebuilds, not existence-driven builds), so a brand-new .skel.h listed in
TRUNNER_BPF_SKELS is generated even when .test.d is otherwise up to date.
The modified local header invalidates .test.o through the previously
included .d content, forcing a recompile that regenerates .test.d with
the new .skel.h dependency captured by gcc -MMD.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 49f6a5503e84..09de69a81112 100644
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

