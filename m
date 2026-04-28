Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039D43A382F
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419967; cv=none; b=eNDeBSNxE3Gq0utboisXJ+njH+5i3UyGpu7OCIvPhKIsTkXmIWkM86Rx2LpKgi/Uq940+YYECvB4B33GetYJTRxZt2JMIk8Dv7516Gtwwst6dzCcBpBmYeSu5d0+mKeuKTRwA/qHdtKiLqr3xXnGXnFj+gCQCtp7jO8cxsUywgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419967; c=relaxed/simple;
	bh=/izrmfoNTErOF0QoJyqRR2oNNCmtADhmsCqLhuVNNYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkszPuzi/LIWTGUzP9W1TKZeDh51omrWJ6Xs3DPm9z4g0hpG3fYVyEOS8EZ6IoZEhaAHmm+MAQCWQGO5TxfL1Gdd4FxYdcZLHUav7Y3uqGZKCwpgKwo6NV9SErLsXx83pwf9tIJfiSO4n1gOUCwIMSbubs8Q2j2Cvk5lAQCE434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gdMO4g1h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gdMO4g1h"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so102682055e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419964; x=1778024764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hR7c8YMvP9LQvNeuTjxfIeyv3ZVfJWeQnEPeA75OGwc=;
        b=gdMO4g1hpgqkCryRhK89nOLyjNiabDxgNL9B33laTn32NgmNk+kMEQyKuwBWnectOA
         bZjF+ncZSv0/S4PmSt/cSjBC4ZRSNzPR0KGmGRaBghmwDayWkZyMkAKGFjaXLj6Wsi2a
         WTJjOI7xZimimQg26ChNBlPmN4nRJ8D1WqVwg6LJasVrEdiEd29KDtrwf7wvyD0Vy9Yd
         jgyOW3Co4weu8vpnp9GuC5fmjTtnDfCYZfEU9iAuvqUY9FTrZ/ZPzdzpTzp+oVrN20gt
         jXbxGBGDebB47qy02jP/mIz9uhr5RAJZvv5AX5iwJAoGSYN9cYCitN0tRp8F0796C1Hh
         T+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419964; x=1778024764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hR7c8YMvP9LQvNeuTjxfIeyv3ZVfJWeQnEPeA75OGwc=;
        b=ZwOrgxhnYmQY5xu/ZBRhIWprP4Nj5DfG9sJpjQ+Tbo/QZ7TAtMJSnHNzTZnR4drTMA
         E5GhoznIq7g99ASTjistKAqFFECVVZIiQmSRLf2UxrNv8eGghUh+5EvMyOXsc4sgyLqP
         lafhklV6aVWaOXH5VAE3395L+gwGCs2XPhZbz+uGk9b0xHFKQXcod140dH7YGHPAlPq2
         HXolJfrwIPzkchkwLsgl0o7EKjw4vfIygJRMTcMsl0D/GMo0k9/TIXH/dacrCihgRPRN
         glj3jNPOr9twB7KdjU7RzuzArYo9jNBnmU1HBfeOg0geRy9r9V1fodY3SPQ0uqPFZDd1
         3y4A==
X-Forwarded-Encrypted: i=1; AFNElJ++QLfWadq2mC2oXDvU9+0JgpnLMEZ4sM3vTbuvL2QswAKnrHETJ+rhtBUqTHDeil1ebOa5/0HVSkCBCMK2QHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIaNFtonk6dhclfals9SsBCV5Rm3xEN68UxHXcijp/erVYYK/H
	Xf8YNA9oRtL7bumgKiHHuhqC8eqVAcaHub1feYqCpQWLLl0gZMx11Je/f5VXArD5qNc=
X-Gm-Gg: AeBDieuJWQin/KcdM/Tf8PM5IlCzgYfHJ1YbSkL9crFd7sMVb8KRLgVbE+wMsv0Kw1W
	MCJ49HicOZGLvtfFCCeNMech4Au9DxPvqE518Pp0dZ9tLHEQ8JNhvMecbEEs7ILUhupwqQM0TN3
	nBbD5rX+D2PqDmlz+EWcpiucGBuugG2q9ss6hnD4rivSHAxN9P22SffhC+W3ZL2YNcrmK/5lTqC
	k3BQitNrsBz3vPqUjSiIlCMDHJsf7YSwRfLf/T9bb65g+bHcmuv9sfAYLTznLaLM++2Mha4ZCW1
	PGlkUUCSJjSkEC+OXRyF3sirUOaiDkOGumKDvzd7aMsHZ4t5ljDKQd6IjZaCqDMAVQfOQCGrtgE
	z2nBp1NsaJcOt1BNLNj5nB2O8cds6MfopGRSsDxEzivOY4Ewd/YzyeLx0NKMEieY9kkOH8z73RS
	rtJ+ryQ/leRfHt0BX6jNryr8Jw
X-Received: by 2002:a05:600c:4e91:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48a7b54b1c7mr24789895e9.25.1777419964535;
        Tue, 28 Apr 2026 16:46:04 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6953946sm271414e0c.0.2026.04.28.16.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:46:02 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:12 -0300
Subject: [PATCH bpf-next v8 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-11-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=2156;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=/izrmfoNTErOF0QoJyqRR2oNNCmtADhmsCqLhuVNNYw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBbgjXwVu2unS8JglD6UCKZJvCJEJAlmSjrzgmiYPCBRyG9YG5E/X2CY352VvtcvIUf+weYBF79
 DIYd08L56eQk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic. Also
add --ignore-missing-args to the TEST_INST_SUBDIRS rsync loop so that
subdirectories with no .bpf.o files (e.g. when a test runner flavor was
skipped) do not abort installation.

Note that the INSTALL_SINGLE_RULE override applies globally to all file
categories including static source files (TEST_PROGS, TEST_FILES). These
are version-controlled and should always be present, so the practical risk
is negligible.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 461e2d9416fc..3c3234a2ce15 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -1017,12 +1017,23 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# When permissive, tell rsync to ignore missing source arguments so that
+# partial builds do not abort installation.
+ifneq ($(PERMISSIVE),)
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+endif
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
-	@for DIR in $(TEST_INST_SUBDIRS); do		  \
-		mkdir -p $(INSTALL_PATH)/$$DIR;   \
-		rsync -a $(OUTPUT)/$$DIR/*.bpf.o $(INSTALL_PATH)/$$DIR;\
+	@for DIR in $(TEST_INST_SUBDIRS); do				  \
+		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
+		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
+			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef
 

-- 
2.54.0

