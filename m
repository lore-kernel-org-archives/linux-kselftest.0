Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128E638C412
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286777; cv=none; b=dfI22YL4c6jJ5DkoHO+kZhy2j/gEQeqxHEEvn8yYVLXGpkwBgIAffIbKIVYsthqWK//51230tjmGPpHpsoeK9CvbFtsVxbbgMYNh3LbfQNxkOHT0Z0MwW5HC2aZY5Z+KJqCaiA/SS10l8T/OBtrXq1+Q+D1FByto689ArJ5Iiu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286777; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEbltVJbxcSV3AXhD2ZWGUnRZZ7jShjoxSt4aG9CLZNNRaVNlguxwbwFnXBC71/iRA3N//U8mPvEfn69WX9Ws1FOzeTVpnVnmYYxN7rbaV/S/g3AjsNBEL1epkQ4VSxdObCKrdGTxUMpZ8L94H0nWbpiMefGXIbQ63c1DYF7knI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UO6xBlmq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UO6xBlmq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so80104735e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286773; x=1776891573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=UO6xBlmqDVBc0rPzQXvG9lOWiReITyiPcTQ7ZwnlUAYuMuk7jUq1S3xYMdAbYdaYh5
         l+fO09VyoopGQXmw974+vosU8axuUd92LTjwttgndsAHy4L6u6VP4somV00FvBwTPRRO
         uGBi144giY35IPE56yObbdNKKI1Vb44vgG87o6V7Kx02RFQeX6bXS559YKTpmjXAl9DR
         fk8KeV6VGcchCqXMJ/bDZgX+VpLgA/8CNw+E3jf+aXKklocuhaR4VsyUmsnHsA+VNQ+S
         1nEM1c88yPl0x9nV66gvtKzBng9KW+0jbAXSRmy8Ix3FA2U9gux5l3dOyIJceBG1eCO0
         r/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286773; x=1776891573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=ljpaFrnTtCpYdZakaKJ6jMPklrHWxkyWmWPl7uf73dd80GFNRAE38O5QtUBHaIyVrX
         Xh0lXzfKorl9uDmz+ei58mRaz852z1yczS84XZ7m3VQqv7JCtgnHN7fbOnBXDrihJRYh
         TCAxiJerAtUnQb72RZzxbAurOZus2l1/u5z0465NuxNSMa8Ed/dlcZkvXeGPnv74x6KF
         Ltv1HiU0EbBxUn1tIYZcM49wPTtEKoWdnnIs4AbgK+nQNNI/7UGhrNUgY4y3xsSfmftr
         nk7JDHko5qqKhMrBAVWOcoIipvarqLv4ambsjAf+JqJgxMt4OzyrFEBEI/1YXRw+5kKk
         UXDw==
X-Forwarded-Encrypted: i=1; AFNElJ93BCFQDAuAhEMt/VwyL/QC8nyGgr2Z8G46pjiEJPYCyOou5E7X7BQtSHTO5ctOAHbPPzJ6RRuWPxBJnkfs/+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCwxIMwtDAVgolUR1qIieuFoH+m4KMqDyhAwwZy687UrOOnEG4
	J3xaP+dYWoRzyKlNCO7sekNc29nQ9w5nWht2kMazdkjrFax+HWR9KDJP6XRUiToVTPM=
X-Gm-Gg: AeBDievBlEs3mEJV33RjAZC+J52O1OPdSyJWRvaIRa7jHkdSVlVAzyj6cqbh4hP6/uu
	u4VPESpVWdc1NH6IX5fBvItQ3fyNv/IKGPFdyFr105K33xoY4fXvFlTTYY44Dby4gbm22EBr0V7
	MJgnOr/vl0tqH3UIitG19IzDv9yl4HP2UMNPvAJCGh0wHSAIYxm5W0U+brgj8F3kRuTnR4T4syK
	4b8X0mtNIBPY1CZD/nkC0+8WE0LRqqy/yPA1kHV5AzJ9wiwY8Pr3uSU/OZlR6dMPj5b2EtMTUHw
	OibiXnk3UTPZyPrsBYOxuqZ2BBwhIliHf02EXn1uVk35f+7tumJ9lmIJzUWItrl9Ieeb0yHuvs8
	ALM2DLuw/KOqhWNt1jP2r61cEDlYm6HRlm5nehGHBKE95FoarDnbixolk5wfwgA5lkm5u6ZZjn5
	oueBxwO9Z2DkA=
X-Received: by 2002:a05:600c:4e48:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488d6858368mr328090195e9.20.1776286773498;
        Wed, 15 Apr 2026 13:59:33 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606925sm5430460eec.12.2026.04.15.13.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:59:32 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:19 -0300
Subject: [PATCH bpf-next v5 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-1-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286764; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFYAv4WgAhzm3x9f07EKaYC1RXISsv6qSmiucrI5tHvTzF/Rk1cy8FTrC/AbeumqsIE8ElCxr0k
 76aamKQT2lgM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Add BPF_STRICT_BUILD (default 1) to control whether BPF compilation
failures are fatal. When set to 0, failures are tolerated and skipped
objects are reported, as implemented by subsequent patches in this
series. When set to 1 (the default), the build fails on any error,
preserving the existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 78e60040811e..c8ba8ccc2c6d 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -44,6 +44,12 @@ SKIP_LLVM	?=
 SKIP_LIBBFD	?=
 SKIP_CRYPTO	?=
 
+# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
+# benchmark compilation failure is fatal. Set to 0 to tolerate failures
+# and continue building the remaining tests.
+BPF_STRICT_BUILD ?= 1
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))

-- 
2.53.0

