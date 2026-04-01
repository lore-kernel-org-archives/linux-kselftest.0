Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4AE47B413
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060158; cv=none; b=ON+WbLTyqFgb7tZPzm+LQTz3YnzpTFH2tUgRoTLZ8ClYbajJhyUOimvOwhgcz2dFD8Ng2ENK9opufdBz275/HHHhTKFLtR1WXSN8Es6jeYTdZsUv9fLfUiR9OP2oqDPl13z5HdD9sm3CvCv1qreXU5xyhyJ7M+wLRuYDEc0JVMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060158; c=relaxed/simple;
	bh=9kRc2srfCyWc8uD9Bu47+DiUt+TkrpdHbGXfZQycNQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cK3p6dBX7NKWmWIDK4x+ptWPg2q2A5fE9FFsAnvYPukpGQfSpLXqeE2c7cWKIOmCYGV9LLm9457ahhcpv8e84KzL9MR6UezfBISqzcryLSpvGdM4GcInSvQ3uezj58//v0V7ZAbJEhTHrwM04oKPCV67feEFP8/mZXT5x5lDliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WPtH7Row; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPtH7Row"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so9161905e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060153; x=1775664953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR5D/DWM5Dfc7y7QbYtyXQZBV4EpcqSV4OtU9XGADfg=;
        b=WPtH7RowbrNJL63OgUwXF5jjFM/EapnlKHFQZtzrPrbGKG3h4EBJZV2tP9N2wnHWln
         QE0NamD903sbHs8+M0TarDcLZodTsHlzV/h3StKPnvrj5cUKLfmjGuCuHBCsDmhtd6Tt
         0emfnqH8i+fr/nlqdpk5EoXx6KtDzI9Q3rw44jwdVTgPLvr3TJL0pnSt/SEAycdz/5Z8
         g6nTUFqm5hF6xW7kLvyb3f8O3Hc82ypxcpsZLhh+WVCrWGQR5+cdbTcgDY7kvaa0XtBB
         QTwq7igYXjumei0jkzZ8fO1BRG8KCDBQHv/gi6tIgOX6zB5BAvtmhfLZK58cyj1nNC3s
         Saow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060153; x=1775664953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HR5D/DWM5Dfc7y7QbYtyXQZBV4EpcqSV4OtU9XGADfg=;
        b=qCSFi1VTl81EW0hov/8p8n+P+kiFkYNTXEc4BFJ7fNvTNuUvGQhTRVBYkLaV1zgc/5
         IqrMX9yMv4UA95YvdjXgCJi8vHljz48KbjB6m4jSW8Y4nf130vBb+4t2mUkYC12BNwSd
         txK1WzycEUiBmW1b+InKSK1tNJqQCzK5a8ZbgZLPrQZHqx7uO0n66lmjeJvdWhyjdtUj
         OdR3QXPu46jlUkwrihGyyg2keAPzAz8uh2lsWNBxLCOxzcW6Ola+s3ipiMHkP5i8KWAl
         aKO7J4c7a6R4giHvDWdTgk6OpOPFA3K4V3MxRnSPpAjiJzXLWxfuovw9zCF4Ba5QjttK
         RcYA==
X-Forwarded-Encrypted: i=1; AJvYcCV0uMrxJG2GjJpsHaeyma9wyG7kZh/4VcPheN2+BB9Deref0YybnkiGQO70RIoooeNuTW1LHIvmxx0SZXfB/dc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdca1VDsILuQY6oEXjYpkKI+MWZtbYg0XIqevNmMaDDcV0aHpU
	7BJZr4qfyQwziCLCLr9q+4fe08Fc9WbRteSxieq0ACd95u4eA4bFhTUG4uHw4J/rSYFLv62rkdJ
	BHkb4Sd8=
X-Gm-Gg: ATEYQzzdZFobnyG0EvjvGpUp85CzhKd5LnM/kUmOpG/AXCD4Z8yqERLNoVYJWOw35tF
	m/tC+/B/I1X8xz5Ywll19vrOmnw/uMtemifpPOc/U34dnWKca+hBADqhU3zxBn/JgCf8ZvdoHE6
	YOhuG2czdvDR1RTuXGOWwZ6T5EqqkCiusA5GYLaHyWZVMcKo/g+hj6Date4hsAGAgMcvj/RXgJ/
	GHdtjQmMmE+Nwe4rIjnENEkQX6IqF69c3+8pyBUNq45ZExAGDMW5+EMj5Zv/XybSczm96bXzquX
	q9A9kJq5ogiLYf3OXsni7kP7mBZs1GXPd30ByQtWUm2IkNsfG085V9gsGpVigLPtE8RPg5L211G
	iz0CD+ktKXXhQKIDrwqzP4Dx29rGcNwleb5j69xIofBTzvi4gf8g8wfh2iOr/9VBrZgg3gumt5V
	GOU8XBRQr8
X-Received: by 2002:a05:600c:6488:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-4887d01f7a6mr161299175e9.6.1775060152860;
        Wed, 01 Apr 2026 09:15:52 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm247993137.2.2026.04.01.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:12 -0300
Subject: [PATCH 05/10] selftests/bpf: Tolerate test file compilation
 failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-5-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
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
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1385;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=9kRc2srfCyWc8uD9Bu47+DiUt+TkrpdHbGXfZQycNQk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKthGeEAG8EHXczvyXvgIKDqYMGnyIJLHnRFqu4+9xR1Xi5pXrksKJ3A+h9fgUISNjlGo8YDDVj
 lPiOve55Khwo=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Individual test files may fail to compile when headers or kernel features
required by that test are absent. Currently this aborts the entire build.

Make the per-test compilation non-fatal: remove the output object on
failure and print a SKIP-TEST marker to stderr. The linker step will later
ignore absent objects, allowing the remaining tests to build and run.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 72f576a8236a..37a454e4cc3e 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -688,7 +688,8 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 		      $(TRUNNER_TESTS_DIR)/%.c				\
 		      | $(TRUNNER_OUTPUT)/%.test.d
 	$$(call msg,TEST-OBJ,$(TRUNNER_BINARY),$$@)
-	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F)
+	$(Q)cd $$(@D) && $$(CC) -I. $$(CFLAGS) -MMD -MT $$@ -c $(CURDIR)/$$< $$(LDLIBS) -o $$(@F) || \
+		($(RM) $$(@F); printf '  %-12s %s\n' 'SKIP-TEST' '$$(notdir $$@)' 1>&2)
 	$$(if $$(TEST_NEEDS_BTFIDS),						\
 		$$(call msg,BTFIDS,$(TRUNNER_BINARY),$$@)			\
 		$(RESOLVE_BTFIDS) --btf $(TRUNNER_OUTPUT)/btf_data.bpf.o $$@;	\

-- 
2.53.0

