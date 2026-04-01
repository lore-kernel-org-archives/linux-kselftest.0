Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E8478E29
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060140; cv=none; b=XWB74ItQY7pFXNIyQaeFulJpK3YGPQP/rWG7BWuAAre+UPxPV+lwHeizeya/gY0q8cD0CyVo8DadIkwCbVlk2BwBBycE+OrjsTLQbFvt0N8mjL+/2zsnCdk/GwMLZUn8yA4/bcKDMwu2MGsURBSDnCCcjXIftagpTLpBPcoGS/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060140; c=relaxed/simple;
	bh=b7nfNBNqrJ18hpBVF8kDcZraYDe06fSNKUQ5ann5t60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnElDwCU+TuDV+awPrBlMfPJ0EAlRD16YwdScGBIRmKOXQuQjdPqRn8EOjCw0zm9c6ovkxSjc9+lRNnewftaQuRT2fMzv7QcXyacMGy713ematNek6jVDOPQ5r4UwhsOaGfumdbnB4Llj+2OPnXE2Xnd9VAhI3MzELkb1uOSDnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qt/09YZS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qt/09YZS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48541edecf9so84715215e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060137; x=1775664937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43fw3GZqDOKnOXUmd4UFVcfR/ZtOCVdeWF0aKs+p6eI=;
        b=Qt/09YZSGdPfC/SWf+vrOEnRp/nEqfUrGkQ0Oog/EWQ/oPaXV5TMBcDqFxJpUgjCNp
         Vff1HMSRP2HHl21SHEt+dGdLj7c0H9cNHN6yqAGacmTppeqGwMWjv1BlHWuVi7YGrIcd
         rny8Al/gYouLnUc6iLBErrnliATxG/qfRb8jDYQggLLkmlGNJk1zpIgKZob4t83sykIt
         3fwTOyrIBUseux6FQASqpIti5YlKydo/mfGsMTY78+HdP1R9wPMgfHzBqur62fSzRKOA
         1G8dmBcG2utfAAxHQgXqEtLuVpATvEzzGdc5xqfbbzjp/6gUrYxy4YJqUjLjNhyPUtL+
         RuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060137; x=1775664937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43fw3GZqDOKnOXUmd4UFVcfR/ZtOCVdeWF0aKs+p6eI=;
        b=O2OjaqV+KcumGb415K1irsNrzTSLAgSve6nnnpoPxNnr2f73F6X8Qkf6TnhRHnWxLA
         dTK2C32457WZcfG/W2Fy+1cvo1fgogmQLfgKQUpn6Z+Ac8xHHLe/TfPyFlYAZ1miuYdM
         u1/QFOnmOYVYYD9cABceXGteNMzZ/QQFqj04+61YQu2cOmaBho/axABek4QY6WzzGcPE
         rOTlWTlOWfN+y+ylYjOrxcaMo3L5WU5VJ9Fx8a9ZOlcQt7aEjVvQlbdo6Sm2pTJiMUjL
         2W00c9EFJJOxs/Zf1N01m2vQRSB6ofexv4Q/L87QopR3WnS9odXSzbbArNKyCF94aj6d
         22PA==
X-Forwarded-Encrypted: i=1; AJvYcCXg47vENrn5Cwlm+R25b069nsUsru604cNWsKsus+9llGc7Bwh6CdhkbxnRg35eFc1/6kJkgC25ZDGgwmGtMWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymzku0MuVmEu7W+K7gjLmW0blYUCLykJDEQ/O3Jef4Cwlhs7+g
	0R7XnZ01yBupGKcxNLmvEoO5oCOgRgvPsT6YcbVWujCu/4kj3sWjF9kq3qK5lO158LI=
X-Gm-Gg: ATEYQzxSFIso3mx5ht/j8Kl8i9DgV5PAg98g/sznNSCCk/bbGm6elRvFTzhWALJdmkN
	QQD+pWssBWu+4yejqMhnqAop0+b4kz/AOKsaPSqFPnOmBTb5gsal3u6jjce5EJQUZicWE/Nwtt5
	sxjWIc3KQ0TIp30IEhO7WbUylCm1xkIOLAPCsksTvJbOjHBds8/HqhhB9147ivOfcmk2r9csGTl
	70td5ClvcaMFtJnzPVVK0OsvA//Bv1tDhxHWft8IO7yAUKO2+pUb9bjmOad/4HLkcct7fwC/CsA
	Zl3iQdcAl93/7CD3ZS3BL3g+RuLjXz92c7g27NGhHRdMz1TFQtjbMN5QhtSMCBmnDouJwul9ttG
	MZKa3tAyHsqTP2aWhLdHS484aahq0OhoriDGJhtr/XHt24w2PmGCaePCzrkSq8kPoj1ZMVk8tOB
	dQw3T18vW3L8J6uMZ3yN0=
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr51986225e9.20.1775060137100;
        Wed, 01 Apr 2026 09:15:37 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm24428e0c.7.2026.04.01.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:15:35 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:08 -0300
Subject: [PATCH 01/10] selftests/bpf: Fall back to distro build directory
 for test_kmods
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-1-3ae42c0af76f@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1367;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=b7nfNBNqrJ18hpBVF8kDcZraYDe06fSNKUQ5ann5t60=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP1x9/R4Np8q6Hmj5+a7NPsgZG1tjGdEaP0IIitotMPUkrM1doOEZwf9ghhp0N/RnJj1MBl3Yiu
 4mK0CQ5TIXAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When building against a distribution kernel there is no in-tree build
directory. Detect this by checking for .config in the source tree root and
fall back to /lib/modules/$(uname -r)/build, which is the standard location
for distribution kernel module build directories.

An explicit O= value still takes highest precedence.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..8babf9b98684 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,9 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+# Prefer an explicit O= build output directory if specified. Otherwise use the
+# in-tree kernel build when it has been configured, and fall back to the
+# running kernel's module build directory for distribution kernel builds.
+KDIR ?= $(if $(O),$(O),$(if $(wildcard $(SRCTREE_KDIR)/.config),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =

-- 
2.53.0

