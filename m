Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA231E106
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286814; cv=none; b=VPnWHhODH3PlAwQvgPEB6wf2+99g+7/fyusUctllSCRLIK/V615s+vho4fvgTXVimSSGGUFy7pCNLLe4tpNLeGgV3Ih/8IOrO7GRFO8oiDNVxcf5RoSnBl8sJkPh37dwv2Dc9n7aJ4Mhvh4NJLA8uNLJG7IKWtLA7/UuI0XKi2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286814; c=relaxed/simple;
	bh=kCNYcmfNgjCtuuNJpdXVk9xztupOqrlgLYIOM5DXg/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBG+jnuMWpaxkyCdJEGwSjPWDDGfZ0UfZxP4RwNPteaoFPlyKRoNBtVrPjATNlTyEYO24zV6KAR1pClMcny9amyrmY83egU4VFsJc1z2lnsD4DEKZdkaaOxO6C3P92j61pyD5ZqgFKRhz1Rj8BKxvMiwI01JRxZkcMrqlAMlQ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RFduFoqM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RFduFoqM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso40433645e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286811; x=1776891611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QarwDcfAAe06CKb3JY8/kgN2OyTVrb9EUoTBmrcnojU=;
        b=RFduFoqMvvvhOqgmmufpKlZw5R3+T/9440CuubpYvkBfWb0CFPVtxDCdEsDBdsoFsG
         QR039W0vh3ovdYwq30xkoCix1bJHA/w90fQCRGf4exc1ZdA+58iRrw++1vS6wy+ymC+W
         hB6ISE9GgOTRNSedbgMv6IGCnKhc8yxK205kCKPZzjGjP5VixLpTQP75YQ/d46VCO8JF
         kkdYfV0HTPzbvs8xaXjUnNn62QqXppPpsqhuwmqkErQQj24Fy+UpCrFxgKAHkK/5eoMU
         Nm46OuDGSUNj6QczZIMUSQZVG215kJz4yDpLbgxd3eD53/VTPJ4+FTz50CeLNwApGe2j
         5SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286811; x=1776891611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QarwDcfAAe06CKb3JY8/kgN2OyTVrb9EUoTBmrcnojU=;
        b=EhweZY891LfaKpN1oo/nRy6/4LeuAwik1N5OUBVw02Vj4rX/RK5y+yks4g7Ea6vfIM
         hztJ6wHQbmuoKK0BfHZ3/+qPMCrPbVoHgTbNN2zME4D9HN4A/FPhi7EXsvbZkD+4Sfai
         G8cwi1527nSk/Nu4tyiiwqpmXbAd1ctQqHy42365DnZ9DFNbBAHDXhA8Hcd1FdL7iHaa
         21/TMjH7XZzKaBWNKQbyhthLJjhTooCVABKLPyZy+ixUwnOopZ53SdW0eydDPV+E6km/
         60KWOa/jqYtfV04H+jG4ibWX0Dub7TjezKB1pn6NFy/8EHM/d3GROupUPims9pbQt2pc
         +u8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RaKSLi35n8SIDizwtkYTaYPyk8mELPVyz1p4Jl6bEYxve3mPw4x2uVqrPS+XT+elU336YSDrnZM9dckV9eMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/i+yerLdYKLZbaVPirXd0aCGtndtTB3d6JDMI+onS0BFmnl1
	WRuuR7nXRLlE2aDiqNiKkZqsAJ+QEVv9DkYejW/i1vINmMy0zyO0ugH7A0QfyL4wetw=
X-Gm-Gg: AeBDieu7gsrLXUjIZUlb618/t/4kRFHAwyxOfcNwjklvJiX6nN84C3/pN0Ebn4HhFVS
	NTgFOhT2GxwX9ptokLguELl33FUIrk78x0Hj1ljfoF1g/J6iAVnVjTFUPNGp1oBwY4AVVOIpD99
	2NLojPoIv1aWta8b5lWNOj99cwEGPPTCdezd1LDlRCL28qieS0Kg3SUX8yyCyBt3SacX1ZUJdx4
	tVO9di/RcimJvzsX4OvUwjdTAMibizgK243RRPh3o0eTTvuMmUxj7fwDOY2nmSF3FSManAdxWSY
	wCeFYgQhLrZe0p1GzJJY3DLxP+dyHEfID1SfrtStI+bcjV12nXclmyo/nndr5h3O1+Oc8bcGES1
	l/9/IktPhCefgLOq5VkcZEsL9rG6Sn6Gx2WzEpjujZUbrTLXOxCi/8AycS2b0eiW2Wpr/5dR7ek
	9EiilWB5UNNc8=
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr297880475e9.11.1776286811412;
        Wed, 15 Apr 2026 14:00:11 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61cd32sm3511675c88.3.2026.04.15.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:00:10 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:29 -0300
Subject: [PATCH bpf-next v5 11/11] selftests/bpf: Tolerate missing files
 during install
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-11-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=2151;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=kCNYcmfNgjCtuuNJpdXVk9xztupOqrlgLYIOM5DXg/U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO52q6ndPD+Zuqj9KzWJiSAHcc5GMQVf/6C90MqwRBbzhXDP7EeLoTE9HyFcc5JRBU9VIP7yPpd
 2CYO84FdEcwc=
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
index 163552458327..1f4a8e1f7932 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -969,11 +969,22 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
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

