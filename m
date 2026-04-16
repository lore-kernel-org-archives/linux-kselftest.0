Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C68C389118
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367866; cv=none; b=Ao0Xt9wBOMjdevLG5CkSU5bDqhlQvluJZounrklTi+lxpbEiveRMvbEOXoLDy/z346AfeGZfdhxQHbM4ygEAwXMSOPvB57aW7fv6WAu/meo4eYQXmRn63Enrcouds3HKiO5GtSms0L9yxgLzeKwQzsUCim0XkCBq0eW8mqvBFnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367866; c=relaxed/simple;
	bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0DPIcffUS2enEE40wmFK68hvvft6ucEIC1XxKHucWuGOTL5uB4sjKd45z/GjaTCcnzvMlVfrDW/3miTZGv6ydi/VKzKBsATgCTixP1wVAIxVmpW8s+iTAVs0Hyp1E/rwtPG0XZtzJA6jVIG4adspGlBX3w26+X5CHHVWyJGrRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HcVKU3Um; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HcVKU3Um"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so80933335e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367861; x=1776972661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=HcVKU3UmRdE/4w4F0f7C/nCck/V4mTxNRWUdn7YZX+q2/c9uVDlZfXFKE2ZRp22xTO
         9YWNum3HjfS/W0p4F67fcJ/41AgU8DOhxQaAgDsuDgzmePPKCUsls2osVfgmF6QcsgqQ
         26oqWcIfZo3sQeSdm1GB9nPmCLaB/OSIyBLHFi8tB7Q2iMFWVfvujoJF14vfggE6bN1X
         +/6PqkNhPWMsIuQViySzUivXp5YlwFK8vNTmmRH9DUnNVr9KhLcRRS9ErUokfKuxYn71
         5irMRL5dOwq5RggZAa43yr1J7gqerE6IPMTT4icAA203CF5HYUC+S9VoyO0nReAGIHPh
         tZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367861; x=1776972661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sg2etNAfQKZBd7rcNCY3p33XRFv6QLBK/6YkWrjaoRM=;
        b=J6wpA205iBMmd79cEjvyuI9gmuoQ12UgQHvtNZKLbMJvhUOrfWzviwmBj7/OwJoDt6
         agfU64ffSXYzRDUWUp6pNLDck82glOw3a5oaSzJnQwstYMmDagfRlqkFLgpzxljdflCT
         qXC3RlBSBYXVOwnouNnHwv2M4ctS4N4kFYsZIc9vTsVKmTG+7U5Ax5MPFPGb0ytIzJuw
         RkWmsv5Wk/Qs4DY19KQv8XeyV21sAIocGPYOBesEWJIVyF2FiBHnLTaC7pzZO7lViv+4
         PF5uqaJWU2yKm72HeqvLDrw3iwCM2fL1NRJh9owgoZm5wDKd79/Ky6+dnG6Hu/KcPYTg
         CeYw==
X-Forwarded-Encrypted: i=1; AFNElJ94e4+ni8UnSNavmmm+LQfYbdfddeV7Z6YOeJtcOkhSvKYjEkRnBafADWGvxfiqfCgtFEwMatUurviZ0sBbEf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp23zC4TnM+YKH4BykvwrNC61mqLImg8TkXa7CMgNz9fSjXnrx
	SDOGaIFUwdgDwCP2FuLzFZLYDiQeOLqVE5FSkPyHHQfIN818XbZo7lCpfwXqrxEK9Bk=
X-Gm-Gg: AeBDievbrzZ4YcDAPPmesJ7A86MA1oVw2DyDn7Ocx/MxBgoyFXzu7s7utYB7eT2qtfM
	MWYcPvFo5YLT3nKe7Y/R6dNoWzYmx5V7Ue9MNwhOETZG/pbaBwIYqw7WSdsgFpcYJKYWDm0/QKf
	MSpMs2K6iAJle2f/0jAZkAb14HXJ+Bte9qEo7eRzuaeFH5dozk/LQQN73BdnqpGMTg9Q8TTMVXd
	fnj+hX0KlKWDDPEC9v2gkReBfSB/TKskN9jrazJtvGXF3kPqZdlSzF1Ac/8SUKGc5ncx4hfSMww
	MEuA+2sRMbL5opn8UqARuHWhBsOV94NwrjqTLQ0NRrqgHh9zFX/fTdnh/ktqF7CEXY/ipahXO9k
	yDNzrX6twzc6xopUS9fpoOw0qDYgkgEmh2Q3HEyuMbQKzAQFFzKbiPoM+i5wHv1EB1ET8MVC0OH
	xN5nBa0ZvZQlU4WvLo341yOok=
X-Received: by 2002:a05:600c:3b20:b0:488:ab37:b442 with SMTP id 5b1f17b1804b1-488fb293c76mr2913935e9.28.1776367861036;
        Thu, 16 Apr 2026 12:31:01 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c10a688sm11563728eec.4.2026.04.16.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:00 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:50 -0300
Subject: [PATCH bpf-next v7 01/11] selftests/bpf: Add BPF_STRICT_BUILD
 toggle
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-1-a078e18012e4@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=1377;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=r4Eeeqlnty5JWhyFFs4PmBr0ldtcOWrItly6lcvC8Ts=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAPbtf49MZRZIT6BCmzoEC5ue1MD2cdyhiDdjZkr/s/rJ+QXHkqIxIuI51vftri0M2v9UeZfIXV
 wVe2C4ANA2wU=
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

