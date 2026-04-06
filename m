Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39241386C31
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491901; cv=none; b=ecd38yiIRJfYeyTHcFbtCSAXjN4SAUHB5hbARgF5yF3bJm7Laavlw6Z7t7cIJCNoTz5MbQmdbnu3H892I1G3qjwsKJOlcDn67a7KkKz5sP5RHXYYLMxSY4iwpZYw5tEFtTR45tCTkjtN4cds9Yl+fg88oXZHLPSXnNjo3zYVxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491901; c=relaxed/simple;
	bh=UNpkyM9z2Uk+FmGgvL1GAOWInz7HiCFNDnRCqP3sEoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgTnqnBk7c+PuTxoQNkdR0CgA/5RqFtj7CL65iY2TFcnNi/Oc8DYFt4pqUOoirk6R6AhVDae6Lv24jinSzhQf3EUHlaRSD3FRPIBHLb9Cdhh6fGHAMW0/ywmFEz698xlEBtbUXKq4ORBBk/NVumke5zIhqvUpiI/LU8SeaenQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T75Z370z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T75Z370z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b150559bso7890195e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491898; x=1776096698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++yFqZU4YJL2pDC+uPFxgCL5MIK1kEP1TNHUNgeqal4=;
        b=T75Z370zx5mWPSVsvQBGM7IWmu77Xg0aFRmwhfCbpW85CH7GeQBW1TfTyByWIyi2pt
         8DB1qeITtx32j97yBmXrYC1J4wDqwXAnnfPcGIxOJ4+qiVgEJf+z9vC3nV46UKIkrqnK
         UeoOh5zkySitFhXrJ4IAjhvzTncy077oBOEjFYGPCbFoIHSFi8RJumeyEV/sjWR5nc7G
         4FBVFGBrdLPKBvkMnB4nBS8nRcgoHSx5CsJRaRxsMUvFd1vckt95cYV0PehQ0Gs9ySYE
         JCLUWcrMi/crAGuCLlmhqEwRfX7aVALNr7d33MS7Yl9MfLtHNcm4Ugq5vDkvPMcd+kYs
         gZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491898; x=1776096698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=++yFqZU4YJL2pDC+uPFxgCL5MIK1kEP1TNHUNgeqal4=;
        b=G5svujalSacT1TxQ6uumHEsr314v2AYGtHg7/1oxx1W6i1mpkwNeTT5C6xAAPfHbTt
         hSz6p4S1sX5aSiYqnpnxRp43MmxVCIPc5ehIiGWhm6vkQBF4sTBaVjcvB3e03xnNGnUr
         OE9nD+SCbghQOrBnLfJpyL85gwNWsRryxzho9UZGLblErMnLVfQaa1lV8F18bi7VRna5
         wOeQaHZOdYurdqnW5jYASn1SKa8xgf4qF5a3Hy41QRQKlnB7qoU3WKrOZkLHXCiQ9RK1
         yoAZGSfi1QrnL3sCacfrDbGns2pvqjlIlIJQbDnfHRaA1euKHIfxJftk0lMoeoZzW7BG
         sZJA==
X-Forwarded-Encrypted: i=1; AJvYcCXCYJIsjXsblM8cHUDNAF3MaZkAwOz+q8djqISTtBvjDDU7XMr99n8f0s2JqzAbKEwR2+Rw2hfjiH2brMSl6NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpatLT9TlxtuMZ0fNqjiAscfKWI0gegIDOrNQgGnPN9SyjBnyl
	JvQLtcpAAn0dNiKHuc3ojA65TcpMXUWLcKrK/D3a0zZU9ABWOnz5IAXtNi9HSzdJsSA=
