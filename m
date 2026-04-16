Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C23E92AC
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367907; cv=none; b=sJT+WLmK6hnd994oJN+1QW81r06EmRS5DBhOUtB+PphwBGZ4v6TF6GsDS1DROlBOiytqoyX1fMGRHUxiHvUMq8xfynlbTOJKgnl4fixDij8KaqHm5+s8N/wwOMZnqoeiZU/b+k0boHIXO0jQhIm/HfDIThCwt5RcQBKTpZCp9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367907; c=relaxed/simple;
	bh=u9LZEwi66b10OuzjwpSk5FjZx5A9K59bxx/PeiS2pIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDV1sz94O8WIMdAMVWt0O1dk8zwnd18CPrkZHE533pklkVQiMpE5mBB5Jnp6/Jh9F/bLE5VaGKfZQDckXjNxLrZr7coLFsiD+j4bW7YTF6RIVHbz2oqgyJLtz8MFPvqCtpFgXjpwXPDI5Pe+MH24cXxvUc9i6MNORoeKgRUSP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fg5oMCS+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fg5oMCS+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so99975625e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367900; x=1776972700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ3r37ogqR7olkqp+SapeMaeTv/V70MwihEzAcWCwTQ=;
        b=Fg5oMCS+e1rpHdpyXpaOG5XCyojqnM1qA2UKaoVEOwEfTdVspDrS/ozZ/Bt5h7sncC
         Y4z9tJg4V3OwRZdWqJFqlwuTygjfjbXy9AyY76Q13zNCeWo5uUsNQRLm1IZvVj9YXTZ1
         vU9Ba/1u9zlo6nAiB33hneCcrc9vrRcGaMJoU1B4ajiZm/JaLO5JI/4Z5ua8g43ehJrG
         3CoOIBIH9IAqNy1v1qpjp82jeUYiOLWBKxMRn1tZNuwZ3mdFjxH4TMoBV2+j047G4i3G
         fmrG5vZA3T3k66fmWDDCRqWGdWD+TyCuiB4vOfg03T3hlWdVcTsrzHXseuXfFnAydztY
         6jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367900; x=1776972700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IJ3r37ogqR7olkqp+SapeMaeTv/V70MwihEzAcWCwTQ=;
        b=PKroDRAwMJqZd8spJuvsp/Vmx1L0t9yI0R4U7XqehOZ6b602NFo+KI8LM711Q7tJBI
         hLPfz4FO1fGkFq5GFYKqia1K5V1nwGwNx+XglPCA4ihZeHa+Do+Dn4GO18M1/hgBxmUM
         RMmCFWD3b7A+WgsZmYWPT9I6aEzorlmPlOZqHJQfQDcQVSHNc9+tFzAXGQg14fdoeXJo
         JxqcnPpNroQmZ0vnLfXRqZKo8iD3qPL/K/GbpKSDws2xNWQjUUpuhQdAcHor5nrnjIbv
         See0WjB9J0J7/hKKez3WnLwnSHGQLFKqSzjuauw7YaW0FfjxqHzR62TnmcfwqGLd2emF
         u3GA==
X-Forwarded-Encrypted: i=1; AFNElJ/pAHSf84hKTEluwn2lBhckKZ1J2pYGcJX5r0VfKhQzjJ79mpOQEOz4dtZNQGaPSnRN9AEYryMAx8cNffdABpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybc0P3/0OjCHqN980fPpOd1Cc2N/vZG8NvI0uN4eKo7YY/0Elq
	ncX4lztn6+HQ7hBSdMCo5q9xZX/KIOTLzobKWSLeyLocDap66El49OjTqZS7DazJ4H0=
X-Gm-Gg: AeBDiesS52OUum/Fjvv1SvzhrMhQXttfFoE2CWIBsucMtgUnKlwmnU8uUqY4zh5PXx8
	qQ0gfwUuWp/6+3gGOsxg36xeswkLBjtb7J1ITOJrDcisqlCM21LVUW2jV1mKGrrGobjip6d68pJ
	uhdTC4bIc3GtcWulo5LvabD2z2EdSgetvZrwfcNjNm/wRYX4OeB9Vo2OBm/B9aLwA7avM4r5z9u
	4H8GJT44/nX6vplensgzzzyg0a9rgwBLy5MhJ7r0YRbAONLQfC0+jbfh9fr2RpvAxBeYl58dtM9
	sn2/cpmxiD/qJE3DGvJnv20lhUrulZVRlxIa045bE5Dkin9nVgEr629Mg+yMA9A/mbbLAlKVX6a
	OKux7eFEfeJcM9o6oi/2G0x9hFxcdRvdwqQZZOjhGs1bgh85CHHZJsMGIuTcX4t4NkT5v/Kq2nA
	WDezzQ8x7dVluMPn34o0iy6PBZY9M28wT9sA==
X-Received: by 2002:a05:600d:1b:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb26ea7cmr2836085e9.2.1776367900154;
        Thu, 16 Apr 2026 12:31:40 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm8751812eec.14.2026.04.16.12.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:39 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:31:00 -0300
Subject: [PATCH bpf-next v7 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-11-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=u9LZEwi66b10OuzjwpSk5FjZx5A9K59bxx/PeiS2pIU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLClSdovgIOUa0JYPVPuFKo/leHFyBzCBLmZIgS2HtfJjjwxK/CInHHcGA7RUpCwe1HMzRr7f5D
 ND8qhfhM0qwA=
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
index 88a03366f6aa..53c3808c0c88 100644
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

