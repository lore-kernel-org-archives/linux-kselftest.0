Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2541A3B9D83
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342138; cv=none; b=E9ONDWAOLLQSoCOGw1TpXoLYMRp5gBsVKaBrtxbJsAwTdhQy0SalAja6SoN+0jd2jXecbpDBdaOUEICDwzKpjldMt6o393ol88gt8L0Ep0s/4UZ7ppNMTpt4krw6lQ9E8pnvK9Q6w/DjBf+1woD1t8mHxyXOYvkGY8U62n7tePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342138; c=relaxed/simple;
	bh=mEg+v7zXI0iREsRG6kydyUfkdkpuhC25e846u65Lppk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMdEv9TyQ0k3QoPnpyeuN8ZN30sVhmdklkfxuBM61u3ft/0v1y2BDZzuS9n1VPWzL0ECKB8KrBxHwbVWIk87Ru10DVtx3n6krRK1txsc7QujZdIV55Zu+PZbZ2LVOBLg9LxJqK4aM69wXH6ROcwkfkO4M89v05CjZrJ1q7BhDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TNVZSiU0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TNVZSiU0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so4511325e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342135; x=1776946935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhHX7gYP2RMHcZsNzdTs8ia86Fe1heXnXQrH+zN2ESQ=;
        b=TNVZSiU0H5gK2CL/L/zsF9L1ePdd/Qt+IZ8EtOP8RZ6NM3pAUGgG7Tn5vAuZ5zHgQ4
         cQOgx23pH8NE9obrM8PZbWIjrv372KMOWyer9Oh/64kCi+4RJ3UshCa7J6RB50xnDobY
         LpVf9Rqdj3OWS9wH5gyaCfvV8yPtLvtMO0pJ2f1IzHLKho2zfZBwdVw00dRYgLid8OSK
         d2qw0COdIW1e0T/PTH2b6dRlPnrevOs0Xxwd/aG/puff/YP2tTPdBNZ9bTvGhP/Kx/Kv
         5FRMgvRpoZNvSRjSqFRIlPEPHn+g9jBzP0ePwKwGMfIin7tY66RoCuBYJRuNnIuw1qbD
         I2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342135; x=1776946935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhHX7gYP2RMHcZsNzdTs8ia86Fe1heXnXQrH+zN2ESQ=;
        b=f5oT8dmm2nnWvOfQ/SIvLHjJ+N02pxntXmx2xfXMrMd1M4LNlPrsgL+ioweSvXCsss
         9LDak/6VSbf+KcH0WZkGgrIFS/qZ2p7AJnqdQAvUJAr8wCIvzN5FY1cFJ95UB+bGPIM3
         HLo+8N+A0vrc+D/4HTyFZ94QzTu6464oAjPda9MNRjo4gGYT979G9AYmTA1uRZdOFuOg
         2RNToTmP9+CLzdXSNUITxQ1/f0URjxov839GMsYvSs9hS12D+ymFmQImwVwwaz6/SOmB
         hfOGTMbSaOiTLsYIxpbIPj2fwtv0+0hnZY5I5o3mZWLVCnsQMwjMWFeerL1HHNAj0FVD
         wDbA==
X-Forwarded-Encrypted: i=1; AFNElJ8q284cAzoU96xb4mdsUPrSPSUP7FXB3KNhUWcYkFtbu19/EX7v4WQzR/OVbNEO5THF7KmduaogreXHxcSoQXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHZKtbu/MA5vgARLOYsr4OXO3LtL7Vb+Ch5mwIusTTkOZ7AOJ
	VJy89Q61OIsNZVxcKTWeBYniWk2erZMqa0bmOrigEAEk+SK0LHYBtvYEQOkfUveRbIPIIBbhA4x
	i9BZex50=
X-Gm-Gg: AeBDiesA66kw8qOZ98pdNYGvA/p02+vmmdJDfV1Yyp2oTAjvq8cJrRae+nmQUtiix5s
	7P560J9ZuePZr8LOHEJ3Pl49KCqaQE52dnJdmkadSstkxtJ/QR2+AEX+k6TsxgceesYUEeiKlUo
	a5ZycQ5T8H7WXBA0pDEFO2xfZXpJYcK1sNzEeW3zSEOc3IEO2bBt95F6Vom9TIXm0acegj1x6p5
	O/8wIfEhb3uJeSC8KI3yXHAICqA9UHOVHCFka/WdaQDw4Y7601ytrdBsu7JOd4S5i6/BBiRS1E/
	kNd7jS9EY5EFpkSwCeGqlUPbWyOj9N4F3+71PLZfL6UUoPTqbAXQUYkpdyoK2/C6kL3lNb/GRg8
	v4iRD/oPr1r/jUXRI5KwgLDJkX+YXLucQBr6fpKzfE+vIkrCXiUqfYT4nl8EGkAuwpC2NXZrS1h
	GowOvawT//Wdo=
X-Received: by 2002:a05:600c:5888:b0:488:a9c3:44a3 with SMTP id 5b1f17b1804b1-488f45c02abmr34600335e9.2.1776342135114;
        Thu, 16 Apr 2026 05:22:15 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c90cd7esm8736289eec.13.2026.04.16.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:22:14 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:28 -0300
Subject: [PATCH bpf-next v6 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-11-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=mEg+v7zXI0iREsRG6kydyUfkdkpuhC25e846u65Lppk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFN3SnWDFLPzFWsuaYADh4eBzRwT7G4DD1uJJxg8KDV+Al+f/kRjZMmp78ssLgAjQOV9rrCEpue
 zdCykIU669A8=
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
index 9e3e0a898e40..2808387b3d9f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -974,11 +974,22 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
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
2.53.0