X-Gm-Gg: AeBDiescQtFE5qBCZ0LkqZXuTxKb9C7DGHajR5/V7UM1qAEiJmcRIJHpeFanCQz6Hon
	AVsTMVwbIef0WFE8aIz9ZUcHWd9X3+bxYtIome3+ibb8X+6BxKBdOKCA5idzlbxPtmyo3saDLMK
	BMu+7CB9qWw21REbhkd6+D5H58f/pdgiEoZPw8pbYXItVAaXLFxsovMZuqk5KSV9KDYKTUlpzDQ
	x47a+YHeOlEJjoqP+ZakpecADA7etAE+UbiHf40IjN207w9LmasjnS8OAfgykLlEqE8wXO7HGml
	vRhfJEWEAMeF1wbJjccsCzWlZ0xZ1Tgj9XekxlXVPOsPnqacr9OM7ONmq01LWgT9YTuRxhXPPrK
	mj+hsIlWwHPWl/AdQsZVBxvGuwnrd4H4IdnntcpG+oeKF5eDe3pbYsExeK7o2EJg3pVOCobBK5H
	0mBnrJV0PfX0Q0
X-Received: by 2002:a05:600c:4593:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-488997de1c6mr212429245e9.25.1775491898536;
        Mon, 06 Apr 2026 09:11:38 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm13683068241.4.2026.04.06.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:11:36 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:24 -0300
Subject: [PATCH v3 02/11] selftests/bpf: Route test_kmods through the
 kselftest module flow
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-2-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=2698;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=UNpkyM9z2Uk+FmGgvL1GAOWInz7HiCFNDnRCqP3sEoI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKtb85zZMJ0Of8jLIIs2/ZtZmDnk1/VJC0cgPUaU0InvJi68iydff5f4QHUlKyEl3s7u80ccp47
 wmLGfUHqI0gc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Now that test_kmods/Makefile correctly handles O=, KBUILD_OUTPUT, and
missing kernel directories, wire it into lib.mk's module build
infrastructure via TEST_GEN_MODS_DIR.

Replace the bespoke pattern rule with a gen_mods_dir target that adds
VMLINUX_BTF and RESOLVE_BTFIDS as prerequisites, letting lib.mk drive
the actual build and clean lifecycle. Make TEST_KMOD_TARGETS order-only
dependents of gen_mods_dir and make the .ko copy step resilient so
that a missing module results in a SKIP rather than an error.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index f75c4f52c028..715f282193c8 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -123,6 +123,7 @@ TEST_PROGS_EXTENDED := \
 TEST_KMODS := bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.ko \
 	bpf_test_modorder_y.ko bpf_test_rqspinlock.ko
 TEST_KMOD_TARGETS = $(addprefix $(OUTPUT)/,$(TEST_KMODS))
+TEST_GEN_MODS_DIR := test_kmods
 
 # Compile but not part of 'make run_tests'
 TEST_GEN_PROGS_EXTENDED = \
@@ -152,7 +153,6 @@ override define CLEAN
 	$(Q)$(RM) -r $(TEST_GEN_FILES)
 	$(Q)$(RM) -r $(TEST_KMODS)
 	$(Q)$(RM) -r $(EXTRA_CLEAN)
-	$(Q)$(MAKE) -C test_kmods clean
 	$(Q)$(MAKE) docs-clean
 endef
 
@@ -277,19 +277,15 @@ $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c
 		  $< -o $@ \
 		  $(shell $(PKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
 
-# This should really be a grouped target, but make versions before 4.3 don't
-# support that for regular rules. However, pattern matching rules are implicitly
-# treated as grouped even with older versions of make, so as a workaround, the
-# subst() turns the rule into a pattern matching rule
-$(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLVE_BTFIDS) $(wildcard test_kmods/Makefile test_kmods/*.[ch])
-	$(Q)$(RM) test_kmods/*.ko test_kmods/*.mod.o # force re-compilation
-	$(Q)$(MAKE) $(submake_extras) -C test_kmods	\
-		RESOLVE_BTFIDS=$(RESOLVE_BTFIDS)	\
-		EXTRA_CFLAGS='' EXTRA_LDFLAGS=''
-
-$(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
+gen_mods_dir: $(VMLINUX_BTF) $(RESOLVE_BTFIDS)
+
+$(TEST_KMOD_TARGETS): | gen_mods_dir
 	$(call msg,MOD,,$@)
-	$(Q)cp test_kmods/$(@F) $@
+	$(Q)if [ -f test_kmods/$(@F) ]; then \
+		cp test_kmods/$(@F) $@; \
+	else \
+		printf '  %-8s %s\n' SKIP $(@F) 1>&2; \
+	fi
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool

-- 
2.53.0

