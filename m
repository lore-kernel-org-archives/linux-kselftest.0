Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DF2393DF3
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499746; cv=none; b=aKtGRzZR+XAfKUj3RwsDi0VcRcV3idHA4l69A0J20TInf6ovYAerRYg2z86Nj/0RC62H+cc5v/vPUFW8t8SDaE9mYaAnDE59lRQVfZqysfJkgMUzGerPHMe5fAcU1JYNTl0ab2Q6CrvT94T4bdjnELGlJ61MrrZr3203ge/kOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499746; c=relaxed/simple;
	bh=UdmIG5ZScOMurXbOdsM3+xZHzE6mxf0WBHcm9S4szVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUVImnRctvY8QImV/KNUvJoCwaxTDfOwlF7xRs9sPUXaErxUe/pI1BVsyhicao4PUcHzV+KHs1rz9wZueCdV0+XwYTyo/rN1f8GNHMgF91axxjAltt+9R8svib1IbHGELN3a7wPTQMbwMSqc6mj2jNirL2zBsDKFySQyVPk/Vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J+Jo8Oaj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J+Jo8Oaj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso41860595e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499743; x=1776104543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4g6ZnBzeP1JTZyYPvWQnENXpCsTRTtKLoMuVgANOhM=;
        b=J+Jo8Oajp0n0qUMnMxg79STdVU7kbwm15Pn0UudRKhEzgPZazn87GkkcnW+6emGPal
         q6/2GcTb4ewVBMgNeASzrsnovVJdvBjYPG2aeCcsvow3QMlYI1Rr3i24f/5692mOlPCn
         ms4hMqoWdzyPhHr2Wgfo7dbjycfeYCXeriMD7+s9s+5hnJ9rhmenSQfSuzG4fKHFIr4D
         mFnZY4bn5yX+Hllxk+uOS67rorJmXTkvcVYMpsGAQiRgTxtSDAqUZ6aI28U1CIbcl9O7
         8pPJvhrkl2pqIkMa0FTAlWm9E2VmIH2AhBpx6oevs7MBqniv+rjkRvYYFMSgz+qD0Z4/
         zEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499743; x=1776104543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s4g6ZnBzeP1JTZyYPvWQnENXpCsTRTtKLoMuVgANOhM=;
        b=BplQsVSwfa8xYfb+oXafetFzTzBFJMbQpqvOqgayArbuSfhGqigeZSpUjLUoSL8yar
         CA1TX/SFDCUmqrM3lWKXQsg4HQ/KnGcwkwDw2uMuEGH/g1VfC0zRNzB78QWNYvBYUqn2
         OEGVjw86Oh8OBv3F49kTxIcJNvIIARF0gHbNbh2hZRQofO3aKmGePDBf8/K9rYdVixif
         iPSFsmg2G6CDYFh1aRflYknK6uUHNbbGCBZiZW0eFJOLaMcN2eJ/0EJOpUBlBA7IjjSO
         WOZGLBf8hYIWREofhd9rE2eASkWtwP2yDCzvojav3XafNqvaXi8QTsmacIQENqMnAVwQ
         MGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPS/Mm/xKzGPiMPrfme9y69txp3OXZdQfJLNOwUEytbkLil6Q3PCBOQ/4emRyx6zYqIFDt7lTwge9H4hfPcZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6a6AXuli26bfWs0CYsdF7oZAB9o6y2lauLB+Bpt7kLpwrtufJ
	fyfcbJ+qIFBribeaaGufG4n52vahbXMxqQZGLa5qG6KeW4PkHaQIjttxoYURcg50rlg=
X-Gm-Gg: AeBDieuBOpfE2/Atti3QLI5yFfTOr48ze146UUXFo2m6PJdN1G+YAcpH7r4+ZSeT1pT
	Z61cP+6wJmAkAubfIF4+8qcM8UzOsCnBns+z/5bTLcBvTyoNyfes+NepZ8IssnjmyHjogzUA1fK
	zWOsWh9Ih9V1ZRk/1k5wL1j/xCcsrGLj2z20ndvqk/niDXSLy28ORRYKd18PPWgEMOae+hPmHKz
	PsdmHrQbvFCxLUIf+uYeRSEj2TbmHnoB6+HW27kqDE3rDaCcoL7OcFgUGsFgdGbxXHT3p2fGlga
	b3AsI/A3dwO8tUudwFTsbR0z8r8uZCDk7088Tq/dJKfiIzumzqH4wGXfXHxIQ7S2J/Aixd/DH9b
	Y8e1m2l0jm10FOuMCCQTGPAgqIE59xUJO47BMXliL6n5+2Ldfw96deAAW/xMrRSyWb4g/lfYncQ
	69CP0+u3iVFltC
X-Received: by 2002:a05:600c:1381:b0:485:6e40:5584 with SMTP id 5b1f17b1804b1-488996afdaemr206141365e9.6.1775499742932;
        Mon, 06 Apr 2026 11:22:22 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm14052881241.4.2026.04.06.11.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:22 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:13 -0300
Subject: [PATCH v4 01/10] selftests/bpf: Fix test_kmods KDIR to honor O=
 and distro kernels
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-1-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=2171;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=UdmIG5ZScOMurXbOdsM3+xZHzE6mxf0WBHcm9S4szVc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPsFC+mekAxUuFuHrSS3/+5pngEcDl6zjD77+ez7jkuo+XJwp6K09aYbo1XfJInLFFrJH14hjkz
 jTijNopyyAwc=
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

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..b4f86f151a09 100644
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
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

