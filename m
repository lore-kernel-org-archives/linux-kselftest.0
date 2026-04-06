Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F138836E
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491896; cv=none; b=tnp5SklMpGaTqJsph2dI+8hAvy7fLZnyvqinAyQE8hoe6jwzq5HnmKEeI2pjmNyZnFyp2enh63Ja3mXpQACNQ+whcrDpveVW6AhArP/c1LSw6I0DclekPdj0MJfbxU3aCc92sVlVBkDIX24KWi6Uk/hodwVMquo2Ylmw1btW9DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491896; c=relaxed/simple;
	bh=hAVHhP89HnimL0oLWLC0644/U3kawRazlk2a87ZKVDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZgeAcm34eegBTPLDZ1vAuPC0YGXvaUL4fDJIc1YYF0sJ5UNrq6lhDzgfpS/oxcb+kBYHfFDhDiTgUcWNmjF6uYqEhvhEABuZUXxaVizmgJluE7YcPQ9VJbhB5Jrkv4MyD7VM4IqGUtOtzFF9jH66IzDs31cXXR+B69T7QHyPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YqNt59q2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YqNt59q2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488afb0427eso12042365e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491894; x=1776096694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpHU6AK4GWIH/sbfOIo3yMGD1Gjj7cgz5YN351qEJrA=;
        b=YqNt59q25AJOTUik4mxzzGx+fmEowbdWCrql8j6ol3fqHytR/Jw/giJy3id1ZG1XQD
         OCdhgGDzP5rcxWtQhJERByz433v08LLVDneGse5ZLQL4JKRKmIw/Afx41PNrpyJMwM8v
         yrgAZCjX+CBEXRI1fZCmI90nIb1mMeZtKX4EiLgOv+XSkrjlPZr9a28qlJpHT53uMYW/
         WM+T5X3gwLnPVQcjp6wIs4bmvwzdw41OUWgFVHzYc+Cem8GCGZu+rjkqF/Z+DsWmO6Q6
         3GccKZvRbblQS3OYjE0+zvYSoHi+F6+UlYfwRf1VhvFy4XpQHD1I0zxoqMAW8lojZqvv
         Ebmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491894; x=1776096694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QpHU6AK4GWIH/sbfOIo3yMGD1Gjj7cgz5YN351qEJrA=;
        b=XUaERWDUUCKQ20qSv3LNad3b6JMmJxer/vPh4R2gGfc9qatF2RLeR5Nok47ZOTk+tQ
         fi/bpObnaWgDfURd87oOOZ+2gT9cHvuk2fSCOflo9sZZ4iPFi0yzkbpxsRP1JNFHXZ0j
         2ScG16Bdp6H05ASa7ugdITw4GNdGUk1hoq6wTK1jSzCI6lrq052sNNEQk6UsvD20XpoE
         xIMgn4lt1XTpGiOVxQRXb48Sk8kwGzs6+spCL8V7Zc21JGOILROosut7put4a5NMEt6J
         MNl9Ci/4cvtcn2TaCt9HbQhsU3BxrJMnjLWJEa2KcKXlFJQYugDvl5IYgjLxv4WJ1ZnG
         L4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xn3bTS3fEw1nutjnQaAJWaaNUwhhbh8cPFF3eUviQofrMVlN92tLcxHr87VnrXA+ayeKi9sXr3iHNhOK9hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxgks+wm6ld16Q8yuk5BlbAHfa7QLAUZP70fy4XNMcShJWXo3N
	SPIcOZxpiPSASCdwKSAYYxFksXkWphZI0rqOi0N1VHablnPOgK+AJlNB4CKzKqk3ljY=
X-Gm-Gg: AeBDieuk4olRdXa1g7G9ZVXKL06qIkVC6sA8pjybWC+92h+yGvvlYa5NPkhubNC7IKe
	3U39Yu7STU2NHamAtnR5ub2JVCkgcDHUNLi9W7o88rMp6tKID8fZNRDWC7uLYmgOE/f4nRSByF4
	mA2taKv+SM9x0MKnDiq/DAs/3cVN2EERKYXArRnOhWA8dHi8pD2E/yrGjmCfQxXvSSsnq5gIusS
	jnAI72PD5mHgmEt3JZU5EoVL78wJE+c9ADjAl63DDn/5Q+2OSqUuQIkJL0dSC+oFv0V0Lt7GfGm
	WEN5CzSILE/CPwJFjlfgHx8vnmCzHscyT//pOU9p4JwBLdBhVsinZryGvaLXdlTDvwt8ztqH74G
	IB/QPbZ5BKvA37UXQGenD7nkYxJO2Ok0vxqh+eT3roYU/Jz9XvjYg87WLPsVe7wsq1NxEZJ55Rh
	CkDDz27nYKQiIAUw/C8d3M64w=
X-Received: by 2002:a05:600c:4752:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-4889976ea80mr196842705e9.12.1775491893645;
        Mon, 06 Apr 2026 09:11:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm17235894e0c.9.2026.04.06.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:33 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:23 -0300
Subject: [PATCH v3 01/11] selftests/bpf: Fix test_kmods KDIR to honor O=
 and distro kernels
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-1-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2399;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=hAVHhP89HnimL0oLWLC0644/U3kawRazlk2a87ZKVDY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDeP13XzXftklBawabTHxLwO2wI9EQvIwa/FVGwg4dP+BjbJ6PtnN0K0zE+moJIbSNzV7I3+hN7
 gHqvarJypjws=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. Module objects were therefore placed
inside the source tree rather than the designated build output directory.
On distro kernels where the source tree has not been built, the Makefile
had no fallback and would fail unconditionally.

When O= or KBUILD_OUTPUT is set, pass it through to the kernel module
build so module artifacts land in the correct output tree. Fall back to
/lib/modules/$(uname -r)/build when neither an explicit build directory
nor an in-tree Module.symvers is present. Guard both all and clean
against a missing KDIR so the step is silently skipped rather than
fatal.

Clear EXTRA_CFLAGS and EXTRA_LDFLAGS when invoking the kernel build to
prevent host-build flags such as -static from leaking into kernel module
compilation.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..47b1bd70e276 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,7 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+KMOD_O := $(or $(O),$(KBUILD_OUTPUT))
+KDIR ?= $(if $(KMOD_O),$(SRCTREE_KDIR),$(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +16,15 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# Ensure KDIR exists, otherwise skip module build and clean.
 all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) EXTRA_CFLAGS='' EXTRA_LDFLAGS='' modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) EXTRA_CFLAGS='' EXTRA_LDFLAGS='' clean
+endif

-- 
2.53.0

