Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F663C8721
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228355; cv=none; b=Zp5VIE837Mi4rCC9LjKlqGYiDDo0lXHcWEpLZKe+w7BVINYs5l/bxbWsCk0bOOz5wJ0n7VwI5ss8/fTCK+mlStOk5z6QUz8ie8jfaMaXvBX/yl4+8XuRWsmwBpoKWHqAnayOraVcaS/RrQ2AGh4ut6vnbW4TC0Xlbzo7gr9C3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228355; c=relaxed/simple;
	bh=f6HIgkgW0zS+/mWkMw/sxAs0VSARPuwtTbc+sdvuugA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhZ2YAteXlnaXFuXQhaJ9KHTupoi8IXx6miqRlQjKneeeEB4wAD65arLC/eS41OYwEShjfluzzYOY759UpZixiEXYxwGRFe9UGNpJR/vVn3lzlvZ03w9NnBkQohX67F5x4H9ooV5HiQGl00/qXBhylzXi/nB9mNkC7/C3BIgsms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G3fljUvI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G3fljUvI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so16029985e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228352; x=1775833152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+1wdXb+bRQTa0pyI8/7iwKfOf3F7IiDnmsocIg8xPk=;
        b=G3fljUvIMqlyHn9SaEl5HRvt0GrcSUg8mOY5/2JF4gIjp9255D03JmOQd29b4d42XT
         0EKfff82vEd53wdN4n07DAi9MZ8z7i7TccSwKD84j1HMcXksapXyvvFM8Ous1SwgVYDV
         FatSHVkhEKYuasjSuklVsOw4jUFjOmP+u3jogzAOr+DqEYVFdbJrI1dQeknLnwQpTGX2
         9huWPiR2UP3/dZ2mNl8XEqSMpMBWY4aUNguh0eTD7o2JrHdu6OFnzk0L0IblthR1Ym0k
         nS8ESWMrTi58zPru4gGOBV16pvthcRQOtiWCg2IEIf/MOxa989KCpj1j/aTqqZ7/B/d7
         3Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228352; x=1775833152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+1wdXb+bRQTa0pyI8/7iwKfOf3F7IiDnmsocIg8xPk=;
        b=JW2XWEQEBTbj4sYZWsqtt1KqGmVMA3Edx2HDnqo0IseGoS6oa6DGn5ulcUNSnuRcPD
         1aMpEJmQDa72NcFvIDZBCCIesO1L/M/tV4ZAo7pUsIIeMUvdyVJ5BzY7OnW0iaaLs79s
         PyMbxevAzRajs9GRyo8yPsaa9PppudUX6ER5KHBJykbui6l01mmPgTiQyOb5ILZrQuVe
         5z0f5HLTGqpw8G0qb07vLtIiy/2UTy4c81v+HBh6Eta4hWk6xsMPXM6PmzgX+fLjCEpL
         MDCOcTEKBcAIkyGJS9ipThLEKGVss6XtLFjCmrMVwHeDddsog3gAZ3HJoabk529CRdoZ
         FMkg==
X-Forwarded-Encrypted: i=1; AJvYcCUD5n9kJt/4a2sXR5sT5Dik6TUvjuaE8fQsWqfmSXYks30Kibs0wgXTAYrRmrXn6ZfoJKpDopnbYC8bVlEepKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Og1OVqooLpDfiYNDlDQf7dRzMvEvFHpNpK2eyr/r0MUmNq4x
	3jhaGcIXhPn9QiQ59xapK08iy2QC+pm4QmZyqDQ4UtbSOElty7xg1prkz29ZVFsZgWE=
X-Gm-Gg: ATEYQzxKIYkUUz+oHH2SzEsTNnQzT2I65Zn1bzccdcvG81SXF9K8h6yTW5u+99Vi+KH
	B5URMztXy6xA/HIckkGQZSoKsjz2Zz3FkuLMRTgr3EtnGoqc3EAMVQTwaPojjf+5/gwyPLmoLrc
	79Tpur6eXIUrKqqe53Qutj6DOjkZJc3Iw4jcSdpEmRUfpYB7co1y2GbDCM6J4/7u9lz79QoVJzU
	AjIgmbn+XGIH3ou4ccj1wxu9TuaKHvEnQUu0IAKa673Xffd5qIIEbZ7uvCfJ0HWBORWBWKVACTF
	KSfcpyouDi75dFYV4XSk5wiqRg1/la9EHudIvbQvqddMoG9hNHPVuO5uCDMR0gYMhkWhvY9OIX3
	IgY+4HmHPmFSWC5+ORGSCi4xyHByhNupWRrnnSPIN1/YoTz631kTvVsFrvBCyhC4fP/Y6b6WOr8
	sob8/aIgC9
X-Received: by 2002:a05:600c:c167:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-488997810bcmr56269185e9.14.1775228352171;
        Fri, 03 Apr 2026 07:59:12 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1d1edsm7553018137.1.2026.04.03.07.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:11 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:58:54 -0300
Subject: [PATCH v2 01/10] selftests/bpf: Fall back to distro build
 directory for test_kmods
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-1-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=1670;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=f6HIgkgW0zS+/mWkMw/sxAs0VSARPuwtTbc+sdvuugA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOTB/yRzeCjFiieMiNd6HsKGUrnkmjlQqa03nLaUBftbDGnMuhh46RMMM7pNW3UfiOFFyJeSPD+
 yb93iZcWxfwI=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When building against a distribution kernel there may be no in-tree build
directory. Prefer explicit O= first, then KBUILD_OUTPUT from the
environment, then an in-tree source tree if Module.symvers is present,
and finally /lib/modules/$(uname -r)/build.

Also skip test_kmods all/clean when the selected KDIR does not exist, so
selftests clean/install flows do not fail on systems without that host
module build directory.

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/test_kmods/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..a5216815d989 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,6 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+KDIR ?= $(if $(O),$(O),$(if $(KBUILD_OUTPUT),$(KBUILD_OUTPUT),$(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build)))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +15,13 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# Ensure KDIR exists, otherwise skip module build and clean.
 all:
+ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
+ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

